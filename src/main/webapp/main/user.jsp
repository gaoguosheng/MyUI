<%--
  Created by IntelliJ IDEA.
  User: GGS
  Date: 13-5-10
  Time: 上午10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/inc/lib.jsp"%>
    <title>${softName}</title>
    <script type="text/javascript">
        /**
         * 刷新表格
         * */
        function f_refreshGrid(){
            $('#gridTable').datagrid('reload');
        }

        function f_add(){
            f_openUserWindow();
        }

        function f_edit(){
            var sel =  $('#gridTable').datagrid('getSelected');
            if(sel){
                f_openUserWindow(sel);
            }else{
                f_alertError("请选择一条记录！");
            }
        }

        function f_del(){
            var sel =  $('#gridTable').datagrid('getSelected');
            if(sel){
                f_confirm("是否确定删除?",function(){f_tips("删除成功！")});
            }else{
                f_alertError("请选择一条记录！");
            }
        }

        function f_closeUserWindow(){
            $('#userWindow').window('close');
        }

        /**
         * 弹出窗口
         * */
        function f_openUserWindow(data){
            $("#userWindow").css("display","block");
            if(data){
                $("#userForm").form("load",data);
            }else{
                $("#userForm").form("clear");
            }

            $("#userWindow").window(
                    {
                        title:'用户管理',
                        width:640,
                        height:300,
                        modal:true,
                        minimizable:false,
                        maximizable:false,
                        collapsible:false
                    }
            );
        }

        function f_submitForm(){
                $("#userForm").form("submit",{
                    url:"${ctx}/main/login.json",
                    success:function(data){
                        var data = eval('(' + data + ')');  // change the JSON string to javascript object
                        if (data.success){
                            f_tips("保存成功！");
                            f_closeUserWindow();
                        }
                    }
                });
        }
    </script>
</head>
<body>
    <div id="tb">
        <div>
            检索：
            <input class="easyui-searchbox" data-options="prompt:'请输入关键字',menu:'#mm',
                    searcher:function(value,name){
                    if(name==0){}
                     else if (name==1){}
                    else if(name==2){}
                     else if(name==3){}}" style="width:250px"/>
            <div id="mm" style="width:150px;">
                <div data-options="name:'1'">姓名</div>
                <div data-options="name:'2'">手机</div>
                <div data-options="name:'3'">QQ</div>
            </div>
        </div>
        <div>
            操作：
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-add'" onclick="f_add();">添加</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-edit'" onclick="f_edit();" >修改</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-remove'" onclick="f_del();">删除</a>
            <a href="#" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-reload'"onclick="f_refreshGrid();">刷新</a>
        </div>
    </div>
    <table id="gridTable" class="easyui-datagrid"
           toolbar="#tb"
           singleSelect="true"
           iconCls="icon-search"
           rownumbers="true"
           pagination="true"
           idField="id"
           url="user.json">
        <thead>
        <tr>
            <th field="flag" width="60">状态</th>
            <th field="username" width="60">帐号</th>
            <th field="realname" width="80" >姓名</th>
            <th field="qq" width="80" >QQ</th>
            <th field="mobile" width="120">手机</th>
            <th field="onlinetimes" width="80">在线时长</th>
        </tr>
        </thead>
    </table>
    <script type="text/javascript">
        $("#gridTable").css("height",screen.availHeight-215);
    </script>

    <div id="userWindow" style="display: none;overflow: hidden;">
        <form id="userForm" method="post">
            <div class="easyui-layout" style="width:100%;height:100%;padding: 0px;margin: 0px;">
                <div data-options="region:'center',border:false" style="overflow: auto;">
                    <input type="hidden" id="userid" name="userid">
                    <table width="100%" border="0" cellpadding="5" class="normalFont">
                        <tr>
                            <td align="right" valign="top">用户名：</td>
                            <td><input name="username" id="username" class="easyui-validatebox" data-options="required:true" style="width: 200px;"/></td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">姓名：</td>
                            <td><input name="realname" id="realname" class="easyui-validatebox" data-options="required:true" style="width: 200px;"/></td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">手机：</td>
                            <td><input name="mobile" id="mobile" class="easyui-validatebox" data-options="required:true" style="width: 200px;"/></td>
                        </tr>
                        <tr>
                            <td align="right" valign="top">QQ：</td>
                            <td><input name="qq" id="qq" class="easyui-validatebox" data-options="required:true" style="width: 200px;"/></td>
                        </tr>
                    </table>
                </div>
                <div data-options="region:'south',split:false,border:false" style="padding: 10px;height:40px;overflow: hidden;text-align: center;background-color: #F5F9FF">
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onclick="f_submitForm();">保存</a>
                    <a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'" onclick="f_closeUserWindow();">关闭</a>
                </div>
            </div>
        </form>
    </div>

</body>
</html>