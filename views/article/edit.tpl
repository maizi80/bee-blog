
<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    <form class="fp-4" id="post-form" method="put" action="/admin/article/{{.a.Id}}">
        <input type="hidden" name="img" value="{{.a.Image}}">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">标题</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="title" value="{{.a.Title}}">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">图片</label>
            <div class="col-sm-4">
                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="{{.a.Image}}" alt="" />
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                    </div>
                    <div >
                        <span class="btn btn-sm btn-info btn-file" style="cursor: pointer;" >
                            <span class="fileinput-new" style="cursor: pointer;" >选择照片</span>
                            <span class="fileinput-exists" style="cursor: pointer;" >换一张</span>
                            <input type="file" name="image" id="picID" style="cursor: pointer;"  accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                        <a href="javascript:;" class="btn btn-sm btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">分类</label>
            <div class="col-sm-4">
                <select class="custom-select col-sm-6" name="category_id">
                    <option selected disabled value="0">请选择分类</option>
                    {{range $key,$c := .categorys}}
                    <option value="{{$c.Id}}" {{if eq $.a.Category.Id $c.Id }} selected {{end}}>{{$c.Name}}</option>
                    {{end}}
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">标签</label>
            <div class="col-sm-4">

                {{range $k,$t := .tags}}
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="checkbox" value="{{$t.Id}}" name="tag"  {{if call $.contains $.a.Tag $t.Id}} checked {{end}}>
                    <label class="form-check-label">{{$t.Name}}</label>
                </div>
                {{end}}
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">介绍</label>
            <div class="col-sm-6">
                <textarea class="form-control" name="introduction" rows="3">{{.a.Introduction}}</textarea>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">内容</label>
            <div class="col-sm-10">
                <div id="test-editor">
                    <textarea style="display:none;" name="content">{{.a.Content}}</textarea>
                </div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary btn-article">提交</button>
            </div>
        </div>
    </form>
</main>
