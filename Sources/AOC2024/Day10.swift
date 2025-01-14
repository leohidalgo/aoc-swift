import AOCCore
import Foundation

struct Day10: Day {

    let title = "Hoof It"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map { $0.characters.compactMap(Int.init) }

        return board.findAll(element: 0)
            .map { dfs($0, 0, board) }
            .map(\.unique)
            .map(\.count)
            .sum
    }

    func part2() throws -> Int {
        let board = input().lines.map { $0.characters.compactMap(Int.init) }

        return board.findAll(element: 0)
            .map { dfs($0, 0, board) }
            .map(\.count)
            .sum
    }

    private func dfs(_ position: Position, _ target: Int, _ board: [[Int]]) -> [Position] {
        guard
            (0..<board.count) ~= position.y,
            (0..<board[0].count) ~= position.x,
            board[position] == target
        else { return [] }

        guard
            target != 9
        else { return [position] }

        return [Direction.up, .down, .left, .right]
            .flatMap { dfs(position.offset($0), target + 1, board) }
    }
}
