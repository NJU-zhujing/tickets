<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/8
  Time: 下午3:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>订单支付</title>
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
    <div class="c-n box01">
        <div class="per-edit-list">
            <form id="payform" method="post" action="/order/pay">
                <dl>
                    <dt>订单号：</dt>
                    <dd>
                        <input id="order_id" type="text" class="input-text-2" name="orderId" value="${orderId}" readonly style="border-style:none"/>
                    </dd>
                </dl>

                <dl>
                    <dt>金额：</dt>
                    <dd>
                        <input id="order_cost" type="text" class="input-text-2" name="cost" value="${orderCost}" readonly style="border-style:none"/>
                    </dd>
                </dl>

                <dl>
                    <dt>支付账号：</dt>
                    <dd>
                        <input id="account" type="text" name="account" value="***${fn:substring(account ,24,32)}" readonly style="border-style:none;width: "/>
                    </dd>
                </dl>

                <dl>
                    <dt>密码：</dt>
                    <dd>
                        <input id="password" type="text" class="input-text-2" name="password" value=""/>
                    </dd>
                </dl>

                <button id="paybtn" class="btn05" type="submit" onclick="pay()">确认支付</button>
            </form>
        </div>
    </div>
</div>
</div>

<script type="text/javascript">
    var payResult = '${payResult}';
    if (payResult=="false"){
        alert("支付失败！");
    }
</script>

<script type="text/javascript">
    function pay(){
        document.getElementById("payform").submit(); //验证成功进行表单提交
    }
</script>

</body>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
