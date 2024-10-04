
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;
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

    public static Optional<String> firstThenLowerCase(List<String> strings, Predicate<String> predicate) {
        return strings.stream().filter(predicate).findFirst().map(String::toLowerCase);
    }

    static class Say {

        private String phrase;

        public Say(String phrase) {
            this.phrase = phrase;
        }

        public String phrase() {
            return this.phrase;
        }

        public Say and(String string) {
            return new Say(this.phrase + " " + string);
        }
    }

    public static Say say(String phrase) {
        return new Say(phrase);
    }

    public static Say say() {
        return new Say("");
    }

    //return not a int 
    static Integer meaningfulLineCount(String fileName) throws IOException {

        try (var fileReader = new BufferedReader(new FileReader(fileName))) {
            return (int) fileReader.lines().filter(line -> !line.trim().isEmpty() && !line.trim().startsWith("#")).count();
        }
    }
}

record Quaternion(double a, double b, double c, double d) {

    public Quaternion    {
        if (Double.isNaN(a) || Double.isNaN(b) || Double.isNaN(c) || Double.isNaN(d)) {
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

    public List<Double> coefficients() {
        return List.of(a, b, c, d);
    }

    public Quaternion plus(Quaternion other) {

        return new Quaternion(
                this.a + other.a,
                this.b + other.b,
                this.c + other.c,
                this.d + other.d
        );

    }

    public Quaternion times(Quaternion other) {

        return new Quaternion(
                this.a * other.a - this.b * other.b - this.c * other.c - this.d * other.d,
                this.b * other.a + this.a * other.b + this.c * other.d - this.d * other.c,
                this.a * other.c - this.b * other.d + this.c * other.a + this.d * other.b,
                this.a * other.d + this.b * other.c - this.c * other.b + this.d * other.a
        );
    }

    @Override
    public String toString() {
        String s = "";
        var coefficients = this.coefficients();
        var terms = List.of("", "i", "j", "k");

        for (int i = 0; i < coefficients.size(); i++) {
            var coefficient = coefficients.get(i);

            if (coefficient == 0) {
                continue;
            }

            s += coefficient < 0 ? "-" : s.isEmpty() ? "" : "+";

            if (Math.abs(coefficient) != 1 || i == 0) {
                s += Math.abs(coefficient);
            }

            s += terms.get(i);
        }

        return s.length() > 0 ? s : "0";
    }

}

sealed interface BinarySearchTree permits Empty, Node {

    int size();

    boolean contains(String value);

    BinarySearchTree insert(String value);

}

final record Empty() implements BinarySearchTree {

    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean contains(String value) {
        return false;
    }

    @Override
    public BinarySearchTree insert(String value) {
        return new Node(value, this, this);
    }

    @Override
    public String toString() {
        return "()";
    }
}

final class Node implements BinarySearchTree {

    private final String value;
    private final BinarySearchTree left;
    private final BinarySearchTree right;

    Node(String value, BinarySearchTree left, BinarySearchTree right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }

    @Override
    public int size() {
        return 1 + left.size() + right.size();
    }

    @Override
    public boolean contains(String value) {
        return this.value.equals(value) || left.contains(value) || right.contains(value);
    }

    @Override
    public BinarySearchTree insert(String value) {
        if (value.compareTo(this.value) < 0) {
            return new Node(this.value, left.insert(value), right);
        } else {
            return new Node(this.value, left, right.insert(value));
        }
    }

    @Override
    public String toString() {
        var stringRep = "(" + left + value + right + ")";
        return stringRep.replace("()", "");

    }
}
