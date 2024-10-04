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

func firstThenLowerCase(of strings: [String], satisfying predicate: (String) -> Bool) -> String? {
    strings.first(where: predicate)?.lowercased()
}

struct Say{

    let phrase: String
    
    func and(_ word: String) -> Say {
        return Say(phrase: phrase + " " + word)
    }
}

func say(_ word: String = "") -> Say {
    return Say(phrase: word)
}

func meaningfulLineCount(_ filename: String) async -> Result<Int, Error> {
    guard let fileContents = try? String(contentsOfFile: filename) else {
        return .failure(NoSuchFileError())
    }

    return .success(fileContents.split(separator:"\n").filter {
         let line = String($0).trimmingCharacters(in: .whitespacesAndNewlines)
          return !(line.isEmpty || line.first == "#") 
          }.count)
}

struct Quaternion: CustomStringConvertible, Equatable {
    let a, b, c, d: Double

    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0){
        self.a = a;
        self.b = b;
        self.c = c;
        self.d = d;
    }

    static let ZERO: Quaternion = Quaternion(a: 0, b: 0, c: 0, d: 0)
    static let I: Quaternion = Quaternion(a: 0, b: 1, c: 0, d: 0)
    static let J: Quaternion = Quaternion(a: 0, b: 0, c: 1, d: 0)
    static let K: Quaternion = Quaternion(a: 0, b: 0, c: 0, d: 1)

    var coefficients: [Double]{
        return [a, b, c, d]
    }

    var conjugate: Quaternion{
        return Quaternion(a: a, b: -b, c: -c, d: -d)
    }

    static func +(first: Quaternion, second: Quaternion) -> Quaternion {
        return Quaternion(a: first.a + second.a, b: first.b + second.b, c: first.c + second.c, d: first.d + second.d)
    }

    static func *(first: Quaternion, second: Quaternion) -> Quaternion {
            let a = first.a * second.a - first.b * second.b - first.c * second.c - first.d * second.d
            let b = first.b * second.a + first.a * second.b + first.c * second.d - first.d * second.c
            let c = first.a * second.c - first.b * second.d + first.c * second.a + first.d * second.b
            let d = first.a * second.d + first.b * second.c - first.c * second.b + first.d * second.a
        return Quaternion(a: a, b: b, c: c, d: d)
    }

    var description: String {
        var s = ""
        let coefficients = self.coefficients
        let terms = ["", "i", "j", "k"]

        for (coefficient, term) in zip(coefficients, terms) {
            if coefficient == 0 {
                continue
            }

            s += coefficient < 0 ? "-" : s.isEmpty ? "" : "+"

            if abs(coefficient) != 1 || term == "" {
                s += "\(abs(coefficient))"
            }

            s += term
        }

        return s.isEmpty ? "0" : s
    }
}

enum BinarySearchTree: CustomStringConvertible {
    case empty
    indirect case node(BinarySearchTree, String, BinarySearchTree)

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
                    return right.contains(value)
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

