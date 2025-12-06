import AOCCore
import Foundation

struct Day04: Day {
    let title = "Printing Department"
    var rawInput: String?

    func part1() throws -> Int {
        let diagram = input().lines.map(\.characters)
        let directions: [Direction] = [.upLeft, .up, .upRight, .left, .right, .downLeft, .down, .downRight]

        return diagram.indices
            .flatMap { y in
                diagram[y].indices.map { x in Point(y: y, x: x) }
            }
            .filter { diagram[$0] == "@" }
            .filter { point in
                directions
                    .filter { diagram[point.offset($0)] == "@" }
                    .count < 4
            }
            .count
    }

    func part2() throws -> Int {
        -1
    }
}
