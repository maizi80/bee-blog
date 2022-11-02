<main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
    <form class="fp-4" id="post-form" method="post" action="/admin/tag">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">别名</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="alias">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">名字</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="name">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-1 col-form-label">排序</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="sort" value="0">
            </div>
        </div>

        <div class="form-group row">
            <div class="col-sm-4">
                <button type="submit" class="btn btn-primary btn-submit">提交</button>
            </div>
        </div>
    </form>
</main>