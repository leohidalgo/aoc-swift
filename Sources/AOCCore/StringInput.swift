import Foundation

public protocol StringInput {

    var characters: [Character] { get }
    var integers: [Int] { get }
    var lines: [Line] { get }
    var raw: String { get }
}
