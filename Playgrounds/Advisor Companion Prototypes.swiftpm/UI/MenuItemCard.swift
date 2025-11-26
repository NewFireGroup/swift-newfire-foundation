import SwiftUI

public struct MenuItemCard: View {
    
    public var item: MenuItem?
    
    public var body: some View {
        VStack {
            if let menu = item {
                Text(menu.name)
            }
        }
    }
}

#Preview {
    MenuItemCard(item: MenuItem.sample())
}
