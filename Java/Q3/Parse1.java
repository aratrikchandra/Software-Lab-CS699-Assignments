import java.util.*;
import java.io.*;

public class Parse1 {
    public static void main(String[] args)
    {
        SortedSet<String> logEntries = new TreeSet<>();
        try {
         BufferedReader fin = new BufferedReader(new FileReader("log.txt"));
         String line;
         while((line = fin.readLine())!=null)
         {
           logEntries.add(line);
         }
         fin.close();
        }
        catch (IOException e){
            e.printStackTrace();
            System.err.println(e.getMessage());
        }
        Iterator<String> it = logEntries.iterator();
        while (it.hasNext())
            System.out.println(it.next());
    }
}

