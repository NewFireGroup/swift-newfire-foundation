import SwiftUI
import SwiftData

public protocol ACEntity: Identifiable {
    var id: String { get set }
    var name: String { get set }
    var systemImage: String { get set }
}
