import SwiftUI

public struct MenuItemCard: View {
    
    public var item: MenuItem?
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            if let menu = item {
                Text(menu.name)
            }
        }
        // Pin to top-left if given more vertical space
        .frame(maxWidth: .infinity, alignment: .topLeading)
    }
}

#Preview {
    MenuItemCard(item: MenuItem.sample())
}

