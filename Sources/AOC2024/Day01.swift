import AOCCore
import Foundation

struct Day01: Day {

    let title = "Historian Hysteria"
    var rawInput: String?

    func part1() throws -> Int {
        var left = input().lines.map(\.integers[0])
        var right = input().lines.map(\.integers[1])

        left.sort()
        right.sort()

        return zip(left, right)
            .map(-)
            .map(abs)
            .sum
    }

    func part2() throws -> Int {
        let left = input().lines.map(\.integers[0])
        let right = input().lines.map(\.integers[1])

        let counter = right
            .reduce(into: [:]) { result, element in
                result[element, default: 0] += 1
            }

        return left
            .map { counter[$0, default: 0] * $0 }
            .sum
    }
}
