<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: zhujing
  Date: 2018/2/27
  Time: 下午4:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" session="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="spm-id" content="a2o6e" />
    <title>小麦网</title>
    <link rel="stylesheet" type="text/css" href="//dui.damai.cn/dm_2015/common/public-min.css?v201612300932" />
    <link rel="stylesheet" type="text/css" href="//dui.damai.cn/dm_2015/index/css/style-min.css?v201612300932"/>
    <script type="text/javascript" src="//dui.dmcdn.cn/??damai_v2/common/js/jquery-1.7.2.min.js"></script>
</head>

<body data-spm='home'>
<script type="text/javascript" id="beacon-aplus" src="//g.alicdn.com/alilog/mlog/aplus_v2.js" exparams="clog=o&aplus&sidx=aplusSidx&ckx=aplusCkx" async="async"></script>
<div class="wrapper">
    <script type="text/javascript">var cityId = 0;</script>
    <!--页面头部 start-->
    <div class="top-s">
        <div class="top-con">
            <ul class="fl">
                <li class="dm-info" id="headerUserinfo" style="display: none"><span class="a">HI, 欢迎来小麦</span>[<a class="dm-login" href="www.baidu.com" >登录</a><a class="dm-register" href="">注册</a>]</li>

                <li class="dm-info"><span class="dm-name">HI,欢迎来到小麦</span>
                    <c:choose>
                        <c:when test="${empty user && empty venue && empty manager}">
                            [<a class="dm-login" title="登录" href="/signIn" >登录</a><a class="dm-register" title="注册" href="/signUp" >注册</a>]
                        </c:when>
                    </c:choose>
                </li>
                <c:choose>
                    <c:when test="${!empty user}">
                        <li class="mydm">
                            <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
                            <div class="dm-c mydm-c">
                                <a title="个人信息" href="/userInfo">个人信息</a>
                                <a title="订单管理" href="/userOrderList">订单管理</a>
                                <a title="查看计划" href="/plan/list">查看计划</a>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${!empty venue}">
                        <li class="mydm">
                            <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
                            <div class="dm-c mydm-c">
                                <a title="商家信息" href="/venueInfo">商家信息</a>
                                <a title="发布计划" href="/plan/createInfo">发布计划</a>
                                <a title="检票" href="/checkTicket">检票</a>
                                <a title="线下购票" href="/venuePlanList">线下购票</a>
                            </div>
                        </li>
                    </c:when>
                    <c:when test="${!empty manager}">
                        <li class="mydm">
                            <div class="dm-t mydm-t"><a href="javascript:void(0)">我的小麦</a><b></b></div>
                            <div class="dm-c mydm-c">
                                <a title="网站信息" href="/managerInfo">网站信息</a>
                                <a title="审批管理" href="/venueChange/list">审批管理</a>
                            </div>
                        </li>
                    </c:when>
                </c:choose>

            </ul>

        </div>
    </div>



    <div class="header-w">

        <!--选择城市 start-->
        <div class="dm-citys">
            <div class="dm-citys-change">
                <span class="dm-ct">全国<i></i></span>
                <div class="ri-con">
        <span class="ri-t">
            当前全国共有<i>4104</i>场演出（比赛），城市后数字代表演出场次
        </span>
                    <a href="javascript:void(0)" class="ri-close">关闭</a>
                </div>

                <div class="bt-infos">
                    <dl class="resent bg-col" id="recentCities" style="display:none;">
                        <dt>近期访问&nbsp;&gt;</dt>
                        <dd></dd>
                    </dl>
                    <dl>
                        <dt>华北东北&nbsp;&gt;</dt>
                        <dd>
                            <ul>
                                <li>
                                    <a href="//www.damai.cn/bj/" target="_blank">北京</a>
                                    <cite>726</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/xa/" target="_blank">西安</a>
                                    <cite>132</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/jn/" target="_blank">济南</a>
                                    <cite>51</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/ty/" target="_blank">太原</a>
                                    <cite>41</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/hrb/" target="_blank">哈尔滨</a>
                                    <cite>30</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/tj/" target="_blank">天津</a>
                                    <cite>160</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/zhengzhou/" target="_blank">郑州</a>
                                    <cite>53</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/sjz/" target="_blank">石家庄</a>
                                    <cite>58</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/sy/" target="_blank">沈阳</a>
                                    <cite>49</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/huhehaote/" target="_blank">呼和浩特</a>
                                    <cite>19</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/yantai/" target="_blank">烟台</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/changchun/" target="_blank">长春</a>
                                    <cite>25</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/qd/" target="_blank">青岛</a>
                                    <cite>16</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/dl/" target="_blank">大连</a>
                                    <cite>37</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/tangshan/" target="_blank">唐山</a>
                                    <cite>8</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/ych/" target="_blank">银川</a>
                                    <cite>6</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/hwz/" target="_blank">海外</a>
                                    <cite>63</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/jilin/" target="_blank">吉林</a>
                                    <cite>3</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/dandong/" target="_blank">丹东</a>
                                    <cite>0</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/weifang/" target="_blank">潍坊</a>
                                    <cite>6</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/langfang/" target="_blank">廊坊</a>
                                    <cite>0</cite>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>华东地区&nbsp;&gt;</dt>
                        <dd>
                            <ul>
                                <li>
                                    <a href="//www.damai.cn/sh/" target="_blank">上海</a>
                                    <cite>554</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/nj/" target="_blank">南京</a>
                                    <cite>65</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/taizhou/" target="_blank">台州</a>
                                    <cite>5</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/hz/" target="_blank">杭州</a>
                                    <cite>182</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/ningbo/" target="_blank">宁波</a>
                                    <cite>73</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/wuxi/" target="_blank">无锡</a>
                                    <cite>56</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/wenzhou/" target="_blank">温州</a>
                                    <cite>18</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/suz/" target="_blank">苏州</a>
                                    <cite>129</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/changzhou/" target="_blank">常州</a>
                                    <cite>27</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/nantong/" target="_blank">南通</a>
                                    <cite>4</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/yangzhou/" target="_blank">扬州</a>
                                    <cite>5</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/zhoushan/" target="_blank">舟山</a>
                                    <cite>7</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/zhenjiang/" target="_blank">镇江</a>
                                    <cite>0</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/hf/" target="_blank">合肥</a>
                                    <cite>38</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/jx/" target="_blank">嘉兴</a>
                                    <cite>0</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/sx/" target="_blank">绍兴</a>
                                    <cite>29</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/jinhua/" target="_blank">金华</a>
                                    <cite>3</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/tz/" target="_blank">泰州</a>
                                    <cite>5</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/yancheng/" target="_blank">盐城</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/wuhu/" target="_blank">芜湖</a>
                                    <cite>3</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/suqian/" target="_blank">宿迁</a>
                                    <cite>0</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/maanshan/" target="_blank">马鞍山</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/tongling/" target="_blank">铜陵</a>
                                    <cite>0</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/huzhou/" target="_blank">湖州</a>
                                    <cite>3</cite>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>华南地区&nbsp;&gt;</dt>
                        <dd>
                            <ul>
                                <li>
                                    <a href="//www.damai.cn/gz/" target="_blank">广州</a>
                                    <cite>169</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/hk/" target="_blank">港澳</a>
                                    <cite>46</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/sz/" target="_blank">深圳</a>
                                    <cite>233</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/nn/" target="_blank">南宁</a>
                                    <cite>35</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/foshan/" target="_blank">佛山</a>
                                    <cite>32</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/fuzhou/" target="_blank">福州</a>
                                    <cite>28</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/dg/" target="_blank">东莞</a>
                                    <cite>36</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/xiamen/" target="_blank">厦门</a>
                                    <cite>50</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/haikou/" target="_blank">海南</a>
                                    <cite>7</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/zhuhai/" target="_blank">珠海</a>
                                    <cite>8</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/quanzhou/" target="_blank">泉州</a>
                                    <cite>13</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/zs/" target="_blank">中山</a>
                                    <cite>15</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/huizhou/" target="_blank">惠州</a>
                                    <cite>13</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/lz/" target="_blank">柳州</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/gl/" target="_blank">桂林</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/jiangmen/" target="_blank">江门</a>
                                    <cite>10</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/beihai/" target="_blank">北海</a>
                                    <cite>1</cite>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                    <dl>
                        <dt>中西部&nbsp;&gt;</dt>
                        <dd>
                            <ul>
                                <li>
                                    <a href="//www.damai.cn/cd/" target="_blank">成都</a>
                                    <cite>143</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/cq/" target="_blank">重庆</a>
                                    <cite>159</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/wuhan/" target="_blank">武汉</a>
                                    <cite>182</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/km/" target="_blank">昆明</a>
                                    <cite>54</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/nanchang/" target="_blank">南昌</a>
                                    <cite>34</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/cs/" target="_blank">长沙</a>
                                    <cite>100</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/gy/" target="_blank">贵阳</a>
                                    <cite>22</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/lanzhou/" target="_blank">兰州</a>
                                    <cite>13</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/wulumuqi/" target="_blank">乌鲁木齐</a>
                                    <cite>1</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/luoyang/" target="_blank">洛阳</a>
                                    <cite>3</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/ls/" target="_blank">拉萨</a>
                                    <cite>3</cite>
                                </li>
                                <li>
                                    <a href="//www.damai.cn/xn/" target="_blank">西宁</a>
                                    <cite>0</cite>
                                </li>
                            </ul>
                        </dd>
                    </dl>
                </div>
            </div>
            <a href="//www.damai.cn/" id="insitehref" class="dm-rec" target="_blank" style="display:none;">推荐进入<span class="insiteName"></span>站</a>
        </div>
        <!--选择城市 end-->

        <!--搜索 start-->
        <div class="dm-search">
            <div class="search-main" id="searchMain">
                <input type="text" autocomplete="off" value="请输入演出、艺人、场馆名称..." class="search-text" id="searchText" data-keyword="" data-link="">
                <button class="search-btn" type="button" id="search">搜索</button>
                <div id="searchRelate" class="search-relate" style="display:none;"></div>
            </div>
            <script type="text/javascript">var searchSuggestions = []</script>
            <div class="dm-recommend">
                <a target="_blank" href="https://search.damai.cn/search.html?keyword=%E5%AD%9F%E4%BA%AC%E8%BE%89">孟京辉</a>
                <a target="_blank" href="https://search.damai.cn/search.html?keyword=%E4%BA%91%E5%8D%97%E6%98%A0%E8%B1%A1">云南映象</a>
                <a target="_blank" href="https://search.damai.cn/search.html?keyword=%E5%BC%A0%E5%AD%A6%E5%8F%8B">张学友</a>
                <a target="_blank" href="https://p.damai.cn/wow/special/act/cba0302">男篮季后赛</a>
            </div>
        </div>
        <!--搜索 end-->

    </div>

    <!--页面头部 end-->
    <script type="text/javascript" src="//www.damai.cn/staticfile/Announcement/Announcement.js?9374928371500"></script>
    <!--主导航 start-->
    <div class="miannav-wrap">
        <div class="miannav">
            <ul>
                <li><a href="//drama.damai.cn/" id="home_daohang_001" class="navtitle" target="_blank" title="戏剧">戏剧</a></li>
                <li><a href="//sports.damai.cn/" id="home_daohang_002" class="navtitle" target="_blank" title="体育">体育</a></li>
                <li><a href="//kids.damai.cn/" id="home_daohang_003" class="navtitle" target="_blank" title="亲子">亲子</a></li>
                <li><a href="//rock.damai.cn/" id="home_daohang_004" class="navtitle" target="_blank" title="摇滚">摇滚</a></li>
                <li><a href="//dc.damai.cn/" id="home_daohang_005" class="navtitle" target="_blank" title="舞蹈古典">舞蹈古典</a></li>
            </ul>
        </div>
    </div>
    <!--主导航 end-->


    <!--页面主体 start-->

    <div class="index-top">

        <!--全部商品分类 begin-->
        <div class="sort">
            <a href="//www.damai.cn/alltickets.html" target="_blank" class="sort-ti" id="home_fldh_000">全部商品分类</a>
            <div class="sort-list">
                <ul>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E6%BC%94%E5%94%B1%E4%BC%9A&order=1" target="_blank" class="sort-list-1 lnk" id="home_fldh_001" data-categoryId="1"><span>演唱会</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>演唱会</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%BC%94%E5%94%B1%E4%BC%9A&sctl=%E6%B5%81%E8%A1%8C&order=1" target="_blank" id="home_fldh_tan_ych_wenzi_001">流行</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%BC%94%E5%94%B1%E4%BC%9A&sctl=%E6%91%87%E6%BB%9A&order=1" target="_blank" id="home_fldh_tan_ych_wenzi_002">摇滚</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%BC%94%E5%94%B1%E4%BC%9A&sctl=%E6%B0%91%E6%97%8F&order=1" target="_blank" id="home_fldh_tan_ych_wenzi_003">民族</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%BC%94%E5%94%B1%E4%BC%9A&sctl=%E9%9F%B3%E4%B9%90%E8%8A%82&order=1" target="_blank" id="home_fldh_tan_ych_wenzi_004">音乐节</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist">
                                </ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E9%9F%B3%E4%B9%90%E4%BC%9A&order=1" class="sort-list-2 lnk" target="_blank" id="home_fldh_002" data-categoryId="2"><span>音乐会</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>音乐会</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E9%9F%B3%E4%B9%90%E4%BC%9A&sctl=%E7%AE%A1%E5%BC%A6%E4%B9%90&order=1" target="_blank" id="home_fldh_tan_yyh_wenzi_001">管弦乐</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E9%9F%B3%E4%B9%90%E4%BC%9A&sctl=%E7%8B%AC%E5%A5%8F&order=1" target="_blank" id="home_fldh_tan_yyh_wenzi_002">独奏</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E9%9F%B3%E4%B9%90%E4%BC%9A&sctl=%E5%AE%A4%E5%86%85%E4%B9%90%E5%8F%8A%E5%8F%A4%E4%B9%90&order=1" target="_blank" id="home_fldh_tan_yyh_wenzi_003">室内乐及古乐</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>

                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&order=1" class="sort-list-3 lnk" target="_blank" id="home_fldh_005" data-categoryId="5"><span>曲苑杂坛</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>曲苑杂坛</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E7%9B%B8%E5%A3%B0&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_001">相声</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E9%AD%94%E6%9C%AF&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_002">魔术</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E9%A9%AC%E6%88%8F&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_003">马戏</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E6%9D%82%E6%8A%80&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_004">杂技</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E6%88%8F%E6%9B%B2&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_005">戏曲</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E6%9B%B2%E8%8B%91%E6%9D%82%E5%9D%9B&sctl=%E5%85%B6%E4%BB%96&order=1" target="_blank" id="home_fldh_tan_qyzt_wenzi_006">其他</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>

                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&order=1" class="sort-list-4 lnk" target="_blank" id="home_fldh_003" data-categoryId="3"><span>话剧歌剧</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>话剧歌剧</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&sctl=%E8%AF%9D%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_hjgj_wenzi_001">话剧</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&sctl=%E6%AD%8C%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_hjgj_wenzi_002">歌剧</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&sctl=%E6%AD%8C%E8%88%9E%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_hjgj_wenzi_003">歌舞剧</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&sctl=%E9%9F%B3%E4%B9%90%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_hjgj_wenzi_004">音乐剧</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%AF%9D%E5%89%A7%E6%AD%8C%E5%89%A7&sctl=%E5%84%BF%E7%AB%A5%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_hjgj_wenzi_005">儿童剧</a>
                                </dd>
                            </dl>
                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>
                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E4%BD%93%E8%82%B2%E6%AF%94%E8%B5%9B&order=1" class="sort-list-5 lnk" target="_blank" id="home_fldh_006" data-categoryId="6"><span>体育比赛</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>体育比赛</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E4%BD%93%E8%82%B2%E6%AF%94%E8%B5%9B&sctl=%E7%90%83%E7%B1%BB%E8%BF%90%E5%8A%A8&order=1" target="_blank" id="home_fldh_tan_tybs_wenzi_001">球类运动</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E4%BD%93%E8%82%B2%E6%AF%94%E8%B5%9B&sctl=%E6%90%8F%E5%87%BB%E8%BF%90%E5%8A%A8&order=1">搏击运动</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E4%BD%93%E8%82%B2%E6%AF%94%E8%B5%9B&sctl=%E5%85%B6%E5%AE%83%E7%AB%9E%E6%8A%80&order=1" target="_blank" id="home_fldh_tan_tybs_wenzi_003">其它竞技</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>

                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E8%88%9E%E8%B9%88%E8%8A%AD%E8%95%BE&order=1" class="sort-list-6 lnk" target="_blank" id="home_fldh_004" data-categoryId="4"><span>舞蹈芭蕾</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>舞蹈芭蕾</dt>
                                <dd>
                                    <span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%88%9E%E8%B9%88%E8%8A%AD%E8%95%BE&sctl=%E8%88%9E%E8%B9%88&order=1" target="_blank" id="home_fldh_tan_wdbl_wenzi_001">舞蹈</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%88%9E%E8%B9%88%E8%8A%AD%E8%95%BE&sctl=%E8%8A%AD%E8%95%BE&order=1" target="_blank" id="home_fldh_tan_wdbl_wenzi_002">芭蕾</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E8%88%9E%E8%B9%88%E8%8A%AD%E8%95%BE&sctl=%E8%88%9E%E5%89%A7&order=1" target="_blank" id="home_fldh_tan_wdbl_wenzi_003">舞剧</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>

                        </div>
                    </li>
                    <li>
                        <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&order=1" class="sort-list-7 lnk" target="_blank" id="home_fldh_007" data-categoryId="7"><span>度假休闲</span></a>
                        <div class="sort-layer">
                            <a class="ri-close" href="#">关闭</a>
                            <dl class="layer-top">
                                <dt>度假休闲</dt>
                                <dd><span>&gt;</span>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E4%B8%BB%E9%A2%98%E5%85%AC%E5%9B%AD&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_001">主题公园</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E9%A3%8E%E6%99%AF%E5%8C%BA&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_002">风景区</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E5%B1%95%E4%BC%9A&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_003">展会</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E7%89%B9%E8%89%B2%E4%BD%93%E9%AA%8C&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_004">特色体验</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E6%B8%A9%E6%B3%89&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_005">温泉</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E6%BB%91%E9%9B%AA&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_006">滑雪</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E6%B8%B8%E8%A7%88%E7%BA%BF%E8%B7%AF&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_007">游览线路</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E5%BA%A6%E5%81%87%E6%9D%91&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_008">度假村</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E4%BB%A3%E9%87%91%E5%88%B8&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_009">代金券</a><i>|</i>
                                    <a href="//search.damai.cn/search.html?ctl=%E5%BA%A6%E5%81%87%E4%BC%91%E9%97%B2&sctl=%E9%85%92%E5%BA%97%E4%BD%8F%E5%AE%BF&order=1" target="_blank" id="home_fldh_tan_djxx_wenzi_010">酒店住宿</a>
                                </dd>
                            </dl>

                            <div class="layer-info">
                                <div class="layer-hd">相关热门</div>
                                <ul class="showlist"></ul>
                            </div>

                        </div>
                    </li>
                    <li> <a href="//search.damai.cn/search.html?tn=%E5%84%BF%E7%AB%A5%E4%BA%B2%E5%AD%90&order=1" class="sort-list-8 lnk" target="_blank" id="home_fldh_100"><span>儿童亲子</span></a> </li>
                    <li><a href="//search.damai.cn/search.html?tn=%E5%8A%A8%E6%BC%AB&order=1" class="sort-list-9 lnk" target="_blank" id="home_fldh_dm"><span>动漫</span></a></li>
                </ul>
            </div>
        </div>
        <!--全部商品分类 end-->

        <!--主轮播 begin-->
        <div class="slide-main">
            <div class="mn">
                <ul class="lst" id="topadpic">
                    <li class="itm"  data-src="https://pimg.dmcdn.cn/perform/damai/home/201803/20180321140620269.jpg" data-color=""><a class="lnk" href=" https://piao.damai.cn/142859.html" target="_blank" title="DOTA2亚洲邀请赛" id="home_lunbo_001"><img src="https://pimg.dmcdn.cn/perform/damai/home/201803/20180321140620269.jpg" /></a></li>
                    <li class="itm"  style="display:none;"  data-src="https://pimg.dmcdn.cn/perform/damai/home/201803/20180312155100554.jpg" data-color=""><a class="lnk" href="https://p.damai.cn/wow/special/act/zhilehui2018" target="_blank" title="至乐汇全国巡演" id="home_lunbo_002"><img src="https://pimg.dmcdn.cn/perform/damai/home/201803/20180312155100554.jpg" /></a></li>
                    <li class="itm"  style="display:none;"  data-src="https://pimg.dmcdn.cn/perform/damai/home/201802/20180205110717232.jpg" data-color=""><a class="lnk" href="https://x.damai.cn/markets/pc/2018qiaohu?spm=a2o6e.kids.0.0.6ad71644Ieqbo2&wh_ttid=pc" target="_blank" title="快乐农场大冒险" id="home_lunbo_003"><img src="https://pimg.dmcdn.cn/perform/damai/home/201802/20180205110717232.jpg" /></a></li>
                </ul>
            </div>
            <div class="sd">        <div class="box">
                <input type="hidden" id="topadcount" value="3"/>
                <ul class="lst" id="topadtitle">
                    <li class="itm"><a href="javascript:;" title="DOTA2亚洲邀请赛">
                        <span class="num">01.</span>
                        <span class="txt">DOTA2亚洲邀请赛</span></a>
                    </li>
                    <li class="itm"><a href="javascript:;" title="至乐汇全国巡演">
                        <span class="num">02.</span>
                        <span class="txt">至乐汇全国巡演</span></a>
                    </li>
                    <li class="itm"><a href="javascript:;" title="快乐农场大冒险">
                        <span class="num">03.</span>
                        <span class="txt">快乐农场大冒险</span></a>
                    </li>
                </ul>
            </div>
                <a class="skip prev" href="javascript:;" title="上一张">上一张</a>
                <a class="skip next" href="javascript:;" title="下一张">下一张</a>
            </div>
        </div>
        <!--主轮播 end-->
    </div>

    <div class="index-con">
        <!-- 每日推荐 & 猜你喜欢 begin -->
        <div class="hotlike">
            <div class="hd">
                <div class="tab">

                    <a class="itm" href="javascript:;">即将开票/预售</a>
                </div>
                <a href="#" class="ri-change" pageindex="1" style="display:none" id="btnLikePager">换一换</a>
            </div>
            <div class="bd">
                <div class="box">
                    <ul class='poster' id='index_recom_a' style='display:none;'></ul>
                    <ul class="poster z-act" id="showlike">
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/142612.html" target="_blank" class="img" id="home_jrtj_001_142612">
                                <img original="https://pimg.dmcdn.cn/perform/project/1426/142612_n.jpg?_t=1518170056252" width="150" height="200" title="赖声川执导，曹禺作品  话剧《北京人》" />
                            </a>
                            <a href="https://piao.damai.cn/142612.html" target="_blank" title="赖声川执导，曹禺作品  话剧《北京人》" class="title" id="home_jrtj_001_142612">赖声川执导，曹禺作品  话剧《北京人》</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>80
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">上海保利大剧院-大剧场</p>
                                <p class="time">2018.05.19-05.20</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/142678.html" target="_blank" class="img" id="home_jrtj_002_142678">
                                <img original="https://pimg.dmcdn.cn/perform/project/1426/142678_n.jpg?_t=1517548545289" width="150" height="200" title="【第七届西安戏剧节】至乐汇荒诞三部曲——《驴得水》" />
                            </a>
                            <a href="https://piao.damai.cn/142678.html" target="_blank" title="【第七届西安戏剧节】至乐汇荒诞三部曲——《驴得水》" class="title" id="home_jrtj_002_142678">【第七届西安戏剧节】至乐汇荒诞三部曲——《驴得水》</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>100
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">陕西大剧院—戏剧厅</p>
                                <p class="time">2018.05.25-05.27</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/135693.html" target="_blank" class="img" id="home_jrtj_003_135693">
                                <img original="https://pimg.dmcdn.cn/perform/project/1356/135693_n.jpg" width="150" height="200" title="世界经典原版音乐剧《猫》Cats 北京站" />
                            </a>
                            <a href="https://piao.damai.cn/135693.html" target="_blank" title="世界经典原版音乐剧《猫》Cats 北京站" class="title" id="home_jrtj_003_135693">世界经典原版音乐剧《猫》Cats 北京站</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>380
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">世纪剧院</p>
                                <p class="time">2018.09.22-10.06</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/119884.html" target="_blank" class="img" id="home_jrtj_004_119884">
                                <img original="https://pimg.dmcdn.cn/perform/project/1198/119884_n.jpg" width="150" height="200" title="五月天 LIFE [ 人生无限公司 ] 世界巡回演唱会-沈阳站  2018 MAYDAY LIFE TOUR" />
                            </a>
                            <a href="https://piao.damai.cn/119884.html" target="_blank" title="五月天 LIFE [ 人生无限公司 ] 世界巡回演唱会-沈阳站  2018 MAYDAY LIFE TOUR" class="title" id="home_jrtj_004_119884">五月天 LIFE [ 人生无限公司 ] 世界巡回演唱会-沈阳站  2018 MAYDAY LIFE TOUR</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>255
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">沈阳奥林匹克体育中心体育场</p>
                                <p class="time">2018.05.26 19:30</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/137617.html" target="_blank" class="img" id="home_jrtj_005_137617">
                                <img original="https://pimg.dmcdn.cn/perform/project/1376/137617_n.jpg" width="150" height="200" title="北京刘老根大舞台" />
                            </a>
                            <a href="https://piao.damai.cn/137617.html" target="_blank" title="北京刘老根大舞台" class="title" id="home_jrtj_005_137617">北京刘老根大舞台</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>380
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">刘老根大舞台北京剧场</p>
                                <p class="time">常年</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="https://piao.damai.cn/129240.html" target="_blank" class="img" id="home_jrtj_006_129240">
                                <img original="https://pimg.dmcdn.cn/perform/project/1292/129240_n.jpg" width="150" height="200" title="孟京辉导演话剧《恋爱的犀牛》" />
                            </a>
                            <a href="https://piao.damai.cn/129240.html" target="_blank" title="孟京辉导演话剧《恋爱的犀牛》" class="title" id="home_jrtj_006_129240">孟京辉导演话剧《恋爱的犀牛》</a>
                            <span class="price">
						票价：<strong>
							<i class="yen">&yen;</i>100
						</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">艺海剧院-先锋剧场</p>
                                <p class="time">2017.11.15-12.10</p>
                            </div>
                        </li>
                    </ul>
                    <ul class="poster">
                        <input type="hidden" id="pageNo" value="" /><input type="hidden" id="totalPageCount" value="" />
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146334.html" class="img" target="_blank" id="home_jjkp_001_146334">
                                <img src="//pimg.dmcdn.cn/perform/project/1463/146334_n_171_214.jpg" width="145" height="193" title="百老汇当红原版音乐剧《长靴皇后》" />
                            </a>
                            <a href="//piao.damai.cn/146334.html" class="title" target="_blank" title="百老汇当红原版音乐剧《长靴皇后》" id="home_jjkp_001_146334">百老汇当红原版音乐剧《长靴皇后》</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>100</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">广州大剧院 歌剧厅</p>
                                <p class="time">2018.08.09-08.19</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146324.html" class="img" target="_blank" id="home_jjkp_002_146324">
                                <img src="//pimg.dmcdn.cn/perform/project/1463/146324_n_171_214.jpg" width="145" height="193" title="2018 张学友《A Classic Tour 学友.经典》世界巡回演唱会-梧州站" />
                            </a>
                            <a href="//piao.damai.cn/146324.html" class="title" target="_blank" title="2018 张学友《A Classic Tour 学友.经典》世界巡回演唱会-梧州站" id="home_jjkp_002_146324">2018 张学友《A Classic Tour 学友.经典》世界巡回演唱会-梧州站</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>380</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">梧州市体育中心体育场</p>
                                <p class="time">2018.04.15 20：00</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146298.html" class="img" target="_blank" id="home_jjkp_003_146298">
                                <img src="//pimg.dmcdn.cn/perform/project/1462/146298_n_171_214.jpg" width="145" height="193" title="2018太湖迷笛音乐节" />
                            </a>
                            <a href="//piao.damai.cn/146298.html" class="title" target="_blank" title="2018太湖迷笛音乐节" id="home_jjkp_003_146298">2018太湖迷笛音乐节</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>220</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">太湖迷笛营</p>
                                <p class="time">2018.04.29-05.01</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146287.html" class="img" target="_blank" id="home_jjkp_004_146287">
                                <img src="//pimg.dmcdn.cn/perform/project/1462/146287_n_171_214.jpg" width="145" height="193" title="蝙蝠电子音乐节" />
                            </a>
                            <a href="//piao.damai.cn/146287.html" class="title" target="_blank" title="蝙蝠电子音乐节" id="home_jjkp_004_146287">蝙蝠电子音乐节</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>380</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">深圳大运中心广场</p>
                                <p class="time">2018.04.14 - 04.15</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146270.html" class="img" target="_blank" id="home_jjkp_005_146270">
                                <img src="//pimg.dmcdn.cn/perform/project/1462/146270_n_171_214.jpg" width="145" height="193" title="【万有音乐系】“丝路狂想”马克西姆2018跨界钢琴演奏会— 杭州站" />
                            </a>
                            <a href="//piao.damai.cn/146270.html" class="title" target="_blank" title="【万有音乐系】“丝路狂想”马克西姆2018跨界钢琴演奏会— 杭州站" id="home_jjkp_005_146270">【万有音乐系】“丝路狂想”马克西姆2018跨界钢琴演奏会— 杭州站</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>280</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">广厦体育馆（原杭州体育馆）</p>
                                <p class="time">2018.06.16</p>
                            </div>
                        </li>
                        <li class="show-poster-1">
                            <a href="//piao.damai.cn/146215.html" class="img" target="_blank" id="home_jjkp_006_146215">
                                <img src="//pimg.dmcdn.cn/perform/project/1462/146215_n_171_214.jpg" width="145" height="193" title="TOP100 DJs 电音天王-R3HAB" />
                            </a>
                            <a href="//piao.damai.cn/146215.html" class="title" target="_blank" title="TOP100 DJs 电音天王-R3HAB" id="home_jjkp_006_146215">TOP100 DJs 电音天王-R3HAB</a>
                            <span class="price">
						票价：<strong><i class="yen">&yen;</i>100</strong>起					</span>
                            <div class="poster-single">
                                <p class="addr">MIU 酒吧</p>
                                <p class="time">2018.04.06</p>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- 每日推荐 & 猜你喜欢 end -->
    </div>

    <div class="index-con">
        <div class="focus-stars">
            <ul class="stars-list">
                <li class="s1">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201803/20180306142143773_238_362.jpg" width="238" height="362"/>
                    <div class="layer-info">
                        <p class="title" title="CBA季后赛联赛">CBA季后赛联赛</p>            <div class="infos-box">
                        <div class="infos">
                        </div>
                        <a href=" https://p.damai.cn/wow/special/act/cba0302" class="ite" target="_blank">专题</a>
                    </div>
                    </div>
                </li>
                <li class="s2">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180102114204792_114_114.jpg" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/135290.html" target="_blank" id="home_xunyan_001_135290">宁波站</a>
                                <a href="//piao.damai.cn/138043.html" target="_blank" id="home_xunyan_002_138043">沈阳站</a>
                            </div>
                            <a href="https://piao.damai.cn/138043.html?spm=a2o6e.search.0.0.645f4cca3oUaFs" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s3">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180116120014374_114_114.png" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/139932.html" target="_blank" id="home_xunyan_001_139932">宁波站</a>
                                <a href="//piao.damai.cn/140955.html" target="_blank" id="home_xunyan_002_140955">常州站</a>
                                <a href="//piao.damai.cn/140327.html" target="_blank" id="home_xunyan_003_140327">苏州站</a>
                                <a href="//piao.damai.cn/140557.html" target="_blank" id="home_xunyan_004_140557">惠州站</a>
                            </div>
                            <a href="https://piao.damai.cn/140955.html?spm=a2o6e.search.0.0.137114e1C3iWWq" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s4">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180102114807553_238_114.jpg" width="238" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/138475.html" target="_blank" id="home_xunyan_001_138475">武汉站</a>
                                <a href="//piao.damai.cn/139515.html" target="_blank" id="home_xunyan_002_139515">太原站</a>
                            </div>
                            <a href="https://piao.damai.cn/139515.html?spm=a2o6e.home.0.0.7562431eifqwT2" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s5">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/2018011612091828_114_114.png" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                            </div>
                            <a href="https://piao.damai.cn/139739.html?spm=a2o6e.search.0.0.2a13064b3ebpI5" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s6">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180125112834289_114_114.jpg" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                            </div>
                            <a href="https://piao.damai.cn/141343.html?spm=a2o6e.search.0.0.2b4c700cdiulg4" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s7">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201710/2017103020030674_238_238.jpg" width="238" height="238"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                            </div>
                            <a href="https://p.damai.cn/wow/act/act/tymxsz" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s8">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180116114510207_238_114.png" width="238" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/135693.html" target="_blank" id="home_xunyan_001_135693">北京站</a>
                                <a href="//piao.damai.cn/139760.html" target="_blank" id="home_xunyan_002_139760">南京站</a>
                                <a href="//piao.damai.cn/137272.html" target="_blank" id="home_xunyan_003_137272">上海站</a>
                                <a href="//piao.damai.cn/136136.html" target="_blank" id="home_xunyan_004_136136">深圳站</a>
                                <a href="//piao.damai.cn/140326.html" target="_blank" id="home_xunyan_005_140326">苏州站</a>
                                <a href="//piao.damai.cn/140957.html" target="_blank" id="home_xunyan_006_140957">宁波站</a>
                            </div>
                            <a href="https://piao.damai.cn/135693.html?spm=a2o6e.search.0.0.4a7dafa60grXIn" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s9">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/2018011612061585_114_114.png" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/140949.html" target="_blank" id="home_xunyan_001_140949">广州站</a>
                            </div>
                            <a href="https://piao.damai.cn/140949.html?spm=a2o6e.search.0.0.42dd5a79gC4vsv" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="s10">
                    <img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180102115233233_114_114.jpg" width="114" height="114"/>
                    <div class="layer-info02">
                        <div class="infos-box">
                            <div class="infos">
                                <a href="//piao.damai.cn/138121.html" target="_blank" id="home_xunyan_001_138121">北京站</a>
                                <a href="//piao.damai.cn/138660.html" target="_blank" id="home_xunyan_002_138660">成都站</a>
                                <a href="//piao.damai.cn/137820.html" target="_blank" id="home_xunyan_003_137820">深圳站</a>
                                <a href="//piao.damai.cn/135292.html" target="_blank" id="home_xunyan_004_135292">武汉站</a>
                                <a href="//piao.damai.cn/137748.html" target="_blank" id="home_xunyan_005_137748">重庆站</a>
                                <a href="//piao.damai.cn/135342.html" target="_blank" id="home_xunyan_006_135342">宁波站</a>
                                <a href="//piao.damai.cn/139031.html" target="_blank" id="home_xunyan_007_139031">西安站</a>
                                <a href="//piao.damai.cn/138792.html" target="_blank" id="home_xunyan_008_138792">长沙站</a>
                                <a href="//piao.damai.cn/139436.html" target="_blank" id="home_xunyan_009_139436">上海站</a>
                            </div>
                            <a href="https://piao.damai.cn/138121.html?spm=a2o6e.search.0.0.5d17911c4yz0zS" class="ite" target="_blank">专题</a>
                        </div>
                    </div>
                </li>
                <li class="li-star s11">
                    <a href="//sale.damai.cn/act/zhxy.html" target="_blank" style="width: 114px; display: block; text-align: center; vertical-align: middle; font-size: 24px; color: rgb(255, 255, 255); font-weight: bold; padding-top: 28px; line-height: 30px; background: rgba(0, 0, 0, 0) url(&quot;//dui.dmcdn.cn/dm_2015/index/img/bg.png&quot;) repeat scroll 0px 0px; overflow: hidden; height: 86px; text-decoration:none;">更多<br>演出</a>
                </li>
            </ul>
        </div>
        <!--焦点图 end-->

        <div class="ri-active">
            <a href="https://piao.damai.cn/142308.html?spm=a2o6e.search.0.0.2b5328dfEdLFgL" class="img" target="_blank" id="home_gg_right"><img original="https://pimg.dmcdn.cn/perform/damai/home/201803/20180301180946185.jpg" title="2018周杰伦【地表最强2】世界巡回演唱会-郑州站 " /></a>
        </div>
    </div>


    <div class="floor drama" id="drama">
        <div class="title">
            <a class="more" href="//drama.damai.cn/" target="_blank">查看全部>></a>
            <h3><strong>1F</strong><a href="//drama.damai.cn/" target="_blank">戏剧达人</a></h3>
        </div>
        <div class="box">
            <div class="left">
                <div class="import">
                    <a href="https://piao.damai.cn/142078.html?spm=a2o6e.search.0.0.cb7b6c48kiCd5s" target="_blank" id="home_xjdr_pic_001"><img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180108095717468.jpg" alt="" width="238" height="362" title="MaiLive 孟京辉经典戏剧作品《恋爱的犀牛》广州站" /></a>
                    <div class="txt">
                        <p class="name">MaiLive 孟京辉经典戏剧作品《恋爱的犀牛》广州站</p>
                        <p class="price"><strong>180</strong>元起</p>
                    </div>
                    <span class="border"></span>
                </div>
                <ul class="tag">
                    <li><a href="//search.damai.cn/search.html?keyword=麦戏聚" target="_blank" title="麦戏聚" id="home_xjdr_gjz_001">麦戏聚</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=百老汇" target="_blank" title="百老汇" id="home_xjdr_gjz_002">百老汇</a></li>
                    <li class="last" ><a href="//search.damai.cn/search.html?keyword=音乐之声" target="_blank" title="音乐之声" id="home_xjdr_gjz_003">音乐之声</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=赖声川" target="_blank" title="赖声川" id="home_xjdr_gjz_004">赖声川</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=正乙祠" target="_blank" title="正乙祠" id="home_xjdr_gjz_005">正乙祠</a></li>
                    <li class="last" ><a href="//search.damai.cn/search.html?keyword=开心麻花" target="_blank" title="开心麻花" id="home_xjdr_gjz_006">开心麻花</a></li>
                    <li><a href="//www.damai.cn/projectlist.do?mcid=3&ccid=19" target="_blank" title="话剧" id="home_xjdr_gjz_007">话剧</a></li>
                    <li><a href="https://search.damai.cn/search.html?keyword=新月饭店" target="_blank" title="新月饭店" id="home_xjdr_gjz_008">新月饭店</a></li>
                    <li class="last" ><a href="//search.damai.cn/search.html?keyword=林奕华" target="_blank" title="林奕华" id="home_xjdr_gjz_009">林奕华</a></li>
                </ul>
            </div>
            <div class="mid">
                <ul class="list clear">
                    <li>
						<span class="img"><a href="https://piao.damai.cn/143533.html" target="_blank" id="home_xjdr_pic_001_143533">
							<img original="https://pimg.dmcdn.cn/perform/project/1435/143533_n.jpg?_t=1518415120661" alt="MaiLive 廖一梅 孟京辉“悲观主义三部曲”《琥珀》重庆站" width="112" height="150" title="MaiLive 廖一梅 孟京辉“悲观主义三部曲”《琥珀》重庆站"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/143533.html" target="_blank" title="MaiLive 廖一梅 孟京辉“悲观主义三部曲”《琥珀》重庆站" id="home_xjdr_pic_001_143533">MaiLive 廖一梅 孟京辉“悲观主义三部曲”《琥珀》重...</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="143533">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.26-04.27">2018.04.26-04.27</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_56625.html" target="_blank" title="重庆群星剧院">重庆群星剧院</a>
                                </p>
                                <p class="price">￥<strong>100</strong>起</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
						<span class="img"><a href="https://piao.damai.cn/143466.html" target="_blank" id="home_xjdr_pic_002_143466">
							<img original="https://pimg.dmcdn.cn/perform/project/1434/143466_n.jpg?_t=1518420792158" alt="“快乐在路上”2018至乐汇《破阵子 The Ugly Town》荒诞戏剧（广州站）" width="112" height="150" title="“快乐在路上”2018至乐汇《破阵子 The Ugly Town》荒诞戏剧（广州站）"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/143466.html" target="_blank" title="“快乐在路上”2018至乐汇《破阵子 The Ugly Town》荒诞戏剧（广州站）" id="home_xjdr_pic_002_143466">“快乐在路上”2018至乐汇《破阵子 The Ugly Town》荒...</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="143466">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.21-04.22">2018.04.21-04.22</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_59053.html" target="_blank" title="广东演艺中心大剧院">广东演艺中心大剧院</a>
                                </p>
                                <p class="price">￥<strong>80</strong>起</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
						<span class="img"><a href="https://piao.damai.cn/142221.html" target="_blank" id="home_xjdr_pic_003_142221">
							<img original="https://pimg.dmcdn.cn/perform/project/1422/142221_n.jpg" alt="“快乐在路上”2018至乐汇《驴得水Mr. Donkey》荒诞戏剧（合肥站）" width="112" height="150" title="“快乐在路上”2018至乐汇《驴得水Mr. Donkey》荒诞戏剧（合肥站）"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/142221.html" target="_blank" title="“快乐在路上”2018至乐汇《驴得水Mr. Donkey》荒诞戏剧（合肥站）" id="home_xjdr_pic_003_142221">“快乐在路上”2018至乐汇《驴得水Mr. Donkey》荒诞戏...</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="142221">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.07-04.08">2018.04.07-04.08</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_336.html" target="_blank" title="安徽大剧院">安徽大剧院</a>
                                </p>
                                <p class="price">￥<strong>50</strong>起</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
						<span class="img"><a href="https://piao.damai.cn/142073.html" target="_blank" id="home_xjdr_pic_004_142073">
							<img original="https://pimg.dmcdn.cn/perform/project/1420/142073_n.jpg" alt="MaiLive 孟京辉经典戏剧作品《两只狗的生活意见》广州站" width="112" height="150" title="MaiLive 孟京辉经典戏剧作品《两只狗的生活意见》广州站"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/142073.html" target="_blank" title="MaiLive 孟京辉经典戏剧作品《两只狗的生活意见》广州站" id="home_xjdr_pic_004_142073">MaiLive 孟京辉经典戏剧作品《两只狗的生活意见》广州...</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="142073">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.05.11-05.12">2018.05.11-05.12</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_1320.html" target="_blank" title="广州友谊剧院">广州友谊剧院</a>
                                </p>
                                <p class="price">￥<strong>100</strong>起</p>
                            </dd>
                        </dl>
                    </li>
                </ul>


            </div>

            <div class="right">
                <div class="rank">
                    <ul class="tab">
                        <li><a class="first active" href="javascript:;">小剧场排行</a></li>
                        <li><a href="javascript:;">大剧场排行</a></li>
                    </ul>
                    <div class="detail">
                        <div class="con on">
                            <ol class="live">
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a href="https://piao.damai.cn/144197.html" title="《恋爱的犀牛》" target="_blank" id="home_xjdr_paihang_xiao_001">《恋爱的犀牛》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a href="https://piao.damai.cn/139619.html" title="《无人入眠》" target="_blank" id="home_xjdr_paihang_xiao_002">《无人入眠》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a href="https://piao.damai.cn/139741.html" title="《他有两把左轮手枪和黑白相间的眼睛》" target="_blank" id="home_xjdr_paihang_xiao_003">《他有两把左轮手枪和黑白相间的眼睛》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a href="https://piao.damai.cn/116269.html" title="《那次奋不顾身的爱情》" target="_blank" id="home_xjdr_paihang_xiao_004">《那次奋不顾身的爱情》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a href="https://piao.damai.cn/144015.html" title="《我爱你，你爱笑》" target="_blank" id="home_xjdr_paihang_xiao_005">《我爱你，你爱笑》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a href="https://piao.damai.cn/137896.html" title="《你好，忧愁》" target="_blank" id="home_xjdr_paihang_xiao_006">《你好，忧愁》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a href="https://piao.damai.cn/144243.html" title="《巴黎圣母院》" target="_blank" id="home_xjdr_paihang_xiao_007">《巴黎圣母院》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a href="https://piao.damai.cn/139756.html" title="《一个陌生女人的来信》" target="_blank" id="home_xjdr_paihang_xiao_008">《一个陌生女人的来信》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >9</span>
                                        <p><a href="https://piao.damai.cn/131753.html" title="《我是余欢水》" target="_blank" id="home_xjdr_paihang_xiao_009">《我是余欢水》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >10</span>
                                        <p><a href="https://piao.damai.cn/142710.html" title="《太阳和太阳穴》" target="_blank" id="home_xjdr_paihang_xiao_0010">《太阳和太阳穴》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state down"></strong>
                                    <div class="works">
                                        <span >11</span>
                                        <p><a href="https://piao.damai.cn/133700.html" title="《谋杀启事》" target="_blank" id="home_xjdr_paihang_xiao_0011">《谋杀启事》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >12</span>
                                        <p><a href="https://piao.damai.cn/143486.html" title="《活出你自己》" target="_blank" id="home_xjdr_paihang_xiao_0012">《活出你自己》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >13</span>
                                        <p><a href="https://piao.damai.cn/139746.html" title="《年轻的野兽》" target="_blank" id="home_xjdr_paihang_xiao_0013">《年轻的野兽》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >14</span>
                                        <p><a href="https://piao.damai.cn/137911.html" title="《九又二分之一爱情》" target="_blank" id="home_xjdr_paihang_xiao_0014">《九又二分之一爱情》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state  up"></strong>
                                    <div class="works">
                                        <span >15</span>
                                        <p><a href="https://piao.damai.cn/134220.html" title="《简爱》" target="_blank" id="home_xjdr_paihang_xiao_0015">《简爱》</a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                        <div class="con">
                            <ol class="live">
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a href="https://piao.damai.cn/144479.html" title="《水中之书》" target="_blank" id="home_xjdr_paihang_da_001">《水中之书》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a href="https://piao.damai.cn/141459.html" title="《李茶的姑妈》" target="_blank" id="home_xjdr_paihang_da_002">《李茶的姑妈》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a href="https://piao.damai.cn/136136.html" title="《猫》" target="_blank" id="home_xjdr_paihang_da_003">《猫》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a href="https://piao.damai.cn/145273.html" title="《白夜行》" target="_blank" id="home_xjdr_paihang_da_004">《白夜行》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a href="https://piao.damai.cn/142367.html" title="《兰陵王》" target="_blank" id="home_xjdr_paihang_da_005">《兰陵王》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a href="https://piao.damai.cn/141337.html" title="《莎士比亚别生气》" target="_blank" id="home_xjdr_paihang_da_006">《莎士比亚别生气》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a href="https://piao.damai.cn/144792.html" title="《乌龙山伯爵》" target="_blank" id="home_xjdr_paihang_da_007">《乌龙山伯爵》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a href="https://piao.damai.cn/141210.html" title="《婿事待发》" target="_blank" id="home_xjdr_paihang_da_008">《婿事待发》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >9</span>
                                        <p><a href="https://piao.damai.cn/141698.html" title="《四世同堂》" target="_blank" id="home_xjdr_paihang_da_009">《四世同堂》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >10</span>
                                        <p><a href="https://piao.damai.cn/144725.html" title="《长靴皇后》" target="_blank" id="home_xjdr_paihang_da_0010">《长靴皇后》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >11</span>
                                        <p><a href="https://piao.damai.cn/129240.html" title="《恋爱的犀牛》" target="_blank" id="home_xjdr_paihang_da_0011">《恋爱的犀牛》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state down"></strong>
                                    <div class="works">
                                        <span >12</span>
                                        <p><a href="https://piao.damai.cn/143693.html" title="《宝岛一村》" target="_blank" id="home_xjdr_paihang_da_0012">《宝岛一村》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >13</span>
                                        <p><a href="https://piao.damai.cn/142196.html" title="《二维码杀手》" target="_blank" id="home_xjdr_paihang_da_0013">《二维码杀手》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >14</span>
                                        <p><a href="https://piao.damai.cn/144345.html" title="《新月饭店》" target="_blank" id="home_xjdr_paihang_da_0014">《新月饭店》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="state up"></strong>
                                    <div class="works">
                                        <span >15</span>
                                        <p><a href="https://piao.damai.cn/144184.html" title="《大宅门》" target="_blank" id="home_xjdr_paihang_da_0015">《大宅门》</a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="floor sport" id="sport">
        <div class="title">
            <a class="more" href="//sports.damai.cn/" target="_blank">查看全部>></a>
            <h3><strong>2F</strong><a href="//sports.damai.cn/" target="_blank">体育赛事</a></h3>
        </div>
        <div class="box">
            <div class="left">
                <div class="import">
                    <a href="https://piao.damai.cn/138169.html" target="_blank" id="home_tyss_pic_001"><img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180116101920333.jpg" title="2018中国杯国际足球锦标赛" alt="" width="238" height="362"></a>
                    <div class="txt">
                        <p class="name">2018中国杯国际足球锦标赛</p>
                        <p class="price"><strong>80</strong>元起</p>
                    </div>
                    <span class="border"></span>
                </div>
            </div>
            <div class="mid">
                <ul class="list list2 clear">
                    <li >
                        <span class="img"><a href="//piao.damai.cn/144747.html" target="_blank" id="home_tyss_pic_001_144747"><img original="https://pimg.dmcdn.cn/perform/project/1447/144747_n.jpg?_t=1521004508497" alt="" width="112" height="150" title="2018赛季中国足球协会超级联赛长春亚泰主场赛事-单场票">2018赛季中国足球协会超级联赛长春亚泰主场赛事-单场票</a></span>
                        <dl class="infor">
                            <dt><a href="//piao.damai.cn/144747.html" target="_blank" title="2018赛季中国足球协会超级联赛长春亚泰主场赛事-单场票" id="home_tyss_pic_001_144747">2018赛季中国足球协会超级联赛长春亚泰主场赛事-单场...</a></dt>
                            <dd class="txt">
                                <p class="time" title="2018.03.18-11.11">2018.03.18-11.11</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_474.html" target="_blank" title="长春体育中心体育场（南岭体育场）">长春体育中心体育场（...</a>
                                </p>
                                <p class="price">
                                    ￥<strong>40</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li >
                        <span class="img"><a href="//piao.damai.cn/146054.html" target="_blank" id="home_tyss_pic_002_146054"><img original="https://pimg.dmcdn.cn/perform/project/1460/146054_n.jpg?_t=1521605064110" alt="" width="112" height="150" title="The Color Run™ 北京站(09:00上午场）">The Color Run™ 北京站(09:00上午场）</a></span>
                        <dl class="infor">
                            <dt><a href="//piao.damai.cn/146054.html" target="_blank" title="The Color Run™ 北京站(09:00上午场）" id="home_tyss_pic_002_146054">The Color Run™ 北京站(09:00上午场）</a></dt>
                            <dd class="txt">
                                <p class="time" title="2018.06.09 9:00">2018.06.09 9:00</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_56969.html" target="_blank" title="北京园博园">北京园博园</a>
                                </p>
                                <p class="price">
                                    ￥<strong>228</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="under">
                        <span class="img"><a href="//piao.damai.cn/144520.html" target="_blank" id="home_tyss_pic_003_144520"><img original="https://pimg.dmcdn.cn/perform/project/1445/144520_n.jpg?_t=1520229641854" alt="" width="112" height="150" title="2018中国足球协会超级联赛大连一方主场年票卡">2018中国足球协会超级联赛大连一方主场年票卡</a></span>
                        <dl class="infor">
                            <dt><a href="//piao.damai.cn/144520.html" target="_blank" title="2018中国足球协会超级联赛大连一方主场年票卡" id="home_tyss_pic_003_144520">2018中国足球协会超级联赛大连一方主场年票卡</a></dt>
                            <dd class="txt">
                                <p class="time" title="2018.03.16-11.11">2018.03.16-11.11</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_56860.html" target="_blank" title="大连体育中心体育场">大连体育中心体育场</a>
                                </p>
                                <p class="price">
                                    ￥<strong>688</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="under">
                        <span class="img"><a href="//piao.damai.cn/142859.html" target="_blank" id="home_tyss_pic_004_142859"><img original="https://pimg.dmcdn.cn/perform/project/1428/142859_n.jpg?_t=1520228291247" alt="" width="112" height="150" title="2018DOTA2亚洲邀请赛">2018DOTA2亚洲邀请赛</a></span>
                        <dl class="infor">
                            <dt><a href="//piao.damai.cn/142859.html" target="_blank" title="2018DOTA2亚洲邀请赛" id="home_tyss_pic_004_142859">2018DOTA2亚洲邀请赛</a></dt>
                            <dd class="txt">
                                <p class="time" title="2018.04.03-04.07">2018.04.03-04.07</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_53332.html" target="_blank" title="东方体育中心">东方体育中心</a>
                                </p>
                                <p class="price">
                                    ￥<strong>129</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="right">
                <div class="rank">
                    <ul class="tab">
                        <li><a class="-active" style="width:258px;color:#333;">热门比赛排行</a></li>
                    </ul>
                    <div class="detail">
                        <div class="con">
                            <ol class="live">
                                <li>
                                    <strong class="txt">南宁</strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a href="https://piao.damai.cn/138169.html" target="_blank" title="2018中国杯国际足球锦标赛" id="home_tyss_paihang_001">2018中国杯国际足球锦标赛</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">贵阳</strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a href="https://piao.damai.cn/138737.html" target="_blank" title="2018赛季贵州恒丰足球队主场年票卡" id="home_tyss_paihang_002">2018赛季贵州恒丰足球队主场年票卡</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a href="https://piao.damai.cn/140952.html" target="_blank" title="2018上海浪琴环球马术冠军赛" id="home_tyss_paihang_003">2018上海浪琴环球马术冠军赛</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">长春</strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a href="https://piao.damai.cn/141036.html" target="_blank" title="2018赛季中超联赛长春亚泰主场赛事-年卡" id="home_tyss_paihang_004">2018赛季中超联赛长春亚泰主场赛事-年卡</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">郑州</strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a href="https://piao.damai.cn/142174.html" target="_blank" title="2018赛季河南建业足球俱乐部社会年卡" id="home_tyss_paihang_005">2018赛季河南建业足球俱乐部社会年卡</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a href="https://piao.damai.cn/145549.html" target="_blank" title="2018 X-Mudder 泥泞障碍赛全国巡回赛-上海站-经典赛" id="home_tyss_paihang_006">2018 X-Mudder 泥泞障碍赛全国巡回赛-上海站-经典赛</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">石家庄</strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a href="https://piao.damai.cn/144814.html" target="_blank" title="2018河北·正定女子半程马拉松" id="home_tyss_paihang_007">2018河北·正定女子半程马拉松</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">青岛</strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a href="https://piao.damai.cn/142364.html" target="_blank" title="2018赛季中甲联赛青岛黄海制药足球俱乐部全年套票（年卡）" id="home_tyss_paihang_008">2018赛季中甲联赛青岛黄海制药足球俱乐部全年套票（年卡）</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">深圳</strong>
                                    <div class="works">
                                        <span >9</span>
                                        <p><a href="https://piao.damai.cn/143411.html" target="_blank" title="2018赛季中甲联赛 深圳佳兆业主场套票" id="home_tyss_paihang_009">2018赛季中甲联赛 深圳佳兆业主场套票</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">沈阳</strong>
                                    <div class="works">
                                        <span >10</span>
                                        <p><a href="https://piao.damai.cn/145336.html" target="_blank" title="The Color Run™沈阳站" id="home_tyss_paihang_0010">The Color Run™沈阳站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">成都</strong>
                                    <div class="works">
                                        <span >11</span>
                                        <p><a href="https://piao.damai.cn/145697.html" target="_blank" title="2018营山国际马拉松赛" id="home_tyss_paihang_0011">2018营山国际马拉松赛</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">成都</strong>
                                    <div class="works">
                                        <span >12</span>
                                        <p><a href="https://piao.damai.cn/144949.html" target="_blank" title="The Color Run™ 成都站" id="home_tyss_paihang_0012">The Color Run™ 成都站</a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="floor music" id="music">
        <div class="title">
            <a class="more" href="//classical.damai.cn/" target="_blank">查看全部>></a>
            <h3><strong>3F</strong><a href="//classical.damai.cn/" target="_blank">古典/舞蹈</a></h3>
        </div>

        <div class="box">
            <div class="left">
                <div class="import">
                    <a href="https://piao.damai.cn/139648.html?spm=a2o6e.search.0.0.3b71fba1lbWc8d" target="_blank" id="home_gdyy_pic_001"><img original="https://pimg.dmcdn.cn/perform/damai/home/201801/20180115112040594.jpg" title="迈克尔·弗莱利《王者之舞·危险游戏》" alt="" width="238" height="362"></a>
                    <div class="txt">
                        <p class="name">迈克尔·弗莱利《王者之舞·危险游戏》</p>
                        <p class="price"><strong>100</strong>元起</p>
                    </div>
                    <span class="border"></span>
                </div>
                <ul class="tag">
                    <li><a href="//search.damai.cn/search.html?keyword=爱乐乐团" target="_blank" title="爱乐乐团" id="home_gdyy_gjz_001">爱乐乐团</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=爱乐汇" target="_blank" title="爱乐汇" id="home_gdyy_gjz_002">爱乐汇</a></li>
                    <li class="last" ><a href="//search.damai.cn/search.html?keyword=天鹅湖" target="_blank" title="天鹅湖" id="home_gdyy_gjz_003">天鹅湖</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=天空之城" target="_blank" title="天空之城" id="home_gdyy_gjz_004">天空之城</a></li>
                    <li><a href="//search.damai.cn/search.html?keyword=芭蕾舞" target="_blank" title="芭蕾" id="home_gdyy_gjz_005">芭蕾</a></li>
                    <li class="last" ><a href="//search.damai.cn/search.html?keyword=现代舞" target="_blank" title="现代舞" id="home_gdyy_gjz_006">现代舞</a></li>
                </ul>
            </div>

            <div class="mid">
                <ul class="list clear">
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/145203.html" target="_blank" id="home_gdyy_pic_001_145203"><img original="https://pimg.dmcdn.cn/perform/project/1452/145203_n.jpg?_t=1520845524199" alt="" width="112" height="150" title="爱乐汇• “致•爱丽丝”经典浪漫钢琴名曲音乐会"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/145203.html" target="_blank" title="爱乐汇• “致•爱丽丝”经典浪漫钢琴名曲音乐会" id="home_gdyy_pic_001_145203">爱乐汇• “致•爱丽丝”经典浪漫钢琴名曲音乐会</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="145203">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.05.04  19:30">2018.05.04  19:30</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_107.html" target="_blank" title="世纪剧院">世纪剧院</a>
                                </p>
                                <p class="price">
                                    ￥<strong>90</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/144467.html" target="_blank" id="home_gdyy_pic_002_144467"><img original="https://pimg.dmcdn.cn/perform/project/1444/144467_n.jpg?_t=1519979939063" alt="" width="112" height="150" title="爱乐汇•俄罗斯芭蕾国家剧院芭蕾舞《胡桃夹子》"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/144467.html" target="_blank" title="爱乐汇•俄罗斯芭蕾国家剧院芭蕾舞《胡桃夹子》" id="home_gdyy_pic_002_144467">爱乐汇•俄罗斯芭蕾国家剧院芭蕾舞《胡桃夹子》</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="144467">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.21-05.01">2018.04.21-05.01</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_107.html" target="_blank" title="世纪剧院">世纪剧院</a>
                                </p>
                                <p class="price">
                                    ￥<strong>90</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/143519.html" target="_blank" id="home_gdyy_pic_003_143519"><img original="https://pimg.dmcdn.cn/perform/project/1435/143519_n.jpg?_t=1518506544900" alt="" width="112" height="150" title="爱乐汇·《夜的钢琴曲》——石进钢琴作品音乐会"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/143519.html" target="_blank" title="爱乐汇·《夜的钢琴曲》——石进钢琴作品音乐会" id="home_gdyy_pic_003_143519">爱乐汇·《夜的钢琴曲》——石进钢琴作品音乐会</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="143519">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.22 20:00">2018.04.22 20:00</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_650.html" target="_blank" title="华夏艺术中心">华夏艺术中心</a>
                                </p>
                                <p class="price">
                                    ￥<strong>120</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/138638.html" target="_blank" id="home_gdyy_pic_004_138638"><img original="https://pimg.dmcdn.cn/perform/project/1386/138638_n.jpg" alt="" width="112" height="150" title="数风流人物还看今朝——中华古今经典诗词名家朗诵音乐会"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/138638.html" target="_blank" title="数风流人物还看今朝——中华古今经典诗词名家朗诵音乐会" id="home_gdyy_pic_004_138638">数风流人物还看今朝——中华古今经典诗词名家朗诵音乐...</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="138638">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.03.30 19:30">2018.03.30 19:30</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_12.html" target="_blank" title="北京音乐厅">北京音乐厅</a>
                                </p>
                                <p class="price">
                                    ￥<strong>90</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="right">
                <div class="rank">
                    <div class="img"><a href="https://search.damai.cn/search.html?keyword=%E4%B8%87%E6%9C%89" target="_blank" id="home_gdyy_pic_002"><img original="https://pimg.dmcdn.cn/perform/damai/home/201802/20180214113243923.jpg" title="万有音乐系" alt="" width="260" height="116"></a></div>
                    <div class="detail">
                        <div class="con">
                            <ol class="live">
                                <li>
                                    <strong class="txt">深圳</strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a href="https://piao.damai.cn/143667.html?spm=a2o6e.search.0.0.45574d15B2RtlP" target="_blank" title="爱乐汇·柏林爱乐钢琴家金·芭比儿童钢琴启蒙音乐会" id="home_gdyy_paihang_001">爱乐汇·柏林爱乐钢琴家金·芭比儿童钢琴启蒙音乐会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">深圳</strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a href="https://piao.damai.cn/143675.html?spm=a2o6e.search.0.0.45574d15B2RtlP" target="_blank" title="爱乐汇·台湾钢琴诗人Pianoboy高至豪流行钢琴深圳音乐会" id="home_gdyy_paihang_002">爱乐汇·台湾钢琴诗人Pianoboy高至豪流行钢琴深圳音乐会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a href="https://piao.damai.cn/134063.html?spm=a2o6e.dance.0.0.16b9066dfNrAs2" target="_blank" title="天鹅湖—世界经典芭蕾舞剧交响名曲元宵音乐会" id="home_gdyy_paihang_003">天鹅湖—世界经典芭蕾舞剧交响名曲元宵音乐会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">南昌</strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a href="https://piao.damai.cn/140794.html?spm=a2o6e.search.0.0.488dc62dLYAcN7" target="_blank" title="《荷兰康科迪亚弦乐四重奏》音乐会" id="home_gdyy_paihang_004">《荷兰康科迪亚弦乐四重奏》音乐会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">天津</strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a href="https://piao.damai.cn/140887.html?spm=a2o6e.search.0.0.488dc62dLYAcN7" target="_blank" title="2018新年民族音乐会 武清专场" id="home_gdyy_paihang_005">2018新年民族音乐会 武清专场</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a href="https://piao.damai.cn/140719.html?spm=a2o6e.search.0.0.5b64df08IPSMov" target="_blank" title="欧罗巴的迷雾（三）：马勒的【复活】" id="home_gdyy_paihang_006">欧罗巴的迷雾（三）：马勒的【复活】</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a href="https://piao.damai.cn/140721.html?spm=a2o6e.search.0.0.5b64df08IPSMov" target="_blank" title="恬静年代：库普曼 阿姆斯特丹巴洛克合唱团与SSO演绎海顿《四季》" id="home_gdyy_paihang_007">恬静年代：库普曼 阿姆斯特丹巴洛克合唱团与SSO演绎海顿《四季》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">杭州</strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a href="https://piao.damai.cn/140736.html?spm=a2o6e.search.0.0.5b64df08IPSMov" target="_blank" title="“海上钢琴师”电影原声音乐演奏家—吉达·布塔钢琴视听音乐会·杭州站" id="home_gdyy_paihang_008">“海上钢琴师”电影原声音乐演奏家—吉达·布塔钢琴视听音乐会·杭州站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >9</span>
                                        <p><a href="https://piao.damai.cn/136512.html?spm=a2o6e.search.0.0.344ee31cTR5kWQ" target="_blank" title="上海歌舞团2018舞剧·舞蹈演出季：舞剧《朱鹮》" id="home_gdyy_paihang_009">上海歌舞团2018舞剧·舞蹈演出季：舞剧《朱鹮》</a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="floor kid" id="kid">
        <div class="title">
            <a class="more" href="//kids.damai.cn/" target="_blank">查看全部>></a>
            <h3><strong>4F</strong><a href="//kids.damai.cn/" target="_blank">儿童亲子</a></h3>
        </div>
        <div class="box">
            <div class="left">
                <div class="import">
                    <a href="https://piao.damai.cn/139173.html" target="_blank" id="home_etqz_pic_001"><img original="https://pimg.dmcdn.cn/perform/damai/home/201802/20180213173740526.jpg" title="英国BBC正版海洋探险儿童舞台剧《海底小纵队-火山大冒险》" alt="" width="238" height="362"></a>
                    <div class="txt">
                        <p class="name">英国BBC正版海洋探险儿童舞台剧《海底小纵队-火山大冒险》</p>
                        <p class="price"><strong>100</strong>元起</p>
                    </div>
                    <span class="border"></span>
                </div>
                <ul class="tag">
                    <li><a id="home_etqz_gjz_001" href="https://piao.damai.cn/124441.html?spm=a2o6e.search.0.0.3647afb8I07DeG" target="_blank" title="太阳马戏">太阳马戏</a></li>
                    <li><a id="home_etqz_gjz_002" href="//search.damai.cn/search.html?keyword=亲子音乐会" target="_blank" title="亲子音乐会">亲子音乐会</a></li>
                    <li class="last" ><a id="home_etqz_gjz_003" href="//search.damai.cn/search.html?keyword=三只小猪" target="_blank" title="三只小猪">三只小猪</a></li>
                    <li><a id="home_etqz_gjz_004" href="https://search.damai.cn/search.html?spm=a2o6e.kids.0.0.3f028343butk1C&keyword=巧虎秋冬" target="_blank" title="巧虎">巧虎</a></li>
                    <li><a id="home_etqz_gjz_005" href="//search.damai.cn/search.html?keyword=童话剧" target="_blank" title="童话剧">童话剧</a></li>
                    <li class="last" ><a id="home_etqz_gjz_006" href="//search.damai.cn/search.html?keyword=迪士尼" target="_blank" title="迪士尼">迪士尼</a></li>
                </ul>
            </div>

            <div class="mid">
                <ul class="list clear">
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/144825.html" target="_blank" id="home_etqz_pic_001_144825"><img title="小动物嘉年华之《丽莎的梦幻世界》" original="https://pimg.dmcdn.cn/perform/project/1448/144825_n.jpg?_t=1520919766383" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/144825.html" id="home_etqz_pic_001_144825" target="_blank" title="小动物嘉年华之《丽莎的梦幻世界》">小动物嘉年华之《丽莎的梦幻世界》</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="144825">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.04.05-04.30">2018.04.05-04.30</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_819.html" target="_blank" title="中国木偶剧院大剧场">中国木偶剧院大剧场</a>
                                </p>
                                <p class="price">
                                    ￥<strong>80</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/139834.html" target="_blank" id="home_etqz_pic_002_139834"><img title="原创音乐亲子剧《木偶奇遇记》-武汉站" original="https://pimg.dmcdn.cn/perform/project/1398/139834_n.jpg" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/139834.html" id="home_etqz_pic_002_139834" target="_blank" title="原创音乐亲子剧《木偶奇遇记》-武汉站">原创音乐亲子剧《木偶奇遇记》-武汉站</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="139834">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.03.24 10:30/15:00">2018.03.24 10:30/15:...</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_266.html" target="_blank" title="湖北剧院">湖北剧院</a>
                                </p>
                                <p class="price">
                                    ￥<strong>50</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/135925.html" target="_blank" id="home_etqz_pic_003_135925"><img title="【小橙堡】大型原创励志童话剧《小马快跑之马虎父子》" original="https://pimg.dmcdn.cn/perform/project/1359/135925_n.jpg" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/135925.html" id="home_etqz_pic_003_135925" target="_blank" title="【小橙堡】大型原创励志童话剧《小马快跑之马虎父子》">【小橙堡】大型原创励志童话剧《小马快跑之马虎父子》</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="135925">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.03.25">2018.03.25</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_59062.html" target="_blank" title="无锡演艺剧院">无锡演艺剧院</a>
                                </p>
                                <p class="price">
                                    ￥<strong>20</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <span class="img"><a href="https://piao.damai.cn/140704.html" target="_blank" id="home_etqz_pic_004_140704"><img title="爱乐汇·贝肯熊大型亲子音乐剧《今天，运气真好！！》" original="https://pimg.dmcdn.cn/perform/project/1407/140704_n.jpg" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="https://piao.damai.cn/140704.html" id="home_etqz_pic_004_140704" target="_blank" title="爱乐汇·贝肯熊大型亲子音乐剧《今天，运气真好！！》">爱乐汇·贝肯熊大型亲子音乐剧《今天，运气真好！！》</a>
                            </dt>
                            <dd class="score">
                                <span class="star"><b style="width:80%;"></b></span>
                                <strong class="num scorenum" pid="140704">8.0</strong>
                            </dd>
                            <dd class="txt">
                                <p class="time" title="2018.03.23-03.25">2018.03.23-03.25</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_188.html" target="_blank" title="艺海剧院">艺海剧院</a>
                                </p>
                                <p class="price">
                                    ￥<strong>80</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                </ul>

                </ul>
            </div>

            <div class="right">
                <div class="rank">
                    <div class="img"><a href="https://x.damai.cn/markets/pc/2018qiaohu?spm=a2o6e.home.0.0.1f2548d3fRMeuU&wh_ttid=pc" target="_blank" id="home_etqz_pic_002"><img original="https://pimg.dmcdn.cn/perform/damai/home/201802/20180227181854477.jpg" title="巧虎2018春季" alt="" width="260" height="116"></a></div>
                    <div class="detail">
                        <div class="con">
                            <ol class="live">
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a id="home_etqz_paihang_001" href="https://piao.damai.cn/124441.html" target="_blank" title="加拿大太阳马戏《KOOZA》巡演">加拿大太阳马戏《KOOZA》巡演</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a id="home_etqz_paihang_002" href="https://piao.damai.cn/139142.html" target="_blank" title="2018新春版朝阳公园大马戏">2018新春版朝阳公园大马戏</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a id="home_etqz_paihang_003" href="https://piao.damai.cn/137550.html" target="_blank" title="2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站">2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a id="home_etqz_paihang_004" href="https://piao.damai.cn/139439.html" target="_blank" title="2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站">2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a id="home_etqz_paihang_005" href="https://piao.damai.cn/138497.html" target="_blank" title="英国BBC大型多媒体全景探险儿童剧《海底小纵队3:惊涛骇浪》">英国BBC大型多媒体全景探险儿童剧《海底小纵队3:惊涛骇浪》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a id="home_etqz_paihang_006" href="https://piao.damai.cn/143317.html" target="_blank" title="美国原版音乐舞台剧《汪汪队立大功-救援先锋》">美国原版音乐舞台剧《汪汪队立大功-救援先锋》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">佛山</strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a id="home_etqz_paihang_007" href="https://piao.damai.cn/143320.html" target="_blank" title="木偶剧《阿拉丁神灯》">木偶剧《阿拉丁神灯》</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">深圳</strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a id="home_etqz_paihang_008" href="https://piao.damai.cn/143082.html" target="_blank" title="2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站">2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">成都</strong>
                                    <div class="works">
                                        <span >9</span>
                                        <p><a id="home_etqz_paihang_009" href="https://piao.damai.cn/142283.html" target="_blank" title="2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站">2018年春季巧虎大型舞台剧《快乐农场大冒险》北京站</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span >10</span>
                                        <p><a id="home_etqz_paihang_0010" href="https://piao.damai.cn/139347.html" target="_blank" title="大型多媒体奇幻互动儿童剧《绿野仙踪》">大型多媒体奇幻互动儿童剧《绿野仙踪》</a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>

    <div class="floor rock" id="rock">
        <div class="title">
            <a class="more" href="//rock.damai.cn/" target="_blank">查看全部>></a>
            <h3><strong>5F</strong><a href="//rock.damai.cn/" target="_blank">摇滚在路上</a></h3>
        </div>
        <div class="box">
            <div class="left">
                <div class="import">
                    <a href="https://piao.damai.cn/143143.html" target="_blank" id="home_ygzls_pic_001"><img original="https://pimg.dmcdn.cn/perform/damai/home/201802/20180213173517272.jpg" title="2018咪咕音乐现场低苦艾乐队专场 " alt="" width="238" height="362"></a>
                    <div class="txt">
                        <p class="name">2018咪咕音乐现场低苦艾乐队专场 </p>
                        <p class="price"><strong>160</strong>元起</p>
                    </div>
                    <span class="border"></span>
                </div>
            </div>
            <div class="mid">
                <ul class="list list2 clear">
                    <li >
                        <span class="img"><a href="https://piao.damai.cn/144811.html" target="_blank" id="home_ygzls_pic_001_144811"><img original="https://pimg.dmcdn.cn/perform/project/1448/144811_n.jpg?_t=1520404443837" title="Arch Enemy(大敌)巡演北京站演唱会" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="//piao.damai.cn/144811.html" target="_blank" title="Arch Enemy(大敌)巡演北京站演唱会" id="home_ygzls_pic_001_144811">Arch Enemy(大敌)巡演北京站演唱会</a>
                            </dt>
                            <dd class="txt">
                                <p class="time" title="2018.04.08 20:30">2018.04.08 20:30</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_27.html" target="_blank" title="糖果TANGO（三层）">糖果TANGO（三层）</a>
                                </p>
                                <p class="price">
                                    ￥<strong>550</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li >
                        <span class="img"><a href="https://piao.damai.cn/141351.html" target="_blank" id="home_ygzls_pic_002_141351"><img original="https://pimg.dmcdn.cn/perform/project/1413/141351_n.jpg?_t=1517886039997" title="伍佰&China Blue 摇滚全经典-全面对决演唱会北京站" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="//piao.damai.cn/141351.html" target="_blank" title="伍佰&China Blue 摇滚全经典-全面对决演唱会北京站" id="home_ygzls_pic_002_141351">伍佰&China Blue 摇滚全经典-全面对决演唱会北京站</a>
                            </dt>
                            <dd class="txt">
                                <p class="time" title="2018.06.23 19:00">2018.06.23 19:00</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_682.html" target="_blank" title="凯迪拉克中心（原五棵松体育馆）">凯迪拉克中心（原五棵...</a>
                                </p>
                                <p class="price">
                                    ￥<strong>280</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="under">
                        <span class="img"><a href="https://piao.damai.cn/139601.html" target="_blank" id="home_ygzls_pic_003_139601"><img original="https://pimg.dmcdn.cn/perform/project/1396/139601_n.jpg" title="U2 EXPERIENCE + INNOCENCE TOUR北美巡演—芝加哥站" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="//piao.damai.cn/139601.html" target="_blank" title="U2 EXPERIENCE + INNOCENCE TOUR北美巡演—芝加哥站" id="home_ygzls_pic_003_139601">U2 EXPERIENCE + INNOCENCE TOUR北美巡演—芝加哥站</a>
                            </dt>
                            <dd class="txt">
                                <p class="time" title="2018.5.22/23">2018.5.22/23</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_92166.html" target="_blank" title="United Center">United Center</a>
                                </p>
                                <p class="price">
                                    ￥<strong>590</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                    <li class="under">
                        <span class="img"><a href="https://piao.damai.cn/132018.html" target="_blank" id="home_ygzls_pic_004_132018"><img original="https://pimg.dmcdn.cn/perform/project/1320/132018_n.jpg" title="2018谢天笑北京演唱会" alt="" width="112" height="150"></a></span>
                        <dl class="infor">
                            <dt>
                                <a href="//piao.damai.cn/132018.html" target="_blank" title="2018谢天笑北京演唱会" id="home_ygzls_pic_004_132018">2018谢天笑北京演唱会</a>
                            </dt>
                            <dd class="txt">
                                <p class="time" title="2018.03.23--03.24">2018.03.23--03.24</p>
                                <p class="place">
                                    <a href="//venue.damai.cn/venue_2.html" target="_blank" title="工人体育馆">工人体育馆</a>
                                </p>
                                <p class="price">
                                    ￥<strong>180</strong>起								</p>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
            <div class="right">
                <div class="rank">
                    <div class="img"><a href="https://search.damai.cn/search.html?keyword=u2" target="_blank" id="home_ygzls_pic_002"><img original="https://pimg.dmcdn.cn/perform/damai/home/201802/20180213174119444.jpg" alt="" width="260" height="116" title="U2 EXPERIENCE + INNOCENCE TOUR北美巡演—芝加哥站"></a></div>
                    <div class="detail">
                        <div class="con">
                            <ol class="live">
                                <li>
                                    <strong class="txt">西安</strong>
                                    <div class="works">
                                        <span class="top">1</span>
                                        <p><a href="https://piao.damai.cn/143143.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="2018咪咕音乐现场低苦艾乐队专场 " id="home_ygzls_paihang_001">2018咪咕音乐现场低苦艾乐队专场 </a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">宁波</strong>
                                    <div class="works">
                                        <span class="top">2</span>
                                        <p><a href="https://piao.damai.cn/143241.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="“再·见 ONE MORE TIME”反光镜乐队2018全国巡演" id="home_ygzls_paihang_002">“再·见 ONE MORE TIME”反光镜乐队2018全国巡演</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">杭州</strong>
                                    <div class="works">
                                        <span class="top">3</span>
                                        <p><a href="https://piao.damai.cn/141343.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="汪峰2018“岁月”巡回演唱会" id="home_ygzls_paihang_003">汪峰2018“岁月”巡回演唱会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">北京</strong>
                                    <div class="works">
                                        <span >4</span>
                                        <p><a href="//mg.damai.cn/xplatform/main/view.do" target="_blank" title="伍佰&China Blue 摇滚全经典" id="home_ygzls_paihang_004">伍佰&China Blue 摇滚全经典</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">上海</strong>
                                    <div class="works">
                                        <span >5</span>
                                        <p><a href="https://piao.damai.cn/142056.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="MIYAVI“DAY2” 2018世界巡回演唱会" id="home_ygzls_paihang_005">MIYAVI“DAY2” 2018世界巡回演唱会</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">杭州</strong>
                                    <div class="works">
                                        <span >6</span>
                                        <p><a href="https://piao.damai.cn/142046.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="MAO超高人气日系爵士嘻哈re:plus 2018中国巡演" id="home_ygzls_paihang_006">MAO超高人气日系爵士嘻哈re:plus 2018中国巡演</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">昆明</strong>
                                    <div class="works">
                                        <span >7</span>
                                        <p><a href="https://piao.damai.cn/141985.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="ARCH ENEMY大敌2018巡演" id="home_ygzls_paihang_007">ARCH ENEMY大敌2018巡演</a></p>
                                    </div>
                                </li>
                                <li>
                                    <strong class="txt">昆明</strong>
                                    <div class="works">
                                        <span >8</span>
                                        <p><a href="https://piao.damai.cn/141902.html?spm=a2o6e.search.0.0.19ce4a8f1dBAzw" target="_blank" title="F-PARTY TOP 100 DJs ARMIN VAN BUUREN " id="home_ygzls_paihang_008">F-PARTY TOP 100 DJs ARMIN VAN BUUREN </a></p>
                                    </div>
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--页面主体 end-->
    <!--页面底部 start-->
    <!--页面底部 end-->
    <script type="text/javascript" src="//cp.damai.cn/js/Service51La/SeoFlowStatistics.js?45"></script>
    <script>
        if (typeof JsLoader === 'undefined') { window.JsLoader = { load: function () { }, before: function () { }, complete: function () { }, completeAfter: function () { } }; }
    </script>

    <script>
        //if (typeof JsLoader === 'undefined') { window.JsLoader = { load: function () { }, before: function () { }, complete: function () { }, completeAfter: function () { } }; }
    </script>
    <!--返回顶部 start-->
    <div class="side-sort">

        <div class="side-sort-con">
            <a class="itm sort-i4" href="#drama"><i></i><strong class="sort-name">戏剧<br/>达人</strong></a>
            <a class="itm sort-i9" href="#sport"><i></i><strong class="sort-name">体育<br/>赛事</strong></a>
            <a class="itm sort-i6" href="#music"><i></i><strong class="sort-name">古典<br/>舞蹈</strong></a>
            <a class="itm sort-i7" href="#kid"><i></i><strong class="sort-name">儿童<br/>亲子</strong></a>
            <a class="itm sort-i5" href="#rock"><i></i><strong class="sort-name">摇滚<br/>在路上</strong></a>
            <a class="in-totop" href="#"><i></i><strong class="sort-name">返回<br/>顶部</strong></a>
        </div>
    </div>
    <!--返回顶部 end-->
</div>
<script type="text/javascript" src="//dui.damai.cn/dm_2015/common/dui-min.js"></script>
<script type="text/javascript" src="//dui.damai.cn/dm_2015/common/app-min.js"></script>
<script type="text/javascript" src="//dui.damai.cn/dm_2015/index/js/index-min.js"></script>
<script type="text/javascript" src="//dui.damai.cn/dm_2015/index/js/public-min.js"></script>
<script type="text/javascript">var pageId = 1;</script>
<script type="text/javascript" src="/dm2015/js/localindex.js?5.9.29"></script>
<script type="text/javascript" src="//www.damai.cn/js/headv6.js?5.9.26"></script>
<script type="text/javascript">
    (function(b){var c=b(window);b.fn.lazyload=function(e){var f={threshold:100,failurelimit:10,event:"scroll",effect:"show",container:window};if(e){b.extend(f,e)}var d=this;if("scroll"==f.event){b(f.container).bind("scroll",function(h){var g=0;d.each(function(){if(b.abovethetop(this,f)){}else{if(!b.belowthefold(this,f)){b(this).trigger("appear")}else{if(g++>f.failurelimit){return false}}}});var i=b.grep(d,function(j){return !j.loaded});d=b(i)})}this.each(function(){var g=this;if(undefined!=b(g).attr("original")){g.loaded=false;b(g).one("appear",function(){if(!this.loaded){b("<img />").bind("load",function(){b(g).hide().attr("src",b(g).attr("original"))[f.effect](f.effectspeed);g.loaded=true}).attr("src",b(g).attr("original"))}})}});b(f.container).trigger(f.event);return this};function a(){}b.belowthefold=function(e,d){var f;if(d.container===undefined||d.container===window){f=(window.innerHeight?window.innerHeight:b(window).height())+b(window).scrollTop()}else{f=b(d.container).offset().top+b(d.container).height()}return f<=b(e).offset().top-d.threshold};b.abovethetop=function(e,d){var f;if(d.container===undefined||d.container===window){f=b(window).scrollTop()}else{f=b(d.container).offset().top}return f>=b(e).offset().top+d.threshold+b(e).height()};b.extend(b.expr[":"],{"below-the-fold":"jQuery.belowthefold(a, {threshold : 0, container: window})","above-the-fold":"!jQuery.belowthefold(a, {threshold : 0, container: window})"})})(jQuery);
    $(function () { $("img").lazyload({ effect: "fadeIn", failurelimit: 0, threshold: 0 }); });
</script>
<iframe src="//serv3.vizury.com/analyze/analyze.php?account_id=VIZVRM1168&param=e100&section=1&level=1" crolling="no" width="1" height="1" marginheight="0" marginwidth="0" frameborder="0"></iframe>
<script type="text/javascript" src="//ad.damai.cn/js/o.js?45"></script>
<script type="text/javascript">DAMAI_CLB_fillSlotAsync('34', 'PAGE_AD_1');</script>
<!-- start Dplus --><script type="text/javascript">!function(a,b){if(!b.__SV){var c,d,e,f;window.dplus=b,b._i=[],b.init=function(a,c,d){function g(a,b){var c=b.split(".");2==c.length&&(a=a[c[0]],b=c[1]),a[b]=function(){a.push([b].concat(Array.prototype.slice.call(arguments,0)))}}var h=b;for("undefined"!=typeof d?h=b[d]=[]:d="dplus",h.people=h.people||[],h.toString=function(a){var b="dplus";return"dplus"!==d&&(b+="."+d),a||(b+=" (stub)"),b},h.people.toString=function(){return h.toString(1)+".people (stub)"},e="disable track track_links track_forms register unregister get_property identify clear set_config get_config get_distinct_id track_pageview register_once track_with_tag time_event people.set people.unset people.delete_user".split(" "),f=0;f<e.length;f++)g(h,e[f]);b._i.push([a,c,d])},b.__SV=1.1,c=a.createElement("script"),c.type="text/javascript",c.charset="utf-8",c.async=!0,c.src="//w.cnzz.com/dplus.php?token=7415364c9dab5n09ff68",d=a.getElementsByTagName("script")[0],d.parentNode.insertBefore(c,d)}}(document,window.dplus||[]),dplus.init("7415364c9dab5n09ff68");</script><!-- end Dplus -->
<!-- start Dplus Define -->
<script type="text/javascript">!function(a,b){var c,d;window.__dplusDefineCacheQueue=[],b.define=function(){window.__dplusDefineCacheQueue.push(Array.prototype.slice.call(arguments))},c=a.createElement("script"),c.type="text/javascript",c.charset="utf-8",c.async=!0,c.src="//w.cnzz.com/dplus.define.php",d=a.getElementsByTagName("script")[0],d.parentNode.insertBefore(c,d)}(document,window.dplus);</script>
<!-- end Dplus Define -->

<script type="text/javascript">
    (function() {
        dplus.define('page', function(page){
            page.init("7415364c9dab5n09ff68", {
                'page_duration': true, //默认不跟踪页面停留时间
                'clean_url': true //默认是clean url
            });
            page.setType('home');//设置页面类型
            page.setTitle('大麦网全国首页');//设置页面标题
            page.view();
        });
    })();
    $(document)
        .on("click", "#topadpic li a", function() {
            var $this = $(this);
            dplus.track('adclick',{
                '$tti':'home',
                '$tul':'https://www.damai.cn/',
                '$tna':'Topadpic头部广告轮播',
                '$tdx':$this.attr("id").split("_")[2],
                'tag':$this.attr("id"),
                '$na':$this.attr("title")
            });//
        })
        .on("click", "#index_recom_a li a", function() {
            var $this = $(this);
            dplus.track('recclick', {
                '$tti':'home',
                '$tul':'https://www.damai.cn/',
                '$tna':'hotlike猜你喜欢',
                '$tdx':$this.attr("data-idx"),
                'tag':$this.attr("id"),
                '$na':$this.attr("title")
            });//
        });
</script>
<script type="text/javascript">
    $(document).ready(function() {
        // var time = 500;
        var mouseenter = true;
        var mouseleave = true;
        if (screen.width <=1280) {
            $('.side-sort').css({
                'marginLeft':'580px',
                'top':'50%',
                'marginTop': '-150px'

            });
            $('.side-sort .side-sort-con').css('display' , 'none');

            $(document).on('mouseenter.aaa', '.side-sort', function () {
                if(!mouseenter)return;
                mouseenter = false;
                console.log(mouseenter);
                $('.side-sort .side-sort-con').slideDown(500,function(){
                    mouseenter = true;
                });
            });

            $(document).on('mouseleave.aaa', '.side-sort', function () {
                if(!mouseleave)return;
                mouseleave = false;
                $('.side-sort .side-sort-con').slideUp(500,function(){
                    mouseleave = true;
                });
            });

        }else{
            $('.side-sort').css({
                'marginLeft' :'610px',
                'bottom' :'100px'
            });
            $('.side-sort .side-sort-con').css('display' , 'block');
        }
    });
</script>
<script type="text/javascript" src="//dui.dmcdn.cn/dm_2015/index/js/mailang.js"></script>
<script type="text/javascript">
    jQuery("#searchText").attr("data-keyword", jQuery("#searchText").val());
</script>


<script type="text/javascript">
    var type = '${type}';

    if(type == "userUnchecked"){
        alert("请在24小时内到邮箱点击确认！");
    }else if (type == "venueUnchecked"){
        alert("请记住你的唯一标示码${code}，耐心等候经理审批！");
    }

    var venueInfo = '${venueInfo}';

    if(venueInfo == "false"){
        alert("商家尚未经过审批，请耐心等待！");
    }

    var userInfo = '${userInfo}';

    if(userInfo == "false"){
        alert("用户尚未经过验证，请进行邮箱验证！");
    }

</script>

</body>
</html>





