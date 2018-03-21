package com.yuezhi.ws.constant;


/**
 * 公共代码类
 * 
 * @author yanyuan
 * @date 2015-5-8
 * @version 1.0
 *
 */
public final class Code {

	/**
	 * 目标用户-系统代码
	 */
	public static final Integer TARGET_ADMIN_CODE = 999999;

	/**
	 * 退回状态
	 */
	public static final Integer STATUS_BACK = 2;

	/**
	 * 有效状态
	 */
	public static final Integer STATUS_VALID = 1;

	/**
	 * 无效状态/初始化
	 */
	public static final Integer STATUS_INVALID = 0;


	// 员工状态 0 禁用 1 可用
	public final static Byte EMPLOYEE_STATUS_INVALID = 0;
	public final static Byte EMPLOYEE_STATUS_VALID = 1;
	public final static Byte EMPLOYEE_STATUS_DEL = 2;


	
}
