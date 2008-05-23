package util;

import java.awt.Color;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cheffo.jeplite.JEP;
import org.cheffo.jeplite.ParseException;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
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
		// TODO Auto-generated method stub
		CountBean licz= (CountBean)request.getSession().getAttribute("licz");
		OutputStream out= response.getOutputStream();
		JFreeChart chart=null;
		chart= createChart(licz);
		response.setContentType("image/png");
		ChartUtilities.writeChartAsPNG(out, chart, 500, 400);
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}   	  	
	
	private JFreeChart createChart(CountBean licz) {
		XYPlot plot;
		JFreeChart chart= ChartFactory.createXYLineChart("", "x", "Y", new XYSeriesCollection(), PlotOrientation.VERTICAL, true, true, false);
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
		for (int i=0; i<1000; i++){
			double x=0.01*i-5+Double.parseDouble(licz.getX());
			parser.addVariable("x", x);
			try {
				ser.add(x, parser.getValue());
			} catch (ParseException e) {
				
				e.printStackTrace();
			}
		}
		sc.addSeries(ser);
		
		
		return chart;
	}
}