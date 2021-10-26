package db1;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Scanner;

public class XYFileIr {

	public static void main(String[] args) throws IOException {		

	int n=0;
	PrintWriter out = new PrintWriter("vezeteknev.txt");
	Scanner sc=new Scanner(System.in);
	
	System.out.println("Adatok száma: ");
	n=sc.nextInt();
	for(int i=0;i<n;i++) {
		System.out.print(i + ".adat = ");
		out.println(sc.nextInt());
		}
	out.close();
	}

}