<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/stylesheet">
</script>
<script type="text/javascript">
</script>
<meta charset="UTF-8">
<title>Student Layout</title>
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

<header class="p-3 text-bg-dark">
    <div class="container">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"></use></svg>
        </a>

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        	<li><h3>Student Dashboard</h3></li>
          <li><a href="/student-dashboard" class="nav-link px-2 text-white">Home</a></li>
          <li><a href="/student-users" class="nav-link px-2 text-white">Users</a></li>
          <li><a href="#" class="nav-link px-2 text-white">Profile</a></li>
          <li><a href="/student-exam" class="nav-link px-2 text-white">Exam</a></li>
          <li><a href="/result" class="nav-link px-2 text-white">Results</a></li>
          <li><a href="/teacherUpload" class="nav-link px-2 text-white">Videos</a></li>
          <li><a href="/doughts" class="nav-link px-2 text-white">Dought</a></li>
        </ul>

        <div class="text-end">
          <a href="/login"><button type="button" class="btn btn-outline-light me-2">Logout</button></a>
          <button type="button" class="btn btn-warning">Change Password</button>
        </div>
      </div>
    </div>
  </header>