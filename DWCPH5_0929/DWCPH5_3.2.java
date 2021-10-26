package db1;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class XYFileOlvas {

  public static void main(String[] args) {

    String fileName = "vezeteknev.txt";

    try (BufferedReader fileReader = new BufferedReader(new FileReader(fileName));) {
      long sum = 0;
      int i=0;

      while (true) {
        String lineRead = fileReader.readLine();
        if (lineRead == null) {
          // End of file is reached
          break;//w  w w.  j ava  2 s.  com
        }
        long num = Integer.parseInt(lineRead);
        System.out.println(i + ". elem: " + num);
        i++;
        sum += num;
      }// end of while

      System.out.println("Összeg: " + sum);
    }// end of try block

    catch (IOException ioex) {
      System.err.println("Error");
    }// end of catch block
  }// end of main
}// end of class