import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun change(amount: Long): Map<Int, Long> {
    require(amount >= 0) { "Amount cannot be negative" }
    
    val counts = mutableMapOf<Int, Long>()
    var remaining = amount
    for (denomination in listOf(25, 10, 5, 1)) {
        counts[denomination] = remaining / denomination
        remaining %= denomination
    }
    return counts
}

fun firstThenLowerCase(phrase: List<String>, predicate: (String) -> Boolean): String? {
    return phrase.firstOrNull(predicate)?.lowercase()  
}
// // Write your say function here
// data class Say(val phrase: String) {
//     fun and(nextPhrase: String): Say {
//         return Say("$phrase $nextPhrase")
//     }
// }

// fun say(phrase: String = ""): Say {
//     return Say(phrase)
// }
// // Write your meaningfulLineCount function here
// @Throws(IOException::class)
// fun meaningfulLineCount(fileName: String): Long {
//     BufferedReader(FileReader(fileName)).use { //useLines
//         reader -> return reader.lines().filter {it.trim().isNotEmpty() }.count()
//     }
// }
// // Write your Quaternion data class here
// data class Quaternion(val a: Double, val b: Double, val c: Double, val d: Double){
    
//     companion object {
//         val ZERO = Quaternion(0.0, 0.0, 0.0, 0.0)
//         val I = Quaternion(0.0, 1.0, 0.0, 0.0)
//         val J = Quaternion(0.0, 0.0, 1.0, 0.0)
//         val K = Quaternion(0.0, 0.0, 0.0, 1.0)
//     }
    
//     operator fun plus(other: Quaternion): Quaternion {
//         return Quaternion(a + other.a, b + other.b, c + other.c, d + other.d)
//     }

//     operator fun times(other: Quaternion){
//         return Quaternion(
//                 a * other.a - b * other.b - c * other.c - d * other.d,
//                 b * other.a + a * other.b + c * other.d - d * other.c,
//                 a * other.c - b * other.d + c * other.a + d * other.b,
//                 a * other.d + b * other.c - c * other.b + d * other.a
//         )
//     }

//     fun coefficients(): List<Double> = listOf(a, b, c, d)

//     fun conjugate(): Quaternion = Quaternion(a, -b, -c, -d)

//     override fun toString(): String {
//         var s = ""
//         var coefficients = this.coefficients()
//         var terms = listOf("", "i", "j", "k")

//         for ((index, coefficient) in coefficients.withIndex()) {
//             if (coefficient == 0) {
//                 continue
//             }

//             s += if (coefficient < 0) "-" else if (s.isEmpty()) "" else "+"

//             if (abs(coefficient) != 1 || i == 0) {
//                 s += abs(coefficient)
//             }

//             s += terms.get(i)
//         }

//         return if (s.length() > 0) s else "0"

//     }



// }

// // Write your Binary Search Tree interfacthise and implementing classes here
// sealed interface BinarySearchTree {
//     fun size(): Int
//     fun contains(value: String): Boolean
//     fun insert(value: String): BinarySearchTree

//     object Empty: BinarySearchTree {
//         override fun size(): Int = 0
//         override fun contains(value: String): Boolean = false
//         override fun insert(value: String): BinarySearchTree = Node(value, Empty, Empty)
//         override fun toString(): String = "()"
//     }

//     data class Node(private val value: String, private val left: BinarySearchTree, private val right: BinarySearchTree): BinarySearchTree {
//         override fun size(): Int {
//             return 1 + right.size() + left.size()
//         }
//         override fun contains(value: String): Boolean = when {
//             value <  this.value -> left.contains(value)
//             value > this.value -> right.contains(value)
//             else -> true
//         }
//         override fun insert(value: String): BinarySearchTree = when {
//             value < this.value -> Node(this.value, left.insert(value), right)
//             value > this.value -> Node(this.value, left, right.insert(value))
//             else -> this
//         }
//         override fun toString(): String = "(" + left + value + right + ")"   
//     }

// }

