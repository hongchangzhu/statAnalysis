<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="com.analysis.service.*"%>
<%
RegoinServiceImpl serviceImpl = new RegoinServiceImpl();
String regoinId = serviceImpl.getDefaultRegoinId();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>��ӭʹ����ԴӦ��ͳ��ϵͳ</title>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery/jquery-1.6.2.min.js" type="text/javascript"></script>
		<script src="<%=request.getContextPath()%>/js/jquery/miniui/miniui.js" type="text/javascript"></script>
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/default/miniui.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/default.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/stat.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/icons.css" rel="stylesheet" type="text/css" />
		<link href="<%=request.getContextPath()%>/js/jquery/miniui/themes/blue/skin.css" rel="stylesheet" type="text/css" />

<style type="text/css">

</style>

	</head>
<body>
	<div style="width:100%;">
		<div class="main">
			<div class="header" style="width:100%;height:150px;padding:0;over-flow:hidden;background:url(../images/tj-2_03.gif);"></div>
	    	<div class="bodycontent">
	    		<div id="form1" class="leftdiv" style="width:234px;height:605px;float:left;background:#eaf0f7">
    				<div class="title1" style="width:100%;height:30px;background:url(../images/tj-2_05.gif);"></div>
    				<p class="lineheight8"></p>
    				
    				<!-- ��ʡ�����ն�ͳ�� -->
    				<div id="cond1" class="lefttile">
						<span class="title">ʡ</span>
						<span class="condcss"><input id="provinceid" name="provinceid" class="mini-combobox" value="" textField="nodeName" valueField="id" onvaluechanged="onProvinceChanged" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond2" class="lefttile">
						<span class="title">��</span>
						<span class="condcss"><input id="cityid" name="cityid" class="mini-combobox" showNullItem="false" value="" textField="nodeName" valueField="id" onvaluechanged="onCityChanged" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond3" class="lefttile">
						<span class="title">�����أ�</span>
						<span class="condcss4"><input id="countryid" name="countryid" class="mini-combobox" showNullItem="false" value="" textField="nodeName" valueField="id" onvaluechanged="onCountryChanged" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond4" class="lefttile unbootDiv">
						<span class="title">�ն�վ��</span>
						<span class="condcss4"><input id="termid" name="termid" class="mini-combobox" showNullItem="false" value="" textField="termName" valueField="termId" style="width:145px;"/></span>
					</div>
					
					<p class="lineheight8"></p>
    				<div><img src="<%=request.getContextPath() %>/images/tj-2_09.gif"></div>
    				<p class="lineheight8"></p>

    				
    				<!-- ͳ��ʱ�� -->
    				<div id="cond5" class="lefttile">
						<span class="title" style="color:#17a2fe;">ͳ��ʱ��</span>
						<span class="condcss4"><input id="times" name="times" class="mini-combobox" showNullItem="true" url="data/timetype.txt" value="" textField="text" valueField="id" style="width:145px;"/></span>
					</div>
    				<p class="lineheight2"></p>
    				
    				<!-- ���� -->
    				<div class="weekmodel">
						<span></span>
						<span class=""><input id="weekyear" name="weekyear" showNullItem="true" class="mini-combobox condcss5" url="data/weekyears.txt" 
							value="" textField="text" valueField="id" style="width:68px;"/><span class="condcss5">&nbsp;-&nbsp;</span><input id="week" name="week" 
							showNullItem="true" class="mini-combobox condcss5" url="loadData.jsp?method=LoadWeekData" value="" textField="text" 
							valueField="id" style="width:65px;"/>
						</span>
					</div>
					<!-- ʱ��� -->
					<div class="periodmodel">
						<span class="datespan">��</span>
						<span><input id="date1" name="date1" class="mini-datepicker condcss6" value="" required="false" style="width:145px;"/></span>
					</div>
					<div class="periodmodel">
						<span class="datespan">��</span>
						<span><input id="date2" name="date2" class="mini-datepicker condcss6" value="" required="false" style="width:145px;"/></span>
					</div>
							
					<!-- ѧ�� -->
					<div class="semestermodel">
						<input id="semesteryear" name="semesteryear" showNullItem="true" class="mini-combobox semesteryearcss" url="data/semesteryears.txt" 
							value="" textField="text" valueField="id" style="width:80px;"/><span class="semestercss">&nbsp;-&nbsp;</span><input id="semester" name="semester" showNullItem="true" 
							class="mini-combobox semestercss" url="data/semesters.txt" value="" textField="text" valueField="id" style="width:65px;"/>
					</div>
					
					<p class="lineheight8"></p>
    				<div><img src="<%=request.getContextPath() %>/images/tj-2_09.gif"></div>
    				<p class="lineheight8"></p>
					
					<!-- ͳ��վ�� -->
					<div id="cond6" class="lefttile">
						<span class="title" style="color:#17a2fe;">ͳ��վ��</span>
						<span></span>
					</div>
					<p class="lineheight2"></p>
					<div id="cond8" class="lefttile unbootDiv">
						<span class="title">ѧ��</span>
						<span class="condcss2"><input id="subjectid" name="subjectid" showNullItem="true" class="mini-combobox" value="" onvaluechanged="onSubjectChanged" textField="subjectName" valueField="subjectId" style="width:145px;"/></span>
					</div>
					
					<p class="lineheight2"></p>
					<div id="cond7" class="lefttile unbootDiv">
						<span class="title">�꼶</span>
						<span class="condcss2"><input id="classid" name="classid" showNullItem="true" class="mini-combobox" value="" textField="bookCatelogName" valueField="bookCatelogId" style="width:145px;"/></span>
					</div>
					
					<p class="lineheight2"></p>
					<div id="cond9" class="lefttile">
						<span class="title">ͳ������</span>
						<span class=""><input id="opttypeid" name="opttypeid" class="mini-combobox condcss4" url="data/opttypes.txt" value="1" textField="text" valueField="id" style="width:145px;"/></span>
					</div>
					<p class="lineheight2"></p>
					<div id="tj">
						<span></span>
						<span class="tjcss"><img src="<%=request.getContextPath() %>/images/tj-2_12.gif" onclick="submitForm()" style="cursor:pointer;"></span>
					</div>

					<p class="lineheight8"></p>
					<!-- ��̨���� -->
					<div class="title1" style="width:100%;height:30px;background:url(../images/tj-2_15.gif);"></div>
					<p class="lineheight8"></p>
					<div class="">
						<span></span>
						<span class="condcss5"><input id="restype" name="restype" class="mini-combobox" url="data/restypes.txt" 
							value="1" textField="text" valueField="id" style="width:145px;"/>
						</span>
					</div>
					<p class="lineheight2"></p>
					<div class="">
						<span></span>
						<span class="condcss5"><input id="reststat" name="reststat" class="mini-combobox" url="data/resstat.txt" 
							value="1" textField="text" valueField="id" style="width:145px;"/>
						</span>
					</div>
					<p class="lineheight2"></p>
					<div class="periodmodel2">
						<div>
							<span></span>
							<span class="condcss6">��&nbsp;<input id="date3" name="date3" class="mini-datepicker" format="yyyy-MM-dd" value="" required="false" style="width:145px;"/></span>
						</div>
						<div>
							<span></span>
							<span class="condcss6">��&nbsp;<input id="date4" name="date4" class="mini-datepicker" format="yyyy-MM-dd" value="" required="false" style="width:145px;"/></span>
						</div>
					</div>
					
					<!-- ���� -->
    				<div class="weekmodel2">
						<span></span>
						<span class=""><input id="week2" name="week2" 
							showNullItem="false" class="mini-combobox condcss52" url="loadData.jsp?method=LoadWeekData" value="1" textField="text" 
							valueField="id" style="width:65px;"/>
						</span>
					</div>
					
					<p class="lineheight2"></p>
					<div id="cond8" class="lefttile backsub">
						<span class="title">ѧ��</span>
						<span class="condcss2"><input id="subjectid2" name="subjectid2" showNullItem="false" class="mini-combobox" onvaluechanged="onSubjectChanged2" value="" textField="subjectName" valueField="subjectId" style="width:145px;"/></span>
					</div>
					
					<p class="lineheight2"></p>
					<div id="cond7" class="lefttile backcls">
						<span class="title">�꼶</span>
						<span class="condcss2"><input id="classid2" name="classid2" nullItemText="" showNullItem="false" class="mini-combobox" value="" textField="bookCatelogName" valueField="bookCatelogId" style="width:145px;"/></span>
					</div>
					
					<p class="lineheight2"></p>
					<div id="tj2">
						<span></span>
						<span class="tjcss"><img src="<%=request.getContextPath() %>/images/tj-2_12.gif" onclick="submitForm2()" style="cursor:pointer;"></span>
					</div>
	    		</div>
	    		
	    		<div class="bgDiv" style="width:755px;float:left;height:605px;background:url(../images/tj-2_07.gif);">
	    			
	    			<div class="fusionchartsDiv" id="form2">
		    			<p style="margin:10px">
		    			<div class="chartstypecss">
		    				<span style="height:30px;"><input id="charttypesid" name="charttypesid" class="mini-combobox" url="data/chartstypes.txt" 
		    					value="../fusioncharts/Column3D.swf" textField="text" valueField="id" onvaluechanged="onChartsChanged"/></span>
		    				<span style="right:-412px;position:relative;height:30px;cursor:pointer;">
		    					<img src="<%=request.getContextPath() %>/images/xls.gif" onclick="exportRs()" title="����excel">
		    					<!-- <a href="#" onclick="exportRs()">��������</a> -->
		    					
		    				</span>
		    				<input id="exportcond" class="mini-hidden"/>
		    			</div>
		    			<p style="margin:5px">
		    			<div id="chartdiv" align="center"> </div>
		    		</div>
	    		
	    		</div>
	    	</div>
	    	
	    	<div class="footer" style="width:100%;height:22px;float:left;background:#e6e6e6;">
	    		<div style="width:100%;">
	    			<span style="font-family:Arial;font-size:13px;font-weight:normal;font-style:normal;text-decoration:none;color:#333333;">��Ȩ���У�����绯������</span>
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
var term = mini.get("termid");
var times = mini.get("times");
var charttypes = mini.get("charttypesid");
var opttype = mini.get("opttypeid");
var exportcond = mini.get("exportcond");
var restype = mini.get("restype");
var reststat = mini.get("reststat");
var subject = mini.get("subjectid");
var grade = mini.get("classid");
var subject2 = mini.get("subjectid2");
var grade2 = mini.get("classid2");

