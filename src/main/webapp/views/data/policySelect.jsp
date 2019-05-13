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
<table id="dg" title="基本信息管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=v_policy_select" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center">序号</th>
        <th field="name" width="50" align="center">扶贫对象</th>
        <th field="levelmc" width="50" align="center">贫困程度</th>
        <th field="reason" width="50" align="center">致贫原因</th>
        <th field="title" width="50" align="center">政策标题</th>
        <th field="text" width="200" align="center">具体描述</th>
        <th field="personpkid" hidden="true"/>
        <th field="policypkid" hidden="true"/>
        <th field="level" hidden="true"/>
    </tr>
    </thead>
</table>
<div id="tb">
    <div>
        <a href="javascript:openUpdateDialog()" class="easyui-linkbutton"
           iconCls="icon-edit" plain="true">政策匹配</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog"
     style="width: 620px;height:350px;padding: 10px 20px" closed="true"
     buttons="#dlg-buttons">
    <form id="selectFm" method="post">
        <input type="hidden" id="personpkid" name="personpkid">
        <table cellspacing="8px">
            <tr>
                <td>扶贫对象：</td>
                <td><input type="text" id="name" name="name"
                           class="easyui-textbox" required="true"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
            <tr>
                <td>扶贫政策：</td>
                <td><input type="text" id="policy" name="policy" class="easyui-textbox" required="true"
                           class="easyui-combobox"/>&nbsp;
                    <font color="red">*</font>
                </td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:savePolicySelect()" class="easyui-linkbutton"
       iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()"
       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>