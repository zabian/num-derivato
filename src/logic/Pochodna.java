package logic;

public abstract class Pochodna {
	public abstract double getValue(double arg);
	
	public double derivBack(double arg, double h, int n){
		double y_4,y_3,y_2,y_1,y0;
		switch(n){
			case 1:
					y0=this.getValue(arg);
		        	y_1=this.getValue(arg-h);
		        	return (y0-y_1)/h;
		    case 2:
					y0=this.getValue(arg);
		        	y_1=this.getValue(arg-h);
		        	y_2=this.getValue(arg-2*h);
		        	return (y0-2*y_1+y_2)/(h*h);
			case 3:
					y0=this.getValue(arg);
		        	y_1=this.getValue(arg-h);
		        	y_2=this.getValue(arg-2*h);
		        	y_3=this.getValue(arg-3*h);	
		        	return (y0-3*y_1+3*y_2-y_3)/(h*h*h);
		    case 4:
		    		y0=this.getValue(arg);
		        	y_1=this.getValue(arg-h);
		        	y_2=this.getValue(arg-2*h);
		        	y_3=this.getValue(arg-3*h);
		        	y_4=this.getValue(arg-4*h);
		        	return (y0-4*y_1+6*y_2-4*y_3+y_4)/(h*h*h*h);
			}			
		return -500; 
					        			
	}
	public double derivForward(double arg, double h, int n){
		double y0,y1,y2,y3,y4;
		switch(n){
			case 1:
					y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	return (y1-y0)/h;
		    case 2:
					y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	y2=this.getValue(arg+2*h);
		        	return (y2-2*y1+y0)/(h*h);
			case 3:
					y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	y2=this.getValue(arg+2*h);
		        	y3=this.getValue(arg+3*h);	
		        	return (y3-3*y2+3*y1-y0)/(h*h*h);
		    case 4:
		    		y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	y2=this.getValue(arg+2*h);
		        	y3=this.getValue(arg+3*h);
		        	y4=this.getValue(arg+4*h);
		        	return (y4-4*y3+6*y2-4*y1+y0)/(h*h*h*h);
			}			
		return -500;			
	}
	
	public double derivCentral(double arg, double h, int n){
		double y_2,y_1,y0,y1,y2;
    	switch(n){
			case 1:
					y_1=this.getValue(arg-h);
		        	y1=this.getValue(arg+h);
		        	return (y1-y_1)/(2*h);
		    case 2:
					y_1=this.getValue(arg-h);
					y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	return (y1-2*y0+y_1)/(h*h);
			case 3:
					y_2=this.getValue(arg-2*h);
					y_1=this.getValue(arg-h);
					y1=this.getValue(arg+h);
		        	y2=this.getValue(arg+2*h);
					return (y2-2*y1+2*y_1-y_2)/(2*h*h*h);
		    case 4:
		    		y_2=this.getValue(arg-2*h);
					y_1=this.getValue(arg-h);
					y0=this.getValue(arg);
		        	y1=this.getValue(arg+h);
		        	y2=this.getValue(arg+2*h);
		        	return (y2-4*y1+6*y0-4*y_1+y_2)/(h*h*h*h);
			}			
		return -500;
		
	}

}
