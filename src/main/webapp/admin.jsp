<%@ page language="java" import="java.util.*,entity.*,service.ParkService,java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<%
	User usr = new User();
	if(session.getAttribute("user_info")!=null){
		usr = (User)session.getAttribute("user_info");
	}
	
	Date nowdate=new Date();
	SimpleDateFormat datef=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String time_stamp = datef.format(nowdate);
%>

<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>景区数据大屏 - 管理员端</title>
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
                  
                  <li class="nav-item">
                    <a class="nav-link"><%="数据更新时间："+time_stamp %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
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
                    <tr class="bg-primary bg-opacity-10">
                        <th scope="col">景区名称</th>
                        <th scope="col" class="text-center">当日流量</th>
                        <th scope="col" class="text-center">次日流量</th>
                        <th scope="col" class="text-center">后日流量</th>
                    </tr>
                    </thead>

                    <tbody>
                    
                    <%
		    		ParkService serv=new ParkService();
		    		ArrayList<Park> parkset=serv.getParkSet();
		    		for(int i=0;i<parkset.size();i++){
		    			Park tmp = parkset.get(i);
		    		%>
                    <tr>
                    
                        <th scope="row" <% if(tmp.isCovid_risk()){%>
                        		class="bg-danger bg-opacity-75"
                        	<%}%>><%=tmp.getPark_name() %></th>
                        
                        <td class="text-center" style="background-color:rgba(255,193,7,<%=(float)tmp.getVisitor_0()/tmp.getMax_num()%>);">
                        	<%=tmp.getVisitor_0() %> / <%=tmp.getMax_num() %>
						</td>
						
                        <td class="text-center" style="background-color:rgba(255,193,7,<%=(float)tmp.getVisitor_1()/tmp.getMax_num()%>);">
                        	<%=tmp.getVisitor_1() %> / <%=tmp.getMax_num() %>
						</td>
						
						<td class="text-center" style="background-color:rgba(255,193,7,<%=(float)tmp.getVisitor_2()/tmp.getMax_num()%>);">
                        	<%=tmp.getVisitor_2() %> / <%=tmp.getMax_num() %>
						</td>
						
                    </tr>
                    <%} %>
                    
                    </tbody>
                </table>
        </div>
        
    </section>

	<footer class="bg-primary bg-opacity-10 p-5 mt-3">
        <div class="container-lg text-center">
            <h3 class="mt-2 ">* 谢谢支持 *</h3>
            <p class="mt-3 pt-3 text-secondary">
               	众志成城  防控疫情
            </p>

            <p class="mt-3 pt-5 text-muted">
              Copyright &copy; 严宇昂 AND 陈润泽
            </p>
        </div>
    </footer>

</body>
</html>
