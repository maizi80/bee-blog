$(".btn-submit").on("click", function () {
    $(".btn-submit").attr("disabled", true);
    $.ajax({
        type: $('#post-form').attr('method'),
        url: $('#post-form').attr('action'),
        data: $('#post-form').serialize(),
        success: function (data){
            if (data.Code === 200){
                showTips('success')
                interval('success')
            } else {
                showTips('error')
                interval('error')
            }
            $(".alert").html(data.Msg)

        },
        error: function (res){
            $(".alert").html(res.statusText)
            showTips('error')
            interval('error')
        }
    })
    return false
})

$(".btn-profile").on("click", function () {
    let formData = new FormData();
    let arr = $('#post-form').serializeArray()
    for (let i=0; i<arr.length; i++){
        formData.append(arr[i].name, arr[i].value)
    }
    formData.append('avatar',$('#picID')[0].files[0]);

    $.ajax({
        type: $('#post-form').attr('method'),
        url: $('#post-form').attr('action'),
        processData: false,
        data: formData,
        contentType: false,
        cache: false,
        success: function (data){
            if (data.Code === 200){
                showTips('success')
                refreshInterval('success')
            } else {
                showTips('error')
                refreshInterval('error')
            }
            $(".alert").html(data.Msg)

        },
        error: function (res){
            $(".alert").html(res.statusText)
            showTips('error')
            refreshInterval('error')
        }
    })
    return false
})

$(".btn-article").on("click", function () {
    let formData = new FormData();
    let arr = $('#post-form').serializeArray()
    for (let i=0; i<arr.length; i++){
        formData.append(arr[i].name, arr[i].value)
    }
    formData.append('image',$('#picID')[0].files[0]);
    $.ajax({
        type: $('#post-form').attr('method'),
        url: $('#post-form').attr('action'),
        processData: false,
        data: formData,
        contentType: false,
        cache: false,
        success: function (data){
            if (data.Code === 200){
                showTips('success')
                interval('success')
            } else {
                showTips('error')
                interval('error')
            }
            $(".alert").html(data.Msg)

        },
        error: function (res){
            $(".alert").html(res.statusText)
            showTips('error')
            interval('error')
        }
    })
    return false
})


function delRow(obj) {
    $(obj).attr("disabled", true).css("pointer-events","none");
    if (window.confirm("删除改数据后将不能恢复，是否继续？") === true){
        console.log($(obj).attr("url"))
        $.ajax({
            type: 'delete',
            url: $(obj).attr("url"),
            success: function (data){
                if (data.Code === 200){
                    showTips('success')
                    refreshInterval('success')
                } else {
                    showTips('error')
                    refreshInterval('error', obj)
                }
                $(".alert").html(data.Msg)

            },
            error: function (res){
                $(".alert").html(res.statusText)
                showTips('error')
                refreshInterval('error', obj)
            }
        })
    }
    return false
}

function modify(obj) {
    $(obj).attr("disabled", true).css("pointer-events","none");
    if (window.confirm("修改该数据状态，是否继续？") === true){
        console.log($(obj).attr("url"))
        $.ajax({
            type: 'put',
            url: $(obj).attr("url"),
            success: function (data){
                if (data.Code === 200){
                    showTips('success')
                    refreshInterval('success')
                } else {
                    showTips('error')
                    refreshInterval('error', obj)
                }
                $(".alert").html(data.Msg)

            },
            error: function (res){
                $(".alert").html(res.statusText)
                showTips('error')
                refreshInterval('error', obj)
            }
        })
    }
    return false
}

function showTips(type) {
    $(".alert").css("display", "block")
    if (type === 'success'){
        $(".alert").addClass("alert-success")
        $(".alert").removeClass("alert-danger")
    }
}

function interval(type) {
    let sec = 3
    if (type === 'success') sec = 1
    var interval = setInterval(function(){
        if (type === 'success') {
            window.history.go(-1);
        }
        $(".alert").css("display", "none")
        $(".btn-submit").attr("disabled", false);
        clearInterval(interval);
    }, sec*1000);
}

function refreshInterval(type, obj) {
    let sec = 3
    if (type === 'success') sec = 1
    var interval = setInterval(function(){
        if (type === 'success') {
            location.reload()
        }
        $(".alert").css("display", "none")
        $(obj).attr("disabled", false).css("pointer-events","none");
        clearInterval(interval);
    }, sec*1000);
}