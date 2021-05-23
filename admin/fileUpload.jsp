<%@ include file="../dbconnect.jsp" %>
<%@ page import="java.io.*,javax.servlet.http.*,javax.servlet.*" %>  
<%@ page import="java.io.FileWriter,java.io.IOException,java.sql.*" %>  
<%  
    String pid = (String)session.getAttribute("new_pid");
    session.setAttribute("new_pid",null); 
    
    
    String fname1="";
	String savePath = "Y:/", filepath = "", filename = "";  
	String contentType = "", fileData = "", strLocalFileName = "";  
	int startPos = 0, endPos = 0;  
	int BOF = 0, EOF = 0;  
%>  
<%!
	void copyByte(byte[] fromBytes, byte[] toBytes, int start, int len)  
	{  
		for(int i=start;i<(start+len);i++)  
		{  
			toBytes[i - start] = fromBytes[i];

		}  
	}  
%>  
<%	  
	contentType = request.getContentType(); 
	if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))   
	{  
		DataInputStream in = new DataInputStream(request.getInputStream());  
		DataInputStream in1 = in;  
		int formDataLength = request.getContentLength();  
		byte dataBytes[] = new byte[formDataLength];  
		int byteRead = 0;  
		int totalBytesRead = 0;  
		while (totalBytesRead < formDataLength)  
		{	  
			byteRead = in1.read(dataBytes, totalBytesRead, formDataLength);  
			totalBytesRead += byteRead;  
		}
		byte[] line = new byte[128];  
		if (totalBytesRead < 3)	  
		{  
		  return;	
		}  
  
		String boundary = "";  
		String s = "";  
		int count = 0;		  
		int pos = 0;  
		do  
		{  
			copyByte(dataBytes, line, count ,1);
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;  
			pos = fileData.indexOf("Content-Disposition: form-data; name=\"");
			if(pos != -1)  
				endPos = pos;  
		}while(pos == -1);  
		boundary = fileData.substring(startPos, endPos);  
		startPos = endPos;  
		do  
		{  
			copyByte(dataBytes, line, count ,1);
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;  
			pos = fileData.indexOf("filename=\"", startPos);
			if(pos != -1)  
				startPos = pos;  
		}while(pos == -1);					  
		do  
		{  
			copyByte(dataBytes, line, count ,1);
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;  
			pos = fileData.indexOf("Content-Type: ", startPos);  
			if(pos != -1)  
				endPos = pos;						  
		}while(pos == -1);  
		filename = fileData.substring(startPos + 10, endPos - 3); 
		strLocalFileName = filename;  
		int index = filename.lastIndexOf("\\");  
		if(index != -1)  
			filename = filename.substring(index + 1);  
		else  
			filename = filename; 
		fname1=filename;
		boolean blnNewlnFlag = false;  
		startPos = endPos;
		do  
		{  
			copyByte(dataBytes, line, count ,1);
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;			  
			pos = fileData.indexOf("\n", startPos);  
			if(pos != -1)  
			{  
				if(blnNewlnFlag == true)  
					endPos = pos;					  
				else  
				{  
					blnNewlnFlag = true;  
					pos = -1;  
				}  
			}  
		}while(pos == -1);  
		contentType = fileData.substring(startPos + 14, endPos);
		BOF = count + 1;  
		do  
		{  
			copyByte(dataBytes, line, count ,1);
			count+=1;  
			s = new String(line, 0, 1);  
			fileData = fileData + s;  
			pos = fileData.indexOf(boundary, startPos);	//check for end of file data i.e boundry value			  
		}while(pos == -1);  
		EOF = count - boundary.length();
		String appPath = application.getRealPath("/");
		String destFolder = appPath + "image/";
		filename= destFolder + pid+".jpg";
		FileOutputStream fileOut = new FileOutputStream(filename);  
		fileOut.write(dataBytes, BOF, (EOF - BOF));  
		fileOut.flush();  
		fileOut.close();
        response.sendRedirect("./admin_index.jsp");
	}  
	else  
	{  
		out.println("Error in uploading ");  
	}
%>  

