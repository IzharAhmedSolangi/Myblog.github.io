

<%@page import="com.tech.entities.Message"%>
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

        <style>
            .banner-bg
            {
               clip-path: polygon(30% 0%, 70% 0%, 100% 0%, 100% 87%, 65.4% 100%, 31.3% 89.3%, 0% 100%, 0% 0%);
                background-color: rgb(29, 123, 223);
                 color: white;
            }
        </style>


        <title>Login Page</title>
    </head>
    <body>




        <main class="d-flex align-items-center  banner-bg pb-3" style="height: 70vh; color: black">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 offset-md-3">

                        <div class="card text-center">
                            <div class="card-header " style="background-color: rgb(29, 123, 223); color: white;">
                                <span class="fa fa-user-plus fa-3x"></span>
                                <br>
                                <h3>Login here</h3>
                            </div>

                            <%
                                Message m = (Message) session.getAttribute("msg");
                                if (m != null) {
                            %>
                            <div class="alert <%= m.getMsgClass() %>" role="alert">
                                <%= m.getContent()%>
                            </div>
                            <%
                                session.removeAttribute("msg");
                                }
                            %>

                            <div class="card-body">
                                <form action="LoginServlet" method="post">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input type="email" class="form-control mb-2" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="username">
                                        <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1 ">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" name="password">
                                    </div>


                                    <!--<button type="submit" class="btn btn-primary align-items-center " style="width: 10vw">Login</button>-->
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-outline-primary align-items-center " style="width: 10vw">Login</button>

                                    </div>
                                </form>
                            </div>
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
        <script>
        </script>
    </body>
</html>
