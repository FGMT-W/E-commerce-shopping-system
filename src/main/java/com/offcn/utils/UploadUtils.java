/**
 * 
 */
package com.offcn.utils;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/** 
* @Title: UploadUtils.java
* @author: yanbo.deng
* @date: 2019��9��15�� ����8:34:06
* @Description:��װ�ļ��ϴ��Ĺ�����
*/
public class UploadUtils {
	
	public static String uploadFile(Part part,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�����ϴ����ļ���
		String photo=null;
		//��ȡ�ϴ�����Ϣ
		String header = part.getHeader("Content-Disposition");
		photo=header.substring(header.lastIndexOf("filename")+10, header.length()-1);
		//System.out.println(photo);
		//ʹ��UUID��������ļ���,����ͬ���ļ��滻
		photo=UUID.randomUUID()+photo;	
		//��ȡ�ļ���׺��
		String type=photo.substring(photo.lastIndexOf(".")+1);
		//�ж��ļ������Ƿ���ͼƬ
		if (!("jpg".equals(type)||"png".equals(type)||"jpeg".equals(type))) {
			request.setAttribute("msg", "图片格式不正确");
			try {
				request.getRequestDispatcher("regist.jst").forward(request, response);
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}
			//����ļ���ʽ����ȷ��ͼƬ���Ƹ���ֵ
			return photo="";
		}
		//�ϴ��ļ�·��
		String path="E:/JavaProject/XiaoMiSource/PictureSource";
		//System.out.println(path);
		//�����ϴ�·��
		File file=new File(path);
		if (!file.exists()) {
			file.mkdir();
		}
		//���ļ����浽ָ��Ŀ¼��
		try {
			part.write(path+"/"+photo);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return photo;
	}	
}
