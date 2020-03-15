

 function order()
 {
     var name=document.getElementById('name').value;
     var idcard=document.getElementById('idcard').value;
     var tel=document.getElementById('tel').value;
     var number=document.getElementById('number').value;
     $.ajax({
		type:'POST', 
		async:false,
		data:{"name":name,"idcard":idcard,"tel":tel,"number":number},
        url:'UserServlet', // 填写servlet地址
		dataType:'json', //预期的服务器响应的数据类型 
		success: function(result){ // 当请求成功时运行的函数
			var jsonStr=JSON.stringify(result);
			var jsonObj = JSON.parse(jsonStr);
			for(var p in jsonObj)
			{
				alert(jsonObj[p]);
			}
			
			
			
		},
		error:function(result){ //失败的函数
			alert("请求数据失败");
		},
	});
 }

