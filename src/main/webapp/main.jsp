<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>精准扶贫信息管理系统</title>
    <script type="text/javascript">
        checkCookie();

        function addTab(url, text, iconCls) {
            var content = "<iframe frameborder=0 scrolling='auto' style='width:100%;height:100%' src='${pageContext.request.contextPath}/views/"
                + url + "'></iframe>";
            $("#tabs").tabs("add", {
                title: text,
                iconCls: iconCls,
                closable: true,
                content: content
            });
        }

        function openTab(text, url, iconCls) {
            if ($("#tabs").tabs("exists", text)) {
                $("#tabs").tabs("close", text);
                addTab(url, text, iconCls);
                $("#tabs").tabs("select", text);
            } else {
                addTab(url, text, iconCls);
            }
        }

        function logout() {
            $.messager.confirm("系统提示", "您确定要退出系统吗", function (e) {
                if (e) {
                    clearCookie();
                }
            });
        }
    </script>
<body class="easyui-layout">
<div region="north" style="height: 78px;background-color: #53bdff" valign="middle">
    <table width="100%">
        <tr>
            <td style="font-size: 20px;color:#ffffff;font-family: '微软雅黑';"
                align="left" width="50%">
                <img src="images/logo.png" width="50"><font size="5">&nbsp;&nbsp;<strong>精准扶贫信息管理系统</strong></font>
            </td>
            <td
                    style="font-size: 20px;color:#ffffff;font-family: '楷体';"
                    align="right" width="50%"><font size="3">&nbsp;&nbsp;<strong>当前用户：</strong>
                admin</font>【管理员】
            </td>
        </tr>
    </table>
</div>
<div region="center">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页" data-options="iconCls:'icon-home'">
            <div align="center" style="padding-top: 50px">
                <%--<font color="grey" size="10">精准扶贫信息管理系统</font>--%>
                <img src="images/jzfphb.jpeg"/>
            </div>
        </div>
    </div>
</div>
<div region="west" style="width: 200px;height:500px;" title="导航菜单"
     split="true">
    <div class="easyui-accordion">
        <div title="扶贫对象管理" data-options="iconCls:'icon-item'"
             style="padding:10px;border:none;">
            <a href="javascript:openTab(' 扶贫对象基本信息','person/person.jsp','icon-man')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">
                基本信息</a>
        </div>
        <div title="扶贫数据管理" data-options="iconCls:'icon-item'"
             style="padding:10px;border:none;">
            <a href="javascript:openTab(' 扶贫人数统计','data/countPerson.jsp','icon-man')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">
                扶贫人数统计</a>
            <a href="javascript:openTab(' 扶贫政策管理','data/policy.jsp','icon-man')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">
                扶贫政策管理</a>
        </div>
        <div title="扶贫措施管理" data-options="iconCls:'icon-item'"
             style="padding:10px;border:none;">
            <a href="javascript:openTab(' 扶贫政策匹配','data/policySelect.jsp','icon-man')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">
                扶贫政策匹配</a>
        </div>
        <div title="扶贫结果统计" data-options="iconCls:'icon-item'"
             style="padding:10px;border:none;">
            <a href="javascript:openTab(' 扶贫结果统计','result/result.jsp','icon-man')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-man'" style="width: 150px;">
                扶贫结果统计</a>
        </div>
        <div title="系统管理" data-options="iconCls:'icon-item'"
             style="padding:10px;border:none;">
            <a href="javascript:openTab(' 用户管理','user/userManage.jsp','icon-lxr')"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-lxr'" style="width: 150px;">
                用户管理</a>
            <a href="javascript:logout()"
               class="easyui-linkbutton"
               data-options="plain:true,iconCls:'icon-exit'"
               style="width: 150px;">
                安全退出</a>
        </div>
    </div>
</div>
</body>
</html>