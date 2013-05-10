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
        /***
         退出
         *
         */
        function f_logout(){
            f_confirm("是否确定要退出${softName}?",function(){location.href = 'logout.jsp';});
        }


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
            function f_getChildNodes(id){
                for(var i=0;i<nodes.length;i++){
                    if(nodes[i].pId==id){
                        childNodes[childNodes.length]=nodes[i];
                        f_getChildNodes(nodes[i].id);
                    }
                }
            }
        }

        function f_onResize(width,height){
            $('#menuDiv').accordion({width:width-8});
        }

        /**
         * 弹出修改密码对话框
         * */
        function f_showPwdDialog(){
            $("#passwordDialog").window(
                    {
                        title:'修改密码',
                        width:450,
                        height:220,
                        modal:true,
                        href:"pwd.jsp",
                        minimizable:false,
                        maximizable:false,
                        collapsible:false
                    }
            );
        }
        /**
         * 关闭密码对话框
         * */
        function f_closePwdDialog(){
            $("#passwordDialog").window("close");
        }


        $(function(){
            f_addTab('首页','main.jsp',false);
            f_tips("欢迎使用平台");
        })
    </script>
</head>
<body>
    <div class="easyui-layout" style="width:100%;height:100%;padding: 0px;margin: 0px;">
        <div data-options="region:'north',border:true" class="header-bg">
            <div>
                <div style="position: absolute;margin: 5px;">
                    <h2><img src="${ctx}/img/logo.jpg" style="vertical-align: middle"> ${softName}</h2>
                </div>
                <div align="right" style="margin-right: 20px;">
                    <img src="${ctx}/img/credit_card.png"> <a href="#" class="easyui-menubutton" data-options="menu:'#themeMenu',plain:true" >主题</a>
                    <img src="${ctx}/img/user_friend.png">  <a href="#" class="easyui-menubutton" data-options="menu:'#adminMenu',plain:true" >Admin</a>
                    <img src="${ctx}/img/information.png"> <a href="#" class="easyui-linkbutton" data-options="plain:true">消息(8)</a>
                    <img src="${ctx}/img/arrow_right.png"> <a href="#" class="easyui-linkbutton" data-options="plain:true" onclick="f_logout();">退出系统</a>
                </div>
            </div>
        </div>
        <div data-options="region:'south',split:false,border:true" style="height:22px;overflow: hidden;text-align: center;">
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
            <div onclick="f_showPwdDialog();">修改密码</div>
            <div>修改资料</div>
        </div>
        <div id="themeMenu">
            <div onclick="location='index.jsp?theme=default';">Default</div>
            <div onclick="location='index.jsp?theme=bootstrap';">Bootstrap</div>
            <div onclick="location='index.jsp?theme=black';">Black</div>
            <div onclick="location='index.jsp?theme=gray';">Gray</div>
            <div onclick="location='index.jsp?theme=metro';">Metro</div>
        </div>
        <div id="passwordDialog"></div>
    </div>

</body>
</html>