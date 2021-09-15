<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="cn">
<%if(request.getParameter("loginfail")!=null){
	String freason = request.getParameter("loginfail");
	if(freason.equals("phoneno_err")){
%>
		<script type="text/javascript"> alert('登录失败\n\n手机号错误或用户不存在');window.location.href="login.jsp"; </script>
<%	}
	if(freason.equals("password_err")){
%>
 		<script type="text/javascript"> alert('登录失败\n\n密码错误');window.location.href="login.jsp"; </script>
<%	}
	if(freason.equals("isofficial_err")){
%>
 		<script type="text/javascript"> alert('登录失败\n\n用户身份类型错误');window.location.href="login.jsp"; </script>
<%	}
}%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>

<body class="bg-light text-dark">
    
    <div class="row">
        <!-- <div class="col-lg-8 col-md-6 col-0 min-vh-100 bg-primary">
                picture
        </div> -->

        <div id="carouselExampleCaptions" class="carousel slide carousel-fade col-lg-8 col-md-6 col-0 min-vh-100 bg-" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
              <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="./assets/img/login1.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5 class="fs-1">创新名城&nbsp;&nbsp;美丽古都</h5>
                  <p>全市景区统一预约订票系统</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="./assets/img/login2.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5 class="fs-1">戴口罩&nbsp;&nbsp;勤洗手&nbsp;&nbsp;常通风&nbsp;&nbsp;不聚集</h5>
                  <p>全市景区统一预约订票系统</p>
                </div>
              </div>
              <div class="carousel-item">
                <img src="./assets/img/login3.jpg" class="d-block w-100" alt="...">
                <div class="carousel-caption d-none d-md-block">
                  <h5 class="fs-1">大江滔滔东入海&nbsp;&nbsp;石城虎踞山盘龙</h5>
                  <p>全市景区统一预约订票系统</p>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
          </div>
            
        <div class="position-relative col-lg-4 col-md-6 col-12 vh-100 bg-white">
            <div class="mt-5"></div>
            <div class="mb-2"></div>
            <div class="p-4 m-5">
                <h4 class="mt-5 mb-5 text-dark fs-2 fw-normal">欢迎光临 <span class="fw-bold">景区订票系统</span></h4>
                <form action="LoginServlet" method="get">
                    <div class="row mb-4">
                        <label class="fw-bold mb-3">手机号</label>
                        <div class="col-sm-12 ">
                            <input type="text" class="form-control" name="phone_no" required="required">
                        </div>
                    </div>

                    <div class="row mb-4">
                        <label class="fw-bold mb-3">密码</label>
                        <div class="col-sm-12">
                            <input type="password" class="form-control" name="password" required="required">
                        </div>
                    </div>  
                      
                    <div class="row mb-4">
                        <label class="fw-bold mb-3 mt-3">您的身份？</label>
                        <div class="row">
                            <div class="form-check col">
                                <input class="form-check-input" type="radio" name="is_official" value="false" checked>
                                <label class="form-check-label">游客</label>
                            </div>

                            <div class="form-check col">
                                <input class="form-check-input" type="radio" name="is_official" value="true" >
                                <label class="form-check-label">管理员</label>
                            </div>
                        </div>
                    </div>
                    <div class="mt-5 text-left">
                        <button type="submit" class="col btn btn-outline-primary btn-lg fw-bold">登录</button>
                    </div>

                    <div class="mt-5 text-center login-form-item text-muted">
                        还没有账号？<a href="register.jsp" style="text-decoration: none;">马上注册 👉</a>
                    </div>
                    <div class="mt-3 text-center login-form-item text-muted">
                        或者...<a href="welcome.jsp" style="text-decoration: none;">先去逛逛？</a>
                    </div>
                </form>

                <div class="position-absolute bottom-0 start-50 translate-middle text-center mt-5 mb-5 text-small text-muted">Copyright &copy; 严宇昂 AND 陈润泽</div>
            </div>

        </div>
    </div>
    
</body>
</html>