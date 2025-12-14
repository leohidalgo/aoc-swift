import AOCCore
import Foundation

struct Day07: Day {
    let title = "Laboratories"
    var rawInput: String?

    func part1() throws -> Int {
        let board = input().lines.map(\.characters)

        guard
            let startPosition = board.findFirst(element: "S")
        else { return 0 }

        var stack = [startPosition]
        var visited: Set<Position> = []
        var total = 0

        while !stack.isEmpty {
            guard
                let current = stack.popLast(),
                board[current] != nil,
                !visited.contains(current)
            else { continue }

            if board[current] == "^" {
                stack.append(current.offset(.downLeft))
                stack.append(current.offset(.downRight))

                total += 1

                continue
            }

            visited.insert(current)

            stack.append(current.offset(.down))
        }

        return total
    }

    func part2() throws -> Int {
        -1
    }
}
