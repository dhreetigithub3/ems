<jsp:include page="adminlayout\header.jsp" />
<br>
<b style="margin-left:50px;">Wel Come,</b><% out.println(session.getAttribute("name")); %>
<hr style="border:2px solid black;">

<style>
    .container-faq {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
    }
    form {
      margin-top: 20px;
    }
    
    input[type="text"] {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      resize: vertical;
    }
    input[type="submit"] {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    
    input[type="submit"]:hover {
      background-color: #45a049;
    }
    input[type="button"] {
      background-color: blue;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
</style>
<div class="container-faq">
  <form method="post" action="/save-faq">
    <h3>FAQs Page</h3><hr style="border:2px solid black;"/>
    <div class="form-group">
      <label for="question">Question:</label>
      <input type="text" name="question" id="question" required>
    </div>
    <div class="form-group">
      <label>Answer :</label>
      <input type="text" name="answer" id="answer" required>
    </div>
    <br>

    <input type="submit" value="Submit" />
    <input type="button" value="Reset" />
    </form>
    <center><h4>${message}</h4></center>
<div>
