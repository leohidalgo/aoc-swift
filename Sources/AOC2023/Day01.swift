import AOCCore
import Foundation
import RegexBuilder

struct Day01: Day {
    let title = "Trebuchet?!"
    var rawInput: String?

    func part1() throws -> Int {
        let lines = input().lines.map(\.characters)

        return lines
            .map { line in
                let left = line.first(where: { $0.isNumber }).flatMap(Int.init) ?? 0
                let right = line.last(where: { $0.isNumber }).flatMap(Int.init) ?? 0

                return left * 10 + right
            }
            .sum
    }

    func part2() throws -> Int {
        let query = Regex {
            Lookahead {
                ChoiceOf {
                    TryCapture.wordInteger
                    TryCapture.integer
                }
            }
        }

        return input().lines
            .map { line in
                line.raw
                    .matches(of: query)
                    .compactMap { $0.output.1 ?? $0.output.2 }
                    .flatMap { $0.digits }
            }
            .map { line in
                let left = line.first ?? 0
                let right = line.last ?? 0

                return left * 10 + right
            }
            .sum
    }
}
