<%@ page language="java" import="java.util.*,entity.*,service.ParkService" pageEncoding="UTF-8"%>

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
    <title>景区一览</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ" crossorigin="anonymous"></script>
</head>
<body>
    <!-- 导航栏，以此为准 -->
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

    <!-- 景点部分 -->
    <section>
        <div class="container-lg">
            <p class="fs-6 fw-bold text-primary ms-0">选择一个景区</p>
            <!-- 展示卡片 -->
            <div class="row">
            
	            <%
	    		ParkService serv=new ParkService();
	    		ArrayList<Park> parkset=serv.getParkSet();
	    		for(int i=0;i<parkset.size();i++){
	    			Park tmp = parkset.get(i);
	    		%>
                <div class="col-lg-4 col-md-6 col-12 g-3">
                    <div class="card">
                        <img src="./assets/img/parks/park<%=i%>.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                        <h5 class="card-title"><%= tmp.getPark_name() %></h5>
                        <p class="card-text">票价： ￥<%= tmp.getPrice() %></p>
                        <p class="card-text">开放时间： <%= tmp.getOpen_time() %> 时至  <%= tmp.getClose_time() %> 时</p>
                        <p class="card-text">剩余可预约人次：<br>
                        	今日&nbsp;&nbsp;<%= tmp.getMax_num()-tmp.getVisitor_0() %>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        	明日&nbsp;&nbsp;<%= tmp.getMax_num()-tmp.getVisitor_1() %>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
                        	后日&nbsp;&nbsp;<%= tmp.getMax_num()-tmp.getVisitor_2() %>
                        </p>
                        <a href="ParkServlet?park_id=<%=tmp.getPark_id() %>" class="btn btn-primary">查看详情</a>
                        </div>
                    </div>
                </div>
            	<%} %>
            	
            </div>
        </div>
    </section>


    <footer class="bg-primary bg-opacity-10 mt-5 ">
        <div class="container-lg mt-5 text-center">
            <h3 class="mt-5">欢迎报考南京师范大学附属中学</h3>
            <p class="mt-5 mb-5">
				地址：南京市鼓楼区察哈尔路37号
            </p>
        </div>
    </footer>
    
    
</body>
</html>