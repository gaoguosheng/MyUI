<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 13-5-9
  Time: 下午9:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/inc/lib.jsp"%>
    <title>${softName}</title>
    <style type="text/css">
        .title{
            font-size:16px;
            font-weight:bold;
            padding:20px 10px;
            background:#eee;
            overflow:hidden;
            border-bottom:1px solid #ccc;
        }
        .t-list{
            padding:5px;
        }
    </style>
    <script>
        $(function(){
            $('#pp').portal({
                border:false,
                fit:true
            });
        });

    </script>
</head>
<body class="easyui-layout">
<div region="center" border="false">
    <div id="pp" style="position:relative">
        <div style="width:30%;">
            <div title="任务中心" collapsible="true" closable="true" style="height:200px;padding:5px;">

            </div>
            <div title="公告新闻" closable="true" style="height:200px;text-align:center;">

            </div>
        </div>
        <div style="width:40%;">
            <div title="工作日程" style="text-align:center;height:250px;padding:5px;">
                <div class="easyui-calendar" style="width:180px;height:180px;"></div>
            </div>
            <div title="通讯录" closable="true" style="width:450px;height:200px;">
                <table class="easyui-datagrid"
                       singleSelect="true"
                       url="json/user.json">
                    <thead>
                        <tr>
                            <th field="realname" width="100" >姓名</th>
                            <th field="qq" width="100" >QQ</th>
                            <th field="mobile" width="150">手机</th>
                        </tr>
                    </thead>
                </table>
            </div>
        </div>
        <div style="width:30%;">
            <div title="全文检索" iconCls="icon-search" closable="true" style="height:80px;padding:10px;">
                <input class="easyui-searchbox">
            </div>
        </div>
    </div>
</div>
</body>
</html>