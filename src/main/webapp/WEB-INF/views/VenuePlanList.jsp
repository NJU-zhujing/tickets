<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/8
  Time: 下午1:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="//search.damai.cn/favicon.ico" rel="shortcut icon" type="image/ico">
    <link href="//search.damai.cn/favicon.ico" rel="icon" type="image/ico">
    <link href="//dui.damai.cn/damai_v2/common/jquery.ui/jquery-ui.min.css" rel="stylesheet" type="text/css" />
    <link href="//dui.dmcdn.cn/dm_2015/common/public-min.css"  rel="stylesheet" type="text/css"/>
    <link href="//dui.dmcdn.cn/dm_2015/search/css/style-min.css" rel="stylesheet" type="text/css" />
    <link href="//dui.damai.cn/damai_v2/login_register3.0/css/style.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="//dui.damai.cn/damai_v2/common/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="//dui.damai.cn/damai_v2/common/jquery.ui/jquery-ui.min.js"></script>
    <script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/index/js/public-min.js"></script>
    <script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/common/dui-min.js"></script>
    <script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/common/app-min.js"></script>
    <script type="text/javascript" src="//www.damai.cn/js/headv6.js"></script>
    <script type="text/javascript" src="https://secure.damai.cn/static/jquery.playalert3.js?0001"></script>
</head>
<body data-spm="search">

<div class="wrapper">
    <div class="top-s">
        <div class="top-con">
            <ul class="fl">
                <li class="dm-info" id="headerUserinfo"><span class="dm-name">HI, 欢迎来小麦</span></li>
                <li class="mydm">
                    <div class="dm-t mydm-t"><a target="_blank" href="//my.damai.cn/">我的小麦</a><b></b></div>
                    <div class="dm-c mydm-c">
                        <a title="商家信息" href="/venueInfo">商家信息</a>
                        <a title="发布计划" href="/plan/createInfo">发布计划</a>
                        <a title="检票" href="/checkTicket">检票</a>
                        <a title="线下购票" href="/venuePlanList">线下购票</a>
                    </div>
                </li>
            </ul>
        </div>
    </div>

    <!--主导航 start-->
    <div class="red-line"></div>
    <!--主导航 end-->

    <!--内容 start-->

    <!--搜索有结果 start -->
    <!--如果搜索有结果 begin-->
    <div class="search_new">
        <div class="search_top">
            <p  id="navigation_show">
            </p>
        </div>

        <div class="search_con clear">
            <div class="search_left">

                <c:set var="totalPages" value="${totalPages}"/>
                <c:set var="currentPage" value="${currentPage}"/>
                <c:set var="planList" value="${planList}"/>

                <!-- 排序start -->
                <div class="search_main">
                    <div class="search_sort">
                        <div class="search_sort_page">
                            <div class="search_sort_com">
                                <a title="列表模式" href="javascript:void(0)"  class="search_lis_on"></a>
                            </div>
                        </div>
                        <ul class="search_sort_way">
                            <li><a id="search_xgj"  class="active" href="javascript:void(0)" >我的计划</a></li>

                        </ul>
                    </div>

                    <!-- 搜索列表 start -->
                    <ul class="search_list" id="content_list">
                        <c:forEach var="planPO" items="${planList}">
                            <li onclick="">
                                <div class="search_txt"><h3>活动名称：${planPO.name}</h3>
                                    <p class="search_txt_cut c3">活动介绍：${planPO.introduction}</p>
                                    <p class="search_txt_time c3" ><a
                                            href="#" class="search_txt_time_icon"></a>${planPO.startTime} - ${planPO.endTime}</p>
                                    <p class="c1"><a href="javascript:void(0)"
                                                     class="search_txt_site_icon">${planPO.venuePO.location}</a></p>
                                    <p class="search_txt_piao"><em>${planPO.planType}</em></p>
                                    <button id="createOrderOffline" class="btn05" type="button" name="createOrderOffline"><a href="/order/createOfflineInfo?planId=${planPO.id}" >线下选座</a></button>
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

                    </ul>
                </div>
            </div>
        </div>
    </div>
    <!--搜索有结果 end -->

    <!--内容 end-->

    <!-- 固定侧栏 begin -->
    <div class="m-sdfix">
        <a class="itm totop z_crt" href="javascript:;">
            <i class="ico"></i><span class="txt">返回顶部</span>
        </a>
    </div>

</body>



</html>
