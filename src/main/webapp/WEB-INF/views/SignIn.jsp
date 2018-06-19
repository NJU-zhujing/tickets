<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/2/27
  Time: 下午4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <link rel="stylesheet" href="https://sdui.damai.cn/secure/static/damai_ui_login_v2.css" type="text/css" />
    <script type="text/javascript" src="https://sdui.damai.cn/damai_v2/common/js/jquery-1.7.2.min.js"></script>
    <link href="https://sdui.damai.cn/dm_2014/common/public-min.css" rel="stylesheet" />
    <script src="https://sdui.damai.cn/damai_v2/login_register3.0/js/script.js?t=2016051909" type="text/javascript"></script>
    <link href="https://sdui.damai.cn/damai_v2/login_register3.0/css/style.css?t=2016051909" rel="stylesheet" type="text/css" />

    <title>登录-小麦</title>
</head>
<body style="
height: 953px;">

<link type="text/css" href="//g.alicdn.com/sd/ncpc/nc.css?t=1487663743445" rel="stylesheet"/>
<link rel="stylesheet" href="/css/taobao.css" />
<div id="_umfp" style="display:inline;width:1px;height:1px;overflow:hidden"></div>

<style>
    #nc_1_wrapper{width:380px !important}
    .nc_1_wrapper{width:378px !important}
    .login_account{height:580px;}
    .nc-container .imgCaptcha, .nc-container .clickCaptcha{width:378px !important;}
    .clickCaptcha_img{text-align:center}
    .nc-container.tb-login .errloading, .nc-container .errloading{width:368px !important}
    .nc-container .nc_scale .clickCaptcha{height:300px !important}
    .nc_scale{* margin-top:-30px !important}
</style>


<div class="login_header">
    <div class="wrap clear">
        <div class="header_left">
            <h1 class="header_title">欢迎登录</h1>
        </div>
    </div>
</div>
<div class="main">
    <div class="login_account layer_box">
        <div class="account_con" id="J_LoginBox">
            <ul class="m_layer_tab tab" style="position:absolute; top:0; left:0">
                <li id="AccountLogin" class="first active"><a href="javascript:void(0)"><span class="m_login_pic1" style="background-image: url(&quot;//dui.damai.cn/damai_v2/login_register3.0/images/new-pop/m_login_active.png&quot;);"></span>账户登录</a></li>
                <li id="QRCodebtn" class=""><a href="javascript:void(0)"><span class="m_ewm_pic1" ></span>商家登陆</a></li>
                <li id="MsgLogin" class=""><a href="javascript:void(0)"><span class="m_message_pic1" ></span>经理登陆</a></li>
            </ul>
            <form id="dlform" name="dlform" method="post">
                <div class="account_box">
                    <ul class="account_list pt30" id="form_inputs">
                        <li style="margin-bottom:0">
                            <div id="m_account" class="account_inner w_378 m_phone" style="position:relative; z-index:1114;">
                                <p class="c2 pt10" id="tishi1" style="display: none;"></p>
                                <span class="account_email"></span>
                                <label for="account" style="position: absolute; top: 4px; left: 10px; cursor: text; color: rgb(195, 195, 195); font-size: 14px; line-height: 27px; z-index: 0;"></label>
                                <input type="text" class="text layer_text" name="account" id="account" placeholder="账号" style="width:312px;" value="" autocomplete="off">
                            </div>
                        </li>
                    </ul>

                    <div id="acc_div" class="con m_new_tab_main" style="display: block;">
                        <ul class="account_list">
                            <li>
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="password" id="login_pwd_txt" name ="password" class="text layer_text" placeholder="登陆密码" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>
                            </li>
                            <li>
                            </li>
                        </ul>
                        <input id="user_btn" type="button" class="login_btn" value="立即登录" onclick=user_sign_in()>
                    </div>


                    <div class="con" style="display: none;padding-top: 20px;">
                        <input type="button" id="venue_btn" class="login_btn" value="立即登录" onclick=venue_sign_in()>
                    </div>

                    <div class="con" id="msg_login" style="display: none;padding-top: 20px;">
                        <input type="button" id="manager_btn" class="login_btn" value="立即登录" onclick= manager_sign_in()>
                    </div>


                </div></form>
            <!---->
            <p id="account_txt" class="account_txt mt5" style="display: block;">
                <a href="/signUp" target="_parent" class="c4 ml10">立即注册</a>
                <a href="javascript:void(0)" class="fl">忘记密码？</a>
                <label class="checkbox">
                    <input type="checkbox">
                    <span>下次自动登录</span>
                </label>
            </p>

            <!---->
            <div id="account_share" style="display: block;">
                <div class="account_share">
                    <span>其他登录：</span>
                    <a class="wx" href="javascript:void(0)" onclick="cnzz(this);" title="微信"></a>
                    <a href="javascript:void(0)" class="qq" onclick="cnzz(this);" title="QQ"></a>
                    <a href="javascript:void(0)" class="sina" onclick="cnzz(this);" title="新浪微博"></a>
                    <a href="javascript:void(0)" class="zhifubao" onclick="cnzz(this);" title="支付宝"></a>
                </div>


            </div>
        </div>
        <div class="account_banner" id="PAGE_AD_1">
        </div>
    </div>
</div>


<script type="text/javascript">
    function user_sign_in(){
        document.getElementById("dlform").setAttribute("action","/signIn/user");
        document.getElementById("dlform").submit(); //验证成功进行表单提交

    }
</script>

<script type="text/javascript">
    function venue_sign_in(){
        document.getElementById("dlform").setAttribute("action","/signIn/venue");
        document.getElementById("dlform").submit(); //验证成功进行表单提交

    }
</script>


<script type="text/javascript">
    function manager_sign_in(){
        document.getElementById("dlform").setAttribute("action","/signIn/manager");
        document.getElementById("dlform").submit(); //验证成功进行表单提交
    }
</script>


<script type="text/javascript">
    var userSignInResult = '${userSignInResult}';

    if(userSignInResult == "false"){
        alert("用户登陆失败");
    }

    var venueSignInResult = '${venueSignInResult}';

    if(venueSignInResult == "false"){
        alert("商家登陆失败");
    }

    var managerSignInResult = '${managerSignInResult}';

    if(managerSignInResult == "false"){
        alert("经理登陆失败");
    }

</script>



</body>
</html>
