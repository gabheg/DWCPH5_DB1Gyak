public void hf2 (String fnev) {
	String sor;
	String[] szavak;
	int sorid = 0;
	try {
		BufferedReader br = new BufferedReader(new FileReader(fnev));
		while((sor=br.readLine())!=null) {
			System.out.println(sor.toUppercase());
		}
		br.close;
		System.out.println("Ok");
	} catch(Excepion ee){
		ee.printStackTrace();
		}
}