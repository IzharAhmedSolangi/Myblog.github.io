

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            .banner-bg
            {
                clip-path: polygon(0 0, 100% 1%, 100% 86%, 68% 100%, 30% 90%, 0 100%);
            }
        </style>


        <title>Register Page</title>
    </head>
    <body>

        <%@include file="_navbar.jsp" %>
        <main class=" p-5 " style="color: black; background-color:rgb(29, 123, 223)">
            <!--<div class="container">-->
            <div class="row">
                <div class="col-md-4 offset-md-4">
                    <div class="card">
                        <div class="card-header text-center " style="color:white; background-color:rgb(18, 48, 234)">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <h5>Sign up here</h5>
                        </div>

                        <div class="card-body">



                            <form id="reg-form"action="RegisterServlet" method="post">

                                <div class="form-group">
                                    <label for="username">User Name</label>
                                    <input type="text" class="form-control " id="username"  placeholder="Enter User Name" name="user_name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control " id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="user_email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1 ">Password</label>
                                    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="user_password">
                                </div>

                                <div class="form-group">
                                    <label for="gen ">Select Gender</label>
                                    <input type="radio" name="gender" value="male" id="gen" > Male
                                    <input type="radio" name="gender" value="female" id="gen1" > Female
                                </div> 


                                <div class="form-group">

                                    <textarea name="about" id="" class="form-control" rows="3" placeholder="Enter Something about your self"></textarea>


                                </div> 



                                <div class="form-check">
                                    <input type="checkbox" name="condition" class="form-check-input" id="checkme"> 
                                    <label for="checkme ">agree terms and Conditions</label>
                                </div>   

                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-refresh fa-spin fa-3x"></span>
                                    <h5>Please wait..</h5>
                                </div>

                                
                                <!--<button type="submit" class="btn btn-primary align-items-center " style="width: 10vw">Login</button>-->
                                <div class="container text-center">
                                <button id="submit-btn" type="submit" class="btn btn-outline-primary align-items-center " style="width: 10vw">Sign Up</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
            <!--</div>-->
        </main>




        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <script>

            $(document).ready(function () {
                $("#reg-form").on("submit", function (event) {
                    event.preventDefault();
                    let form = new FormData(this);
                    $("#submit-btn").hide();
                    $("loader").show();
                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            $("#submit-btn").show();
                            $("loader").hide();

                            swal("Registered Successfully.!", "We are redirecting to login page ", "success").then((value) => {
                                window.location = "login.jsp";
                            });
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $("#submit-btn").show()();
                            $("loader").hide();
                        },
                        processData: false,
                        contentType: false
                    });
                });
            });

        </script>   
    </body>
</html>
