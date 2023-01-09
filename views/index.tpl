
<!-- 判断是否搜索 -->
<div class="blank"></div>
<div class="headertop">
	<!-- 首页大图 -->
	<div id="centerbg" style="background-image: url(/static/images/headerbg.jpg);">
		<!-- 左右倾斜 -->
		<div class="slant-left"></div>
		<div class="slant-right"></div>
		<!-- 博主信息 -->
		<div class="focusinfo">
			<!-- 头像 -->
			<div class="header-tou">
				<a href="/"><img src="{{index .p.avatar}}"></a>
			</div>
			<!-- 简介 -->
			<div class="header-info">
				<p>{{index .p "motto_e"}}</p>
			</div>
			<!-- 社交信息 -->
			<ul class="top-social">
				<li class="qq">
					<a href="#"><img src="/static/images/qq.png"></a>
					<div class="qqInner">{{index .p.qq}}</div>
				</li>
				<li><a href="{{index .p.github}}" target="_blank" rel="nofollow noopener noreferrer" class="social-github"><img src="/static/images/github.png"></a></li>
			</ul>
		</div>
	</div>
	<!-- 首页大图结束 -->
</div>
<div class=""></div>
<div id="content" class="site-content">
	<!-- 顶部公告内容 -->
	<div class="notice">
		<i class="iconfont"></i>
		<div class="notice-content">{{index .p.motto}}</div>
	</div>
	<!-- 聚焦内容 -->
	<div class="top-feature">
		<h1 class="fes-title">聚焦</h1>
		<ul class="feature-content">
			{{range $k,$r := .recomends}}
			<li class="feature-{{$k}}"><a href='{{urlfor "HomeController.Article" ":id" $r.Id}}'><div class="feature-title"><span class="foverlay">{{$r.Title}}</span></div><img src="{{$r.Image}}"></a></li>
			{{end}}

		</ul>
	</div>
	<!-- 主页内容 -->
	<div id="primary" class="content-area">
		<main id="main" class="site-main indexMain" role="main">
			<h1 class="main-title">近况</h1>
			<!-- 结束搜索判断 -->
			<!-- 开始文章循环输出 -->
			{{range $key,$article := .articles}}
			<article class="post post-list">
				<!-- 判断文章输出样式 -->
				<div class="post-entry">
					<div class="feature">
						<a href='{{urlfor "HomeController.Article" ":id" $article.Id}}'><div class="overlay"><i class="iconfont"></i></div>
							<img src="{{$article.Image}}">
						</a>
					</div>
					<h1 class="entry-title"><a href='{{urlfor "HomeController.Article" ":id" $article.Id}}'>{{if compare $article.IsTop 1}}<span style="color:#ff6d6d;font-weight:600">[置顶] </span>  {{end}}{{$article.Title}}</a></h1>
					<div class="p-time">
						<i class="iconfont"></i> {{date $article.PublishedAt "Y-m-d"}}<i class="iconfont hotpost" style="margin-left: 5px;"></i>
					</div>
					<a href='{{urlfor "HomeController.Article" ":id" $article.Id}}'><p>{{substr $article.Introduction 0 80}}...</p></a>
					<!-- 文章下碎碎念 -->
					<footer class="entry-footer">
						<div class="post-more">
							<a href='{{urlfor "HomeController.Article" ":id" $article.Id}}'><i class="iconfont"></i></a>
						</div>
						<div class="info-meta">
							<div class="comnum">
								<span><i class="iconfont"></i><a href='{{urlfor "HomeController.Article" ":id" $article.Id}}'>{{$article.CommentCount}}条评论</a></span>
							</div>
							<div class="views">
								<span><i class="iconfont"></i>{{$article.ViewCount}} 热度</span>
							</div>
						</div>
					</footer>
				</div>
				<hr>
			</article>
			{{end}}
			<!-- 结束文章循环输出 -->
		</main>
		<input type="hidden" id="page_number" value="{{.co}}">
		<div id="pagination"><a class="next" title="" href="/article/home/page/2">加载更多</a></div>
	</div>
</div>
<!-- 结束主页内容 -->

