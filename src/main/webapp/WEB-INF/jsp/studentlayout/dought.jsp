<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<jsp:include page="header.jsp" />

<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>

<form action="/save-dought" method="post" enctype="multipart/form-data">
    <label for="question">Question:</label>
    <textarea id="question" name="question" rows="3" cols="50"></textarea>
    <br>
    <br>
    <input type="submit" value="Submit">
</form>

${message}

<c:forEach var="doughts" items="${doughts}">
    <div>
        <h6>Q${doughts.slno} :- ${doughts.question}</h6><br/>
        <label>Answer</label>
        ${doughts.answer}
        
    </div>
    </c:forEach>