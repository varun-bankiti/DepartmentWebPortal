/*
 *  Author : B.Babu
 *  Date : 12-06-2013(DD/MM/YYYY)
 *  Purpose : To rename the bunch files as we wished.
*/
import java.util.*;
import java.io.*;
public class RenameFiles
{
	public static void main(String args[])
	{
		// Take URL of the folder which contains files which we would like to rename
		String dirFrom = "C:/Users/Babu.B.Reddy/Desktop/1";
		// create a File object
		File f = new File(dirFrom);
		String dirTo = "C:/Users/Babu.B.Reddy/Desktop/1";
		File ff = new File(dirTo);
		String [] files;
		files = f.list();
		for(int i=0;i<files.length;i++)
			{
				File temp = new File(dirFrom+"/"+files[i]);
				if(files[i].lastIndexOf("txt")!=-1)
				{
					temp.renameTo(new File(dirTo+"/"+(i+1)+".png"));
					}
		
			}
		System.out.printf("\n Successfully renamed\n");
		}
	}
