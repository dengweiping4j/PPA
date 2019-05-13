var url = "/SSAM/policy";
var method;
var flag;

function search() {
    $("#dg").datagrid('load', {
        "title": $("#s_title").val()
    });
}

function del() {
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
                url: url + "/delete/" + pkids,//url
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

function openAddDialog() {
    resetValue();
    $("#dlg").dialog("open").dialog("setTitle", "添加扶贫政策信息", 'refresh', "");
    method = "POST";
    flag = "add";
}

function save() {
    var pkid = $("#pkid").val();
    var title = $("#title").val();
    var text = $("#text").val();
    var data = {
        "pkid": pkid,
        "title": title,
        "text": text
    };

    if ($('#fm').form('validate')) {
        var urlStr;
        if (flag == "add") {
            urlStr = url + "/addSave";
        } else {
            urlStr = url + "/updateSave";
        }
        $.ajax({
            type: method,//方法类型
            dataType: "json",//服务器返回的数据类型
            url: urlStr,//url
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }
                else {
                    $.messager.alert("系统提示", "操作失败", "error");
                    $("#dlg").dialog("close");
                    resetValue();
                }
            },
            error: function () {
                $.messager.alert("系统提示", "操作失败", "error");
            }
        });

    } else {
        $.messager.alert("系统提示", "您有内容尚未填写", "warning");
    }
}

function openModifyDialog() {
    var selectedRows = $("#dg").datagrid('getSelections');
    if (selectedRows.length != 1) {
        $.messager.alert("系统提示", "请选择一条要编辑的数据！");
        return;
    }
    var row = selectedRows[0];
    $("#dlg").dialog("open").dialog("setTitle", "编辑扶贫政策信息");
    $('#fm').form('load', row);
    method = "POST";
    flag = "update";
}

function openUpdateDialog() {
    var selectedRows = $("#dg").datagrid('getSelections');
    if (selectedRows.length != 1) {
        $.messager.alert("系统提示", "请选择一条要操作的数据！");
        return;
    }
    policyCombobox();//加载扶贫政策下拉框
    var row = selectedRows[0];
    $("#dlg").dialog("open").dialog("setTitle", "匹配扶贫政策");
    $('#selectFm').form('load', row);
    $('#policy').combobox('setValue', row.policypkid);
    method = "POST";
}

function savePolicySelect() {
    var pkid = $("#personpkid").val();
    var policy = $("#policy").combobox("getValue");
    var data = {
        "pkid": pkid,
        "policy": policy
    };

    if ($('#selectFm').form('validate')) {
        $.ajax({
            type: method,//方法类型
            dataType: "json",//服务器返回的数据类型
            url: "/SSAM/person/updateSelect",
            contentType: "application/json; charset=utf-8",
            data: JSON.stringify(data),
            success: function (result) {
                if (result.resultCode == 200) {
                    $.messager.alert("系统提示", "保存成功");
                    $("#dlg").dialog("close");
                    $("#dg").datagrid("reload");
                    resetValue();
                }
                else {
                    $.messager.alert("系统提示", "操作失败", "error");
                    $("#dlg").dialog("close");
                    resetValue();
                }
            },
            error: function () {
                $.messager.alert("系统提示", "操作失败", "error");
            }
        });

    } else {
        $.messager.alert("系统提示", "您有内容尚未填写", "warning");
    }
}

function policyCombobox() {
    //查询扶贫政策列表数据
    $.ajax({
        async: false,
        type: "post",
        url: url + "/getPolicyList",//请求后台数据
        dataType: "json",
        success: function (policyList) {
            $("#policy").combobox({//往下拉框赋值
                prompt: '请选择',
                data: policyList,
                valueField: "value",//value值
                textField: "text",//文本值
                panelHeight: "auto"
            })
        }
    });
}

//清空dialog缓存数据
function resetValue() {
    $('#fm').form('clear');
    $('#selectFm').form('clear');
}

function closeDialog() {
    $("#dlg").dialog("close");
    resetValue();
}