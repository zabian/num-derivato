package logic;

import org.cheffo.jeplite.JEP;
import org.cheffo.jeplite.ParseException;

public class JEPPochodna extends Pochodna{

	String wzor;
	JEP parser;
	
	public JEPPochodna(String wzor) {
		super();
		this.wzor = wzor;
		parser= new JEP();
		parser.addStandardFunctions();
		parser.addStandardConstants();
		parser.addVariable("x", 0);
	}

	@Override
	public double getValue(double arg) {
		double value = -1;
		parser.addVariable("x", arg);
		parser.parseExpression(wzor);
		try {
			value= parser.getValue();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return value;
	}

	public String getWzor() {
		return wzor;
	}

	public void setWzor(String wzor) {
		this.wzor = wzor;
	}
	

}
