import AOCCore
import Foundation

struct Day09: Day {

    let title = "Disk Fragmenter"
    var rawInput: String?

    func part1() throws -> Int {
        let diskMap = input().characters.compactMap(Int.init)

        var disk = diskMap
            .enumerated()
            .reduce(into: (disk: [], id: 0)) { result, item in
                if item.offset.isEven {
                    result.disk.append(contentsOf: Array(repeating: Disk.file(id: result.id), count: item.element))
                    result.id += 1
                } else {
                    result.disk.append(contentsOf: Array(repeating: Disk.free, count: item.element))
                }
            }
            .disk as [Disk]

        var left = 0
        var right = disk.count - 1
        while left < right {
            while left < right, !disk[left].isFree { left += 1 }
            while left < right, disk[right].isFree { right -= 1 }

            disk.swapAt(left, right)
        }

        return disk
            .compactMap(\.fileId)
            .enumerated()
            .map(*)
            .sum
    }

    func part2() throws -> Int {
        return -1
    }
}

private typealias Block = (index: Int, size: Int)

private enum Disk: CustomDebugStringConvertible {

    case file(id: Int)
    case free

    var fileId: Int? {
        if case let .file(id) = self { id }
        else { nil }
    }

    var isFree: Bool {
        if case .free = self { true }
        else { false }
    }

    var debugDescription: String {
        switch self {
            case let .file(id): "\(id)"
            case .free: "."
        }
    }
}
