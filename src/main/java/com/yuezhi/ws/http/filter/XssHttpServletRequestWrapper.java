package com.yuezhi.ws.http.filter;

import org.springframework.web.util.HtmlUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

/**
 * Created by yanyuan on 2015/6/19.
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {
    public XssHttpServletRequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }
    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if (values==null)  {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for (int i = 0; i < count; i++) {
            encodedValues[i] = HtmlUtils.htmlEscape(values[i]);
        }
        return encodedValues;
    }
    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return HtmlUtils.htmlEscape(value);
    }
    public String getHeader(String name) {
        String value = super.getHeader(name);
        if (value == null)
            return null;
        return HtmlUtils.htmlEscape(value);
    }
}
