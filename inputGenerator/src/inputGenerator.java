import java.io.FileWriter;
import java.io.PrintWriter;

public class inputGenerator {
    public static void main (String []args) throws java.io.IOException {
        FileWriter file = new FileWriter("input.txt");
        PrintWriter pw = new PrintWriter(file);
        int N = 5;
        int m = N;
        for (int i=0; i < N; i++) {
            m--;
            pw.println("enqueue "+ i + "-" + m + " " + m);
        }
        //insertar más instrucciones aquí
        file.close();
    }
}