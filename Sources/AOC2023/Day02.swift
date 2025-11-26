import AOCCore
import Foundation
import RegexBuilder

struct Day02: Day {
    let title = "Cube Conundrum"
    var rawInput: String?

    func part1() throws -> Int {
        let limits = ["red": 12, "green": 13, "blue": 14]

        return input().lines
            .map { line in
                line
                    .subsets()
                    .allSatisfy { subset in
                        limits.allSatisfy { color, maxAllowed in
                            subset[color, default: 0] <= maxAllowed
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
        input().lines
            .map { line in
                let maxValues = line
                    .subsets()
                    .reduce((red: 0, green: 0, blue: 0)) { result, subset in
                        (
                            red: max(result.red, subset["red", default: 0]),
                            green: max(result.green, subset["green", default: 0]),
                            blue: max(result.blue, subset["blue", default: 0])
                        )
                    }

                return maxValues.red * maxValues.green * maxValues.blue
            }
            .sum
    }
}

private extension Line {
    func subsets() -> [[String: Int]] {
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

        return self.raw
            .split(separator: ";")
            .map { group in
                group
                .matches(of: query)
                .reduce(into: [:], { result, element in
                    result[element.output.2, default: 0] += element.output.1
                })
            }
    }
}
