<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">

    <a class="btn btn-primary btn-add" href="/admin/category/add" role="button">添加</a>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead>
            <tr>
                <th>ID</th>
                <th>别名</th>
                <th>名字</th>
                <th>排序</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody>
            {{range $key,$category := .categorys}}
            <tr>
                <td>{{$category.Id}}</td>
                <td>{{$category.Alias}}</td>
                <td>{{$category.Name}}</td>
                <td>{{$category.Sort}}</td>
                <td>
                    <div class="btn-group" role="group" aria-label="Basic example">
                        <a role="button" class="btn btn-primary btn-min" href="/admin/category/{{$category.Id}}" >编辑</a>
                        <a role="button" class="btn btn-danger btn-min" onclick="delRow(this)" url="/admin/category/{{$category.Id}}" >删除</a>
                    </div>
                </td>
            </tr>
            {{end}}
            </tbody>
        </table>
    </div>
</main>