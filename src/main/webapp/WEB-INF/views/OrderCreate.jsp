<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/8
  Time: 下午9:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建订单</title>
    <link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
    <link rel="stylesheet" type="text/css" href="//dui.damai.cn/dm_2015/goods/css/style.css" />
    <link rel="stylesheet" type="text/css" href="//dui.damai.cn/damai_v2/login_register3.0/css/style.css" />
    <link rel="stylesheet" href="//dui.damai.cn/dm_2014/common/public-min.css">
</head>

<body style="background: white">

<div class="top-s">
    <div class="top-con">
        <ul class="fl">
            <li class="dm-info">
                <span class="dm-name">HI , 欢迎来小麦</span>
            </li>
            <li class="mydm">
                <div class="dm-t mydm-t"><a href="javascript:void(0)" target="_blank">我的小麦</a><b></b></div>
                <div class="dm-c mydm-c">
                    <a title="个人信息" href="/userInfo">个人信息</a>
                    <a title="订单管理" href="/userOrderList">订单管理</a>
                    <a title="查看计划" href="/plan/list">查看计划</a>
                </div>
            </li>
        </ul>
    </div>
</div>

<div class="red-line"></div>

<div class="g-bd" data-image="" data-color="">
    <div class="g-bdc">
        <div class="g-mn" style="padding-top: 10px;">

            <c:set var="planPO" value="${planPO}"/>
            <c:set var="venuePO" value="${planPO.venuePO}"/>
            <c:set var="ticketPOList" value="${planPO.ticketPOList}"/>

            <!-- 终极页项目信息 begin -->
            <div class="m-box m-box-col2 m-box-goods" id="projectInfo" style="width: 800px;margin-left: 180px;">
                <div class="hd" style="background: white" >
                    <!-- 面包屑 begin -->
                    <p class="m-crm">
                        <a href="javascript:void(0)">小麦网</a>
                        <span class="arrow">&gt;</span>
                        <a href="javascript:void(0)" >${planPO.planType}</a>
                        <span class="arrow">&gt;</span>
                        <strong>${venuePO.name}</strong>
                        <span class="arrow">&gt;</span>
                        <strong>${planPO.name}</strong>
                    </p>
                    <!-- 面包屑 end -->
                </div>

                <div class="hd" style="background: white;">


                    <!-- 项目模块 begin -->
                    <div class="m-goods" style="padding-left: 90px;padding-bottom: 10px;">
                        <h2 class="tt" >
                            <span class="txt">${planPO.name}</span>
                        </h2>

                        <!-- 产品模块 begin -->
                            <div class="m-product m-product-2 -m-product-1 j_goodsDetails">

                            <!-- 选择日期模块 begin -->
                            <div class="m-choose m-choose-date " id="performList" >
                                <h3 class="tt">
                                    演出时间：</h3>
                                <div class="ct">
                                    <ul class="lst"><li id ="aaa111" class="itm j_more itm-sel"><a href="javascript:;">${planPO.startTime} - ${planPO.endTime}</a></li></ul>
                                </div>
                            </div>
                            <!-- 选择日期模块 end -->

                            <!-- 选择座位票价模块 begin -->
                            <div class="m-choose m-choose-price " id="ticketPOList">
                                <h3 class="tt">选择座位：</h3>
                                <div class="ct">
                                    <ul class="lst" id="">
                                        <c:forEach var="ticketPO" items="${planPO.ticketPOList}">
                                            <c:choose>
                                                <c:when test="${ticketPO.ticketStatus == 'OnSale'}">
                                                    <li id="${ticketPO.id}" name ="selling" class="itm" onclick="change(this.id)"><a href="javascript:void(0);"><span class="price" >${ticketPO.seatNum} - ${ticketPO.price}</span></a></li>

                                                </c:when>
                                                <c:otherwise>
                                                    <li id="${ticketPO.id}" class="itm itm-oos"><a href="javascript:void(0);"><span id="${ticketPO.id}" class="price" >${ticketPO.seatNum} - ${ticketPO.price}</span></a></li>
                                                </c:otherwise>
                                            </c:choose>

                                        </c:forEach>
                                    <li id="random" class="itm" onclick="random(this.id)"><a href="javascript:void(0);"><span class="price">随机座位10张</span></a></li></ul>
                                </div>
                            </div>
                            <!-- 选择座位票价模块 end -->

                        </div>
                        <!-- 产品模块 end -->
                    </div>

                    <%----%>
                    <br/><button id="createbtn" class="btn05" type="submit" onclick="createOrder()" style="margin-left: 100px;margin-bottom: 60px;">提交订单</button>

                </div>
            </div>

        </div>

    </div>
</div>

<script type="text/javascript">
    var ticketStr = '';

    function random(id) {
        var a = document.getElementById(id);
        var str = a.getAttribute('class');
        var num = str.indexOf("itm-sel");
        if (num < 0){
            ticketStr = '';
            var t = document.getElementsByName("selling");
            for (var i=0;i<t.length;i++){
                t[i].setAttribute("class","itm");

                if(i<10) {
                    ticketStr += t[i].getAttribute("id") + ";"
                }

            }
            a.setAttribute('class',str+" itm-sel");
        }else {
            ticketStr = '';
            a.setAttribute('class',"itm");
        }

    }


    function createOrder(){
        var temp = document.createElement("form");
        temp.action = "/order/create";
        temp.style.display = "none";

        var plan = document.createElement("input");
        plan.name = "planId";
        plan.value = "${planPO.id}";

        var ticket = document.createElement("input");
        ticket.name = "ticketIdStr";
        ticket.value = ticketStr.substr(0,ticketStr.length-1);

        temp.appendChild(plan);
        temp.appendChild(ticket);
        document.body.appendChild(temp);
        temp.submit();

    }

    function change(id){
        var a = document.getElementById(id);
        var str = a.getAttribute('class');
        var num = str.indexOf("itm-sel");
        if(document.getElementById('random').getAttribute('class').indexOf('itm-sel')<0){
            if (num < 0 ){
                ticketStr += id+";";
                a.setAttribute('class',str+" itm-sel");

            }else {
                ticketStr.replace(id+";","");
                a.setAttribute('class',"itm");
            }
        }
    }
</script>

<script type="text/javascript">
    var createResult = '${createResult}';

    if (createResult == "false"){
        alert("创建订单失败！");
    }
</script>


<script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/goods/js/jquery-1.8.2.min.js"></script>

<script src="/js/min/common-min.js" type="text/javascript"></script>
<script src="/js/min/search-min.js" type="text/javascript"></script>
<script src="/js/min/widgetUIDs-min.js" type="text/javascript"></script>
<script src="/js/min/item-min.js" type="text/javascript"></script>
<script src="/js/min/calendarSettings-min.js" type="text/javascript"></script>
<script src="/js/min/calendar-min.js" type="text/javascript"></script>
<script src="/js/min/qa-min.js" type="text/javascript"></script>
<script src="/js/min/weixin-min.js" type="text/javascript"></script>
<script src="/js/min/json2-min.js" type="text/javascript"></script>
<script src="/js/min/datepicker-min.js" type="text/javascript"></script>
<script src="/js/min/app-min.js" type="text/javascript"></script>
<script type="text/javascript" src="//www.damai.cn/staticfile/Announcement/Announcement.js?937492837"></script>
<script type="text/javascript" src="https://secure.damai.cn/static/jquery.playalert3.js?0001" async="async"></script>
<script type="text/javascript" src="//cp.damai.cn/js/Service51La/SeoFlowStatistics.js?45" async="async"></script>
<script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/goods/site/map/js/mapview.js" async="async"></script>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</body>
</html>

