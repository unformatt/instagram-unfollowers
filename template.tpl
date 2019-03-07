<html>

    <head>
        <title>@{{username}}</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <style>
            .panel { margin: 3em 0.5em; }
        </style>
    </head>

    <body>
        <div class="container-fluid" style="margin-top:2em;">

            <div class="row">
                <div class="col-md-12">
                    <h3>
                        <a href="{{username}}" target="_blank">{{username}}</a> <br/>
                        {{ followersnum }} Followers <br/>
                        Following {{ followingsnum }}
                    </h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>{{ num_newfollowers }} New Followers :)</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>User Name</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {{#newfollowers}}
                                    <tr>
                                        <td>{{full_name}}</td>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a></td>
                                        <td><img src="{{profile_pic_url}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                    {{/newfollowers}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>{{ num_newunfollowers }} New Unfollowers :(</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>User Name</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {{#newunfollowers}}
                                    <tr>
                                        <td>{{full_name}}</td>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a></td>
                                        <td><img src="{{profile_pic_url}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                    {{/newunfollowers}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>New Followings</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Full Name</th>
                                        <th>User Name</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {{#newfollowings}}
                                    <tr>
                                        <td>{{full_name}}</td>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a></td>
                                        <td><img src="{{profile_pic_url}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                    {{/newfollowings}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <!--<div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>Bad Likers</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Count</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {{#badlikers}}
                                    <tr>
                                        <td>{{username}}</td>
                                        <td>{{count}}</td>
                                        <td><img src="{{image}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                {{/badlikers}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>-->

                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>Best Likers</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Count</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {{#bestlikers}}
                                    <tr>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a></td>
                                        <td>{{count}}</td>
                                        <td><img src="{{image}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                {{/bestlikers}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-warning">
                        <div class="panel-heading">
                            <h3>Never Liked</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                {{#neverliked}}
                                    <tr>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a></td>
                                        <td><img src="{{profile_pic_url}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                {{/neverliked}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <h3>Not Followed Back</h3>
                        </div>
                        <div class="panel-body">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>User</th>
                                        <th>Image</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {{#notback}}
                                    <tr>
                                        <td><a href="{{username}}" target="_blank">{{username}}</a><br/><small>{{full_name}}</small></td>
                                        <td><img src="{{profile_pic_url}}" class="img img-responsive center-block img-circle" style="width:50px; height:50px;" /></td>
                                    </tr>
                                    {{/notback}}
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
