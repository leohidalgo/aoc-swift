import AOCCore
import Foundation

struct Day02: Day {

    var title = "Red-Nosed Reports"
    var rawInput: String?

    func part1() throws -> Int {
        let reports = input().lines.map(\.integers)

        return reports
            .count(where: isSafe)
    }

    func part2() throws -> Int {
        let reports = input().lines.map(\.integers)

        return reports
            .count { levels in
                (0..<levels.count).contains { index in
                    var new = levels
                    new.remove(at: index)

                    return isSafe(levels: new)
                }
            }
    }

    private func isSafe(levels: [Int]) -> Bool {
        let diff = zip(levels, levels.dropFirst()).map(-)

        return
            diff.map(\.signum).allSame &&
            diff.map(abs).allSatisfy { $0 <= 3 }
    }
}
