import SwiftUI
import SwiftData

public protocol ACEntity {
    var id: String { get set }
    var name: String { get set }
    var systemImage: String { get set }
}
