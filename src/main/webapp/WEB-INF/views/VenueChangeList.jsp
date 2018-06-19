<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/7
  Time: 上午11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的小麦-审批管理</title><link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
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
                <span class="dm-name">HI,欢迎来小麦</span>
            </li>
            <li class="mydm">
                <div class="dm-t mydm-t"><a href="javascript:void(0)" target="_blank">我的小麦</a><b></b></div>
                <div class="dm-c mydm-c">
                    <a title="网站信息" href="/managerInfo">网站信息</a>
                    <a title="审批管理" href="/venueChange/list">审批管理</a>
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
        <c:set var="venueChangeList" value="${venueChangeList}"/>


        <ul class="search_list" id="content_list">
            <c:forEach var="venueChangePO" items="${venueChangeList}">
            <li>
                <div class="search_txt">
                    <p class="search_txt_cut c3">申请ID: ${venueChangePO.id} 商家代码：${venueChangePO.code}</p>
                    <h3>${venueChangePO.name}</h3>

                    <p class="c1"><a href="javascript:void(0)" target="_blank"
                                     class="search_txt_site_icon">${venueChangePO.location}</a></p>
                    <p class="search_txt_cut c3">商家介绍${venueChangePO.introduction}</p>
                    <p class="search_txt_cut c3">座位数量：${venueChangePO.seatNum}</p>

                    <c:choose>
                        <c:when test="${venueChangePO.changeType =='SignUp' }">
                            <p class="search_txt_cut c3">申请类型：注册</p>
                        </c:when>
                        <c:when test="${venueChangePO.changeType =='Change' }">
                            <p class="search_txt_cut c3">申请类型：修改</p>
                        </c:when>
                    </c:choose>

                    <button id="approve" class="btn05" type="submit" onclick=""><a href="/venueChange/approve?venueChangeId=${venueChangePO.id}">批准</a></button>
                    <button id="disapprove" class="btn05" type="submit" onclick=""><a href="/venueChange/disapprove?venueChangeId=${venueChangePO.id}">取消</a></button>
                </div>
            </li>
            </c:forEach>

            <li id="search_list_page_tj" class="search_list_page">
                <div class="search-page-box">
                    <ul class="search-page-list">
                        <ul class="search-page-num">
                            <li class="search-pagePrev"><a
                                    href="/venueChangeList?page=1">&lt; 首页</a></li>
                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                <c:set var="active" value="${loop.index==currentPage?'search-page-act':''}"/>
                                <li class="${active}"><a
                                        href="/venueChangeList?page=${loop.index}">${loop.index}</a>
                                </li>
                            </c:forEach>
                            <c:set var="active" value="${loop.index==currentPage?'active':''}"/>
                            <li class="search-pageNext" ><a
                                    href="/venueChangeList?page=${totalPages}">尾页&gt;</a></li>
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
    var approveResult = '${approveResult}';

    if(approveResult == "true"){
        alert("批准成功！");
    }else if(approveResult == "false"){
        alert("批准失败！");
    }

    var disapproveResult = '${disapproveResult}';

    if(disapproveResult == "true"){
        alert("取消成功！");
    }else if(disapproveResult == "false"){
        alert("取消失败！");
    }

</script>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
