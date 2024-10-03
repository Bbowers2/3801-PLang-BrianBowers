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
func meaningfulLineCount(_ fileName: String) async -> Result<Int, Error> {
    
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

    var description: String {
        return "hello there"
    }

    var coefficients: [Double]{
        return [a, b, c, d]
    }

    var conjugate: Quaternion{
        return Quaternion(a: a, b: -b, c: -c, d: -d)
    }

    //static func +
    //static func *
}
// Write your Binary Search Tree enum here
enum BinarySearchTree: CustomStringConvertible {
    case empty
    indirect case Node(BinarySearchTree, Int, BinarySearchTree)
}