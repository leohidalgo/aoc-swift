import Foundation

public final class Input: StringInput {

    public lazy var integers: [Int] = { raw.components(separatedBy: .whitespaces).compactMap(Int.init) }()
    public lazy var lines: [Line] = { raw.components(separatedBy: .newlines).map(Line.init) }()

    public var raw: String

    init(_ raw: String) {
        self.raw = raw
    }

    static func makeInput(caller: StaticString) -> Input {
        var pathComponents = caller.description.components(separatedBy: "/")

        var day = pathComponents.removeLast()
        day.replace(".swift", with: ".txt")

        var year = pathComponents.removeLast()
        year.replace("AOC", with: "Year-")

        pathComponents.removeLast()
        pathComponents.append(contentsOf: ["Inputs", year, day.lowercased()])

        let path = pathComponents.joined(separator: "/")

        if FileManager.default.fileExists(atPath: path),
            let raw = try? String(contentsOfFile: path, encoding: .utf8).trimmingCharacters(in: .newlines) {

            return .init(raw)
        }

        return .init("")
    }
}
