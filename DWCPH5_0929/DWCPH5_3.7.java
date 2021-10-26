public void hf5(){
	String sor;
	Auto ma;
	
	try{
		File fn = new File("Autok.dat");
		if(fn.exists()){
			ObjectInputStream kifile = new ObjectInputStream(
				new FileInputStream ("Autok.dat")	
			);
			try {
				while(true) {
					ma=(Auto) kifile.readObject();
					if(ma.ar>300){
						System.out.println("rendszam=" + m.rsz);
					}
				}
			} catch (EOFException ee){
				ma=null;
  			 }
			  kifile.close();
			}
		}catch (Exception e) (
			e.printStackTrace();
			System.out.println("File nyitasi hiba");
			}
		System.out.println("Ok2");
}

		