$(".periodmodel").hide();
$(".weekmodel").hide();
$(".semestermodel").hide();
//$(".fusionchartsDiv").hide();
$(".chartstypecss").hide();
$(".weekmodel2").hide();
$(".backsub").hide();
$(".backcls").hide();

//Ĭ����ʾ����		
var defaultregoinId = "<%=regoinId%>";

//����������������
$.ajax({
    url: "loadData.jsp?method=LoadRegionData&pid=1",
    type: "post",
    success: function (text) {
        var data = mini.decode(text);   //�����л��ɶ���
        province.setData(data);
        province.setValue(defaultregoinId);
        initCity(defaultregoinId);//�Զ�����Ĭ��ʡ�������
    }
});

//����ѧ���꼶����
$.ajax({
    url: "loadData.jsp?method=LoadSubjectData",
    type: "post",
    success: function (text) {
        var data = mini.decode(text);   //�����л��ɶ���
        var data2 = mini.clone(data);
        subject.setData(data);
        subject2.setData(data2);
    }
});

var chartxml;
function submitForm() {
    //�ύ������
    var form = new mini.Form("#form1");            
    var data = form.getData();      //��ȡ������ؼ�������
    var json = mini.encode(data);   //���л���JSON
    $(".chartstypecss").show();
    //$(".bgDiv").hide();
    exportcond.setValue(json);
    
    $.ajax({
        url: "<%=request.getContextPath()%>/termStatServlet.do",
        type: "post",
        data: { submitData: json },
        success: function (text) {
        	chartxml = text;
            var chartUrl = charttypes.getValue();
            fusionChartsShow(chartUrl);
        }
    });
}

