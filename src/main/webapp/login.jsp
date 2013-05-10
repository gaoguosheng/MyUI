<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 13-5-9
  Time: 下午8:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/inc/lib.jsp"%>
    <title>${softName} - 登录</title>
</head>
<body>
    <div class="easyui-dialog" title="用户登录" resizable="false" draggable="false" closable="false" data-options="iconCls:'icon-user'" style="width:550px;height:330px;padding:10px">
        <div align="center" style="font-size: 20pt;font-weight: bold;">${softName}</div>
        <br/>
        <form id="loginForm" method="post">
            <table align="center" width="100%" border="0"  cellpadding="5" class="normalFont">
                <tr>
                    <td rowspan="4" align="center"><img src="${ctx}/img/logo-m.jpg"></td>
                    <td align="right">帐号：</td>
                    <td><input type="text" name="username" id="username" class="easyui-validatebox" data-options="required:true" style="width: 180px;" value="ggs"></td>
                </tr>
                <tr>
                    <td align="right">密码：</td>
                    <td><input type="password" name="password" id="password" class="easyui-validatebox" data-options="required:true" style="width: 180px;" value="123"></td>
                </tr>
                <tr>
                    <td align="right">自动登录：</td>
                    <td><input type="checkbox" value="1" id="isautologin" name="isautologin"></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="f_submitForm()">登陆</a>
                        <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-reload'" onclick="f_clearForm()">重置</a>
                    </td>
                </tr>
            </table>
        </form>
        <div  align="center">
            <span  class="normalFont">Copyright © 2002 - 2013 GGS. All Rights Reserved</span>
        </div>
    </div>

    <script type="text/javascript">
        function f_submitForm(){
            $.messager.progress();
            window.setTimeout(function(){
                $("#loginForm").form("submit",{
                    url:"${ctx}/main/login.json",
                    success:function(data){
                        var data = eval('(' + data + ')');  // change the JSON string to javascript object
                        if (data.success){
                            $.messager.progress("close");
                            location='${ctx}/main/index.jsp';
                        }
                    }
                });
            },2000);

        }
        function f_clearForm(){
            $('#loginForm').form('clear');
        }
    </script>

</body>
</html>