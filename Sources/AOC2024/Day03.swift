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

        var answer = 0
        var isEnabled = true
        for match in input().raw.matches(of: query) {
            switch (match.output.0, isEnabled) {
                case ("do()", _): isEnabled = true
                case ("don't()", _): isEnabled = false
                case (_, false): continue
                default: answer += (match.output.1 ?? 0) * (match.output.2 ?? 0)
            }
        }

        return answer
    }
}
