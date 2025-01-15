import AOCCore
import Foundation

struct Day06: Day {

    let title = "Guard Gallivant"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)
        let startPosition = board.findFirst(element: "^")!

        return patrol(startPosition, .up, board).count
    }

    func part2() throws -> Int {
        let board = input().lines.map(\.characters)
        let startPosition = board.findFirst(element: "^")!

        return patrol(startPosition, .up, board)
            .count { isLoop(startPosition, .up, $0, board) }
    }

    private func isLoop(_ startPosition: Position, _ startDirection: Direction, _ obstacle: Position, _ board: [[Character]]) -> Bool {
        var route: Set<Tuple<Position, Direction>> = []
        var position = startPosition
        var direction = startDirection

        while board[position] != nil {
            route.insert(.init(position, direction))

            if board[position.offset(direction)] == "#" || position.offset(direction) == obstacle {
                direction = direction.turn()
            } else if !route.contains(.init(position.offset(direction), direction)) {
                position = position.offset(direction)
            } else {
                return true
            }
        }

        return false
    }

    private func patrol(_ startPosition: Position, _ startDirection: Direction, _ board: [[Character]]) -> Set<Position> {
        var route: Set<Position> = []
        var position = startPosition
        var direction = startDirection

        while board[position] != nil {
            route.insert(position)

            if board[position.offset(direction)] == "#" {
                direction = direction.turn()
            }

            position = position.offset(direction)
        }

        return route
    }
}

private extension Direction {

    func turn() -> Direction {
        .init(y: self.x, x: -self.y)
    }
}
