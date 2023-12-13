import java.io.*;
import java.util.*;

/* 
The main function takes as command-line argument a 'testnum' (which controls the sorting order) and a set of CSV files with mortality data.

It parses the CSV file into a suitable Java collections data structure of MortalityData objects and then prints all of the data objects into an output file in sorted order.

Complete the code below. Insert your code ONLY in the portions indicated.
*/

class MortalityData implements Comparable<MortalityData> {
    // An object of this class represents the mortality data for a particular age-group, for a particular week number, in a particular year
    int year;
    int weeknum;
    int agelower;
    int ageupper; // NOTE: Age range is: agelower <= age <= ageupper
    int mortalitycount;

    MortalityData(int year, int weeknum, int agelower, int ageupper, int mortalitycount) {
        this.year = year;
        this.weeknum = weeknum;
        this.agelower = agelower;
        this.ageupper = ageupper;
        this.mortalitycount = mortalitycount;
    }

    // This is what implements the Comparable interface
    public int compareTo(MortalityData m1) {
        return (MortalityAnalysis.testnum >= 0) ? compareHelper1(m1) : compareHelper2(m1);
    }

    // Here, this object should be compared with m1
    // First, based on year, then on weeknum, then on agelower
    // Return -ve, 0, or +ve as in the standard compareTo of the Comparable interface
    public int compareHelper1(MortalityData m1) {
        /* BEGIN_YOUR_CODE_SECTION_1 */
        if(year == m1.year) {
            if(weeknum == m1.weeknum) return agelower-m1.agelower;
            else return weeknum-m1.weeknum;
        } else {
            return year-m1.year;
        }
        /* END_YOUR_CODE_SECTION_1 */
    }

    // Here, this object should be compared with m1
    // First, based on year, then on agelower, then on weeknum
    // Return -ve, 0, or +ve as in the standard compareTo of the Comparable interface
    public int compareHelper2(MortalityData m1) {
        /* BEGIN_YOUR_CODE_SECTION_2 */
        if(year == m1.year) {
            if(agelower == m1.agelower) return weeknum-m1.weeknum;
            else return agelower-m1.agelower;
        } else {
            return year-m1.year;
        }
        /* END_YOUR_CODE_SECTION_2 */
    }

    public String toString() {
        // This should be implemented such that the output CSV matches what is expected:
        // Columns of CSV should be year,weeknum,agelower,ageupper,mortalitycount
        /* BEGIN_YOUR_CODE_SECTION_3 */
        return "" + year + "," + weeknum + "," + agelower + "," + ageupper + "," + mortalitycount;
        /* END_YOUR_CODE_SECTION_3 */
    }

}

class MortalityAnalysis {
    // This is the class which implements main

    public static int testnum; // Command-line arg used to control sorting order of output

    // Below, declare the field 'data' to be of suitable type, as required for IN-ORDER printing (see section 6)
    // You must use a suitable Java Collections data structure here: see docs/technotes/guides/collections/index.html in given documentation
    // Note that the collection must be printable in sorted order
    // Also see how the 'data' variable is used in the parse() function which reads the input
    /* BEGIN_YOUR_CODE_SECTION_4 */
    TreeSet<MortalityData> data;
    /* END_YOUR_CODE_SECTION_4 */

    MortalityAnalysis() {
        // Write code to initialize the 'data' variable suitably
        /* BEGIN_YOUR_CODE_SECTION_5 */
        data = new TreeSet<MortalityData>();
        /* END_YOUR_CODE_SECTION_5 */
    }

    public static void main(String[] argv) {
        if(argv.length < 2) {
            System.err.println("Usage: MortalityAnalysis <testnum> <datafile1> <datafile2>...");
            System.exit(1);
        }
        testnum = Integer.parseInt(argv[0]);
        MortalityAnalysis ma = new MortalityAnalysis();
        // Simply read in data from each input file into 'data', then print CSV output in sorted order
        for(int i=1; i<argv.length; i++) {
            ma.parse(argv[i]);
        }
        ma.printInOrder();
    }

    void printInOrder() {
        // Write code to print the data entries in increasing order
        // Note that you will IMPLICITLY (not explicitly) be using the compareTo function
        // Your code will actually be using a suitable iterator
        // Note: printing a single MortalityData m1 can be done by simply calling System.out.println(m1) , after you have suitably defined the toString function in MortalityData class
        /* BEGIN_YOUR_CODE_SECTION_6 */
        //System.out.println(data.size());
        Iterator<MortalityData> iter = data.iterator();
        while(iter.hasNext()) {
            MortalityData md = iter.next();
            System.out.println(md);
        }
        /* END_YOUR_CODE_SECTION_6 */
    }

    void parse(String datafile) {
        try {
            // Get year from file name
            String[] s1 = datafile.split("\\.");
            if(s1.length != 2) {
                throw new IOException("Expecting filename.csv as datafile: " + datafile);
            }
            String[] s2 = s1[0].split("-");
            int thisyear = -1;
            try {
                thisyear = Integer.parseInt(s2[s2.length-1]);
            } catch (NumberFormatException nfe) {
                throw new NumberFormatException("Expecting filename-year.csv as datafile: " + datafile);
            }

            File file=new File(datafile); // creates a new file instance  
            FileReader fr=new FileReader(file); // reads the file  
            BufferedReader br=new BufferedReader(fr); // creates a buffering character input stream
            String line;

            String firstline = br.readLine();
            if(firstline == null) throw new IOException("No firstline in file " + datafile);
            String[] linesplit = firstline.split(",");
            if(linesplit.length < 2) throw new IOException("First line in file has too few fields" + datafile);
            int firstweek = Integer.parseInt(linesplit[1]);
            if(firstweek != 1) throw new NumberFormatException("Expecting firstweek to be 1 in file " + datafile);

            while((line = br.readLine()) != null) {
                linesplit = line.split(",");
                String ageRangeStr = linesplit[0];
                String[] agesplit = ageRangeStr.split("-");
                if(agesplit.length != 2) {
                    throw new IOException(ageRangeStr + ": expecting agelower-ageupper in first field of file " + datafile);
                }
                int agelower = Integer.parseInt(agesplit[0]);
                int ageupper = Integer.parseInt(agesplit[1]);
                for(int week = 1; week<linesplit.length; week++) {
                    int mortalitycount = Integer.parseInt(linesplit[week]);
                    data.add(new MortalityData(thisyear, week, agelower, ageupper, mortalitycount));
                }
            }
            br.close();

        } catch (IOException ioe) {
            ioe.printStackTrace();
            System.err.println(ioe.toString());
        } catch (NumberFormatException nfe) {
            System.err.println("parse error in file " + datafile);
            nfe.printStackTrace();
            System.err.println(nfe.toString());
        }
    }
}