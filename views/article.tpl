<!-- 文章部分 -->
<div class="blank"></div>
<div class="headertop"></div>
<style type="text/css">.site-content {padding-top:0px !important}</style>
<!-- 不是加密文章 -->

<div class="pattern-center">
    <div class="pattern-attachment-img" style="background-image: url({{.article.Image}})"></div>
    <header class="pattern-header">
        <h1 class="entry-title">{{.Title}}</h1>
    </header>
</div>
<!-- 透明导航栏后调整间距 -->
<div id="content" class="site-content">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <article class="hentry">
                <!-- 文章头部 -->
                <header class="entry-header">
                    <!-- 标题输出 -->
                    <h1 class="entry-title">{{.Title}}</h1>
                    <hr>
                    <div class="breadcrumbs">
                        <div itemscope="" id="crumbs">最后更新时间：{{date .article.PublishedAt "Y-m-d"}}</div>
                    </div>
                </header>
                <!-- 正文输出 -->
                <div class="entry-content" id="article-content"></div>
                <!-- 文章底部 -->
                <footer class="post-footer">
                    <!-- 阅读次数 -->
                    <div class="post-like">
                        <a href="javascript:;" data-action="ding" data-id="58" class="specsZan ">
                            <i class="iconfont"></i>
                            <span class="count">{{.article.ViewCount}}</span>
                        </a>
                    </div>
                    <!-- 分享按钮 -->
                    <div class="post-share">
                        <ul class="sharehidden">
                            <li><a href="#" onclick="window.open(this.href, &#39;renren-share&#39;, &#39;width=490,height=700&#39;);return false;" class="s-weixin" target="_blank" rel="nofollow noopener noreferrer"><img src="/static/images/wechat.png"></a></li>
                            <li><a href="#" onclick="window.open(this.href, &#39;weibo-share&#39;, &#39;width=730,height=500&#39;);return false;" class="s-qq" target="_blank" rel="nofollow noopener noreferrer"><img src="/static/images/qzone.png"></a></li>
                            <li><a href="#" onclick="window.open(this.href, &#39;weibo-share&#39;, &#39;width=550,height=235&#39;);return false;" class="s-sina" target="_blank" rel="nofollow noopener noreferrer"><img src="/static/images/sina.png"></a></li>
                        </ul>
                        <i class="iconfont show-share"></i>
                    </div>

                    <!-- 文章标签 -->
                    <div class="post-tags">
                        <i class="iconfont"></i>
                        {{range $k,$t := .tag}}
                        <a href='{{urlfor "HomeController.TagList" ":tid" $t.Id}}'>{{$t.Name}}</a>
                        {{end}}
                    </div>
                </footer>
            </article>
            <!-- 版权声明 -->
            <div class="open-message">
                <p>声明：Bee-Blog|版权所有，违者必究|如未注明，均为原创</p>
                <p>转载：转载请注明原文链接 - <a href='{{urlfor "HomeController.Article" ":id" .article.Id}}'>{{.Title}}</a></p>
            </div>
            <!-- 相邻文章 -->
            <section class="post-squares nextprev">
                <div class="post-nepre half previous">
                    <a href='{{urlfor "HomeController.Article" ":id" .pre.Id}}' rel="prev">
                        <div class="background" style="background-image:url({{.pre.Image}});"></div>
                        <span class="label">Previous Post</span>
                        <div class="info"><h3>{{if .pre.Title}}{{.pre.Title}}{{else}}无{{end}}</h3>
                            <hr>
                        </div>
                    </a>
                </div>
                <div class="post-nepre half next">
                    <a href='{{urlfor "HomeController.Article" ":id" .next.Id}}' rel="next">
                        <div class="background" style="background-image:url({{.next.Image}});"></div>
                        <span class="label">Next Post</span>
                        <div class="info"><h3>{{if .next.Title}}{{.next.Title}}{{else}}无{{end}}</h3>
                            <hr>
                        </div>
                    </a>
                </div>
            </section>
            <!-- 判断文章加密结束 -->
            <!-- 个人信息 -->
            <section class="author-profile">
                <div class="info" itemprop="author">
                    <div class="pf-gavtar">
                        <div class="pf-tou">
                            <a><img src="{{index .p.avatar}}"></a>
                        </div>
                    </div>
                    <div class="meta">
                        <span class="title">Author</span>
                        <h3 itemprop="name">
                            <a href="/" itemprop="url" rel="author">{{index .p.nickname}}</a>
                        </h3>
                    </div>
                </div>
                <hr>
                <p><i class="iconfont"></i>{{index .p.motto_e}}</p>
            </section>
        </main>
    </div>
</div>
<script src="/static/js/marked.min.js"></script>
<script src="/static/js/highlight.min.js"></script>
<script type="text/javascript">
    document.getElementById('article-content').innerHTML = marked.parse("{{.article.Content}}");
    hljs.initHighlightingOnLoad();
</script>