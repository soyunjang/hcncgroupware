package com.hs.home.controller;

public class UserInfoEncrypt {
	
	/**
   	 * 메소드 설명 : 데이터를 암호화하는 기능
   	 * ----------------------------------------
   	 * @param	String data 	암호화할 데이터
   	 * @return	String result 	암호화된 데이터
   	 * @throws	Exception
   	 */
	public static String encryptStringData(String data) throws Exception {
		return EncryptUtil.encryptStringtoByteData(data);
	}

	/**
   	 * 메소드 설명 :	데이터를 복호화하는 기능
   	 * ----------------------------------------
   	 * @param	String data 복호화할 데이터
   	 * @return	String result 복호화된 데이터
   	 * @throws	Exception
   	 */
	public static String decryptStringData(String data) throws Exception {
		return EncryptUtil.decode(data);
	}
	
	/**
   	 * 메소드 설명 : 이름 마스킹하는 기능
   	 * ----------------------------------------
   	 * @param	String data 	마스킹할 데이터
   	 * @return	String result 	마스킹된 데이터
   	 * @throws	Exception
   	 */
	public static String maskingName(String name){
	    String maskedNm = "";	// 마스킹 이름
	    String firstNm = "";	// 성
	    String lastNm = "";		// 이름
    	String makers = "";		// 마스킹
	 
        if(name.length() > 0){
        	firstNm = name.substring(0, 1);
            lastNm = name.substring(1, name.length());
 
            for(int i = 0; i < lastNm.length(); i++){
                makers += "*";
            }
 
            lastNm = lastNm.replace(lastNm, makers);
            maskedNm = firstNm + lastNm;
        }else{
        	maskedNm = "*";
        }
	 
	    return maskedNm;
	}
}
