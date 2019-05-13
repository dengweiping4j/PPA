var url = "/SSAM/users";
var method;

function searchUser() {
    $("#dg").datagrid('load', {
        "userName": $("#s_userName").val()
    });
}

function deleteUser() {
    var selectedRows = $("#dg").datagrid('getSelections');
    if (selectedRows.length == 0) {
        $.messager.alert("系统提示", "请选择要删除的数据！");
        return;
    }
    var strPkids = [];
    for (var i = 0; i < selectedRows.length; i++) {
        strPkids.push(selectedRows[i].pkid);
    }
    var pkids = strPkids.join(",");
    $.messager.confirm("系统提示", "您确认要删除这<font color=red>"
        + selectedRows.length + "</font>条数据吗？", function (r) {
        if (r) {
            $.ajax({
                type: "DELETE",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/users/delete/" + pkids,//url
                data: {},
                success: function (result) {
                    if (result.resultCode == 200) {
                        $.messager.alert(
                            "系统提示",
                            "数据已成功删除！");
                        $("#dg").datagrid(
                            "reload");
                    }
                    else {
                        $.messager.alert(
                            "系统提示",
                            "数据删除失败！");
                    }

                    ;
                },
                error: function () {
                    $.messager.alert("ERROR！");
                }
            });
        }
    });

}

function openUserAddDialog() {
    $("#addDlg").dialog("open").dialog("setTitle", "添加用户信息");
    method = "POST";
}

function openUserModifyDialog() {
    var selectedRows = $("#dg").datagrid('getSelections');
    if (selectedRows.length != 1) {
        $.messager.alert("系统提示", "请选择一条要编辑的数据！");
        return;
    }
    var row = selectedRows[0];
    $("#updateDlg").dialog("open").dialog("setTitle", "编辑用户信息");
    $('#updateForm').form('load', row);
    $("input[name=password]").val("******");
    method = "POST";
}

function addSave() {
    var userName = $("#add_userName").val();
    var password = $("#add_password").val();
    var userId = $("#add_userId").val();
    var phone = $("#add_phone").val();
    var data = {
        "userId": userId,
        "password": password,
        "userName": userName,
        "phone": phone
    };
    if ($('#addForm').form('validate')) {
        $.ajax({
            type: method,//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url + "/addSave",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                console.log(result);//打印服务端返回的数据
                if (result.resultCode == 200) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#addDlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }
                else {
                    $.messager.alert("系统提示", "操作失败");
                    $("#addDlg").dialog("close");
                    resetValue();
                }
                ;
            },
            error: function () {
                $.messager.alert("系统提示", "操作失败");
            }
        });
    }
}

function updateSave() {
    var pkid = $("#pkid").val();
    var userName = $("#userName").val();
    var phone = $("#phone").val();
    var data = {
        "pkid": pkid,
        "userName": userName,
        "phone": phone
    };
    console.log(data);
    if ($('#updateForm').form('validate')) {
        $.ajax({
            type: method,//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: url + "/updateSave",//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                console.log(result);//打印服务端返回的数据
                if (result.resultCode == 200) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#updateDlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }
                else {
                    $.messager.alert("系统提示", "操作失败");
                    $("#dlg").dialog("close");
                    resetValue();
                }
                ;
            },
            error: function () {
                $.messager.alert("系统提示", "操作失败");
            }
        });
    }
}

function resetValue() {
    $("#user_name").val("");
    $("#password").val("");
    $("#user_id").val("");
    $("#phone").val("");
}

function closeUserDialog() {
    $("#addDlg").dialog("close");
    $("#updateDlg").dialog("close");
    resetValue();
}