<div id="content" class="site-content">
    <article class="hentry">
        <div id="archives-temp">
            <h2>文章归档</h2>
            <div id="archives-content">
                {{range $month,$archive := .archives}}
                <div class="archive-title">
                    <span class="ar-time"><i class="iconfont"></i></span>
                    <h3>{{$month}}</h3>
                    <div class="archives archives-4" id="monlist" style="">
                        {{range $k,$a := $archive}}
                        <span class="ar-circle"></span>
                        <div class="arrow-left-ar"></div>
                        <div class="brick">
                            <a href='{{urlfor "ArticleController.Get" ":id" $a.Id}}'><span class="time"><i class="iconfont"></i>{{$a.Date}}</span>{{$a.Title}}</a>
                        </div>
                        {{end}}
                    </div>
                </div>
                {{end}}
            </div>
        </div>
    </article>
</div>