function submitForm2() {
    //�ύ������
    var form = new mini.Form("#form1");            
    var data = form.getData();      //��ȡ������ؼ�������
    var vrestype = restype.getValue();
    var vreststat = reststat.getValue();
    
    var _begin = mini.get("date3").getFormValue();//data.date3;
    var _end = mini.get("date4").getFormValue();
    var beginStr = "";
    var endStr = "";
    data.date3 = _begin;
    data.date4 = _end;
    
    var json = mini.encode(data);   //���л���JSON
    //alert(json);
    
    var stattypename;
    if(vrestype == 1){
    	if(vreststat == 1){
    		stattypename = "��Դ�ϴ�����";
    	}else if(vreststat == 2){
    		stattypename = "��Դ�ϴ��ܵ�����(KB)";
    	}
    }else if(vrestype == 2){//��������
    	if(vreststat == 1){
    		stattypename = "��ѧ��ͳ����Դ��������(KB)";
    	}else if(vreststat == 2){
    		stattypename = "���꼶ͳ����Դ��������(KB)";
    	}else if(vreststat == 3){
    		stattypename = "������ͳ����Դ��������(KB)";
    	}else if(vreststat == 4){
    		stattypename = "��ʱ���ͳ����Դ�����ܵ�����(KB)";
    	}
    }else if(vrestype == 3){//��������
    	if(vreststat == 1){
    		stattypename = "��ѧ��ͳ����Դ��������(KB)";
    	}else if(vreststat == 2){
    		stattypename = "���꼶ͳ����Դ��������(KB)";
    	}else if(vreststat == 3){
    		stattypename = "������ͳ����Դ��������(KB)";
    	}else if(vreststat == 4){
    		stattypename = "��ʱ���ͳ����Դ�����ܵ�����(KB)";
    	}
    }else if(vrestype == 4){//��������
    	if(vreststat == 1){
    		stattypename = "��ѧ��ͳ����Դ��������(KB)";
    	}else if(vreststat == 2){
    		stattypename = "���꼶ͳ����Դ��������(KB)";
    	}else if(vreststat == 3){
    		stattypename = "������ͳ����Դ��������(KB)";
    	}else if(vreststat == 4){
    		stattypename = "��ʱ���ͳ����Դ�����ܵ�����(KB)";
    	}
    }
    
    $(".chartstypecss").hide();
    
    $.ajax({
        url: "<%=request.getContextPath()%>/backStageServlet.do",
        type: "post",
        data: { submitData: json },
        success: function (text) {
        	//alert(text);
        	var _rv = mini.decode(text);
        	var code = _rv.ReCode;
            var resultNum = 0;
            if(code == 0){
	            resultNum = _rv.ReValue;
            }
            var table = $("<table></table>").addClass("stattable");
            
            var tr1 = $("<tr></tr>");
            var td11 = $("<td></td>").addClass("tdTitle").text(stattypename + "��");
            var td12 = $("<td></td>").text(resultNum);
            var col1 = tr1.append(td11, td12);
            table.append(col1);
            
            var tr2 = $("<tr></tr>");
            var td21 = $("<td></td>").addClass("tdTitle").text("��ʼʱ�䣺");
            var td22 = $("<td></td>").text(_begin);
            var col2 = tr2.append(td21, td22);
            
            var tr3 = $("<tr></tr>");
            var td31 = $("<td></td>").addClass("tdTitle").text("����ʱ�䣺");
            var td32 = $("<td></td>").text(_end);
            var col3 = tr3.append(td31, td32);
            
            
            
            table.append(col2, col3);
            $("#chartdiv").html(table);
        }
    });
}

