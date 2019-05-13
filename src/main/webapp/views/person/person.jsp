<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/views/person/person.js"></script>
</head>
<body style="margin:1px;">
<table id="dg" title="基本信息管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=v_person" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center">序号</th>
        <th field="name" width="50" align="center">姓名</th>
        <th field="sexmc" width="30" align="center">性别</th>
        <th field="age" width="30" align="center">年龄</th>
        <th field="address" width="100" align="center">家庭住址</th>
        <th field="phone" width="80" align="center">联系电话</th>
        <th field="levelmc" width="80" align="center">贫困程度</th>
        <th field="reason" width="150" align="center">致贫原因</th>
        <th field="capacity" width="100" align="center">生产能力</th>
        <th field="pkid" hidden="true"/>
        <th field="sex" hidden="true"/>
        <th field="level" hidden="true"/>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openAddDialog()" class="easyui-linkbutton"
           iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:openModifyDialog()" class="easyui-linkbutton"
           iconCls="icon-edit" plain="true">修改</a>
        <a href="javascript:del()" class="easyui-linkbutton"
           iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;姓名：&nbsp;
        <input type="text" id="s_name" size="20" class="easyui-textbox"
               onkeydown="if(event.keyCode==13) search()"/> <a
            href="javascript:search()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 520px;height:500px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <input type="hidden" id="pkid" name="pkid">
        <table cellspacing="8px">
            <tr>
                <td>姓名：</td>
                <td><input type="text" id="name" name="name"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <input type="radio" id="sex" name="sex" value="1"/>男
                    <input type="radio" id="sex" name="sex" value="0"/>女
                </td>
            </tr>
            <tr>
                <td>年龄：</td>
                <td><input type="text" id="age" name="age"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>家庭住址：</td>
                <td><input type="text" id="address" name="address"
                           class="easyui-textbox" style="width:300px"/>
                </td>
            </tr>
            <tr>
                <td>联系电话：</td>
                <td><input type="text" id="phone" name="phone"
                           class="easyui-textbox"/>
                </td>
            </tr>
            <tr>
                <td>贫困程度：</td>
                <td><input type="text" id="level" name="level"
                           class="easyui-combobox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>致贫原因：</td>
                <td><input type="text" id="reason" name="reason" class="easyui-textbox"
                           class="easyui-combobox" data-options="multiline:true" style="height:60px;width:300px"
                />
                </td>
            </tr>
            <tr>
                <td>基本生产能力：</td>
                <td><input type="text" id="capacity" name="capacity" class="easyui-textbox"
                           class="easyui-combobox" data-options="multiline:true" style="height:60px;width:300px"
                />
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:save()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()"
       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>