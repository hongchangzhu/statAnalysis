package com.analysis.xfire.service;

import java.net.MalformedURLException;
import java.net.URL;

import org.codehaus.xfire.client.Client;

public class TestService{

	/**
	 * @功能：
	 * 
	 * @param args
	 */
	public static void main(String[] args){
		testUnBoot();
	}

	public static void testTakeOver(){
		String data = "[{\"resourceId\": \"ff808081429511330142b62e65ec1b61\","
				+ "\"resourceName\": \"化学试题\"," + "\"termId\": \"1\","
				+ "\"subjectId\": \"3\"," + "\"classId\": \"2\","
				+ "\"optCount\": 18},"
				+ "{\"resourceId\": \"ff808081429511330142b62e65ec1b62\","
				+ "\"resourceName\": \"数学试题\"," + "\"termId\": \"1\","
				+ "\"subjectId\": \"2\"," + "\"classId\": \"3\","
				+ "\"optCount\": 15}]";
		try{
			Client client = new Client(
					new URL(
							"http://10.85.80.54:8081/statAnalysis/services/termService?wsdl"));
			Object[] result = client.invoke("takeOver", new Object[] { data });
			// System.out.println(result[0]);
		}catch(MalformedURLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public static void testUnBoot(){
		String data = "[{\"termId\": \"1\"}," + "{\"termId\": \"2\"}]";
		try{
			Client client = new Client(
					new URL(
							"http://10.85.80.54:8081/statAnalysis/services/termService?wsdl"));
			Object[] result = client.invoke("unBootStrap",
					new Object[] { data });
			// System.out.println(result[0]);
		}catch(MalformedURLException e){
			e.printStackTrace();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
