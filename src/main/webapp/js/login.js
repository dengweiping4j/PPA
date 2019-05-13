function login() {
    var userId = $("#userId").val();
    var password = $("#password").val();
    if (userId == null || userId == "") {
        alert("用户名不能为空！");
        return;
    }
    if (password == null || password == "") {
        alert("密码不能为空！");
        return;
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: "users/cookie",
        data: $('#adminlogin').serialize(),
        success: function (result) {
            if (result.resultCode == 200) {
                setCookie("userName", result.data.currentUser.userName);
                window.location.href = "main.jsp";
            } else {
                $.messager.alert("提示信息", result.message, "warning");
            }

        },
        error: function () {
            $.messager.alert("提示信息", "异常！", "error");
        }
    });

}