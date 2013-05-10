<%--
  Created by IntelliJ IDEA.
  User: ggs
  Date: 13-5-9
  Time: 下午8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@include file="/inc/lib.jsp"%>
    <title>${softName}</title>
    <script type="text/javascript">
        var menuNodes =[
            {
                id : 7,
                name : "系统管理",
                pId : 0,
                uri : "/main/demo.jsp"
            },
            {
            id : 2,
            name : "任务中心",
            pId : 0,
            uri : "/main/demo.jsp"
        }, {
            id : 3,
            name : "公告新闻",
            pId : 0,
            uri : "/main/demo.jsp"
        },


            {
                id : 21,
                name : "待办事项",
                pId : 2,
                uri : "/main/demo.jsp"
            }, {
                id : 22,
                name : "已办事项",
                pId : 2,
                uri : "/main/demo.jsp"
            }, {
                id : 23,
                name : "已发事项",
                pId : 2,
                uri : "/main/demo.jsp"
            }, {
                id : 31,
                name : "单位公告",
                pId : 3,
                uri : "/main/demo.jsp"
            }, {
                id : 32,
                name : "单位新闻",
                pId : 3,
                uri : "/main/demo.jsp"
            }, {
                id : 71,
                name : "用户管理",
                pId : 7,
                uri : "/main/user_list.jsp"
            }, {
                id : 72,
                name : "角色管理",
                pId : 7,
                uri : "/main/demo.jsp"
            }, {
                id : 73,
                name : "菜单管理",
                pId : 7,
                uri : "/main/demo.jsp"
            }, {
                id : 74,
                name : "数据字典",
                pId : 7,
                uri : "/main/demo.jsp"
            }, {
                id : 741,
                name : "公司",
                pId : 74,
                uri : "/main/demo.jsp"
            }, {
                id : 742,
                name : "民族",
                pId : 74,
                uri : "/main/demo.jsp"
            }, {
                id : 743,
                name : "专业",
                pId : 74,
                uri : "/main/demo.jsp"
            }, {
                id : 7411,
                name : "等级",
                pId : 741,
                uri : "/main/demo.jsp"
            }, {
                id : 7412,
                name : "岗位",
                pId : 741,
                uri : "/main/demo.jsp"
            } ];

        /***
         * 退出
         */
        function f_logout(){
            f_confirm("是否确定要退出${softName}?",function(){location.href = 'logout.jsp';});
        }

        /**
         * 加载菜单
         * */
        function f_loadMenu(){
            var setting = {
                data: {
                    simpleData: {
                        enable: true
                    }
                },
                callback: {
                    onClick: function(event, treeId, treeNode, clickFlag){
                        f_addTab(treeNode.name,"${ctx}"+treeNode.uri,true);
                    }
                }
            };
            var menuDiv =$("#menuDiv");
            var nodes = menuNodes;
            var childNodes = new Array();
            for(var i=0;i<nodes.length;i++){
                if(nodes[i].pId==0){
                    childNodes.length=0;
                    var div  = document.createElement("div");
                    $(div).attr("title",nodes[i].name);
                    $(div).html('<ul id="tree_'+nodes[i].id+'" class="ztree"></ul>');
                    $(menuDiv).append(div);
                    f_getChildNodes(nodes[i].id);
                    $.fn.zTree.init($("#tree_"+nodes[i].id), setting, childNodes);
                }
            }
            /**
             * 递归子孙菜单
             * */
            function f_getChildNodes(id){
                for(var i=0;i<nodes.length;i++){
                    if(nodes[i].pId==id){
                        childNodes[childNodes.length]=nodes[i];
                        f_getChildNodes(nodes[i].id);
                    }
                }
            }
        }

        /**
         * 活动菜单大小
         * */
        function f_onResize(width,height){
            $('#menuDiv').accordion({width:width-8});
        }
        /**
         * 修改密码
         * */
        function f_pwdDialog(){
            var dialog = f_dialog("pwdDialog",{
                        title:"修改密码",
                        href:"pwd.jsp"
                    },
                    function(){
                        $("#pwdForm").form("submit",{
                            url:"json/test.json",
                            success:function(data){
                                var data = eval('(' + data + ')');
                                if (data.success){
                                    f_alert(data.message);
                                    $(dialog).dialog("close");
                                }
                            }
                        });
                    }
            );
        }

        $(function(){
            f_addTab('首页','main.jsp',false,"icon-home");
            f_tips("欢迎使用平台");
        })
    </script>
</head>
<body>
    <div class="easyui-layout" style="width:100%;height:100%;padding: 0px;margin: 0px;">
        <div data-options="region:'north',border:false" class="header-bg">
            <div>
                <div style="position: absolute;margin: 5px;">
                    <h2><img src="${ctx}/img/logo.jpg" style="vertical-align: middle"> ${softName}</h2>
                </div>
                <div align="right" style="margin-right: 20px;">
                    <img src="${ctx}/img/delicious.png"> <a href="#" class="easyui-menubutton" data-options="menu:'#themeMenu',plain:true" >主题</a>
                    <img src="${ctx}/img/user_friend.png">  <a href="#" class="easyui-menubutton" data-options="menu:'#adminMenu',plain:true" >Admin</a>
                    <img src="${ctx}/img/information.png"> <a href="#" class="easyui-linkbutton" data-options="plain:true">消息(8)</a>
                    <img src="${ctx}/img/sign_out.png"> <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="f_logout();">退出系统</a>
                </div>
            </div>
        </div>
        <div data-options="region:'south',split:false,border:false" style="height:22px;overflow: hidden;text-align: center;">
            Copyright © 2002 - 2013 GGS. All Rights Reserved
        </div>
        <div data-options="region:'west',split:true,border:false,onResize:f_onResize" title="Menu" style="width:200px;height: 100%;">
            <div id="menuDiv" class="easyui-accordion" align="center"></div>
            <script type="text/javascript">f_loadMenu();</script>
        </div>
        <div data-options="region:'center',border:false">
            <div id="appTabs" class="easyui-tabs" data-options="fit:true,border:false,plain:true">
            </div>
        </div>
        <div id="adminMenu">
            <div onclick="f_pwdDialog();">修改密码</div>
            <div>修改资料</div>
        </div>
        <div id="themeMenu">
            <div onclick="location='index.jsp?theme=default';">Default</div>
            <div onclick="location='index.jsp?theme=bootstrap';">Bootstrap</div>
            <div onclick="location='index.jsp?theme=metro';">Metro</div>
        </div>
    </div>

</body>
</html>