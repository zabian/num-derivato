package web;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oblicz.Pochodna;
import logic.Punkt;

/**
 * Servlet implementation class for Servlet: imageMaker
 *
 */
 public class imageMaker extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public imageMaker() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int iw=640;
		int ih=480;
		BufferedImage image = new BufferedImage(iw, ih, BufferedImage.TYPE_INT_RGB); // 123 wide, 123 tall
		Graphics2D g2 = image.createGraphics();
		
		web.CountBean licz=(web.CountBean) request.getSession().getAttribute("licz");
		String formula=licz.getWyr();
		//String formula=request.getParameter("formula");
		System.out.println(formula);

		//String x=request.getParameter("x");
		String x=licz.getX();
		double x0=Double.parseDouble(x);
		System.out.println(x0);

		Pochodna parser=new Pochodna();
		parser.getValue(formula, x0);
		
		double xMax=Math.abs(1.2*x0);
		double skalaX=0.90*iw/(2*xMax);
		int szerMax = (int) (0.95*iw);
		int szerMin= (int) (0.05*iw);
		int szer=szerMax-szerMin;
		System.out.println(szer);
		ArrayList<Punkt> funkcja=new ArrayList<Punkt>();
		double temp=(-1)*xMax;
		double dx=2*xMax/szer;
		double yMax=Math.abs(parser.getValue(formula, temp));
		for (int i=0; i<szer; i++){
			Punkt p=new Punkt();
			p.setX(temp);
			p.setY(parser.getValue(formula, temp));
			funkcja.add(p);
			temp+=dx;
			if (Math.abs(p.getY())>yMax){
				yMax=Math.abs(p.getY());
			}
		}
		x0=(int)(iw/2)-1;
		int y0=(int)(ih/2)-1;
		double skalaY=0.90*ih/(2.2*yMax);
		g2.setColor(Color.white);
		g2.fillRect(0, 0, iw, ih);
		g2.setColor(Color.black);
		g2.drawRect(0, 0, iw-1, ih-1);
		g2.setBackground(Color.green);
		for (int i=1; i<funkcja.size(); i++){
			Punkt p=funkcja.get(i);
			//g2.fillRect((int)(skalaX *p.getX()+x0)-1, (int)(skalaY *(-1)*p.getY()+y0)-1, 3, 3);
			g2.setStroke(new BasicStroke(1.5f));
			g2.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
			g2.drawLine((int)(skalaX * funkcja.get(i-1).getX() + x0)-1, (int)(skalaY * (-1)*funkcja.get(i-1).getY()+y0)-1, (int)(skalaX * p.getX() + x0)-1, (int)(skalaY * (-1)*p.getY() + y0)-1);
			
		}
		g2.dispose();
		
		response.setContentType("image/jpeg");
		OutputStream outputStream = response.getOutputStream();
		ImageIO.write(image, "jpeg", outputStream);
		outputStream.close();
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequesqt request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	    
}