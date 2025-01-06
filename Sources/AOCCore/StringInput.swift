import Foundation

public protocol StringInput {

    var integers: [Int] { get }
    var lines: [Line] { get }
    var raw: String { get }
}
