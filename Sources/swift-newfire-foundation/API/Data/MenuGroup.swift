import SwiftUI
import SwiftData

open class MenuGroup: ACEntity {
    public var id: String
    public var name: String
    public var systemImage: String
    
    public init(
        id: String? = nil, 
        _ name: String? = nil,
        systemImage: String? = nil) {
            self.id = id ?? UUID().uuidString
            self.name = name ?? "New Item"
            self.systemImage = systemImage ?? "cloud.fill"
            
    }
    
    public static func == (lhs: MenuGroup, rhs: MenuGroup) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
}

extension MenuGroup {
    static func samples() -> [MenuGroup] {
        [
            MenuGroup("Main Menu"),
            MenuGroup("Households")
        ]
    }
    static func sample() -> MenuGroup {
        MenuGroup("Main Menu")
    }
}
