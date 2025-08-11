<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="facultylayout/header.jsp" />
</hr>
<table class="table">
	<tr>
		<th>Sl No.</th>
		<th>Name</th>
        <th>Mobile</th>
		<th>Email</th>
		<th>Message</th>
		<th>Date</th>
        <th>Action</th>
	</tr>
	
	<c:forEach var="contact" items="${facultysavecontact}">
	<tr><td>${contact.slno}
		<td>${contact.name}</td>
        <td>${contact.mobile}</td>
		<td>${contact.email}</td>
		<td>${contact.message}</td>
		<td>${contact.date}</td>
        <td>
			<input type="submit" name="btn" value="Edit" />
            <input type="submit" name="btn" value="Save/Register" />
            <input type="submit" name="btn" value="Delete" />
        </td>
	</tr>
	</c:forEach>
</table>

<jsp:include page="facultylayout/footer.jsp" />