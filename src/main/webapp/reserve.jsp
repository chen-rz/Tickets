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
<%	if(request.getParameter("rsv_err")!=null){
		if(request.getParameter("rsv_err").equals("too_many_people")){
 %>
 		<script type="text/javascript">
 			alert('订单提交失败\n\n▲  您选择的日期余票不足');
 			window.location.href='reserve.jsp';
 		</script>
<%		}
	}
 %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>预约订票</title>
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
            <h3 class="fw-bold text-primary ms-0 mb-3" id=""><%=pk.getPark_name() %></h3>
            <div class="mt-4 p-2">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12 13.5a2.5 2.5 0 100-5 2.5 2.5 0 000 5z"></path><path fill-rule="evenodd" d="M19.071 3.429C15.166-.476 8.834-.476 4.93 3.429c-3.905 3.905-3.905 10.237 0 14.142l.028.028 5.375 5.375a2.359 2.359 0 003.336 0l5.403-5.403c3.905-3.905 3.905-10.237 0-14.142zM5.99 4.489A8.5 8.5 0 0118.01 16.51l-5.403 5.404a.859.859 0 01-1.214 0l-5.378-5.378-.002-.002-.023-.024a8.5 8.5 0 010-12.02z"></path></svg>
                <span id=""><%=pk.getPark_address() %></span>
            </div>
            
            <!-- 表单 -->
            <form action="ReserveServlet" method="post" onsubmit="return antiDuplicateSubmission();">
                <div class="card shadow border-primary mt-5 mb-3" >  
                    <div class="card-body m-4" id="card-body">
                        <div class="row g-3">
                        
                            <div class="col">
                                <div class="col-md-12 col-lg-8">
                                    <label class="form-label fw-bold">入园时间</label>
                                    <select class="form-select" aria-label="Default select example" name="schedule_time">
                                    <%
                                    	for(int k=pk.getOpen_time();k<pk.getClose_time();k++){
                                     %>
                                        <option value="<%=k %>"><%=k %>时</option>
                                    <%} %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="col">
                                <div class="col-md-12 col-lg-8">
                                    <label class="form-label fw-bold">同行人数</label>
                                    <select class="form-select" aria-label="Default select example" id="tickets" onchange="calculateCost()" name="member_num">
                                        <option value="0" selected>0</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row mt-4">
                            <div class="col-lg-4">
                                <label class="form-label fw-bold">预约日期</label>
                                <select class="form-select" aria-label="Default select example" name="schedule_date">
                                    <option value="0" selected>今天</option>
                                    <option value="1">明天</option>
                                    <option value="2">后天</option>
                                </select>
                            </div>
                        </div>

                        <h4 class="mt-5 mb-4 fw-bold">订票人信息</h3>
                        <div>
                            <div class="row mb-4">
                                <div class="col-lg-3 col-md-6">
                                    <label class="form-label fw-bold">姓名</label>
                                    <input type="text" class="form-control " placeholder="您的姓名" required="required" name="tourist_name_0">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-8">
                                    <label class="form-label fw-bold">身份证号</label>
                                    <input type="text" class="form-control " placeholder="请填写身份证号" required="required" name="tourist_idcard_0">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-6">
                                    <label class="form-label fw-bold">手机号</label>
                                    <input type="text" class="form-control " placeholder="请填写手机号" required="required" value="<%=usr.getPhoneno()%>" name="tourist_phoneno">
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-6">
                                    <label class="form-label fw-bold">来源地</label> 
                                    <input type="text" class="form-control " placeholder="14天内您是从哪里来到本市的？" required="required" name="where_from_0">
                                </div>
                            </div>
                            <div class="row mb-1">
                                <div class="col-lg-6">
                                    <label class="form-label fw-bold">健康码是否为绿码</label>
                                </div>
                            </div>
                            <div class="row mb-4">
                                <div class="col-lg-6">
                                    <input class="form-check-input" type="radio" name="is_healthy_0" value="true" checked>
                                    <label class="form-check-label">是</label>
                                </div>
                                <div class="col-lg-6">
                                    <input class="form-check-input" type="radio" name="is_healthy_0" value="false">
                                    <label class="form-check-label">否</label>
                                </div>
                            </div>
                        </div>
                        <!-- 自动生成js -->
                        <h4 class="mt-5 mb-4 fw-bold d-none" id="partenertitle">同行人信息</h3>

                    </div>
                </div>

                <!-- 结算环节 -->
                <div class="row mt-5 ms-2 me-2">
                    <div class="col-lg-8">
                        <h4 class="fw-bold mb-4">预约须知</h4>
                        <p class="text-secondary mt-3">1. 疫情期间景区限流，每日门票有限，订完为止；</p>
                        <p class="text-secondary mt-3">2. 本系统暂时仅提供正价门票，如需购买优惠票，请咨询相应景区；</p>
                        <p class="text-secondary mt-3">3. 如需取消预约、办理退票，请咨询相应景区或市内游客集散中心；</p>
                        <p class="text-secondary mt-3">4. 如对具体景区有其他问题，请联系相关景区，联系方式参见各景区详情页；</p>
                        <p class="text-secondary mt-3">5. 疫情期间余票紧张，请尽可能按时入园，订票后请勿失约，谢谢配合！</p>
                    </div>

                    <div class="card shadow border-primary col-lg-4 p-4" >
                        <div class="mb-2">
                            <div class="text-end text-muted fs-6">景区名称</div>
                            <div class="text-end fw-bold fs-5"><%=pk.getPark_name() %></div>
                        </div>
                        
                        <div class="mb-2">
                            <div class="text-end text-muted fs-6">票价</div>
                            <div class="text-end fw-bold fs-5">￥ <span id="fare"><%=pk.getPrice() %></span></div>
                        </div>

                        <div class="mb-2">
                            <div class="text-end text-muted fs-6">数量</div>
                            <div class="text-end fw-bold fs-5" id="number">1</div>
                        </div>
                        
                        <div class="mb-2">
                            <div class="text-end text-muted fs-6">总价</div>
                            <div class="text-end fw-bold fs-4">￥ <span id="finalcost"><%=pk.getPrice() %></span></div>
                        </div>

                        <div class="mb-2 mt-4 text-end">
                            <button type="submit" class="col btn btn-primary btn-lg fw-bold">预订</button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </section>

    <footer class="bg-primary bg-opacity-10 mt-5 ">
        <div class="container-lg mt-5 text-center">
            <h3 class="mt-5">广告位招租</h3>
            <p class="mt-5 mb-5">
               创新名城，美丽古都，世界文化遗产明孝陵欢迎您！
            </p>
        </div>
    </footer>

