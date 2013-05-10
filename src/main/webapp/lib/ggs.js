/*! jQuery bootstrap GGS v2013 /license */

var $GGS={
	/**
	 * Ajax操作
	 * */
	ajax:{		
		/**
		 * ajax同步
		 * */
		sync:function(url,data){
	        var result;
	        $.ajax({
	            type: "POST",
	            url:url,
	            data:data,
	            async:false,
	            success: function(msg){
	                result=msg;
	            }
	        });
	        return result;
	    } ,
	    /**
	     * ajax异步
	     * */
	    aSync:function(url,data,fun){
	        var result;
	        $.ajax({
	            type: "POST",
	            url:url,
	            data:data,
	            async:true,
	            success: function(msg){
	                result=msg;
	                fun();
	            }
	        });
	        return result;
	    } ,
	    /**
	     * 获取JSON
	     * */
	    getJSON:function(url,data){
            alert(url);
	        var result;
	        $.ajax({
	            type: "POST",
	            url:url,
	            data:data,
	            async:false,
	            dataType:"json",
	            success: function(json){
	            	result=json;
	            }
	        });
	        return result;
	    }		
	},			
	/**
	 * 表单操作
	 * */
	form:{
		/**
		 * 回车移动焦点至下一个表单元素
		 * */
		enterDown:function(){			
			var length = $(":input").length;
		       $(":input").keypress(function(e) {
		       var key = e.which;
		       if (13 == key) {
			       var index = $(":input").index(this);
			       var newIndex = index + 1;
			       if(length == newIndex){
			            newIndex = 0;
			       }
			       var input =$(":input:eq(" + newIndex + ")"); 
			       if($(input).attr("type")=="submit"){
			    	   $(input).click();
			       }else{
			    	   $(input).focus();   
			       }		       				       
			       return false;
		       }		       	
		   });	
		}
	}
}
