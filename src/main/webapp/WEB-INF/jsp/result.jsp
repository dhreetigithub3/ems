<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="studentlayout\header.jsp" />
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">
<br>

<h3 align="center">Results:</h3><br/>

<div style="margin-left:50px;">
<form method="post" action="/show-result-datewise">
   Exam Date : <select name="date" id="date">
         <c:forEach var="exam_dates" items="${exam_date}">
            <option>
               ${exam_dates.exam_date}
            </option>
         </c:forEach>
   </select>
   <br><br>
   <input type="submit" value="Submit" />
</form>
<br><br><br>
Secured Mark: ${total_mark} <br/>
</div>