import AOC2024
import AOCCore
import ArgumentParser
import Foundation

@main
struct AOC: ParsableCommand {

    @Option
    var day: Int

    @Option
    var iterations = 1

    func validate() throws {
        guard
            (1...25).contains(day)
        else { throw ValidationError("Invalid day \(day)") }

        guard
            (1...).contains(iterations)
        else { throw ValidationError("Invalid iterations number") }
    }

    func run() throws {
        guard
            let puzzle = AOC2024.day(day)
        else { throw CleanExit.message("Day not yet solved") }

        var measures: [DateInterval] = []
        var p1: CustomStringConvertible = ""
        var p2: CustomStringConvertible = ""

        for _ in 0..<iterations {
            let t1 = Date()
            (p1, p2) = try puzzle.run()
            let t2 = Date()

            measures.append(DateInterval(start: t1, end: t2))
        }

        print("Day \(day): \(puzzle.title)")
        print("Part 1: \(p1)")
        print("Part 2: \(p2)")
        print("Execution time \(String(format: "%.3f", measures.average))s - \(iterations) iterations.")
    }
}
