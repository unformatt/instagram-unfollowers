#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys, os, json, pystache, io, random, requests
from insta import Instagram

#modify here
USERNAME = sys.argv[1]
insta = Instagram(USERNAME, sys.argv[2])
numer = sys.argv[3]
MAILGUN_API_KEY = sys.argv[4]
MAILGUN_DOMAIN = sys.argv[5]
MAILGUN_TO = sys.argv[6]

THIS_FOLDER = os.path.dirname(os.path.realpath(__file__))


def fullpath(file):
    return os.path.join(THIS_FOLDER, file)


print " ~ Connecting to Instagram"
if insta.login() == False:
    print "Login failed"
    sys.exit(2)
print " ~ Sending request to Instagram , fetching your feeds"
temp = insta.getTotalUserFeed(numer)
likedUsers = {}
for item in temp:
    insta.getMediaLikers(item["id"])
    test = insta.LastJson["users"]
    for user in test:
        if user["username"] not in likedUsers:
            data = {}
            data["count"] = 1
            data["full_name"] = user["full_name"]
            data["profile_pic_url"] = user["profile_pic_url"]
            data["username"] = user["username"]
            likedUsers[user["username"]] = data
        else:
            likedUsers[user["username"]]["count"] += 1

print " ~ Sending request to Instagram , fetching followers"
followers = insta.getTotalFollowers(numer)
print " ~ Sending request to Instagram , fetching followings"
followings = insta.getTotalFollowings(numer)
followersnum=len(followers)
followingsnum=len(followings)
print " ~ Processing..."
fans = []
for fr in followers:
    flag = True
    for fg in followings:
        if fg["pk"] == fr["pk"]:
            flag = False
            break
    if flag:
        fans.append(fr)

notfollowedback = []
for fr in followings:
    flag = True
    for fg in followers:
        if fg["pk"] == fr["pk"]:
            flag = False
            break
    if flag:
        notfollowedback.append(fr)

newfollowers = []
if os.path.exists('followers.json'):
    with open(fullpath('followers.json')) as data_file:
        oldfollowers = json.load(data_file)
        for fr in followers:
            flag = True
            for fg in oldfollowers:
                if fg["pk"] == fr["pk"]:
                    flag = False
                    break
            if flag:
                newfollowers.append(fr)

newunfollowers = []
if os.path.exists(fullpath('followers.json')):
    with open('followers.json') as data_file:
        oldfollowers = json.load(data_file)
        for fr in oldfollowers:
            flag = True
            for fg in followers:
                if fg["pk"] == fr["pk"]:
                    flag = False
                    break
            if flag:
                newunfollowers.append(fr)

newfollowings = []
if os.path.exists(fullpath('followings.json')):
    with open(fullpath('followings.json')) as data_file:
        oldfollowings = json.load(data_file)
        for fr in followings:
            flag = True
            for fg in oldfollowings:
                if fg["pk"] == fr["pk"]:
                    flag = False
                    break
            if flag:
                newfollowings.append(fr)


with open(fullpath('followers.json'), 'w') as outfile:
    json.dump(followers, outfile)

with open(fullpath('followings.json'), 'w') as outfile:
    json.dump(followings, outfile)

neverLiked = []
for follower in followers:
    if follower["username"] not in likedUsers:
        neverLiked.append(follower)


likedUsers = sorted(likedUsers.values(),
                    key=lambda x: x["count"], reverse=True)


data = {
    "username": USERNAME,
    "followersnum": followersnum,
    "followingsnum": followingsnum,
    "notback": notfollowedback,
    "num_newfollowers": len(newfollowers),
    "newfollowers": newfollowers,
    "newunfollowers":newunfollowers,
    "num_newunfollowers": len(newunfollowers),
    "newfollowings": newfollowings,
    "bestlikers": likedUsers[:20],
#    "badlikers": likedUsers[len(likedUsers) - 10:],
    #"neverliked": neverLiked[0:10]
    "neverliked": random.sample(neverLiked,10)
}

def render_html(data):
    file = open(fullpath('template.tpl'), 'r')
    tpl = file.read()
    file.close()

    path = '%s.html' % USERNAME
    print " ~ Creating", path
    output = pystache.render(tpl, data)
    with io.open(path, 'w', encoding='utf8') as f:
        f.write(output)

def send_email(data):
    file = open(fullpath('email-template.html'), 'r')
    tpl = file.read()
    file.close()
    body = pystache.render(tpl, data)
    _send_email("%s IG Update" % USERNAME.title(), body)

def _send_email(subject, body):
    return requests.post(
        "https://api.mailgun.net/v3/%s/messages" % MAILGUN_DOMAIN,
        auth=("api", MAILGUN_API_KEY),
        data={"from": "%s <ig@%s>" % (USERNAME, MAILGUN_DOMAIN),
              "to": [MAILGUN_TO],
              "subject": subject,
              "html": body})


# render_html(data)
send_email(data)

exit()
