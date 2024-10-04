import Foundation

struct NegativeAmountError: Error {}
struct NoSuchFileError: Error {}

func change(_ amount: Int) -> Result<[Int:Int], NegativeAmountError> {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    var (counts, remaining) = ([Int:Int](), amount)
    for denomination in [25, 10, 5, 1] {
        (counts[denomination], remaining) = 
            remaining.quotientAndRemainder(dividingBy: denomination)
    }
    return .success(counts)
}

// Write your first then lower case function here
func firstThenLowerCase(of strings: [String], satisfying predicate: (String) -> Bool) -> String? {
    strings.first(where: predicate)?.lowercased()
}

// Write your say function here
struct Say{

    let phrase: String
    
    func and(_ word: String) -> Say {
        return Say(phrase: phrase + " " + word)
    }
}

func say(_ word: String = "") -> Say {
    return Say(phrase: word)
}

// Write your meaningfulLineCount function here
func meaningfulLineCount(_ filename: String) async -> Result<Int, Error> {
    guard let fileContents = try? String(contentsOfFile: filename) else {
        return .failure(NoSuchFileError())
    }

    return .success(fileContents.readLines().filter { $0.trimmingCharacters(in: .whitespacesAndNewLines) == "" or $0.trimmingCharacters(in: .whitespacesAndNewLines).first() == "#" }.count)
}

// Write your Quaternion struct here
struct Quaternion: CustomStringConvertible, Equatable {
    let a, b, c, d: Double

    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0){
        self.a = a;
        self.b = b;
        self.c = c;
        self.d = d;
    }

    static let Zero: Quaternion = Quaternion(a: 0, b: 0, c: 0, d: 0)
    static let I: Quaternion = Quaternion(a: 0, b: 1, c: 0, d: 0)
    static let J: Quaternion = Quaternion(a: 0, b: 0, c: 1, d: 0)
    static let K: Quaternion = Quaternion(a: 0, b: 0, c: 0, d: 1)

    var coefficients: [Double]{
        return [a, b, c, d]
    }

    var conjugate: Quaternion{
        return Quaternion(a: a, b: -b, c: -c, d: -d)
    }

    static func +(other: Quaternion) -> Quaternion {
        return Quaternion(a + other.a, b + other.b, c + other.c, d + other.d)
    }

    static func *() -> Quaternion {
        return Quaternion(
            .a * other.a - .b * other.b - .c * other.c - .d * other.d,
            .b * other.a + .a * other.b + .c * other.d - .d * other.c,
            .a * other.c - .b * other.d + .c * other.a + .d * other.b,
            .a * other.d + .b * other.c - .c * other.b + .d * other.a
        )
    }

    var description: String {
        String s = "";
        var coefficients = this.coefficients();
        var terms = listOf("", "i", "j", "k");

        for coefficient, term in coefficients, terms {
            if coefficient == 0 {
                continue;
            }

            s += coefficient < 0 ? "-" : s.isEmpty() ? "" : "+";

            if abs(coefficient) != 1 || i == 0 {
                s += abs(coefficient);
            }

            s += term;
        }

        return s.length() > 0 ? s : "0";
    }
}
// Write your Binary Search Tree enum here
enum BinarySearchTree: CustomStringConvertible {
    case empty
    indirect case Node(BinarySearchTree, String, BinarySearchTree)

    var size: Int {
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return 1 + left.size + right.size
            
        }
    }

    func contains(_ value: String) -> Bool {
        switch self {
            case .empty:
                return false
            case let .node(left, v, right):
                if value < v {
                    return left.contains(value)
                } else if value > v {
                    return right.constains(value)
                } else {
                    return true
                }
        }
    }


    func insert(_ value: String) -> BinarySearchTree {
        switch self {
            case .empty:
                return .node(.empty, value, .empty)
            case let .node(left, v, right):
                if value < v {
                    return .node(left.insert(value), v, right)
                } else if value > v {
                    return .node(left, v, right.insert(value))
                } else {
                    return self
                }
        }
    }

    var description: String {
        switch self {
            case .empty:
                return "()"
            case let .node(left, value, right):
                return "(\(left)\(value)\(right))".replacingOccurrences(of: "()", with: "")
        }
    }


}

