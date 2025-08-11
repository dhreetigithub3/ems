<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<jsp:include page="header.jsp" />

<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>
<h3 style="text-align:center;">Video Upload</h3>
<br>
<div style="margin-left:100px;">
  <form action="/upload-video" method="post" enctype="multipart/form-data">
    <label for="file">Select a file:</label>
    <input type="file" id="video" name="video" accept="video/*"><br><br>
    <input type="submit" value="Upload">
  </form>
  ${message}
</div>