import SwiftUI

public struct ACCard<ACOBJECT:ACEntity>: View {
    
    public var acItem: ACOBJECT?
    
    public var body: some View {
        VStack {
            if let item = acItem {
                Text(item.name)
            }
        }
    }
}

#Preview("MenuItem") {
    ACCard(acItem: MenuItem.sample())
}
#Preview("MenuGroup") {
    ACCard(acItem: MenuGroup.sample())
}
