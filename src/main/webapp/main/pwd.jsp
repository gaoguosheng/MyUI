<%--
  Created by IntelliJ IDEA.
  User: GGS
  Date: 13-5-10
  Time: 上午9:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form id="pwdForm">
        <table align="center" width="400" border="0"  cellpadding="5">
            <tr>
                <td align="right" width="30%">旧密码：</td>
                <td width="70%"><input type="password" name="oldpassword" id="oldpassword" class="easyui-validatebox" required="required" style="width: 180px;"></td>
            </tr>
            <tr>
                <td align="right" width="30%">新密码：</td>
                <td width="70%"><input type="password" name="password" id="password" class="easyui-validatebox" required="required" style="width: 180px;"></td>
            </tr>
            <tr>
                <td align="right">密码确认：</td>
                <td><input type="password" name="password2" id="password2" class="easyui-validatebox" required="required" validType="equals['#password']" style="width: 180px;"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="f_submitForm();">确定</a>
                    <a href="#" onclick="f_closePwdDialog();" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
                </td>
            </tr>
        </table>
    </form>
    <script type="text/javascript">
        // extend the 'equals' rule
        $.extend($.fn.validatebox.defaults.rules, {
            equals: {
                validator: function(value,param){
                    return value == $(param[0]).val();
                },
                message: '该输入项不能匹配.'
            }
        });
        function f_submitForm(){
            $("#pwdForm").form("submit",{
                url:"login.json",
                success:function(data){
                    var data = eval('(' + data + ')');  // change the JSON string to javascript object
                    if (data.success){
                        f_alert("修改密码成功！",function(){f_closePwdDialog();});
                    }
                }
            });
        }
    </script>