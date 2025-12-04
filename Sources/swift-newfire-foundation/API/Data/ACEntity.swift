import SwiftUI
import SwiftData

public protocol ACEntity: Identifiable, Hashable {
    var id: String { get set }
    var name: String { get set }
    var systemImage: String { get set }
}

extension ACEntity {

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }

    public static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }

}
