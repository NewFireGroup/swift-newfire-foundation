//
//  Item.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import Foundation
import SwiftUI

public struct EntryEdit: View {

    @State private var entry: CashflowItem = CashflowItem()

    public var body: some View {
        VStack {
            Form {
                Section {
                    TextField("", text: $entry.name, prompt: Text("Name"))
                        .accessibilityLabel("Name")
                    Picker("Type", selection: $entry.type) {
                        ForEach(CashflowType.allCases) { type in
                            Text(type.displayName).tag(type)
                        }
                    }
                    .accessibilityLabel("Entry Type")
                    Picker("Category", selection: $entry.category) {
                        ForEach(Category.samples()) { category in
                            Text(category.name)
                        }
                    }
                        .accessibilityLabel("Category")
                    TextField("Amount", value: $entry.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        #if canImport(UIKit)
                        .keyboardType(.decimalPad)
                        #endif
                        .accessibilityLabel("Amount")
                }
                
                Section {
                    TextEditorPlaceHolder(
                        text: $entry.name,
                        placeholder: "Notes",
                        minHeight: 80,
                        accessibilityLabel: "Notes"
                    )
                }
            }
            .navigationTitle("Cashflow Entry")
        }
    }
}

#Preview {
    EntryEdit()
}
