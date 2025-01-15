import AOCCore
import Foundation

struct Day12: Day {

    let title = "Garden Groups"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)

        return GridSequence(board)
            .reduce(into: (path: Set<Position>(), answer: 0)) { result, position in
                let oldCountPath = result.path.count
                result.answer += dfs(position, board[position]!, &result.path, board) * (result.path.count - oldCountPath)
            }
            .answer
    }

    func part2() throws -> Int {
        return -1
    }

    private func dfs(_ position: Position, _ target: Character, _ path: inout Set<Position>, _ board: [[Character]]) -> Int {
        guard
            0..<board.count ~= position.y,
            0..<board[0].count ~= position.x,
            board[position] == target
        else { return 1 }

        guard
            !path.contains(position)
        else { return 0 }

        path.insert(position)

        return [Direction.up, .down, .left, .right]
            .map { dfs(position.offset($0), target, &path, board) }
            .sum
    }
}
