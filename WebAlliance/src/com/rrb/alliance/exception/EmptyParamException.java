package com.rrb.alliance.exception;

import java.io.Serializable;

public class EmptyParamException extends Exception implements Serializable {

	/**
	 * 用于空字符串抛出异常
	 */
	private static final long serialVersionUID = 1L;

	public EmptyParamException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public EmptyParamException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public EmptyParamException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	public EmptyParamException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

}
