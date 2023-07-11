package com.hs.home.controller;

public class UserInfoEncrypt {
	
	/**
   	 * �޼ҵ� ���� : �����͸� ��ȣȭ�ϴ� ���
   	 * ----------------------------------------
   	 * @param	String data 	��ȣȭ�� ������
   	 * @return	String result 	��ȣȭ�� ������
   	 * @throws	Exception
   	 */
	public static String encryptStringData(String data) throws Exception {
		return EncryptUtil.encryptStringtoByteData(data);
	}

	/**
   	 * �޼ҵ� ���� :	�����͸� ��ȣȭ�ϴ� ���
   	 * ----------------------------------------
   	 * @param	String data ��ȣȭ�� ������
   	 * @return	String result ��ȣȭ�� ������
   	 * @throws	Exception
   	 */
	public static String decryptStringData(String data) throws Exception {
		return EncryptUtil.decode(data);
	}
	
	/**
   	 * �޼ҵ� ���� : �̸� ����ŷ�ϴ� ���
   	 * ----------------------------------------
   	 * @param	String data 	����ŷ�� ������
   	 * @return	String result 	����ŷ�� ������
   	 * @throws	Exception
   	 */
	public static String maskingName(String name){
	    String maskedNm = "";	// ����ŷ �̸�
	    String firstNm = "";	// ��
	    String lastNm = "";		// �̸�
    	String makers = "";		// ����ŷ
	 
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
