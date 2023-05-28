package com.xhu.exception;

public class InsertException extends RuntimeException {

	public InsertException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public InsertException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

	public InsertException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	public InsertException(String message) {
		super(message);
		System.out.println(message);
		// TODO Auto-generated constructor stub
	}

	public InsertException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}
	
}
