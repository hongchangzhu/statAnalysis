<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.analysis.service.*"%>
<%
RegoinServiceImpl serviceImpl = new RegoinServiceImpl();
String regoinId = serviceImpl.getDefaultRegoinId();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
		<title>欢迎使用统计管理系统</title>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/jquery/miniui/miniui.js" type="text/javascript"></script>
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />

<style type="text/css">
body{TEXT-ALIGN: center;}
.lefttile{
text-align:left;
margin-left:10px;
}
.righttile{
text-align:right;
margin-left:10px;
}
.main{
text-align:center;
width:990px;
height:835px;
margin-left:auto;
margin-right:auto;
}
.title{
font-family:Arial;
font-size:13px;
font-weight:bold;
font-style:normal;
text-decoration:none;
color:#17a2fe;
left:2px;
position:relative
}
.title2{
font-family:Arial;
font-size:13px;
font-weight:normal;
font-style:normal;
text-decoration:none;
color:#333333;
left:2px;
position:relative
}
.condcss{
right:-25px;
position:relative
}
.condcss2{
right:-54px;
position:relative
}
.condcss3{
right:-85px;
position:relative
}
.condcss6{
right:-24px;
position:relative
}
.condcss7{
right:-26px;
position:relative
}
.condcss4{
right:-15px;
position:relative
}
.tjcss{
right:-2px;
position:relative
}
.chartstypecss{
text-align:left;
left:57px;
position:relative
}
.lineheight8{
margin:8px;
}
.lineheight2{
margin:4px;
}
.loaddatacss{
position:relative;
top:250px;
text-align:center;
width:150px;
height:40px;
margin-left:auto;
margin-right:auto;
}
</style>

	</head>
<body>
	<div style="width:100%;">
		<div class="main">
			<div class="header" style="width:100%;height:150px;padding:0;over-flow:hidden;background:url(../images/tj-2_03.gif);"></div>
	    	<div class="bodycontent">
	    		<div id="form1" class="leftdiv" style="width:234px;height:605px;float:left;background:#eaf0f7">

    				<p class="lineheight8"></p>
    				<div class="lefttile">
    					<span class="title">行政区划</span>
    					<span class="condcss">
    						<a class="mini-button" onclick="GetRegionData" iconCls="icon-reload">获取行政区划数据</a>
    					</span>
    				</div>
    				<p class="lineheight8"></p>
    				<div class="line1" style="width:100%"><img src="<%=request.getContextPath() %>/images/tj-2_09.gif"></div>
    				<p class="lineheight8"></p>
    				<div class="lefttile">
    					<span class="title">终端站点</span>
    					<span class="condcss">
    					</span>
    				</div>
    				
    				<div id="cond1" class="lefttile">
						<span class="title2">省</span>
						<span class="condcss2"><input id="provinceid" name="provinceid" class="mini-combobox" showNullItem="true" value="" textField="nodeName" valueField="id" onvaluechanged="onProvinceChanged" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond2" class="lefttile">
						<span class="title2">市</span>
						<span class="condcss2"><input id="cityid" name="cityid" class="mini-combobox" showNullItem="true" value="" textField="nodeName" valueField="id" onvaluechanged="onCityChanged" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond3" class="lefttile">
						<span class="title2">区（县）</span>
						<span class="condcss4"><input id="countryid" name="countryid" class="mini-combobox" showNullItem="true" value="" textField="nodeName" valueField="id" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div class="lefttile">
    					<span class="title"></span>
    					<span class="condcss3">
    						<a class="mini-button" onclick="GetTermData" iconCls="icon-reload">获取终端站点数据</a>
    					</span>
    				</div>
    				
    				<p class="lineheight8"></p>
    				<div class="line1" style="width:100%"><img src="<%=request.getContextPath() %>/images/tj-2_09.gif"></div>
    				<p class="lineheight8"></p>
    				<div class="lefttile">
    					<span class="title">学科年级</span>
    					<span class="condcss">
    						<a class="mini-button" onclick="GetSubjectData" iconCls="icon-reload">获取学科年级数据</a>
    					</span>
    				</div>
							
	    		</div>
	    		<div class="bgDiv" style="width:755px;float:left"><img src="<%=request.getContextPath() %>/images/tj-2_07.gif"></div>
	    	</div>
	    	
	    	<div class="footer" style="width:100%;height:22px;float:left;background:#e6e6e6;">
	    		<div style="width:100%;">
	    			<span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">版权所有：中央电化教育馆</span>
	    		</div>
	    	</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript">
mini.parse();
var province = mini.get("provinceid");
var city = mini.get("cityid");
var country = mini.get("countryid");
//加载行政区划数据
$.ajax({
    url: "loadData.jsp?method=LoadRegionData&pid=1",
    type: "post",
    success: function (text) {
        var data = mini.decode(text);   //反序列化成对象
        province.setData(data);
    }
});

function GetRegionData() {
    $.ajax({
        url: "<%=request.getContextPath()%>/getAllRegionServlet.do",
        type: "post",
        beforeSend:function() {
        	mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading loaddatacss',
	            html: '数据更新中，请稍等...'
        	});
        },
        success: function (text) {
            mini.unmask(document.body);
            alert("更新行政区划成功！");
            //showTips();
        },
        errot: function (text) {
            mini.unmask(document.body);
            alert("更新行政区划失败！");
        }
    });
}

function GetSubjectData() {
    $.ajax({
        url: "<%=request.getContextPath()%>/getSubjectDataServlet.do",
        type: "post",
        beforeSend:function() {
        	mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading loaddatacss',
	            html: '数据更新中，请稍等...'
        	});
        },
        success: function (text) {
            mini.unmask(document.body);
            alert("更新学科年级成功！");
            //showTips();
        },
        errot: function (text) {
            mini.unmask(document.body);
            alert("更新学科年级失败！");
        }
    });
}

function GetTermData() {
	var form = new mini.Form("#form1");            
    var data = form.getData();      //获取表单多个控件的数据
    var json = mini.encode(data);   //序列化成JSON
    //alert(json);
    $.ajax({
        url: "<%=request.getContextPath()%>/getTermServlet.do",
        type: "post",
        data: { submitData: json },
        beforeSend:function() {
        	mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading loaddatacss',
	            html: '数据更新中，请稍等...'
        	});
        	
        },
        success: function (text) {
            mini.unmask(document.body);
            alert("更新终端站点成功！");
            //showTips();
        },
        errot: function (text) {
            mini.unmask(document.body);
            alert("更新终端站点失败！");
        }
    });
}
function showTips() {
    var x = "center";
    var y = "center";
    var state = "success";;
    mini.showTips({
        content: "数据更新成功",
        state: state,
        x: x,
        y: y,
        timeout: 3000
    });
}
var nullData = [];
//选择省同时列出其下面的所有市
function onProvinceChanged(e) {
    var id = province.getValue();
    city.setData(nullData);
    country.setData(nullData);
    
    city.setValue("");
    country.setValue("");
    var url = "loadData.jsp?method=LoadRegionData&pid=" + id
    city.setUrl(url);
}

//选择市同时列出其下所有县
function onCityChanged(e) {
    var id = city.getValue();
    country.setData(nullData);
    
    country.setValue("");
    var url = "loadData.jsp?method=LoadRegionData&pid=" + id
    country.setUrl(url);
}
</script>
