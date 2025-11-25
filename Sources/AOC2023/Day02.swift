import AOCCore
import Foundation
import RegexBuilder

struct Day02: Day {
    let title = "Cube Conundrum"
    var rawInput: String?

    func part1() throws -> Int {
        let query = Regex {
            TryCapture.integer
            OneOrMore(.whitespace)
            TryCapture {
                ChoiceOf {
                    "blue"
                    "red"
                    "green"
                }
            } transform: { String($0) }
        }

        let limits = ["red": 12, "green": 13, "blue": 14]

        return input().lines
            .map(\.raw)
            .map {
                $0
                    .split(separator: ";")
                    .allSatisfy { group in
                        let total = group
                            .matches(of: query)
                            .reduce(into: [:], { result, element in
                                result[element.output.2, default: 0] += element.output.1
                            })

                        return limits.allSatisfy { color, maxAllowed in
                            total[color, default: 0] <= maxAllowed
                        }
                    }
            }
            .enumerated()
            .reduce(into: 0, { result, item in
                if item.element {
                    result += item.offset + 1
                }
            })
    }

    func part2() throws -> Int {
        -1
    }
}
