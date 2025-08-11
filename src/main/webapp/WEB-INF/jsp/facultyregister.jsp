
<jsp:include page="facultylayout/header.jsp" />

 <title>Register User</title>
    <script type="text/javascript">
        function check()
        {
            password=document.getElementById('password').value;
            mobile=document.getElementById('mobile').value;

            passwordError=true;
            mobileError=true;

            passwordValid();
            mobileValid();

            if(passwordError && mobileError)
            {
                return true;
            }else{
                return false;
            }
        }
        function passwordValid()
        {
            passwordsms=document.getElementById("msg-password");
            patt=/^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*\W)(?!.* ).{8,16}$/;
            if(password.match(patt))
            {
                passwordsms.innerHTML="";
                passwordError=true;
            }else{
                passwordsms.innerHTML="Invalid Password";
                passwordError=false;
            }
        }
        function mobileValid()
        {
            mobilesms=document.getElementById("msg-mobile");
            patt=/^[6-9]{1}[0-9]{9}$/;
            if(mobile.match(patt))
            {
                mobilesms.innerHTML="";
                mobileError=true;
            }else{
                mobilesms.innerHTML="Invalid Mobile";
                mobileError=false;
            }
        }
    </script>
    <style>
        .div-register {
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
        form {
            width: 400px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f2f2f2;
        }
        input[type="text"], input[type="email"], input[type="password"] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
            border-radius: 4px;
        }
        input[type="submit"] {
            width: 100%;
            background-color:blue;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #00b0ff;
        }
    </style>
</head>
<div class="div-register" >
    <form action="faculty-register-user" method="post" onsubmit="return check()">
        <h2>Register User</h2>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" title="Must contain at least one number and one uppercase and lowercase letter and a special character, and at least 8 or more characters"><br>

        <label for="mobile">Mobile:</label>
        <input type="text" id="mobile" name="mobile" required><br>

        <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option> - Select - </option>
                <option value="Admin">Admin</option>
                <option value="Faculty">Faculty</option>
                <option value="Student">Student</option>
            </select><br><br>

        <input type="submit" value="Register">

        <h3> ${message} </h3>
        <span id="msg-password"> </span><br>
        <span id="msg-mobile"> </span>
        
    </form>

    

</div>


