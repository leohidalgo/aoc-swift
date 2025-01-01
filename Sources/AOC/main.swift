import ArgumentParser
import Foundation

@main
struct AOC: ParsableCommand {

    @Option
    var day: Int

    @Option
    var year: Int = 2024

    func run() throws {
        print("Run puzzle day '\(day)' year '\(year)'")
    }
}
