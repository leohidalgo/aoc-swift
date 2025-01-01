import ArgumentParser
import Foundation

@main
struct AOC: ParsableCommand {

    @Option
    var day: Int

    @Option
    var year: Int = 2024

    func run() throws {
        let t1 = Date()
        print("Run puzzle day '\(day)' year '\(year)'")
        let t2 = Date()

        print("Time \(String(format: "%.3f", t2.timeIntervalSince(t1)))s")
    }
}
