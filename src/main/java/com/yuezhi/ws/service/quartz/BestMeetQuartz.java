package com.yuezhi.ws.service.quartz;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component
public class BestMeetQuartz {
	private final static Logger log = Logger.getLogger(BestMeetQuartz.class);

	public static void main(String[] args) throws ParseException {
		// Date now = new Date();
		// Calendar calendar = Calendar.getInstance();
		// calendar.setTime(now);
		// int hour = calendar.get(Calendar.HOUR_OF_DAY);
		// int minute = calendar.get(Calendar.MINUTE);
		// System.out.println(hour);
		// System.out.println(minute);
		Date startTime = new SimpleDateFormat("HH:mm").parse("08:00");
		Date endTime = new SimpleDateFormat("HH:mm").parse("15:10");

	}
}