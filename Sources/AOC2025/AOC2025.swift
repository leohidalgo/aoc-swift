import AOCCore
import Foundation

public enum AOC2025 {
    private static let days: [Int: any Day] = [
        1: Day01()
    ]
}

extension AOC2025: Year {
    public static func day(_ day: Int) -> (any Day)? {
        days[day]
    }
}
