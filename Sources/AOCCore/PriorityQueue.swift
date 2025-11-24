import Foundation

public struct PriorityQueue<Element, Cost: Comparable> {
    public var isEmpty: Bool { queue.isEmpty }

    private var queue: [(element: Element, cost: Cost)] = []

    public init() { }

    public mutating func append(_ element: Element, _ cost: Cost) {
        queue.append((element, cost))

        queue.sort { $0.cost < $1.cost }
    }

    public mutating func removeFirst() -> (element: Element, cost: Cost) {
        queue.removeFirst()
    }
}
