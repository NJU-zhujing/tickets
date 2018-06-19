<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/7
  Time: 上午11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的小麦-订单管理</title><link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
    <style type="text/css">.onError{color:#f52954;}</style>
    <script type="text/javascript" src="//dui.damai.cn/damai_v2/common/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="//dui.damai.cn/damai_v2/passport/ui-min.js"></script>
    <script src="/js/base.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/dateselects.js"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/formValidator.js?t=20160925"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/Source/myinfo.js?t=20160925"></script>
    <link rel="stylesheet" href="//dui.damai.cn/dm_2014/common/public-min.css">


    <link href="//search.damai.cn/favicon.ico" rel="shortcut icon" type="image/ico">
    <link href="//search.damai.cn/favicon.ico" rel="icon" type="image/ico">
    <link href="//dui.damai.cn/damai_v2/common/jquery.ui/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="//dui.dmcdn.cn/dm_2015/common/public-min.css"  rel="stylesheet" type="text/css"/>
    <link href="//dui.dmcdn.cn/dm_2015/search/css/style-min.css" rel="stylesheet" type="text/css" />
    <link href="//dui.damai.cn/damai_v2/login_register3.0/css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background: white">
<div class="top-s">
    <div class="top-con">
        <ul class="fl">
            <li class="dm-info">
                <span class="dm-name">HI, ${userVO.userPO.email} ,欢迎来小麦</span>
            </li>
            <li class="mydm">
                <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
                <div class="dm-c mydm-c">
                    <a title="个人信息" href="/userInfo">个人信息</a>
                    <a title="订单管理" href="/userOrderList">订单管理</a>
                    <a title="查看计划" href="/plan/list">查看计划</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<!--top end-->
<div class="red-line"></div>

<div class="main" style="width: 700px;">
    <div class="c-n box01" style="margin-top: 20px;">
        <!--<div class="per-edit-list">-->

        <c:set var="totalPages" value="${totalPages}"/>
        <c:set var="currentPage" value="${currentPage}"/>
        <c:set var="orderList" value="${orderList}"/>

        <ul class="search_list" id="content_list">
            <c:forEach var="orderPO" items="${orderList}">
                <li >
                    <c:set var="planPO" value="${orderPO.planPO}"/>
                    <c:set var="ticketPOList" value="${orderPO.ticketPOList}"/>

                    <div class="search_txt">


                        <h3>${planPO.name}</h3>
                        <p class="search_txt_cut c3">活动介绍：${planPO.introduction}</p>
                        <p class="search_txt_time c3" data-spm-anchor-id="a2o6e.search.0.i0.35434d15YB0llJ"><a
                                href="#" class="search_txt_time_icon"></a>${planPO.startTime} - ${planPO.endTime}</p>
                        <p class="c1"><a href="javascript:void(0)"
                                         class="search_txt_site_icon">${planPO.venuePO.location}</a></p>
                        <p class="search_txt_piao"><em>${planPO.planType}</em></p>

                        <%--<p class="search_txt_cut c3">${orderPO.id}</p>--%>
                        <p class="search_txt_cut c3">创建时间：${orderPO.createTime}</p>
                        <p class="search_txt_cut c3">总消费：${orderPO.cost}</p>


                        <c:choose>
                            <c:when test="${orderPO.status=='Created'}">
                                <p class="search_txt_cut c3">订单状态：已创建</p>
                            </c:when>
                            <c:when test="${orderPO.status=='Paied'}">
                                <p class="search_txt_cut c3">订单状态：已支付</p>
                            </c:when>
                            <c:when test="${orderPO.status=='Arranged'}">
                                <p class="search_txt_cut c3">订单状态：已出票</p>
                            </c:when>
                            <c:when test="${orderPO.status=='Finished'}">
                                <p class="search_txt_cut c3">订单状态：已完成</p>
                            </c:when>
                            <c:when test="${orderPO.status=='PastDue'}">
                                <p class="search_txt_cut c3">订单状态：已过期</p>
                            </c:when>
                            <c:when test="${orderPO.status=='Canceled'}">
                                <p class="search_txt_cut c3">订单状态：已取消</p>
                            </c:when>
                        </c:choose>

                        <c:forEach var="ticketPO" items="${ticketPOList}">
                            <c:choose>
                                <c:when test="${orderPO.status=='Arranged'}">
                                    <p class="search_txt_cut c3">座位号：${ticketPO.seatNum}   票号：${ticketPO.code}   价格：${ticketPO.price}</p>
                                </c:when>
                                <c:otherwise >
                                    <p class="search_txt_cut c3">座位号：${ticketPO.seatNum}   票号：无   价格：${ticketPO.price}</p>
                                </c:otherwise>
                            </c:choose>

                        </c:forEach>


                        <c:choose>
                            <c:when test="${orderPO.status=='Created'}">
                                <button id="pay" class="btn05" type="button" name="pay"><a href="/order/payInfo?orderId=${orderPO.id}" >支付</a></button>
                            </c:when>
                            <c:when test="${orderPO.status=='Paied' || orderPO.status=='Arranged'}">
                                <button id="cancel" class="btn05" type="button" name="cancel" ><a href="/order/cancel?orderId=${orderPO.id}" >取消</a></button>
                            </c:when>
                        </c:choose>
                    </div>
                </li>
            </c:forEach>

            <li id="search_list_page_tj" class="search_list_page">
                <div class="search-page-box">
                    <ul class="search-page-list">
                        <ul class="search-page-num">
                            <li class="search-pagePrev"><a
                                    href="/userOrderList?page=1">&lt; 首页</a></li>
                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                <c:set var="active" value="${loop.index==currentPage?'search-page-act':''}"/>
                                <li class="${active}"><a
                                        href="/userOrderList?page=${loop.index}">${loop.index}</a>
                                </li>
                            </c:forEach>
                            <c:set var="active" value="${loop.index==currentPage?'active':''}"/>
                            <li class="search-pageNext" ><a
                                    href="/userOrderList?page=${totalPages}">尾页&gt;</a></li>
                        </ul>
                    </ul>
                </div>
            </li>
        </ul>
        <!--</div>-->
    </div>
</div>
</div>

</body>

<script type="text/javascript">
    var cancelResult = '${cancelResult}';

    if(cancelResult == "true"){
        alert("撤销成功！");
    }else if(cancelResult == "false"){
        alert("撤销失败！");
    }

    var payResult = '${payResult}';

    if(payResult == "true"){
        alert("支付成功！");
    }else if(payResult == "false"){
        alert("支付失败！");
    }
</script>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>