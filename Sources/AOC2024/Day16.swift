import AOCCore
import Foundation

struct Day16: Day {

    let title = "Reindeer Maze"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)
        let startPosition = Position(y: board.count - 2, x: 1)
        let endPosition = Position(y: 1, x: board[0].count - 2)

        var answer = 0
        var visited: Set<Position> = []
        var queue = PriorityQueue<(position: Position, direction: Direction), Int>()
        queue.append((startPosition, .up), 1000)

        while !queue.isEmpty {
            let ((currentPosition, currentDirection), currentCost) = queue.removeFirst()

            guard
                0..<board.count ~= currentPosition.y,
                0..<board[0].count ~= currentPosition.x,
                board[currentPosition] != "#",
                !visited.contains(currentPosition)
            else { continue }

            if currentPosition == endPosition {
                answer = currentCost
                break
            }

            visited.insert(currentPosition)

            [Direction.up, .down, .left, .right].forEach {
                let newPosition = currentPosition.offset($0)

                if !visited.contains(newPosition) {
                    let additionalCost = currentDirection == $0 ? 0 : 1000
                    queue.append((newPosition, $0), currentCost + additionalCost + 1)
                }
            }
        }

        return answer
    }

    func part2() throws -> Int {
        return -1
    }
}
