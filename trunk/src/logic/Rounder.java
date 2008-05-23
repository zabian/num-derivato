package logic;

import java.math.BigDecimal;

public class Rounder {
	public static double round(double arg, int n){
		return (new BigDecimal( arg  ).setScale( n, BigDecimal.ROUND_HALF_UP).doubleValue());
	}

}
