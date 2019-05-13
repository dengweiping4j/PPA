<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/views/student/studentManager.js"></script>
</head>
<body style="margin:1px;">
<table id="dg" title="学生信息管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=student" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="xm" width="50" align="center">学生姓名</th>
        <th field="xh" width="50" align="center">学号</th>
        <th field="year" width="50" align="center">年级</th>
        <th field="department_name" width="80" align="center">学院</th>
        <th field="major_name" width="80" align="center">专业</th>
        <th field="class_name" width="80" align="center">班级</th>
        <th field="phone" width="60" align="center">联系电话</th>
        <th field="pkid" hidden="true"/>
        <th field="department_key" hidden="true"/>
        <th field="major_key" hidden="true"/>
        <th field="class_key" hidden="true"/>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openStudentAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:openStudentModifyDialog()" class="easyui-linkbutton"
           iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:deleteStudnet()" class="easyui-linkbutton"
           iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;学生姓名：&nbsp;
        <input type="text" id="s_xm" size="20" class="easyui-textbox"
               onkeydown="if(event.keyCode==13) searchXS()"/> <a
            href="javascript:searchXS()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 520px;height:450px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>学生姓名：</td>
                <td><input type="text" id="xm" name="xm"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>学号：</td>
                <td><input type="text" id="xh" name="xh"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>入学年份：</td>
                <td><input type="text" id="year" name="year"
                           class="easyui-combobox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>学院：</td>
                <td><input type="text" id="departmentKey" name="departmentKey"
                           class="easyui-combobox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>专业：</td>
                <td><input type="text" id="majorKey" name="majorKey"
                           class="easyui-combobox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>班级：</td>
                <td><input type="text" id="classKey" name="classKey"
                           class="easyui-combobox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><input type="text" id="phone" name="phone" class="easyui-textbox"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveStudent()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:closeStudentDialog()"
       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>