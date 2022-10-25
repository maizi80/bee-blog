<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title itemprop="name">{{.Title}} - Bee-blog</title>
    <meta name="description" content="学习、记录、成长、生活">
    <meta name="keywords" content="学习、记录、成长、生活">
    <link rel="shortcut icon" href="/static/images/favicon.ico" type="image/x-icon">
    <link rel="stylesheet" href="/static/css/style.css" type="text/css">
    <link rel="stylesheet" href="/static/css/OwO.css" type="text/css">
    <link rel="stylesheet" href="/static/css/dark.css" type="text/css">
    <link rel="stylesheet" href="/static/css/blog.css" type="text/css">
    <link rel="stylesheet" href="/static/css/default.min.css">
    {{.HtmlHead}}
</head>
<body class="home blog hfeed">
<!-- 加载动画 -->
<section id="main-container">
    <div class="openNav">
        <div class="iconflat">
            <div class="icon"></div>
        </div>
        <!-- logo则显示 -->
        <div class="site-branding">
            <div class="site-title"><a href="/"><img src="/static/images/logo.png"></a></div>
        </div>
        <!-- logo 结束 -->
    </div>
    <!-- 主页面显示 -->
    <div id="page" class="site wrapper">
        <header class="site-header" role="banner">
            <div class="site-top">
                <!-- logo则显示 -->
                <div class="site-branding">
                    <div class="site-title"><a href="/"><img src="/static/images/logo.png"></a></div>
                </div>
                <!-- logo 结束 -->
                <div id="login-reg">
                    <!-- 个人头像 -->
                    <!-- 如果用户未登录 -->
                    <div class="ex-login">
                        <a href="/admin" target="_top">
                            <i class="iconfont"></i>
                        </a>
                    </div>
                </div>
                <!-- 搜索 -->
                <div class="searchbox">
                    <i class="iconfont js-toggle-search iconsearch"></i>
                </div>
                <!-- 分类 -->
                <div class="lower">
                    <nav>
                        <ul class="menu">
                            <li class="current-menu-item"><a href="/">首页</a></li>
                            <li><a href="#">分类</a>
                                <ul class="sub-menu">
                                    {{range $k, $category := .categorys }}
                                    <li><a href="/list/category/{{$category.Id}}">{{$category.Name}}</a></li>
                                    {{end}}
                                </ul>
                            </li>
                            <li><a href="#">更多</a>
                                <ul class="sub-menu">
                                    <li><a href="/message">留言</a></li>
                                    <li><a href="/list/tag">标签云</a></li>
                                    <li><a href="/archive">文章归档</a></li>
                                    <li><a href="/about">关于博主</a></li>
                                </ul>
                            </li>
                        </ul>
                        <!-- 隐藏后菜单图标 -->
                        <i class="iconfont show-nav"></i>
                    </nav>
                </div>
            </div>
            <!-- 到顶部按钮 -->
            <div class="cd-top-box">
                <a href="/#" class="cd-top"></a>
            </div>
        </header>
    </div>
</section>

{{.LayoutContent}}

{{.Comment}}
<!-- 页底信息 -->
<footer id="colophon" class="site-footer" role="contentinfo">
    <!-- 请尊重作者！至少保留主题名称及其超链接，谢谢！ -->
    <div id="footer" class="site-info">
        Copyright © 2022 by <a href="https://zhebk.cn/" target="_blank" rel="nofollow">纸盒博客</a> - All rights reserved<span class="sep"> | </span>Theme : <a href="#" target="_blank" rel="nofollow">Akina For Typecho</a>
        <div class="footertext">
            <p><a href="https://beian.miit.gov.cn/" target="_blank" rel="nofollow noopener noreferrer">ICP备 xxxx号-1</a></p>

            <a target="_blank" href="#" style="display:inline-block;" rel="nofollow noopener noreferrer">
                <img src="/static/images/gongan.png" style="float: left;height: 17px;">
                <p style="float:left;height:20px;line-height:20px;margin: 0px 0px 0px 5px;">公网安备 xxx 号</p>
            </a>
        </div>
    </div>
</footer>

<!-- 搜索 -->
<form class="js-search search-form search-form--modal" method="post" action="/search" role="search">
    <div class="search-form__inner">
        <div class="search-div">
            <h1 class="micromb-search">你想搜索什么...</h1>
            <i class="iconfont"></i>
            <input class="submit" type="search" name="s" placeholder="Search...">
        </div>
    </div>
</form>
<!-- 搜索结束 -->
<script type="text/javascript">
    var app = {"pjax":""};
    if (!!window.ActiveXObject || "ActiveXObject" in window) { //is IE?
        alert('请抛弃万恶的IE系列浏览器吧。');
    }
    var xl = 0;
    var transparent = 1;
</script>

<script type="text/javascript" src="/static/js/jquery.min.js."></script>
<script type="text/javascript" src="/static/js/jquery.preloader.js."></script>
<script type="text/javascript" src="/static/js/jquery.pjax.js."></script>
<script type="text/javascript" src="/static/js/baguetteBox.min.js."></script>
<script type="text/javascript" src="/static/js/global.js."></script>

{{.Scripts}}
</body>
</html>