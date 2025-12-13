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
        input().lines
            .map { $0.characters.compactMap(Int.init) }
            .map { line in
                var digits = line
                    .enumerated()
                    .suffix(12)
                    .map { (value: $0.element, index: $0.offset) }

                digits = digits
                    .enumerated()
                    .reduce(into: []) { acc, element in
                        let (x, digit) = element

                        let upperBound = digit.index
                        let lowerBound = x > 0
                            ? acc[x - 1].index + 1
                            : 0

                        let best = (lowerBound..<upperBound)
                            .reversed()
                            .reduce(digit) { current, index in
                                line[index] >= current.value
                                    ? (line[index], index)
                                    : current
                            }

                        acc.append(best)
                    }

                return digits
                    .map(\.value)
                    .reduce(0) { $0 * 10 + $1 }
            }
            .sum
    }
}
