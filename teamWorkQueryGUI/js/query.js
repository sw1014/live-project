function order() {
    var Odd = document.getElementById('input').value;
    $.ajax({
        type: 'GET',
        async: false,
        data: { odd: Odd }, //提交预约单号
        url: '', // 填写servlet地址
        dataType: 'json', //预期的服务器响应的数据类型(数据包括预约成功的tag，姓名name、身份证号id、电话号码phonenum、预约口罩个数ordernum)
        success: function(result) { // 当请求成功时运行的函数
            if (result != null) {
                alert("预约成功，截图该提醒框为领域凭证" + JSON.stringify(result));
            }
        },
        error: function(result) { //失败的函数
            alert("请求数据失败");
        },

    });
}