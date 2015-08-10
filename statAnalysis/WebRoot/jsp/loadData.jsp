<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,java.lang.reflect.*"%>
<%@ page import="com.analysis.service.*"%>
<%@ page import="com.analysis.po.Label"%>
<%@ page import="com.analysis.po.QueryCondition"%>
<%@ page import="java.util.*"%>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.GsonBuilder"%>
<%@ page import="com.google.gson.reflect.TypeToken"%>
<%@ page import="com.analysis.utils.DateTool;"%>

<% 		
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");	
	 
    String methodName = request.getParameter("method");
    
       
    Class[] argsClass = new Class[2]; 
    argsClass[0] = HttpServletRequest.class;
    argsClass[1] = HttpServletResponse.class;
    
    Class cls = this.getClass();   
    Method method = cls.getMethod(methodName, argsClass);   
    
    Object[] args = new Object[2];
    args[0] = request;
    args[1] = response;   
    method.invoke(this, args);     
   	
%>
<%!
	/*加载行政区划数据*/
	public void LoadRegionData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String pid = request.getParameter("pid");
		//System.out.println(pid);
		long start = System.currentTimeMillis();
		RegoinServiceImpl serviceImpl = new RegoinServiceImpl();
		String jsonData = serviceImpl.fromObject2Json(pid);
		long end = System.currentTimeMillis();
		System.out.println("取行政区划数据花费时间：" + (end - start) + "ms");
		response.getWriter().write(jsonData);
	}
	
	public void LoadSubjectData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		SubjectServiceImpl serviceImpl = new SubjectServiceImpl();
		String jsonData = serviceImpl.fromSubject2Json();
		response.getWriter().write(jsonData);
	}
	
	public void LoadBookCatelogData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String subjectId = request.getParameter("subjectId");
		SubjectServiceImpl serviceImpl = new SubjectServiceImpl();
		String jsonData = serviceImpl.fromBookCatelog2Json(subjectId);
		response.getWriter().write(jsonData);
	}
	
	/*加载终端数据*/
	public void LoadTermData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String regionid = request.getParameter("regionid");
		//System.out.println("通过区划id得到终端数据：" + regionid);
		long start = System.currentTimeMillis();
		TermServiceImpl serviceImpl = new TermServiceImpl();
		String jsonData = serviceImpl.fromObject2Json(regionid);
		System.out.println("终端数据：" + jsonData);
		long end = System.currentTimeMillis();
		System.out.println("取终端数据花费时间：" + (end - start) + "ms");
		response.getWriter().write(jsonData);
	}
	
	/*加载周数据*/
	public void LoadWeekData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		List list = new ArrayList();
		//Calendar cal = Calendar.getInstance();
		//int year = cal.get(Calendar.YEAR);
		//int weekCount = DateTool.getMaxWeekNumOfYear(year);
		Label label = null;
		//一年53周
		for(int i = 1; i <= 53; i++){
			label = new Label();
			label.setId(i);
			label.setText("第" + i + "周");
			list.add(label);
		}
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		String jsonData = g.toJson(list);
		response.getWriter().write(jsonData);
	}
	
	public void SubmitData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String submitJSON = request.getParameter("submitData");
		Gson g = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss")
				.create();
		QueryCondition cond = g.fromJson(submitJSON, new TypeToken<QueryCondition>(){
		}.getType());
		
		response.getWriter().write("1");
	}
	
	public void GetRegionData(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		RegoinServiceImpl serviceImpl = new RegoinServiceImpl();
		serviceImpl.updateAll();
		response.getWriter().write("1");
	}
%>
