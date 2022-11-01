<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    <form class="fp-4" id="post-form" method="post" action="/admin/profile">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">昵称</label>
            <div class="col-sm-4"> <input type="text" class="form-control" name="nickname" value="{{index .m.nickname}}"> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">格言</label>
            <div class="col-sm-4"> <input type="text" class="form-control" name="motto" value="{{index .m.motto}}"> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">英文</label>
            <div class="col-sm-4"> <input type="text" class="form-control" name="motto_e" value="{{index .m.motto_e}}"> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">头像</label>
            <div class="col-sm-4">
                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload">
                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;">
                        <img id='picImg' style="width: 100%;height: auto;max-height: 140px;" src="{{index .m.avatar}}" alt="" />
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
                    </div>
                    <div >
                        <span class="btn btn-sm btn-info btn-file" style="cursor: pointer;" >
                            <span class="fileinput-new" style="cursor: pointer;" >选择照片</span>
                            <span class="fileinput-exists" style="cursor: pointer;" >换一张</span>
                            <input type="file" name="avatar" id="picID" style="cursor: pointer;"  accept="image/gif,image/jpeg,image/x-png"/>
                        </span>
                        <a href="javascript:;" class="btn btn-sm btn-warning fileinput-exists" data-dismiss="fileinput">移除</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">个人介绍</label>
            <div class="col-sm-8"> <textarea class="form-control" rows="5" name="introduction">{{index .m.introduction}}</textarea> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">QQ</label>
            <div class="col-sm-4"> <input type="text" class="form-control" id="qq" name="qq" value="{{index .m.qq}}"> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">GitHub</label>
            <div class="col-sm-4"> <input type="text" class="form-control" name="github" value="{{index .m.github}}"> </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">Email</label>
            <div class="col-sm-4"> <input type="text" class="form-control" name="email" value="{{index .m.email}}"> </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-4"> <button type="submit" class="btn btn-primary btn-profile">提交</button> </div>
        </div>
    </form>
</main>
