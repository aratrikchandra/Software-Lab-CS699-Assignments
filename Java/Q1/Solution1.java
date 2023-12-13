 import java.io.*;
public class Solution {
    public static void main(String[] args){
        try{
            BufferedWriter out = new BufferedWriter(new FileWriter("output.txt"));
            out.write("Comparable<String>");
            out.newLine();  // This writes a newline character.
            out.write("Serializable");
            out.newLine();  // This writes a newline character.
            out.write("CharSequence");
            out.newLine();  // This writes a newline character.
            out.close();
        }
        catch(IOException e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
    }
}
