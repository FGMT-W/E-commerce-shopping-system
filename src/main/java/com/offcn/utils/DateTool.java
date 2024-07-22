/**
 * 
 */
package com.offcn.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/** 
* @Title: DateTool.java
* @author: yanbo.deng
* @date: 2019��9��23�� ����7:52:20
* @Description:
*/
public class DateTool {
	private static SimpleDateFormat sdFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	//�ַ���ת����
	public static Date stringToDate(String dateStr) {
		try {
			return sdFormat.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	//����ת�ַ���
	public static String dateToString(Date dtDate) {
		return sdFormat.format(dtDate);
	}
}


