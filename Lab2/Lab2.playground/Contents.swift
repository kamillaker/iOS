import Foundation
// Problem 1: FizzBuzz
// Prints numbers from 1 to 100, replacing multiples of 3 with Fizz,
// multiples of 5 with Buzz, and multiples of both with FizzBuzz.

for i in 1...100 {
    if i % 3 == 0 && i % 5 == 0 {
        print("FizzBuzz")
    } else if i % 3 == 0 {
        print("Fizz")
    } else if i % 5 == 0 {
        print("Buzz")
    } else {
        print(i)
    }
}


// Problem 2: Prime Numbers
// Function to check if a number is prime and print primes from 1 to 100.

func isPrime(_ number: Int) -> Bool {
    if number <= 1 { return false }
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}

// Print primes from 1 to 100
for num in 1...100 {
    if isPrime(num) {
        print(num)
    }
}


// Problem 3: Temperature Converter
// Converts temperatures between Celsius, Fahrenheit, and Kelvin.


func celsiusToFahrenheit(_ c: Double) -> Double { return (c * 9/5) + 32 }
func celsiusToKelvin(_ c: Double) -> Double { return c + 273.15 }

func fahrenheitToCelsius(_ f: Double) -> Double { return (f - 32) * 5/9 }
func fahrenheitToKelvin(_ f: Double) -> Double { return (f - 32) * 5/9 + 273.15 }

func kelvinToCelsius(_ k: Double) -> Double { return k - 273.15 }
func kelvinToFahrenheit(_ k: Double) -> Double { return (k - 273.15) * 9/5 + 32 }

// User input
print("Enter temperature value:")
if let input = readLine(), let value = Double(input) {
    print("Enter unit (C, F, K):")
    if let unit = readLine() {
        switch unit.uppercased() {
        case "C":
            print("Fahrenheit: \(celsiusToFahrenheit(value))")
            print("Kelvin: \(celsiusToKelvin(value))")
        case "F":
            print("Celsius: \(fahrenheitToCelsius(value))")
            print("Kelvin: \(fahrenheitToKelvin(value))")
        case "K":
            print("Celsius: \(kelvinToCelsius(value))")
            print("Fahrenheit: \(kelvinToFahrenheit(value))")
        default:
            print("Invalid unit!")
        }
    }
}


// Problem 4: Shopping List Manager
// Simple console-based shopping list app using an array.


var shoppingList: [String] = []
var running = true

while running {
    print("""
    \n--- Shopping List Menu ---
    1. Add item
    2. Remove item
    3. View list
    4. Exit
    Choose an option:
    """)
    
    if let choice = readLine() {
        switch choice {
        case "1":
            print("Enter item to add:")
            if let item = readLine() {
                shoppingList.append(item)
                print("\(item) added.")
            }
        case "2":
            print("Enter item to remove:")
            if let item = readLine(), let index = shoppingList.firstIndex(of: item) {
                shoppingList.remove(at: index)
                print("\(item) removed.")
            } else {
                print("Item not found.")
            }
        case "3":
            print("Current shopping list: \(shoppingList)")
        case "4":
            running = false
        default:
            print("Invalid option.")
        }
    }
}


// Problem 5: Word Frequency Counter
// Counts frequency of each word in a sentence.

print("Enter a sentence:")
if let sentence = readLine() {
    let words = sentence
        .lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .filter { !$0.isEmpty }
    
    var frequency: [String: Int] = [:]
    for word in words {
        frequency[word, default: 0] += 1
    }
    
    for (word, count) in frequency {
        print("\(word): \(count)")
    }
}


// Problem 6: Fibonacci Sequence
// Returns first n Fibonacci numbers in an array.

func fibonacci(_ n: Int) -> [Int] {
    if n <= 0 { return [] }
    if n == 1 { return [0] }
    
    var sequence = [0, 1]
    while sequence.count < n {
        let next = sequence[sequence.count - 1] + sequence[sequence.count - 2]
        sequence.append(next)
    }
    return sequence
}

// Example test
print(fibonacci(10))


// Problem 7: Grade Calculator
// Processes student test scores.

let students: [String: Int] = [
    "Alice": 85,
    "Bob": 70,
    "Charlie": 95,
    "Diana": 60
]

let scores = Array(students.values)
let average = Double(scores.reduce(0, +)) / Double(scores.count)
let highest = scores.max() ?? 0
let lowest = scores.min() ?? 0

print("Average score: \(average)")
print("Highest score: \(highest)")
print("Lowest score: \(lowest)\n")

for (name, score) in students {
    if Double(score) >= average {
        print("\(name): \(score) (Above or equal to average)")
    } else {
        print("\(name): \(score) (Below average)")
    }
}

// Problem 8: Palindrome Checker
// Checks if a given string is a palindrome.

func isPalindrome(_ text: String) -> Bool {
    let cleaned = text
        .lowercased()
        .components(separatedBy: CharacterSet.alphanumerics.inverted)
        .joined()
    
    return cleaned == String(cleaned.reversed())
}

// Example test
print(isPalindrome("A man, a plan, a canal: Panama"))
print(isPalindrome("Hello"))


//Problem 9: Simple Calculator


func add(_ a: Double, _ b: Double) -> Double { a + b }
func subtract(_ a: Double, _ b: Double) -> Double { a - b }
func multiply(_ a: Double, _ b: Double) -> Double { a * b }
func divide(_ a: Double, _ b: Double) -> Double {
    b == 0 ? Double.nan : a / b
}

let x = 10.0
let y = 5.0

print("Addition: \(x) + \(y) = \(add(x, y))")
print("Subtraction: \(x) - \(y) = \(subtract(x, y))")
print("Multiplication: \(x) * \(y) = \(multiply(x, y))")
print("Division: \(x) / \(y) = \(divide(x, y))")


//Problem 10: Unique Characters
func hasUniqueCharacters(_ text: String) -> Bool {
    var seen = Set<Character>()
    for char in text {
        if seen.contains(char) {
            return false
        }
        seen.insert(char)
    }
    return true
}

print(hasUniqueCharacters("Swift"))
print(hasUniqueCharacters("Hello"))




