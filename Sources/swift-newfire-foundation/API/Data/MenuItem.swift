import SwiftUI
import SwiftData

@Model public class MenuItem: ACEntity {
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
} 

extension MenuItem {
    static func samples() -> [MenuItem] {
        [
             MenuItem("Google"),
              MenuItem("ClientWorks"),
              MenuItem("Wealthbox")
        ]
    }
    static func sample() -> MenuItem {
        MenuItem("Google")
    }
}
