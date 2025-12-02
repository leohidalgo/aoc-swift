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

        var measuresPart1: [DateInterval] = []
        var measuresPart2: [DateInterval] = []
        var p1: CustomStringConvertible = ""
        var p2: CustomStringConvertible = ""

        for _ in 0..<iterations {
            try {
                let t1 = Date()
                p1 = try puzzle.part1()
                let t2 = Date()
                measuresPart1.append(DateInterval(start: t1, end: t2))
            }()

            try {
                let t1 = Date()
                p2 = try puzzle.part2()
                let t2 = Date()
                measuresPart2.append(DateInterval(start: t1, end: t2))
            }()
        }

        print("Day \(day): \(puzzle.title)")
        print("Part 1: \(p1) (\(String(format: "%.3f", measuresPart1.average))s - \(iterations) iterations)")
        print("Part 2: \(p2) (\(String(format: "%.3f", measuresPart2.average))s - \(iterations) iterations)")
    }
}
