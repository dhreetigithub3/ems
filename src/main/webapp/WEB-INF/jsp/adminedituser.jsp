
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="adminlayout/header.jsp" />

<title>User Page</title>
  <style>
    .container-update {
      position: absolute;
            width: 50%;
            height: 50%;
            top: 50%;
            left: 30%;
            margin: -50px 0 0 -50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      margin-bottom: 5px;
    }
    input {
      width: 300px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    #btn-update {
        width:100%;
      padding: 10px 20px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
  </style>

  <div class="container-update">
  <form method="post" action="admin-update-users">
    <h1>Update Page</h1>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" id="name" name="name" value="${usermaster[0].name}" >
    </div>
    <div class="form-group">
      <label for="email"></label>
      <input type="hidden" id="email" name="email" value="${usermaster[0].email}">
    </div>
    <div class="form-group">
      <label for="mobile">Mobile:</label>
      <input type="tel" id="mobile" name="mobile" value="${usermaster[0].mobile}">
    </div>
    <div class="form-group">
      Role : <select name="role">
            <option>${usermaster[0].role}</option>
            <option>Admin</option>
            <option>Faculty</option>
            <option>Student</option>
        </select>
    </div>
    <button type="submit" id="btn-update" name="btn-update">Update</button>
    <h3>${message}</h3>
    </form>
  </div>