package util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.Punkt;

/**
 * Servlet implementation class for Servlet: ImageMaker
 *
 */
 public class ImageMaker extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ImageMaker() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int iw=640;
		int ih=480;
		BufferedImage image = new BufferedImage(640, 480, BufferedImage.TYPE_INT_RGB); // 123 wide, 123 tall
		Graphics2D g2 = image.createGraphics();
		
		g2.setBackground(Color.BLUE);
		g2.setColor(Color.WHITE);
		g2.fillRect(0, 0, iw, ih);
		g2.setColor(Color.BLACK);
		g2.drawRect(0, 0, iw-1, ih-1);
		g2.setColor(Color.BLACK);
		g2.drawLine((int)(iw/2), (int)(0.05*ih), (int)(iw/2), (int)(0.95*ih));
		g2.drawLine((int)(0.05*iw), (int)(ih/2), (int)(0.95*iw), (int)(ih/2));
		int x0=(int)(iw/2)-1;
		int y0=(int)(ih/2)-1;
		ArrayList<Punkt> points=(ArrayList<Punkt>)request.getSession().getAttribute("punkty");
		for (int i=0; i<points.size(); i++);
		// render to graphics 2d - 
		// graphics2D.drawString(...), graphics2D.drawLine(...), etc.
		g2.dispose();
		  
		response.setContentType("image/jpeg");
		OutputStream outputStream = response.getOutputStream();
		ImageIO.write(image, "jpeg", outputStream);
		outputStream.close();
	}  	  	  	    
}