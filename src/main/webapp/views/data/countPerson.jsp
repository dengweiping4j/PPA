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
<table id="dg" title="扶贫人数统计" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="${pageContext.request.contextPath}/common/dataGrid?table=v_countPerson" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center">序号</th>
        <th field="zrk" width="50" align="center">总人数</th>
        <th field="ybsr" width="50" align="center">一般收入人数</th>
        <th field="dsr" width="50" align="center">低收入人数</th>
        <th field="xdpk" width="50" align="center">相对贫困人数</th>
        <th field="jdpk" width="50" align="center">绝对贫困人数</th>
        <th field="ycqcs" width="50" align="center">已采取措施人数</th>
    </tr>
    </thead>
</table>
</body>
</html>