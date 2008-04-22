package logic;

public class NewtonPochodna extends Pochodna {
	
	Newton n;
	
	public NewtonPochodna(Newton n) {
		super();
		this.n = n;
	}

	@Override
	public double getValue(double arg) {
		
		double value;
		value= n.horner(arg, 0);
		return value;
	}

}
