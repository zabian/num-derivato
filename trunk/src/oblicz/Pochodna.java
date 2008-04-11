package oblicz;

import org.cheffo.jeplite.JEP;
import org.cheffo.jeplite.ParseException;

public class Pochodna {


	JEP p=new JEP(); 
	String wyr;
	double x=0;
	double y=0;
	public Pochodna(){
		p=new JEP(); 		
		p.addStandardFunctions();
		p.addStandardConstants();
		p.addVariable("x",0);
	}
	public double getValue(String wyr, double arg){
		p.addVariable("x",arg);
    	p.parseExpression(wyr);
    	try{
    		y=p.getValue();
        }catch (ParseException pe){
        }
        System.out.println("Wartosc wyr. "+y);
		return y;	
	}
	public double derivBack(String wyr, double arg, double dh, int n){
		double y_4,y_3,y_2,y_1,y0;
		switch(n){
			case 1:
					y0=this.getValue(wyr, arg);
		        	y_1=this.getValue(wyr, arg-dh);
		        	return (y0-y_1)/dh;
		    case 2:
					y0=this.getValue(wyr, arg);
		        	y_1=this.getValue(wyr, arg-dh);
		        	y_2=this.getValue(wyr, arg-2*dh);
		        	return (y0-2*y_1+y_2)/(dh*dh);
			case 3:
					y0=this.getValue(wyr, arg);
		        	y_1=this.getValue(wyr, arg-dh);
		        	y_2=this.getValue(wyr, arg-2*dh);
		        	y_3=this.getValue(wyr, arg-3*dh);	
		        	return (y0-3*y_1+3*y_2-y_3)/(dh*dh*dh);
		    case 4:
		    		y0=this.getValue(wyr, arg);
		        	y_1=this.getValue(wyr, arg-dh);
		        	y_2=this.getValue(wyr, arg-2*dh);
		        	y_3=this.getValue(wyr, arg-3*dh);
		        	y_4=this.getValue(wyr, arg-4*dh);
		        	return (y0-4*y_1+6*y_2-4*y_3+y_4)/(dh*dh*dh*dh);
			}			
		return -500; 
					        			
	}
	public double derivForward(String wyr, double arg, double dh, int n){
		double y0,y1,y2,y3,y4;
		switch(n){
			case 1:
					y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+dh);
		        	return (y1-y0)/dh;
		    case 2:
					y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+dh);
		        	y2=this.getValue(wyr, arg+2*dh);
		        	return (y2-2*y1+y0)/(dh*dh);
			case 3:
					y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+dh);
		        	y2=this.getValue(wyr, arg+2*dh);
		        	y3=this.getValue(wyr, arg+3*dh);	
		        	return (y3-3*y2+3*y1-y0)/(dh*dh*dh);
		    case 4:
		    		y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+dh);
		        	y2=this.getValue(wyr, arg+2*dh);
		        	y3=this.getValue(wyr, arg+3*dh);
		        	y4=this.getValue(wyr, arg+4*dh);
		        	return (y4-4*y3+6*y2-4*y1+y0)/(dh*dh*dh*dh);
			}			
		return -500;			
	}
	
	public double derivCentral(String wyr, double arg, double h, int n){
		double y_2,y_1,y0,y1,y2;
    	switch(n){
			case 1:
					y_1=this.getValue(wyr, arg-h);
		        	y1=this.getValue(wyr, arg+h);
		        	return (y1-y_1)/(2*h);
		    case 2:
					y_1=this.getValue(wyr, arg-h);
					y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+h);
		        	return (y1-2*y0+y_1)/(h*h);
			case 3:
					y_2=this.getValue(wyr, arg-2*h);
					y_1=this.getValue(wyr, arg-h);
					y1=this.getValue(wyr, arg+h);
		        	y2=this.getValue(wyr, arg+2*h);
					return (y2-2*y1+2*y_1-y_2)/(2*h*h*h);
		    case 4:
		    		y_2=this.getValue(wyr, arg-2*h);
					y_1=this.getValue(wyr, arg-h);
					y0=this.getValue(wyr, arg);
		        	y1=this.getValue(wyr, arg+h);
		        	y2=this.getValue(wyr, arg+2*h);
		        	return (y2-4*y1+6*y0-4*y_1+y_2)/(h*h*h*h);
			}			
		return -500;
		
	}
	
}

