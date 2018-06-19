<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/4
  Time: 上午11:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的小麦-经理信息</title><link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
    <style type="text/css">.onError{color:#f52954;}</style>
    <script type="text/javascript" src="//dui.damai.cn/damai_v2/common/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="//dui.damai.cn/damai_v2/passport/ui-min.js"></script>
    <script src="/js/base.js" type="text/javascript"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/dateselects.js"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/formValidator.js?t=20160925"></script>
    <script type="text/javascript" src="https://my.damai.cn/js/Source/myinfo.js?t=20160925"></script>
    <link rel="stylesheet" href="//dui.damai.cn/dm_2014/common/public-min.css">
</head>

<body>
<div class="top-s">
    <div class="top-con">
        <ul class="fl">
            <li class="dm-info">
                <span class="dm-name">HI,欢迎来小麦</span>

            </li>
            <li class="mydm">
                <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
                <div class="dm-c mydm-c">
                    <a title="网站信息" href="/managerInfo">网站信息</a>
                    <a title="审批管理" href="/venueChange/list">审批管理</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="red-line"></div>

<div class="main" style="width: 700px;">
    <div class="c-n box01">
        <div class="per-edit-list">
            <form id="myinfoform" action="" method="post" >
                <dl>
                    <dt>会员数量：</dt>
                    <dd>
                        <input id="manager_member_num" type="number" class="input-text-2" name="manager_member_num" value="${managerStatisticsVO.memberNum}" disabled="disabled" disabled="disabled" style="border-style:none"/>
                    </dd>
                </dl>
                <dl>
                    <dt>网站收入：</dt>
                    <dd>
                        <input id="manager_income" type="text" class="input-text-2" name="manager_income" value="${managerStatisticsVO.income}" disabled="disabled" style="border-style:none"/>
                    </dd>
                </dl>
                <button id="save" class="btn05" type="submit"><a href="/manager/accounts" >结算</a></button>

            </form>
        </div>
    </div>
</div>
</div>

</body>

<script type="text/javascript">
    var accountsResult = '${accountsResult}';

    if(accountsResult == "true"){
        alert("结算成功！");
    }else if(accountsResult == "false"){
        alert("失败结算！");
    }

</script>


<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
