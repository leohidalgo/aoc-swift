import Foundation

public protocol Day: Sendable {

    associatedtype Part1: CustomStringConvertible = Int
    associatedtype Part2: CustomStringConvertible = Int

    var title: String { get }
    var rawInput: String? { get set }

    func part1() throws -> Part1
    func part2() throws -> Part2
}

public extension Day {

    func input(filePath: StaticString = #filePath) -> Input {
        guard
            let rawInput
        else { return Input.makeInput(caller: filePath) }

        return Input(rawInput)
    }

    func run() throws -> (Part1, Part2) {
        (try part1(), try part2())
    }
}
