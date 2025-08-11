<%@page import="java.util.Base64"%>

<jsp:include page="facultylayout\header.jsp" />
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>
<h3 align="center">Profile Updation</h3><br/>
<% byte[] s=(byte[])request.getAttribute("imageData"); %>
<div style="margin-left:50px;">
<form method="post" action="/update-profile" enctype="multipart/form-data"> 
    <img src="data:image/jpeg;base64,<%=Base64.getEncoder().encodeToString(s) %>" width=100 height=100 />
    <input type="file" name="f" />
    Age : <input type="text" name="age" />
    <input type="submit" name="btn" value="Update" />
</form>
</div>
<br><br><br>
<center><b>${message}</b></center>