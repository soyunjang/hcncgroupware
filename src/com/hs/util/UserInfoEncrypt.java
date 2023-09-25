package com.hs.util;

public class UserInfoEncrypt {
	
	public static String encryptStringData(String data) throws Exception {
		return EncryptUtil.encryptStringToByteData(data);
	}

	public static String decryptStringData(String data) throws Exception {
		return EncryptUtil.decode(data);
	}

}
