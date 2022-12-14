
<%@page import="com.tech.dao.likeDao"%>
<%@page import="com.tech.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.entities.Posts"%>
<%@page import="com.tech.helper.ConnectionProvider"%>
<%@page import="com.tech.dao.postDao"%>
<div class="row">
    <%
        Thread.sleep(1000);
        postDao d = new postDao(ConnectionProvider.getConnection());
        int cid = Integer.parseInt(request.getParameter("cid"));
        List<Posts> posts = null;
        if (cid == 0) {
            posts = d.getAllposts();

        } else {
            posts = d.getAllpostsById(cid);
        }
        User user = (User) session.getAttribute("CurrentUser");
        if (posts.size() == 0) {
            out.println("<h3 class='display-3 text-center'> No Posts in this category..</h3>");
        }
        for (Posts p : posts) {

    %>
    <div class="col-md-6">
        <div class="card mt-2">
            <img src="post_img/<%= p.getPic()%>" class="card-img-top ">
            <div class="card-body">

                <h4><%= p.getpTitle()%></h4>
<!--                <p><%= p.getpContent()%></p>-->
            </div>
            <%

                likeDao ld = new likeDao(ConnectionProvider.getConnection());
            %>

            <div class="card-footer text-center p-1 " style="  background-color: rgb(29, 123, 223); color: white;">
                <a he="#" class="btn btn-outline-info btn-sm p-1"><i class="fa fa-commenting-o"></i><span>100</span></a>
                <a href="readPost.jsp?cid=<%= p.getpId()%>" class="btn btn-outline-primary btn-sm p-1" style="color: white">Read more</a>
                <a he="#!S" onclick="dolike(<%= user.getId()%>, <%= p.getpId()%>)"class="btn btn-outline-info btn-sm p-1"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"><%= ld.countLike(p.getpId())%></span></a>
            </div>
        </div>

    </div>

    <%    }

    %>




</div>

<script src="JavaScript/myjs.js" type="text/javascript"></script>