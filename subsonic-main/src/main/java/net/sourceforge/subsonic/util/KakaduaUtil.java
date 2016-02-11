package net.sourceforge.subsonic.booter.agent;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Random;


/**
 * Created by P on 02-Feb-16.
 */
public class KakaduaUtil {

    public static char randomChar(){
        return randomChar("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
    }

    public static char randomChar(String alphabet){
        return alphabet.charAt(new Random().nextInt(alphabet.length()));
    }

    public static String convertStreamToString(InputStream is) throws Exception {
        BufferedReader reader = new BufferedReader(new InputStreamReader(is));
        StringBuilder sb = new StringBuilder();
        String line = null;
        while ((line = reader.readLine()) != null) {
            sb.append(line).append("\n");
        }
        reader.close();
        return sb.toString();
    }

    public static String getStringFromFile (String filePath) throws Exception{
        FileInputStream fin = new FileInputStream(new File(filePath));
        String ret = convertStreamToString(fin);
        fin.close();
        return ret;
    }

    public static String get_between(String content, String before, String after){
    	return content.substring(content.indexOf(before) + 1, content.indexOf(after));
    }
    
    public static String file_read(String filePath){
    	try{
	        FileInputStream fin = new FileInputStream(new File(filePath));
	        String ret = convertStreamToString(fin);
	        fin.close();
	        return ret;
    	}
    	catch(Exception e){
    		return "";
    	}
    }
    
    public static boolean file_write(String path, String data){
    	return file_write(path, data, "UTF-8");
    }

    public static boolean file_write(String path, String data, String encoding){
    	try{
	    	PrintWriter writer = new PrintWriter(path, encoding);
	    	writer.print(data);
	    	writer.close();
	    	return true;
    	}catch(Exception e){
    		return false;
    	}
    }
    
}
