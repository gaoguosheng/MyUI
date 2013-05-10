<%--
  Created by IntelliJ IDEA.
  User: GGS
  Date: 13-5-10
  Time: 上午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form id="pwdForm">
            <table>
                <tr>
                    <td align="right" width="30%">旧密码：</td>
                    <td width="70%"><input type="password" name="oldpassword" id="oldpassword" class="easyui-validatebox" required="required" ></td>
                </tr>
                <tr>
                    <td align="right" width="30%">新密码：</td>
                    <td width="70%"><input type="password" name="password" id="password" class="easyui-validatebox" required="required"></td>
                </tr>
                <tr>
                    <td align="right">密码确认：</td>
                    <td><input type="password" name="password2" id="password2" class="easyui-validatebox" required="required" validType="equals['#password']" ></td>
                </tr>
            </table>
</form>
