<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/3/12
  Time: 上午9:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建计划</title>
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
                <div class="dm-t mydm-t"><a href="javascript:void(0)" target="_blank">我的小麦</a><b></b></div>
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
            <form id="planform" action="/plan/create" method="post">

                <dl>
                    <dt>活动名称：</dt>
                    <dd>
                        <input id="plan_name" type="text" class="input-text-2" name="plan_name" value=""/>
                    </dd>
                </dl>
                <dl>
                    <dt>活动介绍：</dt>
                    <dd>
                        <input id="plan_introduction" type="text" class="input-text-2" name="plan_introduction" value=""/>

                    </dd>
                </dl>
                <dl>
                    <dt>活动类型：</dt>
                    <dd>
                        <select id = "plan_type" name="plan_type" class="sel-3">
                            <option value="">请选择</option>
                            <option value="1">体育</option>
                            <option value="2">舞蹈</option>
                            <option value="3">戏剧</option>
                            <option value="4">音乐</option>
                            <option value="5">电竞</option>
                        </select>

                    </dd>
                </dl>

                <dl>
                    <dt>开始时间：</dt>
                    <dd>
                        <input id="start_time" type="datetime-local" name="start_time" value=""/>

                    </dd>
                </dl>
                <dl>
                    <dt>结束时间：</dt>
                    <dd>
                        <input id="end_time" type="datetime-local" name="end_time" value=""/>

                    </dd>
                </dl>
                <dl>
                    <dt>座位号：</dt>
                    <dd>
                        <input id="seatnum" type="number" class="input-text-2" name="seatnum" value="" style="width: 50px"/>

                    </dd>
                    <dt>价格：</dt>
                    <dd>
                        <input id="seatprice" type="number" class="input-text-2" name="seatprice" value="" style="width: 50px"/>
                    </dd>
                    <dt>
                        <button id="addseat"  type="button" onclick=addSeat() style="margin-left: 0px;">添加</button>
                    </dt>
                </dl>
                <dl>
                    <dt>座位列表：</dt>
                    <dd>
                        <div id= "seatlist" style="width: 100px">
                        </div>

                    </dd>
                </dl>

                <br/><button id="createbtn" class="btn05" type="submit" onclick="planCreate()">创建</button>
            </form>
        </div>
    </div>
</div>
</div>



</body>

<script type="text/javascript">
    var seatliststr = "";
    function addSeat(){
        var  a = document.createElement("dl");
        a.style.marginBottom="2px";
        a.id = "seatlistitem"
        var str = document.getElementById('seatnum').value+'-'+document.getElementById('seatprice').value;
        a.innerHTML=str
        seatliststr+=str+";";
        document.getElementById('seatlist').appendChild(a);
    }

    function planCreate(){
        var seatlisthid = document.createElement("input");
        seatlisthid.name = "seat_list_str";
        if(seatliststr.length>0){
            seatliststr = seatliststr.substr(0,seatliststr.length-1);
        }
        seatlisthid.value = seatliststr;
        seatlisthid.style.display = "none";
        document.getElementById("planform").appendChild(seatlisthid);
        document.getElementById("planform").submit(); //验证成功进行表单提交

    }
</script>

<script type="text/javascript">
    var createResult = '${createResullt}';
    if (createResult == "false"){
        alert("创建计划失败！");
    }else if(createResult == "true"){
        alert("创建计划成功！");
    }
</script>



<script src="//dui.damai.cn/dm_2014/common/dui-min.js" type="text/javascript"></script>
<script src="//dui.damai.cn/dm_2014/common/app-min.js" type="text/javascript"></script>

</html>
