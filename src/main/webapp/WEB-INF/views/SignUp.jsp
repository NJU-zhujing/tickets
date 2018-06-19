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

    <title>注册-小麦</title>
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
            <h1 class="header_title">欢迎注册</h1>
        </div>
    </div>
</div>
<div class="main">
    <div class="login_account layer_box">
        <div class="account_con" id="J_LoginBox">
            <ul class="m_layer_tab tab" style="position:absolute; top:0; left:0;width: 440px;">
                <li id="AccountLogin" class="first active" style="width: 220px;"><a href="javascript:void(0)"><span class="m_login_pic1" style="background-image: url(&quot;//dui.damai.cn/damai_v2/login_register3.0/images/new-pop/m_login_active.png&quot;);"></span>用户注册</a></li>
                <li id="QRCodebtn" class="" style="width: 218px;"><a href="javascript:void(0)"><span class="m_ewm_pic1" ></span>商家注册</a></li>
            </ul>
            <form id="dlform" name="dlform" method="post">
                <div class="account_box">
                    <div id="acc_div" class="con m_new_tab_main" style="display: block;">
                        <ul class="account_list">

                            <li style="padding-bottom: 20px;padding-top: 60px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_email"></span>
                                    <label for="user_sign_up_email" style="position: absolute; top: 4px; left: 10px; cursor: text; color: rgb(195, 195, 195); font-size: 14px; line-height: 27px; z-index: 0;"></label>
                                    <input type="text" class="text layer_text" name="user_sign_up_email" id="user_sign_up_email" placeholder="邮箱" style="width:312px;" value="" autocomplete="off">
                                </div>

                            </li>
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="password" id="user_sign_up_password" name ="user_sign_up_password" class="text layer_text" placeholder="密码" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>

                            </li >
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="password" id="user_sign_up_password_confirm" name ="user_sign_up_password_confirm" class="text layer_text" placeholder="确认密码" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>

                            </li>

                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="text" id="user_sign_up_account" name ="user_sign_up_account" class="text layer_text" placeholder="支付账号" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>

                            </li>
                        </ul>
                        <input id="user_btn" type="button" class="login_btn" value="立即注册" onclick=user_sign_up()>
                    </div>


                    <div class="con" style="display: none;">
                        <ul class="account_list">
                            <li style="padding-bottom: 20px;padding-top: 60px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_email"></span>
                                    <label for="venue_name" style="position: absolute; top: 4px; left: 10px; cursor: text; color: rgb(195, 195, 195); font-size: 14px; line-height: 27px; z-index: 0;"></label>
                                    <input type="text" class="text layer_text" name="venue_name" id="venue_name" placeholder="商家名称" style="width:312px;" value="" autocomplete="off">
                                </div>

                            </li>
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="text" id="venue_location" name ="venue_location" class="text layer_text" placeholder="地址" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>
                            </li >
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="text" id="venue_pay_account" name ="venue_pay_account" class="text layer_text" placeholder="支付账号" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>
                            </li>
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="number" id="venue_seat_num" name ="venue_seat_num" class="text layer_text" placeholder="座位数量" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>

                            </li>
                            <li style="padding-bottom: 20px;">
                                <div class="account_inner" style="z-index: 2; position: relative;width: 378px">
                                    <span class="account_password"></span>
                                    <input type="text" id="venue_introduction" name ="venue_introduction" class="text layer_text" placeholder="一句话介绍" style="width:312px;" value="" autocomplete="off" style="width:312px;">
                                </div>
                            </li>
                        </ul>
                        <input type="button" id="venue_btn" class="login_btn" value="立即注册" onclick=venue_sign_up()>
                    </div>


                </div></form>

        </div>
    </div>
    <div class="account_banner" id="PAGE_AD_1">
    </div>
</div>
</div>


<script type="text/javascript">
    function user_sign_up(){
        document.getElementById("dlform").setAttribute("action","/signUp/user");
        document.getElementById("dlform").submit(); //验证成功进行表单提交

    }
</script>

<script type="text/javascript">
    function venue_sign_up(){
        document.getElementById("dlform").setAttribute("action","/signUp/venue");
        document.getElementById("dlform").submit(); //验证成功进行表单提交
    }
</script>

<script type="text/javascript">
    var userSignUpResult = '${userSignUpResult}';
    if(userSignUpResult == "false"){
        alert("注册失败！");
    }

    var venueSignUpResult = '${venueSignUpResult}';
    if(venueSignUpResult == "false"){
        alert("注册失败！");
    }

    var activateResult = '${activateResult}';
    if(activateResult == "false"){
        alert("邮箱验证失败，请重新注册！");
    }
</script>

</body>
</html>
