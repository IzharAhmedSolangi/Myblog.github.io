

<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.entities.Categories"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.dao.postDao"%>
<%@page import="com.tech.entities.Message"%>
<%@page import="com.tech.entities.User"%>


<%
    User user = (User) session.getAttribute("CurrentUser");

    if (user == null) {
        response.sendRedirect("login.jsp");
    }
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
        <title>Profile Page</title>
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



        <!--........   MESSAGE MODULE ,,,,,,,,..-->

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {
        %>
        <div class="alert <%= m.getMsgClass()%>" role="alert">
            <%= m.getContent()%>
        </div>
        <%
                session.removeAttribute("msg");
            }
        %>









        <!--...START OF MODAL...-->


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header ">
                        <h5 class="modal-title " id="exampleModalLabel">Tech Blog </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div  class="container text-center">
                            <img src="profile_pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50% ; max-width: 150px;">
                            <h5 class="modal-title " id="exampleModalLabel"><%= user.getName()%></h5>

                            <!--DETAILS....-->


                            <div id="profile-details">

                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID :</th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status : </th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on : </th>
                                            <td><%= user.getDateTime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="profile-edit" style="display: none;">
                                <h4 class="mt-3">Please edit profile carefully . </h4>
                                <form action="EditServlet" method="post" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID  </td>
                                            <td><%= user.getId()%> </td>
                                        </tr>
                                        <tr>
                                            <td>Name  </td>
                                            <td><input type="text" class="form-control" name="user_name" value="<%= user.getName()%>"> </td>
                                        </tr>
                                        <tr>
                                            <td>Email  </td>
                                            <td>
                                                <input type="email" class="form-control" name="user_email" value="<%= user.getEmail()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Password  </td>
                                            <td>
                                                <input type="password" class="form-control" name="user_password" value="<%= user.getPassword()%>">
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender  </td>
                                            <td>
                                                <%= user.getGender().toUpperCase()%> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>About : </td>
                                            <td>
                                                <textarea row="3" name="about" class="form-control"><%= user.getAbout()%> </textarea>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>New Profile Picture</td>
                                            <td>
                                                <input type="file" name="image" class="form-control">    
                                            </td>
                                        </tr>


                                    </table>

                                    <div class="container text-center" >

                                        <button type="submit" class="btn btn-outline-primary" style="width:  150px;">Save</button>
                                    </div>


                                </form>

                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-profile-btn">EDIT</button>
                    </div>
                </div>
            </div>
        </div>

        <!--...END OF MODAL...-->



        <!--...............   POST MODAL START .............-->


        <div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header ">
                        <h5 class="modal-title " id="exampleModalLabel">Provide the post details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <form id="post-data-form" action="PostServlet" method="post">

                            <div class="form-group">
                                <select name="cid" class="form-control " >
                                    <option selected disabled> ----- Select Categories -----</option>
                                    <%
                                        postDao p = new postDao(ConnectionProvider.getConnection());
                                        ArrayList<Categories> list = p.getCategories();
                                        for (Categories c : list) {
                                    %>

                                    <option value="<%= c.getcID()%>"> <%= c.getcName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" name="ptitle" placeholder="Enter Post Title . " class="form-control">
                            </div>

                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height: 200px;" placeholder="Enter your Content.."></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height: 200px;" placeholder="Enter your program (if any)"></textarea>
                            </div>

                            <div class="form-group" >
                                <label>Select Picture</label>
                                <br>
                                <input  type="file" name="pic">
                            </div>
                            <div class="form-group text-center">
                                <button type="submit" class="btn btn-primary">SAVE</button>
                            </div>
                        </form>

                    </div>

                </div>
            </div>
        </div>



        <!--...................  POST MODAL ENDS ................-->



        <!--DISPLAYING BLOGS ON PAGE-->  
        
        
        <main>
            
            <div class="container">
                <div class="row mt-4 ">
                    <!--FIRST COLUMN--> 
                    <div class="col-md-4">
                        <div class="list-group">
                            
                            <a href="#" onclick="getAllpost(0,this)" class=" c-link list-group-item list-group-item-action active">All Posts</a>
                            
                          <%
                          postDao pD = new postDao(ConnectionProvider.getConnection());
                          
                          ArrayList<Categories> list1 = pD.getCategories();
                          
                          for(Categories cc : list1){
                              
                            %>
                            
                            <a href="#" onclick="getAllpost(<%= cc.getcID() %>,this)" class=" c-link list-group-item list-group-item-action"><%= cc.getcName() %></a>
                              <%
                              }
                          %>
                        </div>
                    </div>
                    <!--SECOND COLUMN--> 
                    <div class="col-md-8" >
                        <div class="container text-center" id="loader">
                            
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">
                            
                            
                        </div>
                    </div>
                </div>
                
            </div>
            
        </main>
        
        
        
        
        
        




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script >
            $(document).ready(function () {
                let profile_status = true;

                $("#edit-profile-btn").click(function () {
                    if (profile_status) {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        $(this).text("Edit");
                        profile_status = false;
                    } else
                    {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        $(this).text("Back");
                        profile_status = true;
                    }
                });
            });
        </script>

        <!--JAVASCRIPT FOR POST-->

        <script>
            $(document).ready(function (e) {

//               console.log("Loaded ....");


                $("#post-data-form").on("submit", function (event) {

                    event.preventDefault();



                    let form = new FormData(this);

                    $.ajax({
                        url: "PostServlet",
                        method: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#do-post-modal").hide();
                            if (data.trim() === 'done') {
                               swal("Good job !"," Posted Successfuy . !","success").then((value) => {
                                   
                                window.location = "profile.jsp";
                            });
                               
                               
//                               window.location = "profile.jsp";
//                                swal({
//                                    title: "Good job!",
//                                    text: "You clicked the button!",
//                                    icon: "success",
//                                    button: "Aww yiss!",
//                                });
                            } else
                            {
                                console.log(data);
                                swal("Error !", " Something went wrong ! Please try again.", "erroe");
                            }


                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Error !", " Something went wrong ! Please try again.", "erroe");
                        },
                        processData: false,
                        contentType: false

                    });

                });

            });
        </script>
        
        
        <script>
            
            function getAllpost(catId,temp){
                
                $("#loader").show();
                $("#post-container").hide();
                $(".c-link").removeClass('active');
                 $.ajax({
                   url: "Loader_page.jsp",
                   data:{"cid" : catId},
                   success: function (data, textStatus, jqXHR) {
                       
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                        
                    }
               }) ;
                
            }
            $(document).ready(function(e){
                let allpostref = $('.c-link')[0];
              getAllpost(0 , allpostref);
                
            });
        </script>

    </body>
</html>
