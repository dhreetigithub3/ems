<jsp:include page="studentlayout\header.jsp" />
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">


<jsp:include page="studentlayout\footer.jsp" />