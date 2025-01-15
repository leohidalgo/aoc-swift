import AOCCore
import Foundation

struct Day11: Day {

    let title = "Plutonian Pebbles"
    var rawInput: String?

    func part1() throws -> Int {
        var stones = makeStones()

        (0..<25).forEach { _ in
            stones.blink()
        }

        return stones.values.sum
    }

    func part2() throws -> Int {
        var stones = makeStones()

        (0..<75).forEach { _ in
            stones.blink()
        }

        return stones.values.sum
    }

    private func makeStones() -> [Int: Int] {
        input().integers.reduce(into: [:]) { result, item in
            result[item, default: 0] += 1
        }
    }
}

private extension Int {

    func blinked() -> [Int] {
        if self == 0 { return [1] }
        else if self.digits.count.isEven {
            let separator = Int(pow(10, Double(self.digits.count / 2)))

            let left = self / separator
            let right = self - (left * separator)

            return [left, right]
        }

        return [self * 2024]
    }
}

private extension Dictionary where Key == Int, Value == Int {

    mutating
    func blink() {
        self = self.keys.reduce(into: [:]) { result, item in
            item
                .blinked()
                .forEach { result[$0, default: 0] += self[item, default: 0] }
        }
    }
}
