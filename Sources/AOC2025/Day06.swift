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
        -1
    }
}
