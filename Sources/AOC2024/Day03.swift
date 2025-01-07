import AOCCore
import Foundation
import RegexBuilder

struct Day03: Day {

    let title = "Mull It Over"
    var rawInput: String?

    func part1() throws -> Int {
        let query = Regex {
            "mul("
            TryCapture.integer
            ","
            TryCapture.integer
            ")"
        }

        return input().raw
            .matches(of: query)
            .map { $0.output.1 * $0.output.2 }
            .sum
    }

    func part2() throws -> Int {
        let query = Regex {
            ChoiceOf {
                "do()"
                "don't()"
                Regex {
                    "mul("
                    TryCapture.integer
                    ","
                    TryCapture.integer
                    ")"
                }
            }
        }

        return input().raw.matches(of: query)
            .reduce(into: (answer: 0, isEnabled: true)) { result, match in
                switch (match.output.0, result.isEnabled) {
                case ("do()", _): result.isEnabled = true
                case ("don't()", _): result.isEnabled = false
                case (_, false): return
                default: result.answer += (match.output.1 ?? 0) * (match.output.2 ?? 0)
                }
            }
            .answer
    }
}
