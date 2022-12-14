<%@page import="com.tech.dao.likeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.dao.userDao"%>
<%@page import="com.tech.entities.Posts"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.dao.postDao"%>
<%@page import="com.tech.entities.User"%>
<%
    User user = (User) session.getAttribute("CurrentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }

    int id = Integer.parseInt(request.getParameter("cid"));

    postDao d = new postDao(ConnectionProvider.getConnection());
    Posts p = d.getpostsById(id);

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--External CSS-->
        <link href="CSS/Style.css" rel="stylesheet" type="text/css" />

        <!--FONT AWSOME CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        
        <style> 
        .post-title{
        font-weight: 100;
        font-size: 30px;
        }
        .post-date{
            font-style: italic;
            font-weight: bold; 
        }
        .userinfo-row{
            border: 1px solid #e2e2e2;
            padding-top: 15px;
        }
        
        body{
            background-image: url('post_img/1192495.jpg');
            background-size: cover;
            background-attachment: fixed;
        }
        
        
        </style>
        
        <title><%= p.getpTitle()%></title>
    </head>
    <body>

        <!--NAVBAR START-->
        <nav class="navbar navbar-expand-lg navbar-dark pb-0 pt-1" style="background-color:rgb(18, 48, 234);">
            <a class="navbar-brand" href="#"><span class="fa fa-asterisk"></span>Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-code"></span> Learn to Code <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-home"></span>Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-category"></span>categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Projects Deployment</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-home"></span>Contact Us</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#do-post-modal"><span class="fa fa-home"></span>Post</a>
                    </li>

                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link " href="#!" data-toggle="modal" data-target="#profile-modal"><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link " href="LogoutServlet">logout</a>
                    </li>

                </ul>
            </div>
        </nav>
        <!--NAVBAR END-->


        <!--POST DESIGNING ...-->
        
        <div class="container">
        <div class="row">
            
            <div class="col-md-8 offset-md-2 my-4">
                
                <div class="card">
                    <div class="card-header">
                        <h4 class="text-center post-title"><%= p.getpTitle() %></h4>
                    </div>
                    <div class="card-body">
                        
                            
                        
                             <img src="post_img/<%= p.getPic() %>" class="card-img-top ">
                             <div class="row my-3 userinfo-row">
                                 <div class="col-md-8">
                                     
                                     <%
                                     userDao userdao = new userDao(ConnectionProvider.getConnection());
                                     %>
                                     
                                     <p ><a href="#!">  <%= userdao.getUserByUserId(p.getUserID()).getName() %> </a> has posted this </p> 
                                 </div>
                                 <div class="col-md-4 post-date">
                                     <%= DateFormat.getDateTimeInstance().format(p.getpDate()) %>
                                 </div>
                                 
                             </div>
                             
                             <p cass="post-content" >
                                 <%= p.getpContent() %>
                             </p>
                             <br>
                             <br>
                             <div class="post-code">
                                 <pre><%= p.getpCode() %></pre>
                             </div>
                        <!--%>-->
                        <%
                        
                        likeDao ld = new likeDao(ConnectionProvider.getConnection());
                        %>
                        
                    </div>
                             <div class="card-footer p1">
                                 <a he="#!S" onclick="dolike(<%= user.getId() %> , <%= p.getpId() %> ) "class="btn btn-outline-primary btn-sm p-1"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLike(p.getpId()) %></span></a>
                                  <a he="#" class="btn btn-outline-primary btn-sm p-1 ml-1"><i class="fa fa-commenting-o"></i><span>100</span></a>
                             </div>
                </div>
                
            </div>
            
        </div>
                             </div>
        
        
        
        
        
        
        
        
        
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="JavaScript/myjs.js" type="text/javascript"></script>
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        
        
        
        
        
    </body>
</html>