function exportRs(){
	var exJson = exportcond.getValue();
	window.location.href = "<%=request.getContextPath()%>/exportDataServlet.do?submitData="+exJson;
}

function loading() {
	mini.mask({
	    el: document.body,
	    cls: 'mini-mask-loading',
	    html: '������...'
	});
	setTimeout(function () {
	    mini.unmask(document.body);
	}, 2000);
}

function GetRegionData() {
    $.ajax({
        url: "loadData.jsp?method=SubmitData",
        type: "post",
        beforeSend:function() {
        	mini.mask({
	            el: document.body,
	            cls: 'mini-mask-loading',
	            html: '���ݸ����У����Ե�...'
        	});
        },
        success: function (text) {
            //alert("�������������ɹ���");
            mini.unmask(document.body);
            showTips();
        }
    });
}
function showTips() {
    var x = "center";
    var y = "center";
    var state = "success";;
    mini.showTips({
        content: "���ݸ��³ɹ�",
        state: state,
        x: x,
        y: y,
        timeout: 3000
    });
}
//��Ⱦͳ��ͼ��
function fusionChartsShow(chartUrl){
	var chart = new FusionCharts(chartUrl, "ChartId", "600", "500", "0", "0");
	   chart.setDataXML(chartxml);
	   chart.render("chartdiv");
}

