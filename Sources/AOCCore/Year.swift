import Foundation

public protocol Year {

    static func day(_ day: Int) -> (any Day)?
}
