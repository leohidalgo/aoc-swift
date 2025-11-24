import AOC2023
import AOC2024
import AOC2025
import AOCCore
import ArgumentParser
import Foundation

@main
struct AOC: ParsableCommand {
    @Option
    var year: Int = 2025

    @Option
    var day: Int

    @Option
    var iterations = 1

    func validate() throws {
        guard
            (2023...2025).contains(year)
        else { throw ValidationError("Invalid year \(year)") }

        guard
            (1...25).contains(day)
        else { throw ValidationError("Invalid day \(day)") }

        guard
            (1...).contains(iterations)
        else { throw ValidationError("Invalid iterations number") }
    }

    func run() throws {
        let years: [Int: any Year.Type] = [
            2023: AOC2023.self,
            2024: AOC2024.self,
            2025: AOC2025.self
        ]

        guard
            let puzzle = years[year]?.day(day)
        else { throw CleanExit.message("Day \(day) not solved yet for year \(year)") }

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
