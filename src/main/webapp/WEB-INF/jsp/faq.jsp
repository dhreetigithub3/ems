<jsp:include page="header.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.accordion {
  background-color: white;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 30%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active,.accordion:hover {
  background-color: #eee; 
}

.panel {
  padding: 0 18px;
  display: none;
  width: 30%;
  background-color: white;
  overflow: hidden;
}
.accordion:after {
  content: "\02795";
  font-size: 13px;
  color: #777;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2796";
}
</style>

<br/>
<h4 style="margin-left:50px;">Frequently Asked Questions</h4>
<hr style="border:2px solid black;">    

<c:forEach var="faq" items="${faqs}">
<button class="accordion"><b>${faq.question}</b></button>
<div class="panel">
  <p>${faq.answer}</p>
</div>
</br>
</c:forEach>

<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
}
</script>

<jsp:include page="footer.jsp" />