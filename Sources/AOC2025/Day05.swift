import AOCCore
import Foundation

struct Day05: Day {
    let title = "Cafeteria"
    var rawInput: String?

    func part1() throws -> Int {
        let ranges = input().sections[0].lines
            .map(\.integers)
            .map { $0[0]...$0[1] }
        let ingredients = input().sections[1].lines
            .flatMap(\.integers)

        return ingredients
            .filter { id in
                for range in ranges where range.contains(id) {
                    return true
                }

                return false
            }
            .count
    }

    func part2() throws -> Int {
        input().sections[0].lines
            .map(\.integers)
            .map { $0[0]...$0[1] }
            .sorted { $0.lowerBound < $1.lowerBound }
            .reduce(into: [ClosedRange<Int>]()) { result, range in
                guard
                    let last = result.last
                else {
                    result.append(range)
                    return
                }

                if last.overlaps(range) {
                    result.removeLast()
                    result.append(last.lowerBound...max(last.upperBound, range.upperBound))
                } else {
                    result.append(range)
                }
            }
            .map { $0.upperBound - $0.lowerBound + 1 }
            .sum
    }
}
