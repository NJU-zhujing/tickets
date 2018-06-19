<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/9
  Time: 上午11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>检票</title>
    <link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
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
                <span class="dm-name">HI , 欢迎来小麦</span>
            </li>
            <li class="mydm">
                <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
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
<!--top end-->
<div class="red-line"></div>

<div class="main" style="width: 700px;">
    <div class="c-n box01">
        <div class="per-edit-list">
            <form id="checkform" action="/checkTicket/result" method="post" >
                <dl>
                    <dt>票号：</dt>
                    <dd>
                        <input id="ticket_code" type="text" class="input-text-2" name="ticket_code" />
                    </dd>
                </dl>

                <button id="check" class="btn05" type="submit" onclick="checkTicket()">确认检票</button>
            </form>
        </div>
    </div>
</div>
</div>

</body>

<script type="text/javascript">
    var checkResult = '${checkResult}';

    if(checkResult == "false"){
        alert("检票失败");
    }else if(checkResult == "true"){
        alert("检票成功");
    }

</script>

<script type="text/javascript">
    function checkTicket(){
        document.getElementById("checkform").submit(); //验证成功进行表单提交
    }
</script>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
