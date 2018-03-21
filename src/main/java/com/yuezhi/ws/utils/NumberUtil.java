package com.yuezhi.ws.utils;

import java.text.NumberFormat;

public class NumberUtil {
	public static String roundDouble(double d,int position){
		NumberFormat nf = NumberFormat.getNumberInstance(); 
		nf.setMaximumFractionDigits(position);
		return nf.format(d);
	}
}
