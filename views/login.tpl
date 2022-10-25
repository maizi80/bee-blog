<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.88.1">
    <title>登录-Bee-Blog</title>
    <!-- Bootstrap core CSS -->
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .bd-placeholder-img {
            font-size: 1.125rem;
            text-anchor: middle;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        @media (min-width: 768px) {
            .bd-placeholder-img-lg {
                font-size: 3.5rem;
            }
        }
    </style>
    <!-- Custom styles for this template -->
    <link href="/static/css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
<div class="alert alert-danger" role="alert" style="position: absolute; left: 46%; top: 25%; display:none">登录成功</div>
<form class="form-signin" action="/login" method="post" id="login">
    <h1 class="h3 mb-3 font-weight-normal">请登录</h1>
    <label for="inputUsername" class="sr-only">用户名</label>
    <input type="text" name="username" id="inputUsername" class="form-control" placeholder="用户名" required autofocus>
    <label for="inputPassword" class="sr-only">密码</label>
    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="密码" required>
    <div class="checkbox mb-3">
        <label>
            <input type="checkbox" value="remember-me"> 记住我
        </label>
    </div>
    <button class="btn btn-lg btn-primary btn-block" type="submit">登录</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2022-2022</p>
</form>
<script src="/static/js/jquery.min.js" crossorigin="anonymous"></script>
<script>
    $(".btn").on("click", function () {
        $.ajax({
            type: "POST",
            url: $('#login').attr('action'),
            data: $('#login').serialize(),
            success: function (data){
                if (data.Code === 200){
                    showTips('success')
                } else {
                    showTips('error')
                }
                $(".alert").html(data.Msg)

                console.log(data)
            },
            error: function (res){
                $(".alert").html(res.statusText)
                showTips('error')
            }
        })
        return false
    })

    function showTips(type) {
        $(".alert").css("display", "block")
        if (type === 'success'){
            $(".alert").addClass("alert-success")
            $(".alert").removeClass("alert-danger")
            interval('success')
        } else {
            interval('error')
        }

    }

    function interval(type) {
        let sec = 3
        if (type === 'success') sec = 1
        var interval = setInterval(function(){
            if (type === 'success') {
                window.location.href = "/admin";
            }
            $(".alert").css("display", "none")
            clearInterval(interval);
        }, sec*1000);
    }
</script>
</body>
</html>
