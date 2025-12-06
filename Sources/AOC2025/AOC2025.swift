import AOCCore
import Foundation

public enum AOC2025 {
    private static let days: [Int: any Day] = [
        1: Day01(),
        2: Day02(),
        3: Day03(),
        4: Day04(),
        5: Day05()
    ]
}

extension AOC2025: Year {
    public static func day(_ day: Int) -> (any Day)? {
        days[day]
    }
}
