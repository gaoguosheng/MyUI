/**
 * 信息框
 * */
function f_alert(msg,fn){
    $.messager.alert("提示",msg,"info",fn);
}
/**
 * 错误提示
 * */
function f_alertError(msg,fn){
    $.messager.alert("提示",msg,"error",fn);
}

/**
 * 确认框
 * */

function f_confirm(msg,fn){
    $.messager.confirm('提示',msg,function(r){
        if (r){
            fn();
        }
    });
}
/**
 * 小帖士提示
 * */
function f_tips(msg){
    $.messager.show({
        title:'提示',
        msg:msg,
        timeout:3000,
        showType:'slide'
    });
}
/**
 * 小帖士提示
 * */
function f_tipsAlways(msg){
    $.messager.show({
        title:'提示',
        msg:msg,
        timeout:0,
        showType:'slide'
    });
}

var appTabs="appTabs";
function f_addTab(title, href,closable,icon){
    var tt = $('#'+appTabs);
    if (tt.tabs('exists', title)){//如果tab已经存在,则选中并刷新该tab
        tt.tabs('select', title);
        f_refreshTab({tabTitle:title,url:href});
    } else {
        if (href){
            var content = '<iframe scrolling="no" frameborder="0"  src="'+href+'" style="width:100%;height:100%;"></iframe>';
        } else {
            var content = '';
        }
        tt.tabs('add',{
            title:title,
            closable:closable,
            content:content,
            iconCls:icon||'icon-default'
        });
    }
}
function f_refreshTab(cfg){
    var refresh_tab = cfg.tabTitle?$('#'+appTabs).tabs('getTab',cfg.tabTitle):$('#'+appTabs).tabs('getSelected');
    /*if(refresh_tab && refresh_tab.find('iframe').length > 0){
        var _refresh_ifram = refresh_tab.find('iframe')[0];
        var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;        
        _refresh_ifram.contentWindow.location.href=refresh_url;
    }*/
}



var menuNodes = [  {
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
        id : 7,
        name : "系统管理",
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
        uri : "/main/user.jsp"
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