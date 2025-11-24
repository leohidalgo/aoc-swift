import Foundation

public extension Int {
    var digits: [Int] {
        Array(String(self)).compactMap(Int.init)
    }

    var isEven: Bool {
        self.isMultiple(of: 2)
    }

    var signum: Int {
        signum()
    }

    init?(_ character: Character) {
        guard
            character.isNumber,
            let value = character.wholeNumberValue
        else { return nil }

        self = value
    }
}
