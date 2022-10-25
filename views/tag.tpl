<div id="content" class="site-content">
    <div id="primary" class="content-area">
        <main id="main" class="site-main" role="main" style="margin-bottom:50px;">
            <article class="hentry">
                <header class="entry-header">
                    <h1 class="entry-title">标签云</h1>
                </header>
                <div class="entry-content">
                    <p>这里就是全部的标签了。</p>	                <!--标签云输出-->
                    <ul class="tags-list">
                        {{range $k,$t := .tag}}
                        <li><a href='{{urlfor "HomeController.TagList" ":tid" $t.Id}}' rel="tag" class="size-5" title="{{$t.Name}}">{{$t.Name}}</a></li>
                        {{end}}
                    </ul></div>
            </article>
        </main>
    </div>
</div>