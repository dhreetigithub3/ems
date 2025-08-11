<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="facultylayout/header.jsp" />
<style>
    .container-faculty-users {
      max-width: 70%;
      margin: 0 auto;
      padding: 20px;
    }
	table,th,td{
        border:1px solid black;
        border-collapse:collapse;
    }
	.delete-user{
		border:0px;
		background-color: #fff;
		color:#f00;
	}
	.delete-user:hover{
		background-color: #f00;
      	color: white;
	}
	.edit-user{
		border:0px;
		background-color: #fff;
		color:#00f;
	}
	.edit-user:hover{
		background-color: #00f;
      	color: white;
	}
</style>
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">

<div class="container-faculty-users">
<table class="table">
	<tr>
        <th>ID</th>
		<th>Name</th>
        <th>Mobile</th>
		<th>Email</th>
		<th>Role</th>
        <th>Status</th>
		<th>Action</th>
	</tr>
	
	<c:forEach var="user" items="${usermaster}">
	<tr>
        <td>${user.id}</td>
		<td>${user.name}</td>
        <td>${user.mobile}</td>
		<td>${user.email}</td>
		<td>${user.role}</td>
        <td>${user.status}</td>
		<td>
		<form method="post" action="faculty-manage-users">
			<input type="hidden" name="email" value="${user.email}" />
			<button type="submit" name="btn"  class="delete-user" value="delete">   <i class="bi bi-trash3"></i> </button>
			<button type="submit"  class="edit-user"  name="btn" value="edit">   <i class="bi bi-pencil-fill"></i> </button>
		</form>
		</td>
	</tr>
	</c:forEach>
</table>
<center><h5>${message}</h5></center>
</div>

<jsp:include page="facultylayout/footer.jsp" />