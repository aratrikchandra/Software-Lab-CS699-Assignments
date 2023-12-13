
import java.io.*;
public class Solution {
    public static void main(String[] args) {
        String fileName = "output.txt";
        String content = "UUID,ShortBuffer,SOAPBinding.Style";

        try {
            BufferedWriter out = new BufferedWriter(new FileWriter(fileName));
            out.write(content);
          out.close();
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
    }
}
