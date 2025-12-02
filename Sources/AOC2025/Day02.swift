import AOCCore
import Foundation

struct Day02: Day {
    let title = "Gift Shop"
    var rawInput: String?

    func part1() throws -> Int {
        input().raw
            .split(separator: ",")
            .map { $0.split(separator: "-") }
            .compactMap { line -> ClosedRange<Int>? in
                guard
                    let from = Int(line[0]),
                    let to = Int(line[1])
                else { return nil }

                return from...to
            }
            .reduce(into: 0) { result, range in
                for i in range where i.isTwiceSequenceOfDigits() {
                    result += i
                }
            }
    }

    func part2() throws -> Int {
        input().raw
            .split(separator: ",")
            .map { $0.split(separator: "-") }
            .compactMap { line -> ClosedRange<Int>? in
                guard
                    let from = Int(line[0]),
                    let to = Int(line[1])
                else { return nil }

                return from...to
            }
            .reduce(into: 0) { result, range in
                for i in range where i.isMultipleSequenceOfDigits() {
                    result += i
                }
            }
    }
}

private extension Int {
    func isTwiceSequenceOfDigits() -> Bool {
        let n = countOfDigits

        guard
            n.isEven
        else { return false }

        let base = pow10(n / 2)

        let left = self / base
        let right = self % base

        return left == right
    }

    func isMultipleSequenceOfDigits() -> Bool {
        let n = countOfDigits

        guard
            n > 1
        else { return false }

        for size in 1...(n / 2) where n.isMultiple(of: size) {
            var match = true

            let base = pow10(size)
            let pattern = self % base
            var value = self / base

            while value > 0 {
                if value % base != pattern {
                    match = false
                    break
                }

                value /= base
            }

            if match {
                return true
            }
        }

        return false
    }
}
