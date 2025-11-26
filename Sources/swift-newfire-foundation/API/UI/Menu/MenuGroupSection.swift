import Foundation
import SwiftUI

public struct MenuGroupSection<CONTENTS: View>: View {
    
    var item: (any ACEntity)?
    @ViewBuilder var contents: CONTENTS
    
    public var body: some View {
        if let itemValue = item {
            Section(itemValue.name) {
                contents
            }
        } else {
            MilkCarton(missing: "Menu Group")
        }
    }
}

#Preview("Empty") {
    MenuGroupSection(item: nil, contents: {
        ForEach(MenuItem.samples()) { item in 
            NavigationLink(value: item, label: {
                Text(item.name)
            })   
        }
    })
}
#Preview("Navigation Links") {
    MenuGroupSection(item: MenuGroup.sample(), contents: {
        ForEach(MenuItem.samples()) { item in 
            NavigationLink(value: item, label: {
                Text(item.name)
            })   
        }
    })
}
