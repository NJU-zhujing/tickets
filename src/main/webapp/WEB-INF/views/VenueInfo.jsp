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
    <title>我的小麦-商家信息</title><link rel="stylesheet" href="//dui.damai.cn/damai_v2/passport/ui-min.css" />
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
                <span class="dm-name">HI, 欢迎来小麦</span>

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
<div class="red-line"></div>

<div class="main" style="width: 700px;">
    <div class="c-n box01">
        <div class="per-edit-list">
            <form id="venueform" action="/venueInfo/save" method="post" >
                <div class="per-edit-msg">修改商家信息，有助于我们为您提供更加个性化的服务，小麦网将尊重并保护您的隐私。</div>
                <dl>
                    <dt>商家代码：</dt>
                    <dd>
                        <input id="venue_code" type="text" class="input-text-2" name="venue_code" value="${venueVO.venuePO.code}" readonly style="border-style:none"/>
                    </dd>
                </dl>
                <dl>
                    <dt>商家名称：</dt>
                    <dd>
                        <input id="venue_name" type="text" class="input-text-2" name="venue_name" value="${venueVO.venuePO.name}"/>
                    </dd>
                </dl>
                <dl>
                    <dt>地址：</dt>
                    <dd>
                        <input id="venue_location" type="text" class="input-text-2" name="venue_location" value="${venueVO.venuePO.location}"/>

                    </dd>
                </dl>
                <dl>
                    <dt>座位：</dt>
                    <dd>
                        <input id="venue_seat_num" type="number" class="input-text-2" name="venue_seat_num" value="${venueVO.venuePO.seatNum}"/>

                    </dd>
                </dl>
                <dl>
                    <dt>介绍：</dt>
                    <dd>
                        <input id="venue_introduction" type="text" class="input-text-2" name="venue_introduction" value="${venueVO.venuePO.introduction}"/>

                    </dd>
                </dl>
                <dl>
                    <dt>总收入：</dt>
                    <dd>
                        <input id="venue_income" type="text" class="input-text-2" name="venue_income" value="${venueVO.venuePO.income}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>


                <dl>
                    <dt>总订单数：</dt>
                    <dd>
                        <input id="totalNum" type="number" class="input-text-2" name="totalNum" value="${venueVO.venueStatisticsVO.totalNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已创建数：</dt>
                    <dd>
                        <input id="createdNum" type="number" class="input-text-2" name="createdNum" value="${venueVO.venueStatisticsVO.createdNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已支付数：</dt>
                    <dd>
                        <input id="hasPaiedNum" type="number" class="input-text-2" name="hasPaiedNum" value="${venueVO.venueStatisticsVO.hasPaiedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已出票数：</dt>
                    <dd>
                        <input id="hasArrangedNum" type="number" class="input-text-2" name="hasArrangedNum" value="${venueVO.venueStatisticsVO.hasArrangedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已完成数：</dt>
                    <dd>
                        <input id="finishedNum" type="number" class="input-text-2" name="finishedNum" value="${venueVO.venueStatisticsVO.finishedNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>
                <dl>
                    <dt>已过期数：</dt>
                    <dd>
                        <input id="pastDueNum" type="number" class="input-text-2" name="pastDueNum" value="${venueVO.venueStatisticsVO.pastDueNum}" disabled="disabled" style="border-style:none"/>

                    </dd>
                </dl>

                <button id="save" class="btn05" type="submit" onclick="venueInfo_save()">保存</button>
            </form>
        </div>
    </div>
</div>
</div>

</body>


<script type="text/javascript">
    function venueInfo_save(){
        document.getElementById("venueform").submit(); //验证成功进行表单提交
    }

</script>

<script type="text/javascript">
    var result = '${modifyInfoResult}';

    if(result == "false"){
        alert("修改信息失败！");
    }else if(result == "true"){
        alert("修改信息成功！");
    }

</script>

<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
