import AOCCore
import Foundation

struct Day04: Day {

    let title = "Ceres Search"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)
        let target = Array("XMAS")
        let directions = [Direction.up, .down, .left, .right, .upLeft, .upRight, .downLeft, .downRight]

        var answer = 0
        for position in GridSequence(board) {
            answer += directions.count { search(position, $0, 0, target, board) }
        }

        return answer
    }

    func part2() throws -> Int {
        let board = input().lines.map(\.characters)
        let target = Array("MAS")

        let directions: [Direction: [(offset: (y: Int, x: Int), direction: Direction)]] = [
            .downRight: [((y: 2, x: 0), .upRight), ((y: 0, x: 2), .downLeft)],
            .upLeft: [((y: -2, x: 0), .downLeft), ((y: 0, x: -2), .upRight)]
        ]

        var answer = 0
        for position in GridSequence(board) {
            answer += directions.count { key, value in
                search(position, key, 0, target, board) &&
                value.contains { search(position.offset($0.offset), $0.direction, 0, target, board) }
            }
        }

        return answer
    }

    private func search(_ position: Position, _ direction: Direction, _ targetIndex: Int, _ target: [Character], _ board: [[Character]]) -> Bool {
        guard
            board[position] == target[targetIndex]
        else { return false }

        guard
            targetIndex < target.count - 1
        else { return true }

        return search(position.offset(direction), direction, targetIndex + 1, target, board)
    }
}
