package com.wq.util;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

/**
 * @author 1034683568@qq.com
 * @project_name perfect-ssm
 * @date 2017-3-1
 */
public class ResponseUtil {

    public static void write(HttpServletResponse response, Object o) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        response.addHeader("Access-Control-Allow-Origin", "*");
        PrintWriter out = response.getWriter();
        out.println(o.toString());
        out.flush();
        out.close();
    }
}
