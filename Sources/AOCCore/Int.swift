import Foundation

public extension Int {
    var countOfDigits: Int {
        Int(log10(Double(self))) + 1
    }

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