</body>


    <script>
        // 用个onclick实践，每次刷新一下
        function calculateCost (){

            //计价功能
            var tickets = document.getElementById("tickets");
            var index = tickets.selectedIndex;
            var ticketnumber = tickets.options[index].value;
            parseFloat(ticketnumber);
            ticketnumber ++;

            var number = document.getElementById("number");
            number.textContent = ticketnumber;

            // 这里用jsp设定，防止不怀好意
            var fare = document.getElementById("fare").textContent;
            parseFloat(fare);
            var cost = fare * ticketnumber;
            var finalcost = document.getElementById("finalcost");
            finalcost.textContent = cost;

            var parteners = ticketnumber - 1;
            var partenertitle =  document.getElementById("partenertitle");
            var oldpartenerinfo = document.getElementById("partenerinfo");

            // 改变前先清零
            if(oldpartenerinfo === null){
                    //console.log("原来无！");
                }

                else {
                    oldpartenerinfo.parentNode.removeChild(oldpartenerinfo);
                    //console.log("清除！");
                }
            
            if(parteners > 0) {
                partenertitle.setAttribute("class", "mt-5 mb-4 fw-bold");
                
                

                var cardbody = document.getElementById("card-body");
                var newpartenerinfo = document.createElement("div");
                newpartenerinfo.setAttribute("id", "partenerinfo");
                cardbody.appendChild(newpartenerinfo);

                console.log("")

                for(var i = 0; i < parteners; i++) {
                    //标题
                    var title = document.createElement("p");
                    title.setAttribute("class", "fs-5");
                    title.textContent = "同行人";
                    newpartenerinfo.appendChild(title);

                    var titlespan = document.createElement("span");
                    titlespan.textContent = i + 1;
                    title.appendChild(titlespan);

                    // 姓名
                    var namediv = document.createElement("div");
                    namediv.setAttribute("class", "row mb-4");
                    newpartenerinfo.appendChild(namediv);

                    var namedivdiv = document.createElement("div");
                    namedivdiv.setAttribute("class", "col-lg-3 col-md-6");
                    namediv.appendChild(namedivdiv);

                    var namelabel = document.createElement("label");
                    namelabel.setAttribute("class", "form-label fw-bold");
                    namelabel.textContent = "姓名";
                    namedivdiv.appendChild(namelabel);

                    var nameinput = document.createElement("input");
                    nameinput.setAttribute("type", "text");
                    nameinput.setAttribute("class", "form-control");
                    nameinput.setAttribute("placeholder", "您的姓名");
                    nameinput.setAttribute("name", "tourist_name_" + (i+1));
                    nameinput.setAttribute("required", "required");
                    namedivdiv.appendChild(nameinput);

                    //身份证号
                    var iddiv = document.createElement("div");
                    iddiv.setAttribute("class", "row mb-4");
                    newpartenerinfo.appendChild(iddiv);

                    var iddivdiv = document.createElement("div");
                    iddivdiv.setAttribute("class", "col-lg-8");
                    iddiv.appendChild(iddivdiv);

                    var idlabel = document.createElement("label");
                    idlabel.setAttribute("class", "form-label fw-bold");
                    idlabel.textContent = "身份证号";
                    iddivdiv.appendChild(idlabel);

                    var idinput = document.createElement("input");
                    idinput.setAttribute("type", "text");
                    idinput.setAttribute("class", "form-control");
                    idinput.setAttribute("placeholder", "请填写身份证号");
                    idinput.setAttribute("name", "tourist_idcard_" + (i+1));
                    idinput.setAttribute("required", "required");
                    iddivdiv.appendChild(idinput);

                    //哪里来的
                    var fromdiv = document.createElement("div");
                    fromdiv.setAttribute("class", "row mb-4");
                    newpartenerinfo.appendChild(fromdiv);

                    var fromdivdiv = document.createElement("div");
                    fromdivdiv.setAttribute("class", "col-lg-6");
                    fromdiv.appendChild(fromdivdiv);

                    var fromlabel = document.createElement("label");
                    fromlabel.setAttribute("class", "form-label fw-bold");
                    fromlabel.textContent = "来源地";
                    fromdivdiv.appendChild(fromlabel);

                    var frominput = document.createElement("input");
                    frominput.setAttribute("type", "text");
                    frominput.setAttribute("class", "form-control");
                    frominput.setAttribute("placeholder", "14天内您是从哪里来到本市的？");
                    frominput.setAttribute("name", "where_from_" + (i+1));
                    frominput.setAttribute("required", "required");
                    fromdivdiv.appendChild(frominput);

                    // 健康码标题
                    var healthtitlediv = document.createElement("div");
                    healthtitlediv.setAttribute("class", "row mb-1");
                    newpartenerinfo.appendChild(healthtitlediv);

                    var healthtitledivdiv = document.createElement("div");
                    healthtitledivdiv.setAttribute("class", "col-lg-6");
                    healthtitlediv.appendChild(healthtitledivdiv);

                    var healthtitlelabel = document.createElement("label");
                    healthtitlelabel.setAttribute("class", "form-label fw-bold");
                    healthtitlelabel.textContent = "健康码是否为绿码";
                    healthtitledivdiv.appendChild(healthtitlelabel);

                    //健康码选择
                    var healthselectdiv = document.createElement("div");
                    healthselectdiv.setAttribute("class", "row mb-4");
                    newpartenerinfo.appendChild(healthselectdiv);

                    var healthselectdivdiv1 = document.createElement("div");
                    healthselectdivdiv1.setAttribute("class", "col-lg-6");
                    healthselectdiv.appendChild(healthselectdivdiv1);

                    var healthselectinput1 = document.createElement("input");
                    healthselectinput1.setAttribute("class", "form-check-input");
                    healthselectinput1.setAttribute("type", "radio");
                    healthselectinput1.setAttribute("name", "is_healthy_" + (i+1));
                    healthselectinput1.setAttribute("value", "true");
                    healthselectinput1.setAttribute("checked", "checked");
                    healthselectdivdiv1.appendChild(healthselectinput1);

                    var healthselectlabel1 = document.createElement("label");
                    healthselectlabel1.setAttribute("class", "form-check-label");
                    healthselectlabel1.textContent = "是";
                    healthselectdivdiv1.appendChild(healthselectlabel1);

                    var healthselectdivdiv2 = document.createElement("div");
                    healthselectdivdiv2.setAttribute("class", "col-lg-6");
                    healthselectdiv.appendChild(healthselectdivdiv2);

                    var healthselectinput2 = document.createElement("input");
                    healthselectinput2.setAttribute("class", "form-check-input");
                    healthselectinput2.setAttribute("type", "radio");
                    healthselectinput2.setAttribute("name", "is_healthy_" + (i+1));
                    healthselectinput2.setAttribute("value", "false");
                    healthselectdivdiv2.appendChild(healthselectinput2);

                    var healthselectlabel2 = document.createElement("label");
                    healthselectlabel2.setAttribute("class", "form-check-label");
                    healthselectlabel2.textContent = "否";
                    healthselectdivdiv2.appendChild(healthselectlabel2);
                }
            }

            else {
                partenertitle.setAttribute("class", "mt-5 mb-4 fw-bold d-none");
            }
            
        }   
    </script>
    
    <script type="text/javascript">
    	var submitCheck = false;
    	function antiDuplicateSubmission(){
    		if(submitCheck == true){return false;}
    		submitCheck = true;
    		return true;
    	}
    </script>
    
</html>
