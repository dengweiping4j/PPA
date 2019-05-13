<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/views/user/userManager.js"></script>
</head>
<body style="margin:1px;">
<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=user" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="user_name" width="50" align="center">用户名</th>
        <th field="user_id" width="50" align="center">账号</th>
        <th field="phone" width="50" align="center">联系电话</th>
        <th field="pkid" hidden="true"/>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openUserAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a> <a
            href="javascript:openUserModifyDialog()" class="easyui-linkbutton"
            iconCls="icon-edit" plain="true">修改</a> <a
            href="javascript:deleteUser()" class="easyui-linkbutton"
            iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;用户名：&nbsp;<input type="text" id="s_userName" size="20" class="easyui-textbox"
                               onkeydown="if(event.keyCode==13) searchUser()"/> <a
            href="javascript:searchUser()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="addDlg" class="easyui-dialog"
     style="width: 420px;height:350px;padding: 10px 20px" closed="true"
     buttons="#add-buttons">
    <form id="addForm" method="post">
        <table cellspacing="8px">
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="add_userName" name="add_userName"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>账号：</td>
                <td><input type="text" id="add_userId" name="add_userId"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td><input type="text" id="add_password" name="add_password"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><input type="text" id="add_phone" name="add_phone"
                           class="easyui-textbox"/>
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="updateDlg" class="easyui-dialog"
     style="width: 420px;height:350px;padding: 10px 20px" closed="true"
     buttons="#update-buttons">
    <form id="updateForm" method="post">
        <input id="pkid" name="pkid" type="hidden">
        <table cellspacing="8px">
            <tr>
                <td>用户名：</td>
                <td><input type="text" id="userName" name="user_name"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><input type="text" id="phone" name="phone"
                           class="easyui-textbox"/>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="add-buttons">
    <a href="javascript:addSave()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:closeUserDialog()"
       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
<div id="update-buttons">
    <a href="javascript:updateSave()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:closeUserDialog()"
       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>