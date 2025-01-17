import AOCCore
import Foundation

struct Day07: Day {

    let title = "Bridge Repair"
    var rawInput: String?

    func part1() throws -> Int {
        let equations = input().lines.map(\.integers)

        let operators = [
            { (a: Int, b: Int) -> Int in return a + b },
            { (a: Int, b: Int) -> Int in return a * b }
        ]

        return equations
            .filter { hasSolution(operators, $0[0], $0[1], $0.dropFirst(2)) }
            .map { $0[0] }
            .sum
    }

    func part2() throws -> Int {
        let equations = input().lines.map(\.integers)

        let operators = [
            { (a: Int, b: Int) -> Int in return a + b },
            { (a: Int, b: Int) -> Int in return a * b },
            { (a: Int, b: Int) -> Int in return Int("\(a)\(b)")! }
        ]

        return equations
            .filter { hasSolution(operators, $0[0], $0[1], $0.dropFirst(2)) }
            .map { $0[0] }
            .sum
    }

    private func hasSolution(_ operators: [(Int, Int) -> Int], _ target: Int, _ partialResult: Int, _ remainingValues: ArraySlice<Int>) -> Bool {
        guard
            partialResult <= target,
            !remainingValues.isEmpty
        else { return partialResult == target }

        guard
            let firstValue = remainingValues.first
        else { return false }

        return operators.contains {
            hasSolution(operators, target, $0(partialResult, firstValue), remainingValues.dropFirst())
        }
    }
}
