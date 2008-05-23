package logic;

import java.util.ArrayList;


public class Newton{
	ArrayList<Punkt> ob;
	double[] t;
	double[][] ilorazy;
	
	public Newton(ArrayList<Punkt> ob) {
		super();
		this.ob = ob;
		t=new double[ob.size()];
		ilorazy=new double[ob.size()][ob.size()];
		wspolczynniki();		
	}

	double setIlorazy(int i,int j){
		if (j==0){
			return ilorazy[i][j];
		}
		else{
			ilorazy[i][j]=(setIlorazy(i,j-1)-setIlorazy(i-1,j-1))/(ob.get(i).getX()-ob.get(i-j).getX());
			return ilorazy[i][j];
		}
			
	}
	
	void wspolczynniki(){
		for (int i=0; i<ob.size(); i++){
			ilorazy[i][0]=ob.get(i).getY();
		}
		ilorazy[ob.size()-1][ob.size()-1]=setIlorazy(ob.size()-1,ob.size()-1);
		for (int i=0; i<ob.size(); i++){
			t[i]=ilorazy[i][i];
		}
	}
	
	
	public String getFormula(){
		String f="";
		boolean byl=false;
		for (int i=0; i<t.length; i++){
			if (t[i]!=0){
				if (t[i]>0  && byl) f+="+";
				f+=t[i];
				for (int j=0; j<i; j++){
					f+="*(x";
					if (ob.get(j).getX()!=0){
						if (ob.get(j).getX()<0){
							f+="+"+(-1)*ob.get(j).getX();
						} 
						else{
							f+="-"+ob.get(j).getX();
						}
					}
					f+=")";
				}
				byl=true;
			}
			
		}
		return f;
	}
	
	public void getClassicalFormula(ArrayList<Punkt> p, double t[],double tab[], int n){
		//double tt[]=new double[n];
		//tt[0]=t[n];
		double tt[]=new double[1];
		if (n==0) tab[0]=t[0];
		else{
			tt=new double[n];
			tt[0]=t[n];
		}
		for (int i=0; i<n; i++){
			
			
			double temp[]=new double[n+1];
			temp[0]=0;
			for (int j=0; j<=i; j++){
				temp[j+1]=tt[j];
				tt[j]*=(-1)*p.get(i).getX();
				//tt[j]+=temp[j];
			}
			for (int j=0; j<=i; j++){
				tt[j]+=temp[j];
				//System.out.println("aaa"+temp[j]);
			}
			//tt[i]+=temp[i];
			
		}
		for (int i=0; i<n; i++){
			tab[i]+=tt[i];
			
		}
		if (n==p.size()-1) return;
		System.out.println("****"+n);
		getClassicalFormula(p, t, tab, n+1);
	}
	
	public void wspol(ArrayList<Punkt> p, double t[],double tab[], int n){
		if (n==p.size()) return;
		double tt[]=new double[n+1];
		tt[0]=t[n];
		for (int i=0; i<n; i++){
			double temp[]=new double[n+1];
			temp[0]=0;
			for (int j=0; j<=i; j++){
				temp[j+1]=tt[j];
				tt[j]=tt[j]*(-1)*p.get(i).getX();
				System.out.println(temp[j+1]);
			}
			//tt[i]*=(-1)*p.get(i).getX();
			for (int j=0; j<=i+1; j++){
				tt[j]+=temp[j];
			}
		}
		for (int i=0; i<=n; i++){
			tab[i]+=tt[i];
		}
		//if (n==p.size()-1) return; 
		wspol(p,t,tab,n+1);
	}
	
	
	
	
	public String getFoo(ArrayList<Punkt> p, double t[]){
		String wzor="";
		boolean byl=false;
		double tab[]=new double[p.size()];
		for (int i=0; i<p.size(); i++){
			tab[i]=0;
		}
		wspol(p, t, tab, 0);
		for (int i=0; i<p.size(); i++){
			System.out.println(tab[i]);
			if (tab[i]!=0){
				if (tab[i]>0 && byl){
					wzor+="+";
				}
				wzor+=tab[i];
				if (i>0){
					wzor+="*x^"+i;
				}
				byl=true;
			}
		}
		
		return wzor;
		
		
	}
	
	public String getHTMLClasic(ArrayList<Punkt> ob, double t[]) {
		String wzor="";
		boolean byl=false;
		double tab[]=new double[ob.size()];
		for (int i=0; i<ob.size(); i++){
			tab[i]=0;
		}
		wspol(ob, t, tab, 0);
		for (int i=0; i<ob.size(); i++){
			System.out.println(tab[i]);
			if (tab[i]!=0){
				if (tab[i]>0 && byl){
					wzor+="+";
				}
				if (tab[i]==-1 && i>0) wzor+="-";
				if (Math.abs(tab[i])!=1 || i==0){
					wzor+=tab[i];
					if (i>0){
						wzor+="*";
					}
				}
				if (i>0){
					wzor+="<var>x";
					if (i>1) {
						wzor+="<sup>"+i+"</sup>";
					}
					wzor+="</var>";
				}
				byl=true;
			}
		}
		
		return wzor;
	}
	
	public double horner(double x, int n){
		
		double wynik=0;
		if (n==ob.size()-1) return t[n];
		wynik=t[n]+(x-ob.get(n).getX())*horner(x,n+1);
		System.out.println("wynik"+n+"= "+wynik);
		return wynik;
	}

}
