import AOCCore
import Foundation

struct Day06: Day {

    let title = "Guard Gallivant"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)

        var position = board.findFirst(element: "^")!
        var direction = Direction.up
        var path: Set<Position> = []

        while board[position] != nil {
            path.insert(position)

            if board[position.offset(direction)] == "#" {
                direction = direction.turn()
            }

            position = position.offset(direction)
        }

        return path.count
    }

    func part2() throws -> Int {
        -1
    }
}

private extension Direction {

    func turn() -> Direction {
        .init(y: self.x, x: -self.y)
    }
}
