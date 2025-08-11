<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="studentlayout/header.jsp" />
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">

<table class="table">
	<tr>
        <th>ID</th>
		<th>Name</th>
        <th>Mobile</th>
		<th>Email</th>
		<th>Role</th>
	</tr>
	
	<c:forEach var="user" items="${usermaster}">
	<tr>
        <td>${user.id}</td>
		<td>${user.name}</td>
        <td>${user.mobile}</td>
		<td>${user.email}</td>
		<td>${user.role}</td>
	</tr>
	</c:forEach>
</table>

<jsp:include page="studentlayout/footer.jsp" />