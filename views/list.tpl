
<div id="content" class="site-content">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main">
            <!-- 判断搜索是否有结果-是 -->
            <header class="page-header">
                <h1 class="page-title">搜索结果: <span>{{.list.Name}}的文章</span></h1>
                <span>找到{{.count}}篇</span>
            </header>
            <!-- 开始文章循环输出 -->
            {{range $key,$a := .articles}}
            <article class="post post-list">
                <!-- 判断文章输出样式 -->
                <div class="post-entry">
                    <div class="feature">
                        <a href='{{urlfor "HomeController.Article" ":id" $a.Id}}'><div class="overlay"><i class="iconfont"></i></div>
                            <img src="{{$a.Image}}">
                        </a>
                    </div>
                    <h1 class="entry-title"><a href='{{urlfor "HomeController.Article" ":id" $a.Id}}'>{{if compare $a.IsTop 1}}<span style="color:#ff6d6d;font-weight:600">[置顶] </span>  {{end}}{{$a.Title}}</a></h1>
                    <div class="p-time">
                        <i class="iconfont"></i> {{date $a.PublishedAt "Y-m-d"}}
                    </div>
                    <a href='{{urlfor "HomeController.Article" ":id" $a.Id}}'><p>{{substr $a.Introduction 0 80}}...</p></a>
                    <!-- 文章下碎碎念 -->
                    <footer class="entry-footer">
                        <div class="post-more">
                            <a href='{{urlfor "HomeController.Article" ":id" $a.Id}}'><i class="iconfont"></i></a>
                        </div>
                        <div class="info-meta">
                            <div class="comnum">
                                <span><i class="iconfont"></i><a href='{{urlfor "HomeController.Article" ":id" $a.Id}}'>{{$a.CommentCount}}条评论</a></span>
                            </div>
                            <div class="views">
                                <span><i class="iconfont"></i>{{$a.ViewCount}} 热度</span>
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
        <div id="pagination"><a class="next" title="" href="/article/{{.type}}/page/{{.list.Id}}/{{.p}}">加载更多</a></div>
    </div>
</div>