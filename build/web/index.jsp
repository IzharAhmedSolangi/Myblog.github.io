<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.entities.Categories"%>
<%@page import="com.tech.dao.postDao"%>
<%@page import="com.tech.dao.postDao"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--bootstrap CSS-->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--External CSS-->
        <link href="CSS/Style.css" rel="stylesheet" type="text/css" />

        <!--FONT AWSOME CDN-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--CLIP PATH CSS-->
        <style>
            #banner-bg
            {
            /*clip-path: polygon(0 0, 100% 0, 100% 86%, 68% 100%, 30% 90%, 0 100%);*/
            clip-path: polygon(30% 0%, 70% 0%, 100% 0%, 100% 87%, 65.4% 100%, 31.3% 89.3%, 0% 100%, 0% 0%);
            
            background-color: rgb(29, 123, 223);
            
            }
            h3{
                
                font-weight: 100;
            }
            </style>
        
        <title>Home Page</title>
    </head>

    <body>
        <%@include file="_navbar.jsp" %>

        <div calss="container-fluid p-0 m-0">

            <div class="jumbotron primary-background  mb-2 pb-5 pt-2  " id="banner-bg">
                <div class="container">
                    <h3 class="display-3">Welcome to TechBlog </h3>
                    <p>he intersection of technology, science, art, and culture. Offers in-depth reporting & long-form feature stories, breaking news coverage, product information, and community content in a unified and cohesive manner</p>
                    <p>TechBlog is the leading source of news, information, and resources for the connected generation.</p>

                    <a href="register_Page.jsp"class="btn btn-outline-light btn-lg "><span class="fa fa-external-link"></span> Start ! its Free</button>
                    <a href="login.jsp"class="btn btn-outline-light btn-lg "><span class="fa fa-user-circle fa-spin"></span> Login</a>

                </div>


            </div>
        </div>

        <!--=========   ADDING CARDS ===============-->
        
        
                          
        
        
        
        

        <div class="container">
            <div class="row mb-3">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title">Java</h5>
                            <p class="card-text">Java is a programming language and a platform. Java is a high level, robust, object-oriented and secure programming language.</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">Python</h5>
                            <p class="card-text">Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation</p>
                            <a href="#" class="btn btn-primary ">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title ">Java Script</h5>
                            <p class="card-text">JavaScript is a scripting or programming language that allows you to implement complex features on web pages. every time a web page does more than just sit there  </p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <!--SECOND ROW-->
            
            <div class="row">
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">PHP</h5>
                            <p class="card-text">PHP is a general-purpose scripting language geared toward web development.It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1993. The PHP reference implementation is now produced by The PHP Group</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">CSS</h5>
                            <p class="card-text">Cascading Style Sheets (CSS) is a style sheet language used for describing the presentation of a document written in a markup language such as HTML or XML (including XML dialects such as SVG, MathML or XHTML)</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">
                        <div class="card-body text-center">
                            <h5 class="card-title text-center">C++</h5>
                            <p class="card-text">C++ (pronounced "C plus plus") is a high-level general-purpose programming language created by Danish computer scientist Bjarne Stroustrup as an extension of the C programming language, or "C with Classes".</p>
                            <a href="#" class="btn btn-primary">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>




















        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        
    </body>

</html>