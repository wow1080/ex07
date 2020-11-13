<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
      <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     <script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
    <title>받은 메세지</title>
     <style>
        .read{color:blue; font-size:18px;}
        .unread{color:red; font-size:18px;}
    </style>
</head>
<body>
    <h1>[받은 메세지]</h1>
    <table border="1">
        <tr>
            <td width=100>받은이</td>
            <td width=100>${vo.uname}</td>
            <td width=100>포인트</td>
            <td width=100><b><span id="point">${vo.point}</span></b></td>
        </tr>
    </table>
    <table border="1" id="tbl"></table>
    <script id="temp" type="text/x-handlebars-template">
        <tr>
            <td width=130>보낸이</td>
            <td width=300>내용</td>
            <td width=200>보낸날짜</td>
            <td width=100>읽기</td>
        </tr>
        {{#each .}}
        <tr class="row">
            <td>{{sender}}:{{uname}}</td>
            <td>{{message}}</td>
            <td>{{sendDate}}</td>
            <td><button class="{{confirm readDate}}" mid="{{mid}}">읽기</button></td>
        </tr>
        {{/each}}
    </script>
    <script>
        Handlebars.registerHelper("confirm", function(readDate){
    	    if(!readDate) return "unread";
    	    else return "read";           		      	
        });
    </script>
    <div id="divRead" style="width:700px; background:pink;color:#000000;padding:10px;">
        보낸이:<span id="sender"></span><br>
        내용:<span id="message"></span><br>
        발신일:<span id="sendDate"></span><br>
        수신일:<span id="readDate"></span><br>
    </div>
</body>
<script>
    var receiver="${vo.uid}";
    getList();
    $("#divRead").hide();
    
    
    $("#tbl").on("click",".row button", function(){
    	 var mid=$(this).attr("mid");
    	 $("#divRead").show();
    	 $.ajax({
    		 type:"get",
    		 url:"readMessage",
    		 data:{"mid":mid},
    		 success:function(data){
    			 $("#sender").html(data.uname);
    			 $("#message").html(data.message);
    			 $("#sendDate").html(data.sendDate);
    			 $("#readDate").html(data.readDate);
    			 getList();
    			 getUser();
    		 }
    	 });
    });
    function getList(){
    	$.ajax({
    		type:"get",
    		url:"receiveList",
    		data:{"receiver":receiver},
    		success:function(data){
    			 var temp = Handlebars.compile($("#temp").html());
     	        $("#tbl").html(temp(data));
    		}
    	});
    }
    
    
    function getUser(){
    	$.ajax({
    		type:"get",
    		url:"read",
    		data:{"uid":receiver},
    		success:function(data){
    			$("#point").html(data.point);
    		}
    	});
    }
</script>
</html>