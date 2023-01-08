<%@ page language="java" import="java.util.*,entity.*" pageEncoding="UTF-8"%>

<% 	Park pk = new Park();
	if(request.getSession().getAttribute("park_selected")!=null){
		pk = (Park)request.getSession().getAttribute("park_selected");
	} 
	
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
    <title><%=pk.getPark_name() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body>
    <!-- 导航栏 -->
    <nav class="navbar navbar-expand-md navbar-light pt-5 pb-4" >
        <div class="container-xxl">
            <a class="navbar-brand">
                <span class="text-secondary fw-bold">
                  	全市景区统一预约订票系统
                </span>
              </a>

              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#main-nav" aria-controls="main-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>

              <div class="collapse navbar-collapse justify-content-end align-center" id="main-nav">
                <ul class="navbar-nav">
                
                  <li class="nav-item">
                    <a class="nav-link"><%=usr.getUser_name()==null?"您尚未登录":"欢迎您，"+usr.getUser_name() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
                  </li>
                  
                  <li class="nav-item">
                    <a class="nav-link" href="welcome.jsp">景区一览</a>
                  </li>
                  
                  <%if(usr.getUser_name()!=null){ %>
                  <li class="nav-item">
                    <a class="nav-link" href="tickets.jsp">订单记录</a>
                  </li>
                  <%} %>
                  
                  <li class="nav-item ms-2 d-none d-md-inline">
                    <a class="btn btn-secondary" href="login.jsp"><%=usr.getUser_name()==null?"去登录":"退出登录"%></a>
                  </li>
                  
                </ul>
              </div>
        </div>
    </nav>

    <section>
        <div class="container-lg">
            <p class="fs-6 fw-bold text-primary ms-0 mb-3"><%=pk.getPark_name() %></p>
            <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                  <div class="carousel-item active ">
                    <img src="./assets/img/details/detail<%=pk.getPark_id() %>_1.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./assets/img/details/detail<%=pk.getPark_id() %>_2.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="./assets/img/details/detail<%=pk.getPark_id() %>_3.jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
            </div>
            <h6 class="text-primary fw-bold mb-5 mt-5">详情介绍</h6>

            <!-- 基本信息 右边放一个地图，最好自动生成可放大-->
            <div class=" border-start border-info border-4">
                <div class="ms-3 mb-3">              
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13.5a2.5 2.5 0 100-5 2.5 2.5 0 000 5z"></path><path fill-rule="evenodd" d="M19.071 3.429C15.166-.476 8.834-.476 4.93 3.429c-3.905 3.905-3.905 10.237 0 14.142l.028.028 5.375 5.375a2.359 2.359 0 003.336 0l5.403-5.403c3.905-3.905 3.905-10.237 0-14.142zM5.99 4.489A8.5 8.5 0 0118.01 16.51l-5.403 5.404a.859.859 0 01-1.214 0l-5.378-5.378-.002-.002-.023-.024a8.5 8.5 0 010-12.02z"></path></svg>
                    <span>地址：</span> <span id=""><%=pk.getPark_address() %></span>
                </div> 

                <div class="ms-3 mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12.5 7.25a.75.75 0 00-1.5 0v5.5c0 .27.144.518.378.651l3.5 2a.75.75 0 00.744-1.302L12.5 12.315V7.25z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg>
                    <span>开放时间：</span> <span id=""> <%=pk.getOpen_time() %> 时至 <%=pk.getClose_time() %> 时</span>
                </div>

                <div class="ms-3 mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M5.873 3.26A.75.75 0 016.44 3h11.31a.75.75 0 01.576.27l5 6a.75.75 0 01-.028.992l-10.75 11.5a.75.75 0 01-1.096 0l-10.75-11.5a.75.75 0 01-.02-1.003l5.19-6zm.91 1.24L2.258 9.73 12 20.153l9.75-10.43L17.399 4.5H6.783z"></path></svg>
                    <span>票价：</span> <span id="">￥ <%=pk.getPrice() %></span>
                </div>

                <div class="ms-3 mb-3">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path fill-rule="evenodd" d="M1.513 1.96a1.374 1.374 0 011.499-.21l19.335 9.215a1.146 1.146 0 010 2.07L3.012 22.25a1.374 1.374 0 01-1.947-1.46L2.49 12 1.065 3.21a1.374 1.374 0 01.448-1.25zm2.375 10.79l-1.304 8.042L21.031 12 2.584 3.208l1.304 8.042h7.362a.75.75 0 010 1.5H3.888z"></path></svg>
                    <span>联系电话：</span> <span id=""><%=pk.getContact() %></span>
                </div>

            </div>


            <div class="card border-info mt-5 mb-3" >
                <div class="card-body">
                	<%=pk.getDescription() %>
                </div>
            </div>

            <!-- 购票按钮 -->
			<%if(usr.getPhoneno()!=null){ %>
            <div class="mb-4 mt-4 text-left">
                <button class="col btn btn-primary btn-lg fw-bold" 
                	onclick="window.location.href='reserve.jsp'">预约订票</button>
            </div>
			<%}else{ %>
            <div class="mb-4 mt-4 text-left">
                <button class="col btn btn-primary btn-lg fw-bold" 
                	onclick="window.location.href='login.jsp'">去登录</button>
            </div>
			<%} %>
        </div>
    </section>

    
	<footer class="bg-primary bg-opacity-10 p-5 mt-5">
        <div class="container-lg text-center">
            <h3 class="mt-2 ">* 谢谢支持 *</h3>
            <p class="mt-3 pt-3 text-secondary">
               	广告位招租
            </p>

            <p class="mt-3 pt-5 text-muted">
              Copyright &copy; 严宇昂 AND 陈润泽
            </p>
        </div>
    </footer>

    
</body>
</html>
