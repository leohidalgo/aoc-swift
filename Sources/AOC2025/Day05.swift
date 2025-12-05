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

        return ingredients.filter { id in
            for range in ranges where range.contains(id) {
                return true
            }

            return false
        }
        .count
    }

    func part2() throws -> Int {
        -1
    }
}
