<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8"%>

<%
	User usr = new User();
	if(session.getAttribute("user_info")!=null){
		usr = (User)session.getAttribute("user_info");
	}
%>

<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>全市景区统一预约订票系统 - 管理员版</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body >

    <nav class="navbar navbar-expand-md navbar-light pt-5 pb-4" >
        <div class="container-xxl">
            <a class="navbar-brand">
                <span class="text-secondary fw-bold">全市景区统一预约订票系统</span>
                  <span class="text-secondary"> - 管理员版</span>
                
              </a>

              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-nav" aria-controls="main-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse justify-content-end align-center" id="main-nav">
                <ul class="navbar-nav">
                
                  <li class="nav-item">
                    <a class="nav-link"><%=usr.getUser_name()==null?"您尚未登录":"欢迎您，"+usr.getUser_name() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  </li>
                  
                  <li class="nav-item ms-2 d-none d-md-inline">
                    <a class="btn btn-secondary" href="login.jsp"><%=usr.getUser_name()==null?"去登录":"退出登录"%></a>
                  </li>
                  
                </ul>
              </div>
        </div>
    </nav>

    <section class="min-vh-100">
        <div class="container-lg ">
        <p class="fs-6 fw-bold text-primary ms-0">景区数据大屏</p>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th scope="col">景区名称</th>
                        <th scope="col">当日流量</th>
                        <th scope="col">次日流量</th>
                        <th scope="col">后日流量</th>
                    </tr>
                    </thead>

                    <tbody>
                    <tr class="bg-primary">
                        <th scope="row">玄武湖公园</th>
                        <td id = "11">100/200 </td>
                        <td id = "12">100/200 </td>
                        <td id = "13">100/200 </td>
                    </tr>

                    <tr class="bg-secondary">
                        <th scope="row">小桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-success">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-warning">
                        <th scope="row">玄武湖公园</th>
                        <td id = "11">100/200 </td>
                        <td id = "12">100/200 </td>
                        <td id = "13">100/200 </td>
                    </tr>

                    <tr class="bg-danger">
                        <th scope="row">小桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-info">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-primary bg-gradient">
                        <th scope="row">玄武湖公园</th>
                        <td id = "11">100/200 </td>
                        <td id = "12">100/200 </td>
                        <td id = "13">100/200 </td>
                    </tr>

                    <tr class="bg-secondary bg-gradient">
                        <th scope="row">小桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-success bg-gradient">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-warning bg-gradient">
                        <th scope="row">玄武湖公园</th>
                        <td id = "11">100/200 </td>
                        <td id = "12">100/200 </td>
                        <td id = "13">100/200 </td>
                    </tr>

                    <tr class="bg-danger bg-gradient">
                        <th scope="row">小桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-info bg-gradient">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-warning bg-opacity-10">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-warning bg-opacity-25">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    <tr class="bg-warning bg-opacity-50">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>
                    <tr class="bg-warning bg-opacity-15">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>
                    <tr class="bg-warning">
                        <th scope="row">大桃园
                        <td id = "21">100/200 </td>
                        <td id = "22">100/200 </td>
                        <td id = "23">100/200 </td>
                    </tr>

                    



                    
                    
                    </tbody>
                </table>
        </div>
        
    </section>

	<footer class="bg-primary bg-opacity-10 p-5 mt-5">
        <div class="container-lg text-center">
            <h3 class="mt-2 ">* 谢谢支持 *</h3>
            <p class="mt-3 pt-3 text-secondary">
                由于支付功能需要企业资质，暂时无法完善支付模块哦，不过聪明的小伙伴肯定想到了，我们的微信是14762998710和13337806752，掏出手机支持我们一下吧~
            </p>

            <p class="mt-3 pt-5 text-muted">
              Copyright &copy; 严宇昂AND陈润泽
            </p>
        </div>
    </footer>

</body>
</html>
