<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script  src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/information.js"></script> 
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>口罩预约平台</title>
    <style type="text/css">
    html,body
    {
        width: 100%;
        height: 100%;
        margin: 0;
        padding: 0;
    }
    body {
    background-color: rgba(0, 191, 191, 1);
    }
    .btn
    {
        cursor: pointer;
        border-width: 0px;
        margin-top: 30px;
        width: 400px;
        height: 100px;
        border-radius: 15px;
        font-size: 20px;
    }
    .btn:hover
    {
        color:white;
        background-color:#0489B1
    }
    #btn1/*首页的两个按钮 */
    {
        width: 400px;
        height:300px;
        margin: 0 auto;
        position: relative;
        top: 50%;
        margin-top: -150px;

    }
    .btn2 /* 开始预约、结束预约按钮*/
    {
        color: white;
        background-color: rgba(0, 191, 191, 1);
        width: 100px;
        height: 40px;
        border-radius: 10px;
    }
    .form /*表单格式设置*/
    {
        margin-top: 5px;

    }

    </style>
</head>
<body>
    <div id="btn1"> 
        <button class="btn" data-toggle="modal" data-target="#myModal">
            口罩预约购买
        </button>
        <button type="button" class="btn">中签结果查询</button>
    </div>
    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        &times;
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                       登记信息
                    </h4>
                </div>
                <div class="modal-body" style="display: flex;justify-content: center;flex-direction: column;">
                    <form>
                        <div class="form">姓名:<input id="name" type="text" name="name"></div>
                        <div class="form">身份证号:<input id="idcard" type="text" name="idcard"></div>
                        <div class="form">手机号:<input id="tel" type="text" name="tel"></div>
                        <div class="form">预约口罩数量:
                            <select id="number">
                                <option value ="1">1个</option>
                                <option value ="2">2个</option>
                                <option value ="3">3个</option>
                            </select>
                        </div>
                    </form>  
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn2" data-dismiss="modal" >结束当前预约
                    </button>
                    <button type="button" class="btn2" onclick="order()">开始新的预约
                    </button>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>