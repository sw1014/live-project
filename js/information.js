

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
        url:'', // 填写servlet地址
		dataType:'json', //预期的服务器响应的数据类型 
		success: function(result){ // 当请求成功时运行的函数
        var jsonStr=JSON.stringify(result);
        if(jsonStr=="预约成功")
        {
            alert("预约成功");
        }
        
		},
		error:function(result){ //失败的函数
			alert("请求数据失败");
		},
	});
 }
/*
function order()
{
    alert(name);
    $.ajax({
        type:'POST', 
        async:false,
        data:{"name":"全国"},
        url:'provinceStatisticServlet', // 请求的url地址
        dataType:'json', //预期的服务器响应的数据类型 
        success: function(result){ // 当请求成功时运行的函数
        var jsonStr=JSON.stringify(result);
        var jsonObj = JSON.parse(jsonStr);
        for(var p in jsonObj){//遍历json对象
            var data={};
            data.name=p;
            data.value=jsonObj[p];
            mydata.push(data);
    }
        },
        error:function(result){ //失败的函数
            alert("请求数据失败");
        },
    });
    
*/