//ͼ�������¼�
function onChartsChanged(e){
	var chartUrl = charttypes.getValue();
	fusionChartsShow(chartUrl);
}
var nullData = [];

//ѡ��ʡͬʱ�г��������������
function onProvinceChanged(e) {
    var id = province.getValue();
    city.setData(nullData);
    country.setData(nullData);
    term.setData(nullData);
    
    city.setValue("");
    country.setValue("");
    term.setValue("");
    var url = "loadData.jsp?method=LoadRegionData&pid=" + id
    city.setUrl(url);
}

//ѡ����ͬʱ�г�����������
function onCityChanged(e) {
    var id = city.getValue();
    country.setData(nullData);
    term.setData(nullData);
    
    country.setValue("");
    term.setValue("");
    var url = "loadData.jsp?method=LoadRegionData&pid=" + id
    country.setUrl(url);
}

//ѡ����ͬʱ�г����������ն�վ��
function onCountryChanged(e) {
    var id = country.getValue();
    term.setData(nullData);
    term.setValue("");
    var url = "loadData.jsp?method=LoadTermData&regionid=" + id
    term.setUrl(url);
}

function onSubjectChanged(e){
	var id = subject.getValue();
    grade.setData(nullData);
    grade.setValue("");
    var url = "loadData.jsp?method=LoadBookCatelogData&subjectId=" + id
    grade.setUrl(url);
}

function onSubjectChanged2(e){
	var id = subject2.getValue();
	var vrestype = restype.getValue();
    var vreststat = reststat.getValue();
    if(vrestype == 2 || vrestype == 3){
    	if(vreststat == 2){
    		grade2.setData(nullData);
    		grade2.setValue("");
    		var url = "loadData.jsp?method=LoadBookCatelogData&subjectId=" + id
    		grade2.setUrl(url);
    	}
    }
}

opttype.on("valuechanged", function (e) {
	var value = this.getValue();
    if(value == '1' || value == '3' || value == '4'){
    	$(".unbootDiv").show();
    }else if(value == '2'){
    	$(".unbootDiv").hide();
    }
});

