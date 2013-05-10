<%--
  Created by IntelliJ IDEA.
  User: GGS
  Date: 13-5-10
  Time: 下午3:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="userForm" method="post">
            <input type="hidden" id="userid" name="userid">
            <table>
                <tr>
                    <td align="right" valign="top">用户名：</td>
                    <td><input name="username" id="username" class="easyui-validatebox" required="required"  /></td>
                </tr>
                <tr>
                    <td align="right" valign="top">姓名：</td>
                    <td><input name="realname" id="realname" class="easyui-validatebox" required="required"/></td>
                </tr>
                <tr>
                    <td align="right" valign="top">手机：</td>
                    <td><input name="mobile" id="mobile" class="easyui-validatebox" required="required" validType=""/></td>
                </tr>
                <tr>
                    <td align="right" valign="top">QQ：</td>
                    <td><input name="qq" id="qq" class="easyui-validatebox" required="required"/></td>
                </tr>
            </table>
</form>