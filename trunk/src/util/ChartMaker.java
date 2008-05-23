package util;

import java.awt.Color;
import java.awt.Rectangle;
import java.awt.Shape;
import java.awt.geom.Ellipse2D;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import logic.Newton;
import logic.Punkt;

import org.cheffo.jeplite.JEP;
import org.cheffo.jeplite.ParseException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import org.jfree.ui.RectangleInsets;

import web.CountBean;

/**
 * Servlet implementation class for Servlet: ChartMaker
 *
 */
 public class ChartMaker extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
   static final long serialVersionUID = 1L;
   
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public ChartMaker() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		JFreeChart chart=null;
		
		String type=request.getParameter("type");
		if(type.equals("der")){
			CountBean licz= (CountBean)request.getSession().getAttribute("licz");
			chart= createChart(licz);
		} else if(type.equals("newton")){
			ArrayList<Punkt> punkty= (ArrayList<Punkt>)request.getSession().getAttribute("ob");
			Newton n= (Newton)request.getSession().getAttribute("interpolacja");
			chart=createNewtonChart(punkty, n);
		}
		OutputStream out= response.getOutputStream();
		response.setContentType("image/png");
		ChartUtilities.writeChartAsPNG(out, chart, 600, 500);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	
	
	private JFreeChart createChart(CountBean licz) {
		XYPlot plot;
		JFreeChart chart= ChartFactory.createXYLineChart("", "X", "Y", new XYSeriesCollection(), PlotOrientation.VERTICAL, true, true, false);
		chart.setBackgroundPaint(Color.white);
		plot=chart.getXYPlot();
		plot.setBackgroundPaint(Color.white);
		plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));
		plot.setDomainGridlinePaint(Color.black);
		plot.setRangeGridlinePaint(Color.black);
		XYSeriesCollection sc=(XYSeriesCollection)plot.getDataset();
		
		JEP parser=new JEP();
		parser.addStandardConstants();
		parser.addStandardFunctions();
		parser.addVariable("x", 1);
		parser.parseExpression(licz.getWyr());
		XYSeries ser=new XYSeries(licz.getWyr());
		for (int i=0; i<200; i++){
			double x=0.05*i-5+Double.parseDouble(licz.getX());
			parser.addVariable("x", x);
			try {
				ser.add(x, parser.getValue());
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
		}
		
		sc.addSeries(ser);
		/*
		XYLineAndShapeRenderer renderer
	    = (XYLineAndShapeRenderer) plot.getRenderer();
	renderer.setShapesVisible(true);
	renderer.setShapesFilled(true);
	
		Ellipse2D el = new Ellipse2D.Double(0,0,50,15);
		
		renderer.setSeriesShape(1, new Rectangle());
		renderer.setSeriesShape(0, el);
		renderer.setSeriesLinesVisible(0, false);
		renderer.setSeriesPaint(0, Color.blue);
		
		*/
		
		

		
		chart.setAntiAlias(true);
		return chart;
	}
	
	private JFreeChart createNewtonChart(ArrayList<Punkt> punkty, Newton n) {
		XYPlot plot;
		JFreeChart chart= ChartFactory.createXYLineChart("", "X", "Y", new XYSeriesCollection(), PlotOrientation.VERTICAL, true, true, false);
		chart.setBackgroundPaint(Color.white);
		plot=chart.getXYPlot();
		plot.setBackgroundPaint(Color.white);
		plot.setAxisOffset(new RectangleInsets(5.0, 5.0, 5.0, 5.0));
		plot.setDomainGridlinePaint(Color.black);
		plot.setRangeGridlinePaint(Color.black);
		XYSeriesCollection sc=(XYSeriesCollection)plot.getDataset();
		
		XYSeries wezly=new XYSeries("Wêz³y");
		double min=punkty.get(0).getX();
		double max=punkty.get(0).getX();
		
		for (int i=0; i<punkty.size(); i++){
			wezly.add(punkty.get(i).getX(), punkty.get(i).getY());
			double x=punkty.get(i).getX();
			if(x<min){
				min=x;
			} else if(x>max){
				max=x;
			}
		}
		double k=(int)(max-min+2)/0.01;
		double x=min-1;
		XYSeries newton=new XYSeries("Funkcja intepoluj¹ca");
		if(n==null){
			System.out.println(x+"!!!!!!");
		}
		newton.add(x,n.horner(x, 0));
		
		for(int i=0; i<k; i++){
			x+=0.01;
			newton.add(x, n.horner(x, 0));
			
		}
		
		XYSeries aa=new XYSeries("Punkty");
		aa.add(3.0,-5);
		aa.add(1.2,9.0);
		sc.addSeries(wezly);
		sc.addSeries(newton);
		XYLineAndShapeRenderer renderer= (XYLineAndShapeRenderer) plot.getRenderer();
		renderer.setShapesVisible(true);
		renderer.setShapesFilled(true);
	
		Ellipse2D el = new Ellipse2D.Double(-2,-2,5,5);
		
		renderer.setSeriesShape(1, new Rectangle());
		renderer.setSeriesShape(0, el);
		renderer.setSeriesLinesVisible(0, false);
		renderer.setSeriesPaint(0, Color.blue);
		
		chart.setAntiAlias(true);
		return chart;
	}
	
	
	
	
	
}