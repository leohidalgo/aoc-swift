import AOCCore
import Foundation

struct Day05: Day {

    let title = "Print Queue"
    var rawInput: String?

    func part1() throws -> Int {
        let rules = input().sections[0].lines.map(\.integers)
            .reduce(into: [:]) { result, value in
                result[value[0], default: []].append(value[1])
            }

        return input().sections[1].lines.map(\.integers)
            .filter { update in
                zip(update, update.dropFirst()).allSatisfy { lhs, rhs in
                    isLower(lhs, rhs, rules)
                }
            }
            .map { $0[$0.count / 2] }
            .sum
    }

    func part2() throws -> Int {
        let rules = input().sections[0].lines.map(\.integers)
            .reduce(into: [:]) { result, value in
                result[value[0], default: []].append(value[1])
            }

        return input().sections[1].lines.map(\.integers)
            .filter { update in
                !zip(update, update.dropFirst()).allSatisfy { lhs, rhs in
                    isLower(lhs, rhs, rules)
                }
            }
            .map { $0.sorted { isLower($0, $1, rules) } }
            .map { $0[$0.count / 2] }
            .sum
    }

    private func isLower(_ lhs: Int, _ rhs: Int, _ rules: [Int: [Int]]) -> Bool {
        rules[lhs, default: []].contains(rhs)
    }
}
