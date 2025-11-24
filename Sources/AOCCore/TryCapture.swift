import Foundation
import RegexBuilder

public extension TryCapture where Output == (Substring, Int) {
    static var integer: Self {
        TryCapture {
            OneOrMore { .digit }
        } transform: {
            Int($0)
        }
    }

    static var wordInteger: Self {
        TryCapture {
            ChoiceOf {
                "zero"
                "one"
                "two"
                "three"
                "four"
                "five"
                "six"
                "seven"
                "eight"
                "nine"
            }
        } transform: {
            let numberWords: [Substring: Int] = [
                "zero": 0,
                "one": 1,
                "two": 2,
                "three": 3,
                "four": 4,
                "five": 5,
                "six": 6,
                "seven": 7,
                "eight": 8,
                "nine": 9
            ]

            return numberWords[$0]
        }
    }
}
