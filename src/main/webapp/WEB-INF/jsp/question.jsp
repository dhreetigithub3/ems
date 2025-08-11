<jsp:include page="facultylayout/header.jsp" />
<style>
    .container-question {
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
<div class="container-question">
  <form method="post" action="/save-questions">
    <h3>Question Page</h3><hr style="border:2px solid black;"/>
    <div class="form-group">
      <label for="question">Question:</label>
      <input type="text" name="question" id="question" required>
    </div>
    <div class="form-group">
      <label>Option 1:</label>
      <input type="text" name="opt1" id="opt1" required>
    </div>
    <div class="form-group">
      <label>Option 2:</label>
      <input type="text" name="opt2" id="opt2" required>
    </div>
    <div class="form-group">
      <label>Option 3:</label>
      <input type="text" name="opt3" id="opt3" required>
    </div>
    <div class="form-group">
      <label>Option 4:</label>
      <input type="text" name="opt4" id="opt4" required>
    </div>
    <div class="form-group">
      <label>Answer :</label>
      <input type="text" name="ans" id="ans" required>
    </div>
          <br>
<%-- <div class="container-question">
<form method="post" action="/save-questions">
    <b>Question :</b>
    <input type="text" name="question" id="question" required><br>
    option 1:<input type="text" name="opt1" id="opt1" required><br>
    option 2:<input type="text" name="opt2" id="opt2" required><br>
    option 3:<input type="text" name="opt3" id="opt3" required><br>
    option 4:<input type="text" name="opt4" id="opt4" required><br>
    Answer :<input type="text" name="ans" id="ans" required><br><br> --%>


    <input type="submit" value="Submit" />
    <input type="button" value="Reset" />
    </form>
    <center><h4>${message}</h4></center>
<div>
