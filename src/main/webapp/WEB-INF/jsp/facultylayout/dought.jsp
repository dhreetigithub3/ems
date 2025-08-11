<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp" />

<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>

<div style="margin-left:50px;">
    <h4 align="center">Doughts</h4><br/>

    <form method="post" action="/update-doughts">
    <c:forEach var="doughts" items="${all_doughts}">
    <div>
        <label>Q${doughts.slno} :- ${doughts.question}</label><br/>
        <input type="hidden" id="slno" name="slno" value=${doughts.slno} />
        <label>Answer</label>
        <textarea name="answer" rows="3" cols="50" id="answer"></textarea>
        <input type="submit" value="Submit Answer" /> 
    </div><br/>
    </c:forEach>
       
    </form>
    <center>${message}</center>
</div>