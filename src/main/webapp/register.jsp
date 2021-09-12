<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="cn">

<%if(request.getParameter("failure")!=null){
	if(request.getParameter("failure").equals("psw_cfm_err")){
	%>
		<script type="text/javascript"> 
			alert('再次输入的密码不正确，请检查');
			window.location.href="register.jsp";
		</script>
<%	}
	if(request.getParameter("failure").equals("reg_err")){
%>
		<script type="text/javascript">
			alert('注册失败\n\n请注意：\n◆ 所有项目均不能为空\n◆ 同一手机号不可注册多个账号');
			window.location.href="register.jsp";
		</script>
<%	}
	if(request.getParameter("failure").equals("no_failure")){
%>
		<script type="text/javascript">
			alert('注册成功！');
			window.location.href="login.jsp";
		</script>
<%	} 
}%>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
    <title>用户注册</title>
</head>

<body class="position-relative bg-light min-vh-100">
    <div class="shadow position-absolute top-50 start-50 translate-middle card col-10 col-sm-8 col-md-7 col-lg-6 col-xl-5">
        <div class="card-header bg-white">
            <h4 class=" text-primary fw-bold ms-4 mt-3">注册</h4>
        </div>

        <form action="RegisterServlet" method="get">
            <div class="row mb-4 mt-4 ms-4">
                <label class="fw-bold mb-3">用户名</label>
                <div class="col-9 ">
                    <input type="text" class="form-control col" name="user_name">
                </div>
            </div>

            <div class="row mb-4 mt-4 ms-4">
                <label class="fw-bold mb-3">手机号</label>
                <div class="col-9 ">
                    <input type="text" class="form-control col" name="phone_no">
                </div>
            </div>

            <div class="row mb-4 mt-4 ms-4">
                <label class="fw-bold mb-3">密码</label>
                <div class="col-6 ">
                    <input type="password" class="form-control col" name="password">
                </div>
            </div>

            <div class="row mb-4 mt-4 ms-4">
                <label class="fw-bold mb-3">请再次确认密码~</label>
                <div class="col-6 ">
                    <input type="password" class="form-control col" name="password_confirm">
                </div>
            </div>

            <div class="mb-4 mt-5 ms-4 text-left">
                <button type="submit" class="col btn btn-outline-primary btn-lg fw-bold ms-2">注册！</button>
            </div>

            <div class="mt-5 mb-5 text-center login-form-item text-muted">
                已经有账号啦？<a href="login.jsp" style="text-decoration: none;">去登录 👉</a>
            </div>

            
        </form>
    </div>
    
</body>
</html>