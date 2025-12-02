import AOCCore
import Foundation

struct Day01: Day {
    let title = "Secret Entrance"
    var rawInput: String?

    func part1() throws -> Int {
        input().lines
            .map(\.components)
            .reduce((current: 50, total: 0)) { result, line in
                var (current, total) = result

                current += line.direction * line.steps

                if current < 0 {
                    current = 100 + (current % 100)
                } else if current > 100 {
                    current = current % 100
                }

                if current == 0 || current == 100 {
                    current = 0
                    total += 1
                }

                return (current, total)
            }
            .total
    }

    func part2() throws -> Int {
        input().lines
            .map(\.components)
            .reduce((current: 50, total: 0)) { result, line in
                var (current, total) = result
                var delta = line.steps

                while delta > 0 {
                    current += line.direction
                    delta -= 1

                    if current == 100 {
                        current = 0
                    }

                    if current == -1 {
                        current = 99
                    }

                    if current == 0 {
                        total += 1
                    }
                }

                return (current, total)
            }
            .total
    }
}

private extension Line {
    var components: (direction: Int, steps: Int) {
        let direction = raw.prefix(1) == "L"
            ? -1
            : 1
        let steps = Int(raw.dropFirst()) ?? 0

        return (direction, steps)
    }
}
