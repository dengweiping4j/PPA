var url = "/SSAM/person";
var method;
var flag;

function search() {
    $("#dg").datagrid('load', {
        "name": $("#s_name").val()
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
    $("#dlg").dialog("open").dialog("setTitle", "添加扶贫对象信息", 'refresh', "");
    $("input[name=sex]").get(0).checked = true;//性别默认选中男
    method = "POST";
    flag = "add";
    //加载下拉框
    var levelData = [
        {'text': '一般收入人口', 'value': 1},
        {'text': '低收入人口', 'value': 2},
        {'text': '相对贫困人口', 'value': 3},
        {'text': '绝对贫困人口', 'value': 4},
    ];
    $('#level').combobox({
        prompt: '请选择',
        textField: 'text',
        valueField: 'value',
        panelHeight: 'auto',
        data: levelData
    });
}

function save() {
    var name = $("#name").val();
    var sex = $("#sex").val();
    var age = $("#age").val();
    var address = $("#address").val();
    var phone = $("#phone").val();
    var level = $("#level").combobox("getValue");
    var reason = $("#reason").val();
    var capacity = $("#capacity").val();
    var pkid = $("#pkid").val();
    var data = {
        "pkid": pkid,
        "name": name,
        "sex": sex,
        "age": age,
        "address": address,
        "phone": phone,
        "level": level,
        "reason": reason,
        "capacity": capacity
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
    $("#dlg").dialog("open").dialog("setTitle", "编辑扶贫对象信息");
    $('#fm').form('load', row);
    //加载下拉框
    var levelData = [
        {'text': '一般收入人口', 'value': 1},
        {'text': '低收入人口', 'value': 2},
        {'text': '相对贫困人口', 'value': 3},
        {'text': '绝对贫困人口', 'value': 4},
    ];
    $('#level').combobox({
        prompt: '请选择',
        textField: 'text',
        valueField: 'value',
        panelHeight: 'auto',
        data: levelData
    });
    $('#level').combobox('setValue', row.level);
    method = "POST";
    flag = "update";
}

//清空dialog缓存数据
function resetValue() {
    $('#fm').form('clear');
}

function closeDialog() {
    $("#dlg").dialog("close");
    resetValue();
}