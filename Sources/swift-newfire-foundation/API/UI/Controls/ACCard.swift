import SwiftUI

public struct ACCard<ACOBJECT:ACEntity>: View {
    
    public var acItem: ACOBJECT?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let item = acItem {
                Text(item.name)
            }
        }
        // Pin to top-left when the parent gives extra space
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview("MenuItem") {
        VStack(alignment: .listRowSeparatorLeading, spacing: 15) {
            ACCard(acItem: MenuItem.sample())
            ACCard(acItem: MenuItem.sample())
        }
}
#Preview("MenuGroup") {
    ACCard(acItem: MenuGroup.sample())
}

