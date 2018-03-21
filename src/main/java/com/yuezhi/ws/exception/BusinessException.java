package com.yuezhi.ws.exception;

/**
 * 自定义异常类
 * @author yanyuan
 * @version 1.0
 * @date 2015-05-04
 *
 */
public class BusinessException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public BusinessException() {
		super();
	}

	public BusinessException(String message) {
		super(message);
	}

	public BusinessException(String message, Throwable cause) {
		super(message, cause);
	}

	public BusinessException(Throwable cause) {
		super(cause);
	}

}
