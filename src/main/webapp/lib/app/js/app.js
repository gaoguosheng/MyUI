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
            iconCls:icon||'icon-issue'
        });
    }
    function f_refreshTab(cfg){
        var refresh_tab = cfg.tabTitle?$('#'+appTabs).tabs('getTab',cfg.tabTitle):$('#'+appTabs).tabs('getSelected');
        /*if(refresh_tab && refresh_tab.find('iframe').length > 0){
         var _refresh_ifram = refresh_tab.find('iframe')[0];
         var refresh_url = cfg.url?cfg.url:_refresh_ifram.src;
         _refresh_ifram.contentWindow.location.href=refresh_url;
         }*/
    }
}

function f_dialog(id,data,fn){
    var dialog = $("#"+id);
    if(dialog.length==0){
        dialog = document.createElement("div");
        $(dialog).attr("id",id);
        $(document.body).append(dialog);
    }
    var myDialog =  $(dialog).dialog(
        {
            title:data.title,
            width:data.width?data.width:640,
            height:data.height?data.height:480,
            modal:true,
            href:data.href,
            minimizable:false,
            maximizable:true,
            collapsible:false,
            iconCls: data.iconCls,
            buttons: [{
                text:'确定',
                iconCls:'icon-ok',
                handler:function(){
                    fn();
                }
            },{
                text:'取消',
                iconCls:'icon-cancel',
                handler:function(){
                    $(dialog).dialog("close");
                }
            }]
        }
    );
    window.setTimeout(function(){
        $(myDialog).find("form").form("load",data.params);
        $GGS.form.enterDown();
        },500);
    return  myDialog;
}

// extend the 'equals' rule
$.extend($.fn.validatebox.defaults.rules, {
    equals: {
        validator: function(value,param){
            return value == $(param[0]).val();
        },
        message: '该输入项不能匹配.'
    }
});