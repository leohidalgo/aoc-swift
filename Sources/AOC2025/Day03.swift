import AOCCore
import Foundation

struct Day03: Day {
    let title = "Lobby"
    var rawInput: String?

    func part1() throws -> Int {
        input().lines
            .map { $0.characters.compactMap(Int.init) }
            .map { line in
                var index = 0

                var left = 0
                var right = 0

                while index < line.count - 1 {
                    if line[index] > line[left] {
                        left = index
                    }

                    index += 1
                }

                index = left + 1
                right = left + 1
                while index < line.count {
                    if line[index] > line[right] {
                        right = index
                    }

                    index += 1
                }

                return line[left] * 10 + line[right]
            }
            .sum
    }

    func part2() throws -> Int {
        -1
    }
}
