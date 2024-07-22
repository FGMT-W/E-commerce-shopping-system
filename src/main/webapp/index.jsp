<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%	
	//获取项目名
	String path = request.getContextPath();
	//获取tomcat 协议+地址+端口号+ 获取项目名
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//获取tomcat 协议+地址+端口号
	String imgPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/xmpic/";
	
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>小米首页</title>
    <link rel="stylesheet" href="<%=basePath %>css/index.css">
    <script src="<%=basePath %>js/jquery-3.1.1.js"></script>
    <style>

    </style>

</head>
<body style="background-color: #fafafa;">
    <%
    	Object obj = request.getAttribute("cateList");
   		 if(obj==null){
    	//跳转到Servlet查询
    	response.sendRedirect("Index?method=indexInfo");
    }
    %>
    <!-- 头部分 -->
    <jsp:include page="header.jsp"></jsp:include>
    
    <!-- 滚动图片 -->
    <div class="scroll">
        <ul>
            <li><a href=""><img src="img/scroll_01.jpg" alt=""></a></li>
            <li><a href=""><img src="img/scroll_02.jpg" alt=""></a></li>
            <li><a href=""><img src="img/scroll_03.jpg" alt=""></a></li>
            <li><a href=""><img src="img/scroll_04.jpg" alt=""></a></li>
            <li><a href=""><img src="img/scroll_05.jpg" alt=""></a></li>
            <li><a href=""><img src="img/scroll_06.jpg" alt=""></a></li>
        </ul>
        <div class="scroll_dot">
            <span class="scroll_dot_span"></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            <span></span>
        </div>
        <div class="scroll_arrows">
            <a href="javascript:void(0);"><span class="left scroll_arrows_back">〈</span></a>
            <a href="javascript:void(0);"><span class="right scroll_arrows_back">〉</span></a>
        </div>
        <div class="scroll_left" style="height: 420px;">
            <ul class="scr-ul">
            	<c:forEach items="${cateList }" var="cate">
            		 <li class="scr_li"><a href="">${cate.name }</a><i class="scr_i"></i></li>
            	</c:forEach>
            </ul>
        </div>
        
    </div>
    <div class="bot">
        <div class="bot_max">
            <div class="bot_first">
                <div class="bot_one">
                    <div><a href=""><img src="img/bot_01.jpg">选购手机</a></div>
                    <div><a href=""><img src="img/bot_02.jpg">企业团购</a></div>
                    <div><a href=""><img src="img/bot_03.jpg">F码通道</a></div>
                    <div><a href=""><img src="img/bot_04.jpg">img米粉卡</a></div>
                    <div><a href=""><img src="img/bot_05.jpg">以旧换新</a></div>
                    <div><a href=""><img src="img/bot_06.jpg">话费充值</a></div>
                </div>

            </div>
            <a href="#"><img src="img/3_02.jpg" alt=""></a>
            <a href="#"><img src="img/3_03.jpg" alt=""></a>
            <a href="#"><img src="img/3_04.jpg" alt=""></a>
        </div>
    </div>
    <div class="time">
        <div class="H">小米明星单品</div>
        <div class="time_in">
        <c:forEach items="${starList }" var="good">
        	<!-- 动态数据时使用，已经修改过css -->
		            <div style="background-color: #fff;width: 234px;height:320px;float: left;margin-left: 11px; ">
		            	<a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}" target="_blank">
		            		<img class="time_min" style="width:234px;height: 234px;" src="<%=imgPath %>${good.pic}" alt="${good.gname }" title="${good.description }">
		            	</a>
		            	<div style="clear: both;"></div>
		            	
		            	<div style="width: 234px;height: 85px;">
		            		<div style="width: 234px;height: 20px;line-height: 20px;text-align: center;font-size: 14px;font-family: Arial">
		            			${good.gname }
		            		</div>
		            		<div style="width: 234px;height: 30px;line-height: 30px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">
		            			 ${good.price }
		            		</div>
		            		<div style="width: 234px;height: 35px;line-height: 35px;text-align: center;color: #000;font-size: 14px;font-family: Arial" title="${good.full_description }">
		            			<c:if test="${good.description.length() <=12 }">
		            				${good.description}
		            			</c:if>
		            			<c:if test="${good.description.length() > 12 }">
		            				<%-- ${good.description.substring(0,12) }... --%>
		            				${fn:substring(good.description,0,12) }...
		            			</c:if>
		            		</div>
		            	</div>
		            </div>
        </c:forEach> 
        </div>
    </div>
    <div class="appliances">
        <div class="app_width">
            <div class="app_A">家电</div>
            <div class="app_Ar orangeGL">
               <div class="app_Ar_r"><a href="">热门</a></div>
               <div class="app_Ar_r"><a href="">电视影音</a></div>
               <div class="app_Ar_r"><a href="">电脑</a></div>
               <div class="app_Ar_r"><a href="">家居</a></div>
            </div>
            <div class="app_max">
                <div class="appl"><a href=""><img src="img/app_00.jpg" alt=""></a></div>
                <div class="appr">
                    <div class="appr_top">
                    	<!-- 循环后台取到的家电的集合 -->
                    		<!-- 动态获取数据时使用，已经修改过css -->
                   			<!-- 动态获取数据时使用，已经修改过css -->
                   		  <c:forEach items="${jdList }" var="good" varStatus="i">
                   		  <c:if test="${i.count<5 }">
                   		  	<!-- 第一排4个商品 --> 
                  			<div class="appr_min" id="appr_min1" style="margin-left: 12px;width: 234px;height: 300px;background-color: #FFF;text-align: center;">
                  			<a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}" target="_blank"><img width="180px" height="180px;" src="<%=imgPath %>${good.pic}" alt="${good.gname }"></a>
                  			
                  			<div style="width: 234px;height: 100px;">
                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">${good.gname }</div>
                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">
                  				<c:if test="${good.description.length()<12 }">
                  					${good.description }
                  				</c:if>
                  				<c:if test="${good.description.length()>=12 }">
                  					${good.description.substring(0,12) }...
                  				</c:if>
                  				</div>	
                  				<div style="width: 100%;height: 33px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">${good.price }</div>
                  			</div>
                  			</div>
                  		  </c:if>
                   		  </c:forEach>
                  		<c:forEach items="${goodsListByCate }" var="good" varStatus="i">
                  		<c:if test="${i.count>=5 }">
                  			<!-- 第二排4个商品  -->
                  			<div class="appr_min" style="margin-left: 12px;width: 234px;height: 300px;background-color: #FFF;text-align: center;margin-top: 15px;" id="appr_min1">
                  			<a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}"><img width="180px" height="180px;" src="<%=imgPath %>${good.pic}" title="${good.full_description }"></a>
                  			<div style="width: 234px;height: 100px;">
                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">${good.gname }</div>
                  				<div style="width: 100%;height: 33px;text-align: center;font-size: 14px;font-family: Arial">
                  				<c:if test="${good.description.length()<12 }">
                  					${good.description }
                  				</c:if>
                  				<c:if test="${good.description.length()>=12 }">
                  					${good.description.substring(0,12) }...
                  				</c:if>
                  				</div>	
                  				<div style="width: 100%;height: 33px;text-align: center;color: #ff6700;font-size: 14px;font-family: Arial">${good.price }</div>
                  			</div>
                  			</div>
                  		</c:if>
                  		</c:forEach>	        
                    </div>
                </div>
            </div>
        </div>
    </div>`
    <div class="capabackground">
        <div class="capacity">
            <div class="capa_box_top">
                <div class="capa_box_top_al">智能</div>
                <div class="capa_box_top_ar">
                    <div class="capa_box_top_ar_min orangeGL"><a class="script_capa_box_top_ar" href="javascript:;">路由器</a></div>
                    <div class="capa_box_top_ar_min orangeGL"><a class="script_capa_box_top_ar" href="javascript:;">酷玩</a></div>
                    <div class="capa_box_top_ar_min orangeGL"><a class="script_capa_box_top_ar" href="javascript:;">健康</a></div>
                    <div class="capa_box_top_ar_min orangeGL"><a class="script_capa_box_top_ar" href="javascript:;">出行</a></div>
                    <div class="capa_box_top_ar_min orangeGL"><a class="script_capa_box_top_ar" href="javascript:;">热门</a></div>
                </div>
            </div>
            	<div class="capa_box scrip_capa_box scrip_capa_box_on">
                	<div class="capa_top">
                    	<!-- 智能家居 - 动态使用  -->
                    	<c:forEach items="${znList }" var="good">
                    	<div class="capa capa_shadow" style="width: 231px;height: 301px;text-align: center;background-color: #FFFFFF;margin-top: 15px;">
	                        <a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}" target="_blank"><img width="180px" height="180px" src="<%=imgPath%>${good.pic}">
	                            <div class="tran">
	                                <span>${good.full_description }</span>
	                            </div>
	                        </a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333">${good.gname }</li>
	                                <li style="color: #b0b0b0">
	                                <c:if test="${good.description.length()<12 }">
                  						${good.description }
	                  				</c:if>
	                  				<c:if test="${good.description.length()>=12 }">
	                  					${good.description.substring(0,12) }...
	                  				</c:if>
	                                </li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >${good.price }元</li>
	                            </ul>
	                        </div>
	                    </div>
                    	</c:forEach>
	                    <!-- 原始网页，仅供参考 -->
	                    <div class="capa capa_shadow">
	                        <a href=""><img src="img/capa_01.jpg"></a>
	                    </div>
	                    <div class="capa capa_shadow">
	                        <a href=""><img src="img/capa_02.jpg">
	                            <div class="tran">
	                                <span>小米一如既往的好前天下单今天就到了，送货到家很细心的...</span>
	                            </div>
	                        </a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333">米家LED 智能台灯</li>
	                                <li style="color: #b0b0b0">无可视频闪,四种场景可变调光</li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >169元</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="capa capa_shadow">
	                        <a href=""><img src="img/capa_03.jpg"><div class="tran">
	                            <span>现在看起来挺不错的，性价比超高！持续关注呀</span>
	                        </div></a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333">九号平衡车 Plus</li>
	                                <li style="color: #b0b0b0">35km超长续航,一键自动跟随</li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >3499元</li>
	                            </ul>
	                        </div>
	                    </div>
	                    <div class="capa capa_shadow">
	                        <a href=""><img src="img/capa_04.jpg"><div class="tran">
	                            <span>米兔智能故事机.</span>
	                        </div></a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333">米兔智能故事机</li>
	                                <li style="color: #b0b0b0">微信远程互动,智能语音交互</li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700">199元</li>
	                            </ul>
	                        </div>
	
	                    </div>
	                    <div class="capa capa_shadow capa_unright">
	                        <a href=""><img src="img/capa_05.jpg" alt="">
	                            <div class="tran">
	                                <span>小米一如既往的好前天下单今天就到了，送货到家很细心的...</span>
	                            </div></a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333">米家恒温电水壶</li>
	                                <li style="color: #b0b0b0">水温智能控制,304不锈钢内胆</li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700">199元</li>
	                            </ul>
	                        </div>
	
	                    </div>
	                    
                    </div>
               </div>

            </div>
    </div>
    <div class="recommend">
        <div class="capacity">
            <div class="capa_box_top">
                <div class="capa_box_top_al">为你推荐</div>
                <div class="capa_box_top_ar">
                    <!--<div class="capa_box_top_ar_min orangeGL"><a href="">路由器</a></div>-->
                    <!--<div class="capa_box_top_ar_min orangeGL"><a href="">酷玩</a></div>-->
                    <!--<div class="capa_box_top_ar_min orangeGL"><a href="">健康</a></div>-->
                    <!--<div class="capa_box_top_ar_min orangeGL"><a href="">出行</a></div>-->
                    <!--<div class="capa_box_top_ar_min orangeGL"><a href="">热门</a></div>-->
                </div>
            </div>
            <div class="capa_box">
                <div class="capa_top">
					
					<!-- 动态数据使用，仅供参考 -->
					<c:forEach items="${tjList }" var="good">
	                	<div class="capa capa_shadow" style="margin-right: 10px;background-color: #fff">
	                        <a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}"><img width="234"  src="<%=imgPath %>${good.pic}">
	                        </a>
	                        <div class="capa_a">
	                            <ul>
	                                <li style="color: #333333"> ${good.gname } </li>
	                                <li style="color: #b0b0b0"> 
	                                <c:if test="${good.description.length()<=12 }">${good.description }</c:if>
	                                <c:if test="${good.description.length()>12 }">${good.description.substring(0, good.description.length()-1) }</c:if>
	                                </li>
	                                <li style="font-size: 14px;margin-top: 10px; color: #ff6700" >${good.price } 元</li>
	                            </ul>
	                        </div>
	                    </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <div class="popular">
        <div class="popular_background">
            <div class="popular_box_top">
                <div class="popular_box_top_al">热门产品</div>
            </div>
            <div class="popu_box">
            	
            	<!-- 动态数据使用，仅供参考 -->
            	<c:forEach items="${hotList }" var="good" varStatus="i">
            		<c:if test="${i.count ==1 }">
            			<div class="popu popu_unleft popu_shadow" >
	                        <a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}" target="_blank"><img style="width: 296px" height="220px" src="<%=imgPath %>${good.pic}"></a>
		                        <div class="popu_bottom">
		                            <p class="review">
		                                <c:if test="${good.full_description.length()<=25 }">${good.full_description }</c:if>
		                                <c:if test="${good.full_description.length()>25 }">${good.full_description }</c:if>
		                            </p>
		                            <p class="author"> 来自于 秘密 的评价 </p>
		                            <div class="info">
		                                <h3 class="title">${good.gname }</h3>
		                                <span class="sep">|</span>
		                                <p class="price"><span>${good.price }</span>元</p>
		                            </div>
		                        </div>
		                  </div>
            		</c:if>
            		<c:if test="${i.count !=1 }">
            			<div class="popu popu_unleft popu_shadow" style="margin-left: 13px;">
	                        <a href="<%=basePath %>Index?method=findGoodsByGid&gid=${good.gid}" target="_blank"><img style="width: 296px" height="220px" src="<%=imgPath %>${good.pic}"></a>
		                        <div class="popu_bottom">
		                            <p class="review">
		                                <c:if test="${good.full_description.length()<=25 }">${good.full_description }</c:if>
		                                <c:if test="${good.full_description.length()>25 }">${good.full_description }</c:if>
		                            </p>
		                            <p class="author"> 来自于 秘密 的评价 </p>
		                            <div class="info">
		                                <h3 class="title">${good.gname }</h3>
		                                <span class="sep">|</span>
		                                <p class="price"><span>${good.price }</span>元</p>
		                            </div>
		                        </div>
		                  </div>
            		</c:if>  
	              </c:forEach>
            </div>
        </div>
    </div>
    <div class="content">
        <div class="popular_background">
            <div class="popular_box_top">
                <div class="popular_box_top_al">内容</div>

            </div>
            <div class="popu_box">
            
            	<!-- 动态数据，仅供参考 -->
            	<%-- <c:forEach items="${nRGoods }" var="goods" varStatus="i">
            		
            		<c:if test="${i.count ==1 }">
            			 <div class="popu cont_border_top1 popu_unleft popu_shadow" style="text-align: center;">
		                    <div class="popu_bottom">
		                        <h2 class="con_title">图书</h2>
		                        <h4 class="popu_name">${goods.name }</h4>
		                        <p class="popu_desc"><a href="">${goods.mark }</a></p>
		                        <p class="popu_price"><a href="">${goods.price }元</a></p>
		                    </div>
		                    <a href="indexServlet?fs=findGoodsDetail&gid=${goods.gid }" target="_blank"><img width="180px" height="200px" src="<%=imgPath %>${goods.pic }"></a>
		
		                </div>
            		</c:if>
            		<c:if test="${i.count ==2 }">
            			<div class="popu cont_border_top2 popu_shadow" style="text-align: center;">
	
		                    <div class="popu_bottom">
		                       <h2 class="con_title">MIUI 主题</h2>
		                        <h4 class="popu_name">${goods.name }</h4>
		                        <p class="popu_desc"><a href="">${goods.mark }</a></p>
		                        <p class="popu_price"><a href="">${goods.price }米币</a></p>
		                    </div>
		                    <a href="indexServlet?fs=findGoodsDetail&gid=${goods.gid }" target="_blank"><img width="180px" height="200px" src="<%=imgPath %>${goods.pic }"></a>
		                </div>
            		
            		</c:if>
            		<c:if test="${i.count ==3 }">
            			<div class="popu cont_border_top3 popu_shadow " style="text-align: center;">
		                    <div class="popu_bottom">
		                        <h2 class="con_title">游戏</h2>
		                        <h4 class="popu_name">${goods.name }</h4>
		                         <p class="popu_desc"><a href="">${goods.mark }</a></p>
		                        <p class="popu_price"><a href="">${goods.price }米币</a></p>
		                    </div>
		                    <a href="indexServlet?fs=findGoodsDetail&gid=${goods.gid }" target="_blank"><img width="200px" height="150px" src="<%=imgPath %>${goods.pic }"></a>
		                </div>
            		</c:if>
            		<c:if test="${i.count ==4 }">
            			 <div class="popu popu_border_top4 popu_shadow " style="text-align: center;">
		                    <div class="popu_bottom">
		                        <h2 class="con_title">应用</h2>
		                        <h4 class="popu_name">${goods.name }</h4>
		                        <p class="popu_desc"><a href="">${goods.mark }</a></p>
		                        <p class="popu_price"><a href="">${goods.price }米币</a></p>
		                    </div>
		                    <a href="indexServlet?fs=findGoodsDetail&gid=${goods.gid }" target="_blank"><img width="200px" height="150px" src="<%=imgPath %>${goods.pic }"></a>
		                </div>
            		</c:if>
                
                </c:forEach> --%>
                
                <!-- 原始网页 -->
                <div class="popu cont_border_top1 popu_unleft popu_shadow">
                    <div class="popu_bottom">
                        <h2 class="con_title">图书</h2>
                        <h4 class="popu_name">哈利·波特与被诅咒的孩子</h4>
                        <p class="popu_desc"><a href="">“哈利·波特”第八个故事中文版震撼来袭！特别彩排版剧本！ </a></p>
                        <p class="popu_price"><a href="">29.37元</a></p>
                    </div>
                    <a href=""><img src="img/cont_01.jpg"></a>

                </div>
                <div class="popu cont_border_top2 popu_shadow ">

                    <div class="popu_bottom">
                       <h2 class="con_title">MIUI 主题</h2>
                        <h4 class="popu_name">包宝宝养成记</h4>
                        <p class="popu_desc"><a href="">包宝宝定制主题Q萌上线！快来领取萌萌包宝宝吧！</a></p>
                        <p class="popu_price"><a href="">4.2米币</a></p>
                    </div>
                    <a href=""><img src="img/cont_02.jpg"></a>
                </div>
                <div class="popu cont_border_top3 popu_shadow ">

                    <div class="popu_bottom">
                        <h2 class="con_title">游戏</h2>
                        <h4 class="popu_name">小米超神</h4>
                        <p class="popu_desc"><a href="">实力派！一起团！</a></p>
                        <p class="popu_price"><a href=""></a></p>
                    </div>
                    <a href=""><img src="img/cont_03.jpg"></a>
                </div>
                <div class="popu popu_border_top4 popu_shadow ">

                    <div class="popu_bottom">
                        <h2 class="con_title">应用</h2>
                        <h4 class="popu_name">2017金米奖</h4>
                        <p class="popu_desc"><a href="">最优秀的应用和游戏</a></p>
                        <p class="popu_price"><a href=""></a></p>
                    </div>
                    <a href=""><img src="img/cont_04.jpg"></a>
                </div>
                
            </div>


        </div>
    </div>
    <div class="video">
        <div class="popular_background">
            <div class="popular_box_top">
                <div class="popular_box_top_al">视频</div>

            </div>
            <div class="popu_box">
                <div class="vid popu_unleft popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="img/snowPerson.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">小米8，一部与众不同的手机</a></h3>
                        <p class="vid_desc">透明探索版，将科技与美学完美结合</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="img/snowPerson.mp4" controls loop  poster="img/video_02.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">小米MIX 2S，一面科技 一面艺术</a></h3>
                        <p class="vid_desc">艺术品般陶瓷机身，惊艳、璀璨</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="img/snowPerson.mp4" controls loop  poster="img/video_03.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">天生丽质的小米6X</a></h3>
                        <p class="vid_desc">让你一见倾心</p>
                    </div>
                </div>
                <div class="vid  popu_shadow">
                    <div class="video_top">
                        <a href=""><video class="this_vid" src="img/snowPerson.mp4" controls loop  poster="img/video_01.jpg"></video></a>
                    </div>
                    <div class="video_bottom">
                        <h3 class="vid_title"><a href="">生活中无所不在的小爱同学</a></h3>
                        <p class="vid_desc">透明探索版，将科技与美学完美结合</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 底部的包含 -->
	<jsp:include page="footer.jsp"></jsp:include>

    <script>
        var abc = document.getElementsByClassName("script_capa_box_top_ar");
        console.log("abc:"+abc);
        console.log("abc[0]"+abc[0]);
        var box = document.getElementsByClassName("scrip_capa_box");
        console.log("box:"+box);
        console.log("box[0]:"+box[0]);
        for(var i = 0; i<abc.length;i++){
            abc[i].index=i;
            abc[i].onmouseover=function(){
                for(var j = 0 ;j<abc.length;j++){
                    box[j].className="capa_box scrip_capa_box";
                }
                box[this.index].className="capa_box scrip_capa_box scrip_capa_box_on"
                console.log("this.index:"+this.index);
            }
        }
        var n = 0;

        /*setInterval(function () {
            n++;
             if(n > $(".scroll ul li").length){
             n=0;
             }
            $(".scroll ul li").css("opacity","0").eq(n).css("opacity","1")
        },100)*/
        var t = setInterval(fun,1000);
        function  fun() {
            n++;
            if(n > $(".scroll>ul>li").length-1){
                n = 0;
            }
            $(".scroll>ul>li").css("opacity","0").eq(n).css("opacity","1")
            $(".scroll_dot span").eq(n).addClass("scroll_dot_span").siblings().removeClass("scroll_dot_span");
        }
        $(".scroll_arrows .left").click(function() {
            n -= 2;
                    if(n <-1){
                        n=4;
                    }
                    fun()

        } );
        $(".scroll_arrows .right").click(function() {
            fun()
        });
        $(".scroll_dot span").click(function () {
            console.log($(this).index());
            n=$(this).index()-1;
            $(this).siblings().removeClass("scroll_dot_span").end().addClass("scroll_dot_span");
            fun()
        }); $(".scroll").hover(function () {
                    clearInterval(t);
                },
                function () {
                    t = setInterval(fun,1000);
                });

    </script>
</body>
</html>