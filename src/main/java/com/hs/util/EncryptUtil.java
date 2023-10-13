package com.hs.util;

import java.security.MessageDigest;
import java.util.Base64;

public class EncryptUtil {
	
	public static byte[] decodeBinary(String data) throws Exception {
		return Base64.getDecoder().decode(data.getBytes());
	}
	
	public static String decode(String data) throws Exception {
		return new String(decodeBinary(data));
	}
	
	public static String encryptStringToByteData(String data) throws Exception {
		if(data == null)
			return "";

		MessageDigest md = MessageDigest.getInstance("MD5");
	    byte[] passBytes = data.getBytes();
	    md.reset();
	    byte[] digested = md.digest(passBytes);
	    StringBuilder sb = new StringBuilder();
	    for (int i = 0; i < digested.length; i++) {
	    	sb.append(Integer.toString((digested[i]&0xff) + 0x100, 16).substring(1));
	    }

	    return sb.toString();
	}
}
