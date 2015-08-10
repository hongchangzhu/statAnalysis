package com.analysis.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.apache.commons.lang.StringUtils;

public class DateTool{
	/**
	 * ����: �����ڶ�����ĳ�ָ�ʽ����ת��������ת������ַ���
	 * 
	 * @param date
	 *            ���ڶ���
	 * @param pattern
	 *            ת����ʽ ����yyyy-MM-dd
	 */
	public static String DateToString(Date date, String pattern){
		String strDateTime = null;

		SimpleDateFormat formater = new SimpleDateFormat(pattern);
		strDateTime = date == null ? null : formater.format(date);
		return strDateTime;
	}

	/**
	 * ����: ����������ڶ�����yyyy-MM-dd��ʽת�����ַ�������
	 * 
	 * @param date
	 *            ���ڶ���
	 * @return String
	 */
	public static String DateToString(Date date){
		String _pattern = "yyyy-MM-dd";
		return date == null ? null : DateToString(date, _pattern);
	}

	public static Calendar getCalendar(Date date){
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		return cal;
	}

	/**
	 * ��һ���ַ���(һ��Ҫ��֤����ȷ����)ת����Java��Date�� ���ʧ�ܷ���null �����ʽ��֧���뽫��ʽ���ӵ�datePattern��
	 * 
	 * @param source
	 *            ����������ַ���
	 * @return Date
	 */
	public static Date parseDate(String source){
		if(source == null || source.length() == 0)
			return null;
		String[] datePattern = { "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd",
				"HH:mm:ss", "yyyy-MM-dd HH:mm" };
		Date date = null;
		for(int i = 0; i < datePattern.length; i++){
			date = parseDate(source, datePattern[i]);
			if(date != null)
				break;
		}
		datePattern = null;
		return date;
	}

	public static java.sql.Date parseSqlDate(String pattern){
		Date date = parseDate(pattern);
		java.sql.Date returnV;
		returnV = new java.sql.Date(date.getTime());
		return returnV;
	}

	/**
	 * ��һ��ָ����ʽ�������ַ���ת����Java��Date�� ���ʧ�ܷ���null
	 * 
	 * @param source
	 *            ����������ַ���
	 * @param format
	 *            ���ڵĸ�ʽ
	 * @return Date
	 */
	public static Date parseDate(String dateStr, String format){
		if(StringUtils.isBlank(dateStr))
			return null;

		SimpleDateFormat dateFormat = new SimpleDateFormat(format);
		Date date = null;

		try{
			date = dateFormat.parse(dateStr);
		}catch(ParseException e){
			// do nothing.
		}

		return date;
	}

	/**
	 * ȡ�ô��������Ƕ�����
	 * 
	 * @param date
	 * @return �ڼ���
	 */
	public static int getWeekOfYear(Date date){
		Calendar c = new GregorianCalendar();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setMinimalDaysInFirstWeek(7);
		c.setTime(date);

		return c.get(Calendar.WEEK_OF_YEAR);
	}

	/**
	 * ȡ�õ�ǰ�����Ƕ�����
	 * 
	 * @return �ڼ���
	 */
	public static int getWeekOfYear(){
		return getWeekOfYear(new Date());
	}

	/**
	 * �õ�ĳһ���ܵ�����
	 * 
	 * @param year
	 * @return ĳһ���ܵ�����
	 */
	public static int getMaxWeekNumOfYear(int year){
		Calendar c = new GregorianCalendar();
		c.set(year, Calendar.DECEMBER, 31, 23, 59, 59);

		return getWeekOfYear(c.getTime());
	}

	/**
	 * �õ�ĳ��ĳ�ܵĵ�һ��
	 * 
	 * @param year
	 * @param week
	 * @return ĳ��ĳ�ܵĵ�һ��
	 */
	public static Date getFirstDayOfWeek(int year, int week){
		Calendar c = new GregorianCalendar();
		c.set(Calendar.YEAR, year);
		c.set(Calendar.MONTH, Calendar.JANUARY);
		c.set(Calendar.DATE, 1);

		Calendar cal = (GregorianCalendar) c.clone();
		cal.add(Calendar.DATE, week * 7);

		return getFirstDayOfWeek(cal.getTime());
	}

	/**
	 * ����: ��������ַ�������ʽת���ɶ�Ӧ�����ڶ���
	 * 
	 * @param str
	 *            �ַ���
	 * @param pattern
	 *            ��ʽ
	 * @return Date
	 */
	public static Date StringToDate(String str, String pattern){
		Date dateTime = null;
		try{
			if(str != null && !str.equals("")){
				SimpleDateFormat formater = new SimpleDateFormat(pattern);
				dateTime = formater.parse(str);
			}
		}catch(Exception ex){
		}
		return dateTime;
	}

	/**
	 * ȡ�õ�ǰ���������ܵĵ�һ��
	 * 
	 * @param date
	 * @return ��ǰ���������ܵĵ�һ��
	 */
	public static Date getFirstDayOfWeek(Date date){
		Calendar c = new GregorianCalendar();
		c.setFirstDayOfWeek(Calendar.MONDAY);
		c.setTime(date);
		c.set(Calendar.DAY_OF_WEEK, c.getFirstDayOfWeek()); // Monday
		return c.getTime();
	}

	/**
	 * 
	 * @���ܣ���ȡָ��ĳ��ĳ�ܵĵ�һ��������ַ���
	 * 
	 * @param year
	 * @param week
	 * @return
	 */
	public static String getFirstDayOfYearWeek(int year, int week){
		Date date = DateTool.getFirstDayOfWeek(year, week - 1);
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		int curyear = cal.get(Calendar.YEAR);
		// �����һ������һ������ڄt����1��1��
		if(curyear != year)
			return year + "-01-01";

		return DateToString(date, "yyyy-MM-dd");
	}

	/**
	 * 
	 * @���ܣ���ȡָ��ĳ��ĳ�ܵ����һ��������ַ���
	 * 
	 * @param year
	 * @param week
	 * @return
	 */
	public static String getLastDayOfYearWeek(int year, int week){
		Date date = DateTool.getFirstDayOfWeek(year, week);

		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		cal.add(Calendar.DAY_OF_MONTH, -1);
		int curyear = cal.get(Calendar.YEAR);
		// ������һ������һ������ڄt����12��31��
		if(curyear != year)
			return year + "-12-31";

		return DateToString(cal.getTime(), "yyyy-MM-dd");
	}

}
