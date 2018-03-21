package com.yuezhi.ws.utils;

import com.yuezhi.ws.exception.BusinessException;
import org.apache.commons.lang.math.RandomUtils;

import java.util.Random;

public class CodeUtil {

	public static final Integer ORDER_CODE_LENGTH = 10;
	public static final Integer ORDER_CODE_RANDOM = 3;
	
	public static String getExchangeCode(){
		String result = "";
		String[] strs = {"1","2","3","4","5","6","7","8","9","0",
				"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		for (int i = 0; i < 6; i++) {
			result+=strs[RandomUtils.nextInt(strs.length)];
		}
		return result;
	}
	
	public static String getChangeCodeId(int id){
		String result = "";
		String[] strs = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"};
		int size = 6-(id+"").length();
		for (int i = 0; i < size; i++) {
			result+=strs[RandomUtils.nextInt(strs.length)];
		}
		return result+id;
	}

	public static String getChangeCodeAndId(int id){
		return getExchangeCode()+getChangeCodeId(id);
	}


	/**
	 * 根据订单ID和随机位数生成订单号
	 * @param id
	 * @return
	 */
	public static String generateOrderCode(Integer id) {
		if(id == null){
			throw new BusinessException("编号生成失败：id不能为空");
		}
		StringBuffer code = new StringBuffer(10);
		Random random = new Random();
		//第一位为1-9随机数
		for(int i = 0; i < ORDER_CODE_RANDOM; i++){
			String firstNumString =new Integer((random.nextInt(9) + 1)).toString();
			code.append(firstNumString);
		}
		//中间加上n个0，零的个数为总长度减去id长度再减去1
		int zeroLength = ORDER_CODE_LENGTH - id.toString().length() - ORDER_CODE_RANDOM;
		for(int i = 0; i < zeroLength; i++)
			code.append(0);

		//最后加上id
		code.append(id);

		return code.toString();
	}

	public static void main(String[] args) {
		System.out.println(generateOrderCode(2222));
	}
	
}