restype.on("valuechanged", function (e) {
	var value = this.getValue();
    if(value == '2' || value == '3' || value == '4' || value == '5'){
    	reststat.setUrl("data/resstat2.txt");
    	$(".backsub").show();
   		$(".backcls").hide();
   		$(".weekmodel2").hide();
   		$(".periodmodel2").hide();
    }else if(value == '1'){
    	reststat.setUrl("data/resstat.txt");
    	$(".backsub").hide();
   		$(".backcls").hide();
   		$(".weekmodel2").hide();
   		$(".periodmodel2").show();
    }
});

reststat.on("valuechanged", function (e) {
	var restypeV = restype.getValue();
	var value = this.getValue();
    if((restypeV == '2' || restypeV == '3' || restypeV == '4' || restypeV == '5')){
    	if(value == '1'){//��ѧ��ͳ����Դ
    		$(".backsub").show();
    		$(".backcls").hide();
    		$(".weekmodel2").hide();
    		$(".periodmodel2").hide();
    	}else if(value == '2'){//���꼶ͳ����Դ
    		$(".backsub").show();
    		$(".backcls").show();
    		$(".weekmodel2").hide();
    		$(".periodmodel2").hide();
    	}else if(value == '3'){//������ͳ����Դ
    		$(".backsub").hide();
    		$(".backcls").hide();
    		$(".weekmodel2").show();
    		$(".periodmodel2").hide();
    	}else if(value == '4'){//��ʱ���ͳ����Դ
    		$(".backsub").hide();
    		$(".backcls").hide();
    		$(".weekmodel2").hide();
    		$(".periodmodel2").show();
    	}
    }else{
    	$(".backsub").hide();
    	$(".backcls").hide();
    	$(".weekmodel2").hide();
    	$(".periodmodel2").show();
    }
});

function initCity(pid){
	$.ajax({
	    url: "loadData.jsp?method=LoadRegionData&pid=" + pid,
	    type: "post",
	    success: function (text) {
	        var data = mini.decode(text);   //�����л��ɶ���
	        var all = {"id":"","nodeName":"ȫ��"};
        	data.unshift(all);
	        city.setData(data);
	    }
	});
}
times.on("valuechanged", function (e) {
	var value = this.getValue();
	
    if(value == '1'){//����ͳ��
    	$(".weekmodel").show();
    	$(".periodmodel").hide();
    	$(".semestermodel").hide();
    }else if(value == '2'){//��ʱ���ͳ��
    	$(".periodmodel").show();
    	$(".weekmodel").hide();
		$(".semestermodel").hide();
    }else if(value == '3'){//��ѧ��ͳ��
    	$(".semestermodel").show();
		$(".weekmodel").hide();
		$(".periodmodel").hide();
    }else {
		$(".periodmodel").hide();
		$(".weekmodel").hide();
		$(".semestermodel").hide();
    }
});


// ��Date����չ���� Date ת��Ϊָ����ʽ��String   
// ��(M)����(d)��Сʱ(h)����(m)����(s)������(q) ������ 1-2 ��ռλ����   
// ��(y)������ 1-4 ��ռλ��������(S)ֻ���� 1 ��ռλ��(�� 1-3 λ������)   
// ���ӣ�   
// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423   
// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18   
Date.prototype.format = function(fmt){ //author: meizz   
  var o = {   
    "M+" : this.getMonth()+1,                 //�·�   
    "d+" : this.getDate(),                    //��   
    "h+" : this.getHours(),                   //Сʱ   
    "m+" : this.getMinutes(),                 //��   
    "s+" : this.getSeconds(),                 //��   
    "q+" : Math.floor((this.getMonth()+3)/3), //����   
    "S"  : this.getMilliseconds()             //����   
  };   
  if(/(y+)/.test(fmt))   
    fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length));   
  for(var k in o)   
    if(new RegExp("("+ k +")").test(fmt))   
  fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));   
  return fmt;   
}
</script>
