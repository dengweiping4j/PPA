var url = "/SSAM/student";
var method;

function searchXS() {
    $("#dg").datagrid('load', {
        "xm": $("#s_xm").val()
    });
}

function deleteStudnet() {
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

function openStudentAddDialog() {
    $("#dlg").dialog("open").dialog("setTitle", "添加学生信息", 'refresh', "");
    method = "POST";
    //加载下拉框
    findcombobox();
}

function saveStudent() {
    var xm = $("#xm").val();
    var xh = $("#xh").val();
    var year = $("#year").combobox("getValue");
    var departmentKey = $("#departmentKey").combobox("getValue");
    var majorKey = $("#majorKey").combobox("getValue");
    var classKey = $("#classKey").combobox("getValue");
    var phone = $("#phone").val();
    var data = {
        "xm": xm,
        "xh": xh,
        "year": year,
        "departmentKey": departmentKey,
        "majorKey": majorKey,
        "classKey": classKey,
        "phone": phone
    };

    if ($('#fm').form('validate')) {
        $.ajax({
            type: method,//方法类型
            dataType: "json",//服务器返回的数据类型
            url: url + "/addSave",//url
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

function openStudentModifyDialog() {
    var selectedRows = $("#dg").datagrid('getSelections');
    if (selectedRows.length != 1) {
        $.messager.alert("系统提示", "请选择一条要编辑的数据！");
        return;
    }
    var row = selectedRows[0];
    $("#dlg").dialog("open").dialog("setTitle", "编辑学生信息");
    $('#fm').form('load', row);
    //下拉框加载
    findcombobox();
    $('#year').combobox('setValue', row.year);
    $('#departmentKey').combobox('setValue', row.department_key);
    $('#majorKey').combobox('setValue', row.major_key);
    $('#classKey').combobox('setValue', row.class_key);
    method = "POST";
}

//加载下拉框
function findcombobox() {
    //入学年份下拉框
    var year = new Date().getFullYear();
    var yearData = [
        {'text': '请选择...', 'value': ''},
        {'text': year + '年', 'value': year},
        {'text': year - 1 + '年', 'value': year - 1},
        {'text': year - 2 + '年', 'value': year - 2},
        {'text': year - 3 + '年', 'value': year - 3},
        {'text': year - 4 + '年', 'value': year - 4}
    ];
    $('#year').combobox({
        textField: 'text',
        valueField: 'value',
        panelHeight: 'auto',
        data: yearData
    })
    //学院下拉框
    $.ajax({
        async: false,
        type: "post",
        url: url + "/getDepartmentList",//请求后台数据
        dataType: "json",
        success: function (departmentList) {
            $("#departmentKey").combobox({//往下拉框赋值
                prompt: '请选择',
                data: departmentList,
                valueField: "value",//value值
                textField: "text",//文本值
                panelHeight: "auto"
            })
        }
    });
    //触发学院选项  
    $("#departmentKey").combobox({
        onChange: function () {
            $("#majorKey").combobox('setValue', ''); //清空专业 
            $("#classKey").combobox('setValue', ''); //清空班级
            var departmentKey = $('#departmentKey').combobox('getValue');
            $("#majorKey").combobox("loadData", "");
            $.ajax({
                async: false,
                url: url + "/getMajorList",
                data: {departmentKey: departmentKey},
                type: "POST",
                dataType: "json",
                success: function (majorList) {
                    $("#majorKey").combobox("loadData", majorList);
                }

            });
        }

    });
    $('#majorKey').combobox({
        prompt: '请选择',
        editable: false, //不可编辑状态    
        cache: false,
        panelHeight: 'auto',//自动高度适合    
        valueField: 'value',
        textField: 'text'
    });
    //触发专业选项时  
    $("#majorKey").combobox({
        onChange: function () {
            $("#classKey").combobox('setValue', ''); //清空班级
            var majorKey = $('#majorKey').combobox('getValue');
            $("#classKey").combobox("loadData", "");
            $.ajax({
                async: false,
                url: url + "/getClassList",
                cache: false,
                data: {majorKey: majorKey},
                type: "POST",
                dataType: "json",
                success: function (classList) {
                    $("#classKey").combobox("loadData", classList);
                }
            });
        }
    });
    $('#classKey').combobox({
        prompt: '请选择',
        editable: false, //不可编辑状态    
        cache: false,
        panelHeight: 'auto',//自动高度适合    
        valueField: 'value',
        textField: 'text'
    });
}

function resetValue() {
    $('#fm').form('clear');
}

function closeStudentDialog() {
    $("#dlg").dialog("close");
    resetValue();
}