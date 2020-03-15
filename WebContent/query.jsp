<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/query.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>口罩预约查询</title>
    <style type="text/css">
        html,
        body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
        }
        
        body {
            background-color: rgba(0, 191, 191, 1);
        }
        
        * {
            padding: 0;
            margin: 0;
        }
        
        #btn1
        /*首页的两个按钮 */
        
        {
            width: 600px;
            height: 150px;
            margin: 0 auto;
            position: relative;
            top: 50%;
            margin-top: -150px;
            /*background-color: aquamarine;*/
        }
        
        .input {
            border-radius: 15px;
            height: 50px;
            width: 430px;
            border: 1px white;
            font-size: large;
            top: 0px;
            left: 0px;
            right: 0px;
            bottom: 20px;
            margin: auto;
        }
        
        .btn {
            cursor: pointer;
            border-width: 0px;
            margin-top: 30px;
            width: 200px;
            height: 50px;
            border-radius: 15px;
            font-size: 20px;
            position: fixed;
            top: 0px;
            left: 400px;
            right: 0px;
            bottom: 250px;
            margin: auto;
        }
        
        .btn:hover {
            color: white;
            background-color: #0489B1
        }
    </style>

    <script type="text/javascript">
        function validateForm() {
            var x = document.forms["query"]["fname"].value;
            if (x == null || x == "") {
                alert("未填写预约单号");
                return false;
            }
        }
    </script>

</head>

<body>
    <div id="btn1">
        <form name="query" action="SearchServlet" onsubmit="return validateForm()" method="post">
            <input type="text" name="fname" placeholder="请输入预约单号" class="input">
            <input type="submit" value="查询" onclick="query()" class="btn">
        </form>
    </div>
</body>

</html>