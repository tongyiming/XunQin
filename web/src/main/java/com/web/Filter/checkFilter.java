package com.web.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Created by Administrator on 2016/12/8 0008.
 */
@WebFilter("/blog")
public class checkFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest)req;

        Cookie[] cookies=request.getCookies();
        HttpSession session=request.getSession();
        Boolean flag = (Boolean) session.getAttribute("isCheck");
        if(session.getAttribute("userid")!=null || (flag!=null && flag)) {
            chain.doFilter(req, resp);
            return;
        }
        if (cookies != null) {

            System.out.println("e");
            for (Cookie cookie : cookies) {
                String s = cookie.getName();
                if ("user".equals(s)) {
                    String[] mess = cookie.getValue().split(":");
                    request.setAttribute("username", mess[0]);
                    request.setAttribute("userpass", mess[1]);
                    request.getRequestDispatcher("/goto/check").forward(req, resp);
                    return;
                }
            }
        }
        request.setAttribute("error","请先登录!");
        request.getRequestDispatcher("/goto/login").forward(req,resp);
        chain.doFilter(req,resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
