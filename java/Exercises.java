import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;
import java.util.function.Function;
import java.util.function.Predicate;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

public class Exercises {
    static Map<Integer, Long> change(long amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount cannot be negative");
        }
        var counts = new HashMap<Integer, Long>();
        for (var denomination : List.of(25, 10, 5, 1)) {
            counts.put(denomination, amount / denomination);
            amount %= denomination;
        }
        return counts;
    }

    // Write your first then lower case function here
    public static Optional<String> firstThenLowerCase(List<String> strings, Predicate<String> predicate){
        return strings.stream().filter(predicate).findFirst().map(String::toLowerCase);
    }

    // Write your say function here
    private static class Say {
        private String phrase;

        public Say(String phrase){
            this.phrase = phrase;
        }

        public String phrase(){
            return this.phrase;
        }

        public Say and(String string){
            return new Say(this.phrase + " " + string);
        }
    }

    public static Say say(String phrase) {
        return new Say(phrase);
    }

    public static Say say(){
        return new Say("");
    }

    // Write your line count function here
    public static Integer meaningfulLineCount(String fileName) throws IOException{

        try (var fileReader = new BufferedReader(new FileReader(fileName))){
            return (int)fileReader.lines().filter(line -> !line.trim().isEmpty() && !line.trim().startsWith("#")).count();
        }
    }    
}

// Write your Quaternion record class here
record Quaternion(double a, double b, double c, double d ){

    public Quaternion {
        if (Double.isNaN(a) || Double.isNaN(b) || Double.isNaN(c) || Double.isNaN(d)){
            throw new IllegalArgumentException("Coefficients cannot be NaN");
        }
    }

    public final static Quaternion ZERO = new Quaternion(0, 0, 0, 0);
    public final static Quaternion I = new Quaternion(0, 1, 0, 0);
    public final static Quaternion J = new Quaternion(0, 0, 1, 0);
    public final static Quaternion K = new Quaternion(0, 0, 0, 1);

    public Quaternion conjugate() {
        return new Quaternion(a, -b, -c, -d);
    }

    public List<Double> coefficients(){
        return List.of(a, b, c, d);
    }

    @Override
    public String toString(){
        return "";
    }

}
// Write your BinarySearchTree sealed interface and its implementations here
sealed interface BinarySearchTree permits Empty, Node {
    int size();

    //at 19 mins in homework helper

}

