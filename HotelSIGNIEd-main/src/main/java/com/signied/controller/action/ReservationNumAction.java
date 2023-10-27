package com.signied.controller.action;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.signied.dao.ReservationDAO;
import com.signied.dto.ReservationVO;

public class ReservationNumAction implements Action {

    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, Exception {
        String url = null;

        String num = request.getParameter("num");
        System.out.println("reserveNum : " + num);

        ReservationDAO rDao = ReservationDAO.getInstance();
        ReservationVO vo = rDao.selectOneByNum(Integer.parseInt(num));
        System.out.println(vo);
        
        if (vo != null && vo.getReserveNum() == Integer.parseInt(num)) {
        	request.setAttribute("reservation", vo);
        	url = "ReservationConfirm.jsp";
        } else {
        	url = "ReservationInquiry.jsp";
        	request.setAttribute("message", "예약번호가 존재하지 않습니다.");
        }

        request.getRequestDispatcher(url).forward(request, response);
    }
}