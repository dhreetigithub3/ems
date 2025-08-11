<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<jsp:include page="header.jsp" />

<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>

<c:forEach var="videos" items="${video_data}">
<div class="row" style="text-align:center;">
    <div class="col-md-4">
        <video id="myVideo" width="320" height="240" controls muted>
        <source src="videos/${videos.video_name}" type="video/mp4">
        </video>
        <br><br>
        <h6>${videos.video_name}</h6>
    </div>
    <div class="col-md-4">
        <br/>
       <b> Uploaded By: </b> <label>${videos.teacher_id}</label><br/>
       <b> Likes: </b> <label>${videos.likes}</label><br/>
       <b> Coments: </b> <label>${videos.comments}</label><br/>
    </div>
</div>
</c:forEach>

<script >
  var vid = document.getElementById("myVideo");
  vid.volume = 0.1;
</script>
