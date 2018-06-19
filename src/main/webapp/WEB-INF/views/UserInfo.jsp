<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>我的小麦-个人信息</title>
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
                <span class="dm-name">HI,欢迎来小麦</span>
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
            <form id="infoform" action="/userInfo/save" method="post" >
                <div class="per-edit-msg">修改个人信息，有助于我们为您提供更加个性化的服务，小麦网将尊重并保护您的隐私。</div>
                <dl>
                    <dt>邮箱：</dt>
                    <dd>
                        <input id="email" type="text" class="input-text-2" name="email" value="${userVO.userPO.email}" disabled="disabled" style="border-style:none"/>
                    </dd>
                </dl>
                <dl>
                    <dt>密码：</dt>
                    <dd>
                        <input id="password" type="text" class="input-text-2" name="password" value="${userVO.userPO.password}"/>

                    </dd>
                </dl>

                <dl>
                    <dt>会员状态：</dt>
                    <dd>

                        <c:choose>
                            <c:when test="${userVO.userPO.isCanceled == true}">
                                <input type="radio" id="isMember"  name="member" value="true"><span>是</span>
                                <input type="radio" id="notMember"  name="member" value="false" checked><span>否</span>
                            </c:when>

                            <c:when test="${userVO.userPO.isCanceled == false}">
                                <input type="radio" id="isMember"  name="member" value="true" checked><span>是</span>
                                <input type="radio" id="notMember"  name="member" value="false" ><span>否</span>

                            </c:when>
                        </c:choose>

                    </dd>
                </dl>

                <dl>
                    <dt>总消费：</dt>
                    <dd>
                        <input id="cost" type="text" class="input-text-2" name="cost" value="${userVO.userPO.cost}" disabled="disabled" style="border-style:none"/>
                    </dd>
                </dl>
                <dl>
                    <dt>积分：</dt>
                    <dd>
                        <input id="memberpoints" type="text" class="input-text-2" name="memberpoints" value="${userVO.userPO.memberPoints}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>会员等级：</dt>
                    <dd>
                        <input id="memberlevel" type="text" class="input-text-2" name="memberlevel" value="${userVO.memberLevel}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>总订单数：</dt>
                    <dd>
                        <input id="totalNum" type="number" class="input-text-2" name="totalNum" value="${userVO.userStatisticsVO.totalNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已创建数：</dt>
                    <dd>
                        <input id="createdNum" type="number" class="input-text-2" name="createdNum" value="${userVO.userStatisticsVO.createdNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已支付数：</dt>
                    <dd>
                        <input id="hasPaiedNum" type="number" class="input-text-2" name="hasPaiedNum" value="${userVO.userStatisticsVO.hasPaiedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已出票数：</dt>
                    <dd>
                        <input id="hasArrangedNum" type="number" class="input-text-2" name="hasArrangedNum" value="${userVO.userStatisticsVO.hasArrangedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已完成数：</dt>
                    <dd>
                        <input id="finishedNum" type="number" class="input-text-2" name="finishedNum" value="${userVO.userStatisticsVO.finishedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已过期数：</dt>
                    <dd>
                        <input id="pastDueNum" type="number" class="input-text-2" name="pastDueNum" value="${userVO.userStatisticsVO.pastDueNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已取消数：</dt>
                    <dd>
                        <input id="cancelNum" type="number" class="input-text-2" name="cancelNum" value="${userVO.userStatisticsVO.cancelNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>


                <button id="save" class="btn05" type="submit" onclick="userInfo_save()">保存</button>
            </form>
        </div>
    </div>
</div>
</div>

</body>

<script type="text/javascript">
    function userInfo_save(){
        document.getElementById("save").submit(); //验证成功进行表单提交
    }

</script>

<script type="text/javascript">
    var result = '${result}';

    if(result == "modifyInfofailed"){
        alert("修改密码失败");
    }else if(result == "cancelMemberfailed"){
        alert("取消会员失败");
    }else if(result == "modifyInfosucceed"){
        alert("修改信息成功");

    }


</script>



<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>




</html>
