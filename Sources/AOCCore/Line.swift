import Foundation

public final class Line {

    public lazy var integers: [Int] = { raw.components(separatedBy: .whitespaces).compactMap(Int.init) }()
    public lazy var lines: [Line] = { raw.components(separatedBy: .newlines).map(Line.init) }()

    public var raw: String

    public init(_ raw: String) {
        self.raw = raw
    }
}

extension Line: CustomDebugStringConvertible {

    public var debugDescription: String {
        "Line(\"\(raw)\")"
    }
}
