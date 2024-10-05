# Homework Assignments

### Homework 1: Scripting (Lua, Javascript, Python)
**Group:**  Brian Bowers

**About:**  This assignment consisted of reading the Preface and Chapters 1, 2, 3, and 5 of the textbook, as well as other reference readings. Then I had to complete five problems in three different languages: Python, Javascript, and Lua. Each problem was checked with its own unit tests. The first problem was to write a function that when given a sequence of strings and a predicate returns the first string that satisfies the predicate. The second problem was to write a generator, or a Lua coroutine, that yeilds successive powers of the base starting with the base to the zero power. The third problem was to write chainable functions that accept a string or no arguments and returns the words previously passed in. The fourth problem was another function that returns the number of meaningful text lines given a filename. The last problem was to write a class, table in Lua, that represents a Quaternion which supports adding, multiplying, obtaining the coefficients, computing the conjugate, supports-value based equality, and has a string representation. 

Resources that helped me:
- class notes 
- the MDN Web Docs, such as https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/reject
- python docs, such as https://docs.python.org/3/library/dataclasses.html
- W3 schools, such as https://www.w3schools.com/jsref/jsref_try_catch.asp
- Lua docs, such as https://www.lua.org/pil/6.1.html
- other random articles: https://en.wikipedia.org/wiki/Quaternion#Quaternion_algebras, https://www.pythonmorsels.com/python-setattr/, https://www.freecodecamp.org/news/with-open-in-python-with-statement-syntax-example/

### Homework 2: Enterprise Languages (Java, Kotlin, Swift)
**Group:**  Brian Bowers

**About:**  This assignment consisted of reading the Preface and several chaphers of the textbook. This homework had the same questions as the first assignment with the addition of a new problem, creating a binary search tree for strings. This assignment focused on features such as immutibility and optionals, as well as limiting access to vars and methods in classes.

Resources that helped me:
- class notes 
- the homework helper 2
- https://www.hackingwithswift.com/, helped give concrete examples of how to use features in swift. 
- https://www.w3schools.com/java/ for weird java features

## The Test Suites

### Lua

```
lua exercises_test.lua
```

### Python

```
python3 exercises_test.py
```

### JavaScript

```
npm test
```

### Java

```
javac *.java && java ExercisesTest
```

### Kotlin

```
kotlinc *.kt -include-runtime -d test.jar && java -jar test.jar
```

### Swift

```
swiftc -o main exercises.swift main.swift && ./main
```

### TypeScript

```
npm test
```

### OCaml

```
ocamlc exercises.ml exercises_test.ml && ./a.out
```

### Haskell

```
ghc ExercisesTest.hs && ./ExercisesTest
```

### C

```
gcc string_stack.c string_stack_test.c && ./a.out
```

### C++

```
g++ -std=c++20 stack_test.cpp && ./a.out
```

### Rust

```
cargo test
```

### Go

```
go run restaurant.go
```

## Grading Notes

Your grade is a reflection not only of your ability to write code to pass existing tests, but also of your ability to construct software in a professional setting. Therefore, the following will contribute rather heavily to your score:

- **Following all submission instructions**! Pay attention to every requirement such as replacing the contents of this readme file and including the names of all participants of any group work.
- **Keeping a pristine GitHub repository**. Do not push any file that does not belong (including but not limited to that silly `DS_Store`). Make sure all generated executables, intermediate files, third-party libraries, etc. are not committed. Your repo contents should be limited to your solution files, tests, configuration files, and `.gitignore` files.
- **Adherence to naming and formatting conventions for the language you are writing in**. Inconsistent indentation, for example, has no place in professional or student software. Neither does end-of-line whitespace, huge chunks of contiguous blank lines, and other types of messy coding practices that show friends, family, colleagues, and potential employers that you don’t care about your work.
- (As always) The **readability and maintainability** of your code.
