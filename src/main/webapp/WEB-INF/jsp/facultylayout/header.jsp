<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css">
<script type="text/stylesheet">
</script>
<script type="text/javascript">
</script>
<meta charset="UTF-8">
<title>Faculty Layout</title>
<style type="text/css">
.carousel-item {
	  height: 65vh;
	  min-height: 350px;
	  background: no-repeat center center scroll;
	  -webkit-background-size: cover;
	  -moz-background-size: cover;
	  -o-background-size: cover;
	  background-size: cover;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
</body>

<header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        	<li><h3>Faculty Dashboard</h3></li>
          <li><a href="/faculty-dashboard" class="nav-link px-2 text-white">Home</a></li>
          <li><a href="/faculty-users" class="nav-link px-2 text-white">Users</a></li>
          <li><a href="/profile" class="nav-link px-2 text-white">Profile</a></li>
          <li><a href="/faculty-register-user" class="nav-link px-2 text-white">Register</a></li>
          <li><a href="/question" class="nav-link px-2 text-white">Question</a></li>
          <li><a href="/faculty-save-contact" class="nav-link px-2 text-white">Contacts</a></li>
          <li><a href="/uploadVideo" class="nav-link px-2 text-white">Videos</a></li>
          <li><a href="/faculty-dought" class="nav-link px-2 text-white">Doughts</a></li>
        </ul>

        <div class="text-end">
          <a href="/login"><button type="button" class="btn btn-outline-light me-2">Logout</button></a>
          <button type="button" class="btn btn-warning">Change Password</button>
        </div>
      </div>
    </div>
  </header>