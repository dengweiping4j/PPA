<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/views/data/policy.js"></script>
</head>
<body style="margin:1px;">
<table id="dg" title="扶贫政策管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=policy" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center">序号</th>
        <th field="title" width="50" align="center">政策标题</th>
        <th field="text" width="200" align="center">具体描述</th>
        <th field="pkid" hidden="true"/>
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
        &nbsp;政策标题：&nbsp;
        <input type="text" id="s_title" size="20" class="easyui-textbox"
               onkeydown="if(event.keyCode==13) searchXS()"/> <a
            href="javascript:search()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">搜索</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 620px;height:350px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="fm" method="post">
        <input type="hidden" id="pkid" name="pkid">
        <table cellspacing="8px">
            <tr>
                <td>政策标题：</td>
                <td><input type="text" id="title" name="title"
                           class="easyui-textbox" required="true" style="width:300px"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>具体描述：</td>
                <td><input type="text" id="text" name="text" class="easyui-textbox" required="true"
                           class="easyui-textbox" data-options="multiline:true" style="height:150px;width:400px"
                />&nbsp;
                    <font color="red">*</font>
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