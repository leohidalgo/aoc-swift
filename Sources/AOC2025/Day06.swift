import AOCCore
import Foundation

struct Day06: Day {
    let title = "Trash Compactor"
    var rawInput: String?

    func part1() throws -> Int {
        input().lines
            .map { $0.raw.split(separator: .whitespace).map(String.init) }
            .columns
            .map { (numbers: $0.dropLast().compactMap(Int.init), operation: $0.suffix(1).first) }
            .map { numbers, operation in
                if operation == "*" {
                    return numbers.reduce(1, *)
                }

                if operation == "+" {
                    return numbers.reduce(0, +)
                }

                return 0
            }
            .sum
    }

    func part2() throws -> Int {
        let board = input().lines.map(\.characters)

        let maxLength = board.reduce(0) { result, line in
            max(result, line.count)
        }

        let numbers = (0..<maxLength)
            .map { x in
                board.reduce(0) { number, line in
                    guard
                        x < line.count,
                        let digit = line[x].wholeNumberValue
                    else { return number }

                    return number * 10 + digit
                }
            }
            .split(separator: 0)

        let operations = board.last?.filter { !$0.isWhitespace } ?? []

        return zip(numbers, operations)
            .map { numbers, operation  in
                if operation == "*" {
                    return numbers.reduce(1, *)
                }

                if operation == "+" {
                    return numbers.reduce(0, +)
                }

                return 0
            }
            .sum
    }
}
