/*===========================================
   FileManager.java
   - 파일 다운로드 와 관련된 환경 설정 구성
============================================*/
package com.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class FileManager
{
	// 파일 다운로드
	// · saveFileName : 서버에 저장된 파일명
	// · orignalFileName : 클라이언트가 업로드한 파일명
	// · path : 서버에 저장된 경로
	public static boolean doFileDownload(String saveFileName , String originalFileName,String path,HttpServletResponse response)
	{ 
		// 경로 구성
		// → 매개변수로 넘겨 받은 path + 구분자 + 서버에 저장된 파일명
		String loadDir = path + File.separator + saveFileName;
									// 구분자 \\ 와 동일
		
		try
		{
			if(originalFileName == null || originalFileName.equals(""))
			{
				originalFileName = saveFileName;
				
			}
			originalFileName = new String(originalFileName.getBytes("euc-kr"),"ISO-8859-1");
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		try
		{
			File file = new File(loadDir);
			
			if(file.exists()) //파일이 존재 할때
			{
				byte[] readByte =  new byte[4096];	//4*1024
				
				// 응답 객체 관련 헤더 구성
				response.setContentType("application/octet-stream");
				response.setHeader("Content-disposition","attachment;filename="+ originalFileName);
				
				BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
				
				OutputStream os = response.getOutputStream();
				
				int read;
				while((read=bis.read(readByte,0,4096))!= -1) //읽어 들인 내용으로 
				{
					os.write(readByte,0,read);
				}
				os.flush();
				os.close();
				bis.close();
				
				return true;
				
				
			}
			
			
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
		
		
		
	
		return false;
	}
}
