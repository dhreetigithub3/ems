<jsp:include page="header.jsp" />
<title>Contact Page</title>
  <style>
    .container-contact {
      max-width: 400px;
      margin: 0 auto;
      padding: 20px;
    }
    
    h1 {
      text-align: center;
    }
    
    form {
      margin-top: 20px;
    }
    
    label {
      display: block;
      margin-bottom: 10px;
    }
    
    input[type="text"],
    textarea {
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
  </style>

  <div class="container-contact">
    <h1>Contact Us</h1>
    <form action="/savecontact" method="post">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" required>

      <label for="name">Mobile:</label>
      <input type="text" id="mobile" name="mobile" required>
      
      <label for="email">Email:</label>
      <input type="text" id="email" name="email" required>
      
      <label for="message">Message:</label>
      <textarea id="message" name="message" rows="5" required></textarea>
      
      <input type="submit" value="Submit">
    </form>
  </div>

<%--        
    <title>Contact Information</title>
<div class="d-grid gap-3" style="grid-template-columns: 1fr 2fr;">
      <div class="bg-body-tertiary border rounded-3">
    <h3>Contact Information</h3>
    
    <h4>Name</h4>
    <p>Example</p>
    
    <h4>Email</h4>
    <p>exampleemail@example.com</p>
    
    <h4>Phone</h4>
    <p>+1 123-456-7890</p>
    
    <h2>Address</h4>
    <p>123 Main Street, City, State, ZIP</p>
    </div>

    <div class="bg-body-tertiary border rounded-3">
    <h1>Contact Us</h1>
    
    <form action="/savecontact" method="post">
            Name :  <input type="text" class="form-control" name="name" />
            Mobile : <input type="text" class="form-control" name="mobile" />
            Email : <input type="email" class="form-control" name="email" />
            Message: <textarea name="message" class="form-control" rows="2" cols="30"></textarea><br><br>
        <input type="submit" value="Submit"><br><br>
        </form>
    </div>
<div> --%>
<center><h3>${message}</h3></center>
