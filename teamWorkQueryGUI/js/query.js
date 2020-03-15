function order() {
    var Odd = document.getElementById('input').value;
    $.ajax({
        type: 'GET',
        async: false,
        data: { odd: Odd }, //提交预约单号
        url: '', // 填写servlet地址
        dataType: 'json', //预期的服务器响应的数据类型 
        success: function(result) { // 当请求成功时运行的函数
            var jsonStr = JSON.stringify(result);
            if (jsonStr == "成功中签") {
                alert("成功中签");
            }

        },
        error: function(result) { //失败的函数
            alert("请求数据失败");
        },

    });
}