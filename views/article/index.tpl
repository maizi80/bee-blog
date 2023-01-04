<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    <a class="btn btn-primary btn-add" href="/admin/article/add" role="button">添加</a>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>ID</th>
                <th>标题</th>
                <th>简介</th>
                <th>内容</th>
                <th>图片</th>
                <th>分类</th>
                <th>标识</th>
                <th>浏览量</th>
                <th>评论数</th>
                <th>点赞数</th>
                <th>添加时间</th>
                <th>发布时间</th>
                <th>最后更新时间</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            {{range $key,$a := .articles}}
            <tr>
                <td>{{$a.Id}}</td>
                <td>{{$a.Title}}</td>
                <td>{{substr $a.Introduction 0 30}}</td>
                <td>{{substr $a.Content 0 30}}</td>
                <td><img src="{{$a.Image}}" class="img-thumbnail" style="width:100px"></td>
                <td>{{$a.Category.Name}}</td>
                <td>{{$a.Sort}}</td>
                <td>{{$a.ViewCount}}</td>
                <td>{{$a.CommentCount}}</td>
                <td>{{$a.LikeCount}}</td>
                <td>{{date $a.CreatedAt "Y-m-d H:i:s"}}</td>
                <td>{{date $a.PublishedAt "Y-m-d H:i:s"}}</td>
                <td>{{date $a.UpdatedAt "Y-m-d H:i:s"}}</td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        {{if compare $a.Status 0}}
                        <a role="button" class="btn btn-success btn-min" onclick="modify(this)" url="/admin/{{$a.Id}}/status/1" title="发布文章">发布</a>
                        <a role="button" class="btn btn-warning btn-min disabled" href="/admin/article/{{$a.Id}}" title="置顶文章">置顶</a>
                        <a role="button" class="btn btn-info btn-min disabled" href="/admin/article/{{$a.Id}}" title="推荐文章">推荐</a>
                        {{else}}
                        <a role="button" class="btn btn-outline-success btn-min" onclick="modify(this)" url="/admin/article/{{$a.Id}}/status/0" title="取消发布文章">发布</a>
                            {{if compare $a.IsTop 0}}
                            <a role="button" class="btn btn-warning btn-min" onclick="modify(this)" url="/admin/article/{{$a.Id}}/top/1" title="置顶文章">置顶</a>
                            {{else}}
                            <a role="button" class="btn btn-outline-warning btn-min" onclick="modify(this)" url="/admin/article/{{$a.Id}}/top/0" title="取消置顶文章">置顶</a>
                            {{end}}

                            {{if compare $a.IsRecommend 0}}
                            <a role="button" class="btn btn-info btn-min" onclick="modify(this)" url="/admin/article/{{$a.Id}}/recommend/1" title="推荐文章">推荐</a>
                            {{else}}
                            <a role="button" class="btn btn-outline-info btn-min" onclick="modify(this)" url="/admin/article/{{$a.Id}}/recommend/0" title="取消推荐文章">推荐</a>
                            {{end}}
                        {{end}}

                        <a role="button" class="btn btn-primary btn-min" href="/admin/article/{{$a.Id}}" >编辑</a>
                        <a role="button" class="btn btn-danger btn-min" onclick="delRow(this)" url="/admin/article/{{$a.Id}}" >删除</a>
                    </div>
                </td>
            </tr>
            {{end}}
            </tbody>
        </table>
        {{if gt .paginator.PageNums 1}}
        <nav aria-label="Page navigation example">
            <ul class="pagination">
                {{if .paginator.HasPrev}}
                <li class="page-item"><a class="page-link" href="{{.paginator.PageLinkFirst}}">First</a></li>
                <li class="page-item"><a class="page-link" href="{{.paginator.PageLinkPrev}}">&lt;</a></li>
                {{else}}
                <li class="page-item disabled"><a class="page-link">First</a></li>
                <li class="page-item disabled"><a class="page-link">&lt;</a></li>
                {{end}}
                {{range $index, $page := .paginator.Pages}}
                    {{if $.paginator.IsActive .}}
                    <li class="page-item active" aria-current="page">
                        <a class="page-link" href="{{$.paginator.PageLink $page}}">{{$page}}</a>
                    </li>
                    {{else}}
                    <li class="page-item"><a class="page-link" href="{{$.paginator.PageLink $page}}">{{$page}}</a></li>
                    {{end}}
                {{end}}
                {{if .paginator.HasNext}}
                <li class="page-item"><a class="page-link" href="{{.paginator.PageLinkNext}}">&gt;</a></li>
                <li class="page-item"><a class="page-link" href="{{.paginator.PageLinkLast}}">Last</a></li>
                {{else}}
                <li class="page-item disabled"><a class="page-link">&gt;</a></li>
                <li class="page-item disabled"><a class="page-link">Last</a></li>
                {{end}}
            </ul>
        </nav>
        {{end}}
    </div>
</main>