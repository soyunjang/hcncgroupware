package com.hs.home.controller;

import java.util.Base64;

import sun.security.provider.MD5;

import java.security.MessageDigest;

public class EncryptUtil {
	
	/**
	 * �޼ҵ� ���� :	�����͸� ��ȣȭ�ϴ� ���
	 * ----------------------------------------
	 * @param	String data ��ȣȭ�� ������
	 * @return	String result ��ȣȭ�� ������
	 * @throws	Exception
	 */
	public static byte[] decodeBinary(String data) throws Exception {
		return Base64.getDecoder().decode(data.getBytes());
	}
	
	/**
	 * �޼ҵ� ���� :	�����͸� ��ȣȭ�ϴ� ���
	 * ----------------------------------------
	 * @param	String data ��ȣȭ�� ������
	 * @return	String result ��ȣȭ�� ������
	 * @throws	Exception
	 */
	public static String decode(String data) throws Exception {
		return new String(decodeBinary(data));
	}
	
	/**
	 * �޼ҵ� ���� :	�����͸� ��ȣȭ�ϴ� ��� SHA-512
	 * ----------------------------------------
	 * @param	String data ��ȣȭ�� ��й�ȣ
	 * @return	String result ��ȣȭ�� ��й�ȣ
	 * @throws	Exception
	 */
	public static String encryptStringtoByteData(String data) throws Exception {
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
