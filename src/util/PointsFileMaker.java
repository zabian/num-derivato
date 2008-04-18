package util;

import java.io.BufferedWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.Punkt;

/**
 * Servlet implementation class for Servlet: PointsFileMaker
 *
 */
 public class PointsFileMaker extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public PointsFileMaker() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<logic.Punkt> ob=new ArrayList<Punkt>();
		ob=(ArrayList<Punkt>) request.getSession().getAttribute("ob");
		if (ob!=null) System.out.println("wpadlo");
		response.setContentType("text/plain");
		String linia=new String();
		PrintWriter pw= response.getWriter();
		for (int i=0; i<ob.size(); i++){
			linia=ob.get(i).getX()+","+ob.get(i).getY();
			pw.println(linia);
		}
		
		
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	    
}