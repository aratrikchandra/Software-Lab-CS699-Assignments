import java.util.*;
import java.io.*;

class Log implements Comparable<Log> {
    long nodeId, entryNumber, entryType, entryValue, timestamp;

    public Log(long nodeId, long entryNumber, long entryType, long entryValue, long timestamp) {
        this.nodeId = nodeId;
        this.entryNumber = entryNumber;
        this.entryType = entryType;
        this.entryValue = entryValue;
        this.timestamp = timestamp;
    }

    @Override
    public int compareTo(Log other) {
        if (this.nodeId != other.nodeId) {
            if(this.nodeId==other.nodeId)
                return 0;
            else if(this.nodeId > other.nodeId)
                return 1;
            else
                return -1;
        }
        else {
            if(this.entryNumber==other.entryNumber)
                return 0;
            else if(this.entryNumber > other.entryNumber)
                return 1;
            else
                return -1;
        }
    }
    }

public class Parse2 {
    public static void main(String[] args) {
        String logFile = "log.txt";
        SortedSet<Log> logEntries = new TreeSet<>();

        try {
            BufferedReader br = new BufferedReader(new FileReader(logFile));
            String line;
            while ((line = br.readLine()) != null) {
                StringTokenizer st = new StringTokenizer(line);
                long nodeId = Long.parseLong(st.nextToken());
                long entryNumber = Long.parseLong(st.nextToken());
                long entryType = Long.parseLong(st.nextToken());
                long entryValue = Long.parseLong(st.nextToken());
                long timestamp = Long.parseLong(st.nextToken());

               Log logObj=new Log(nodeId, entryNumber, entryType, entryValue, timestamp);
                logEntries.add(logObj);
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.err.println(e.getMessage());
        }

        for (Log entry : logEntries) {
            System.out.println(entry.nodeId + " " + entry.entryNumber + " " + entry.entryType + " " + entry.entryValue + " " + entry.timestamp);
        }
    }
}