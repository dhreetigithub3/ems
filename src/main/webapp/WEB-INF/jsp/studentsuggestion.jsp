
<jsp:include page="studentlayout/header.jsp" />

<style>
    .container-suggestion {
        
      margin-top: 70px;
      max-width: 500px;
      margin: 0 auto;
      padding: 20px;
    }

    h1 {
      color: #333;
      text-align: center;
    }

    p {
      color: #666;
      line-height: 1.5;
    }

    .suggestion-form {

      margin-top: 30px;
      background-color: #fff;
      padding: 20px;
      border-radius: 5px;
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .form-group {
      margin-bottom: 20px;
    }

    label {
      display: block;
      font-weight: bold;
      margin-bottom: 5px;
    }

    input[type="text"],
    textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 3px;
    }

    .btn-suggestion {
      background-color: #333;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 3px;
      cursor: pointer;
    }

    .btn-suggestion:hover {
      background-color: #555;
    }
  </style>

  <div class="container-suggestion">
    <h1>Suggestion Page</h1><br>
    <p>Please provide your suggestions below:</p>
    <div class="suggestion-form">
      <form action="students-suggestion" method="post">
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
          <label for="email">Email:</label>
          <input type="text" id="email" name="email" required>
        </div>
        <div class="form-group">
          <label for="suggestion">Suggestion:</label>
          <textarea id="suggestion" name="suggestion" rows="5" required></textarea>
        </div>
        <input type="submit" class="btn-suggestion" value="Submit">
      </form>
    </div>
  </div>