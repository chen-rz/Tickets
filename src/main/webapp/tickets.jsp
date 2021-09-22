<%@ page language="java" import="java.util.*,entity.*,service.ReserveService,javax.crypto.spec.SecretKeySpec,javax.crypto.Cipher,org.apache.commons.codec.binary.Hex" pageEncoding="UTF-8"%>

<%
	User usr = new User();
	String userKey = "00000000000000000000000000000000";
	if(session.getAttribute("user_info")!=null){
		usr = (User)session.getAttribute("user_info");
		userKey = usr.getPassword().substring(0, 32);
	}
	
	ReserveService rssv = new ReserveService();
	ArrayList<Reservation> rsvset = rssv.getReservationSet(usr.getPhoneno());
%>
<%!
	public String aes128_decrypt(String src, String key128) throws Exception {
		SecretKeySpec keySpec = new SecretKeySpec(key128.getBytes("UTF-8"),"AES");
		Cipher cphr = Cipher.getInstance("AES");
		cphr.init(Cipher.DECRYPT_MODE, keySpec);
		byte[] original = cphr.doFinal(Hex.decodeHex(src));
		String oriStr = new String(original,"UTF-8");
		return oriStr;
	}
%>

<!DOCTYPE html>
<html lang="cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>订单记录（共 <%=rsvset.size() %> 条）</title>
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

    <div class="container-lg min-vh-100 mb-0">
        <p class="fs-6 fw-bold text-primary ms-0 mb-3 pt-3">订单记录（共 <%=rsvset.size() %> 条）</p>
        
        <%for(int i=0;i<rsvset.size();i++){ %>
        <div class="shadow row mt-3 ms-3 mb-5 me-3" style="border-width: 0.7rem 0 0.7rem 0; border-color: #ffc107;border-style: solid; background-color:white; ">
            <!-- 左边放信息 -->
           
            <div class="col-lg-9" style="border-width: 0 0.1rem 0 0; border-color: #e9ecef; border-style: solid;">
                <p class="text-secondary fs-6 m-3 p-1">持票人姓名: &nbsp;
                    <span><%=aes128_decrypt(rsvset.get(i).getTourist_name(),userKey) %></span>
                </p>
                <p class="text-secondary fs-6 m-3 p-1">持票人身份证号: &nbsp;
                    <span><%=aes128_decrypt(rsvset.get(i).getTourist_idcard(),userKey) %></span>
                </p>

                <p class="text-secondary fs-6 m-3 p-1">同行者数目: &nbsp;
                    <span><%=rsvset.get(i).getMember_num() %></span>
                </p>
                <p class="text-secondary fs-6 m-3 p-1">预订景区: &nbsp;
                    <span><%=rsvset.get(i).getPark_selected() %></span>
                </p>
                <p class="text-secondary fs-6 m-3 p-1">预订入园时间: &nbsp;
                    <span><%=rsvset.get(i).getSchedule() %></span>
                </p>
                <p class="text-secondary fs-6 m-3 p-1">订单号: &nbsp;
                    <span><%=rsvset.get(i).getReserve_id() %></span>
                </p>
                <p class="text-secondary fs-6 m-3 p-1">下单时间: &nbsp;
                    <span><%=rsvset.get(i).getTime_stamp() %></span>
                </p>
            </div>

            <div class="col-lg-3 text-center pt-5 mt-2" >
                <img src="https://api.pwmqr.com/qrcode/create/?url=<%=rsvset.get(i).getId_cipher() %>" style="width: 15em; height: 15em;">     
            </div>
            
        </div>
        <%}%>
        
    </div>

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
