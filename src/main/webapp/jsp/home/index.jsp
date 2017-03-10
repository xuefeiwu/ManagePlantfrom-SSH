<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/welcome.css">
<script type="text/javascript">
	//websocket 
	var websocket = null;
     //判断当前浏览器是否支持WebSocket
     if ('WebSocket' in window) {
         websocket = new WebSocket("ws://127.0.0.1:8888/ManagePlantfrom-SSH/websocket");
     }
     else {
         alert('当前浏览器不支持websocket，请使用 IE 11浏览器');
     }
 
     //连接发生错误的回调方法
     websocket.onerror = function (evt) {
         alert("连接发生错误"); 
     };
     //连接成功建立的回调方法
     websocket.onopen = function () {
         alert("WebSocket连接成功");
         var ip=getcookie("ip");
         if(ip!=null){
         	websocket.send(ip);
         }
    };

     //接收到消息的回调方法
     websocket.onmessage = function (event) {
     	location.href="${pageContext.request.contextPath }/"+event.data+"_loadInfor.action";
     };

     //连接关闭的回调方法
     websocket.onclose = function () {
      alert("WebSocket连接关闭");
     };
     //监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
     window.onbeforeunload = function () {
         closeWebSocket();
     };
     //关闭WebSocket连接
     function closeWebSocket() {
         websocket.close();
     }
     //获取cookie
     function getcookie(objname){//获取指定名称的cookie的值
		var arrstr = document.cookie.split("; ");
		for(var i = 0;i < arrstr.length;i++){
			var temp = arrstr[i].split("=");
			if(temp[0] == objname) return unescape(temp[1]);
		}
	}
</script>
</head>
<body>
<div class="container">
	<section class="main">
		
		<h2 class="cs-text" id="cs-text">
			<span><span class="char1">欢</span></span>
			<span><span class="char2">迎</span></span>
			<span><span class="char3">登</span></span>
			<span><span class="char4">陆</span></span>
			<span><span class="char5">管</span></span>
			<span><span class="char6">理</span></span>
			<span><span class="char7">系</span></span>
			<span><span class="char8">统</span></span>
		</h2>
	</section>
</div>
</body>
</html>