//
//  SwiftUIView.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/30/25.
//

import SwiftUI

struct EntryList: View {
    @Binding var entries: [CashflowItem]
    
    var body: some View {
        List($entries) { entry in
            EntryCard(entry: entry)
        }
    }
}

#Preview {
    StatefulPreviewWrapper(CashflowItem.samples()) {
        entries in
        EntryList(entries: entries)
    }
    
}
