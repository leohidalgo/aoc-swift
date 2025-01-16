import AOCCore
import Foundation

struct Day09: Day {

    let title = "Disk Fragmenter"
    var rawInput: String?

    func part1() throws -> Int {
        let diskMap = input().characters.compactMap(Int.init)
        var disk = makeDiskPart1(diskMap)

        var left = 0
        var right = disk.count - 1
        while left < right {
            while left < right, !disk[left].isFree { left += 1 }
            while left < right, disk[right].isFree { right -= 1 }

            disk.swapAt(left, right)
        }

        return disk.checksum()
    }

    func part2() throws -> Int {
        let diskMap = input().characters.compactMap(Int.init)
        var (files, free) = makeDiskPart2(diskMap)

        for id in (0..<files.count).reversed() {
            guard
                let (fileIndex, fileSize) = files[id],
                let i = free.firstIndex(where: { $0.size >= fileSize })
            else { continue }

            if fileIndex > free[i].index {
                files[id]?.index = free[i].index
                free[i].index += fileSize
                free[i].size -= fileSize
            }
        }

        return files.checksum()
    }

    private func makeDiskPart1(_ diskMap: [Int]) -> [Disk] {
        diskMap
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
    }

    private func makeDiskPart2(_ diskMap: [Int]) -> (files: [Int: Block], free: [Block]) {
        let (files, free, _, _) = diskMap
            .enumerated()
            .reduce(into: (files: Dictionary<Int, Block>(), free: Array<Block>(), id: 0, index: 0)) { result, item in
                if item.offset.isEven {
                    result.files[result.id] = (result.index, item.element)
                    result.id += 1
                } else {
                    result.free.append((result.index, item.element))
                }

                result.index += item.element
            }

        return (files, free)
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

private extension Dictionary where Key == Int, Value == Block {

    func checksum() -> Int {
        self
            .map {
                let startIndex = $0.value.index
                let endIndex = $0.value.index + $0.value.size

                return (startIndex..<endIndex).sum * $0.key
            }
            .sum
    }
}

private extension Collection where Element == Disk {

    func checksum() -> Int {
        self
            .compactMap(\.fileId)
            .enumerated()
            .map(*)
            .sum
    }
}
