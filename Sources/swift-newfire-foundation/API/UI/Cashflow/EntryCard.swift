//
//  SwiftUIView.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import SwiftUI

struct EntryCard: View {
    
    @Binding var entry: CashflowItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Optional leading icon if you later decide to use systemImage
            if !entry.systemImage.isEmpty {
                Image(systemName: entry.systemImage)
                    .font(.title3)
                    .foregroundStyle(.secondary)
            }
            
            VStack(alignment: .leading, spacing: 6) {
                // Title and type badge row
                HStack(alignment: .firstTextBaseline) {
                    Text(entry.name.isEmpty ? "Untitled" : entry.name)
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Spacer(minLength: 8)
                    
                    Text(entry.type.displayName)
                        .font(.caption.weight(.semibold))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(typeTint.opacity(0.15))
                        .foregroundStyle(typeTint)
                        .clipShape(Capsule())
                        .accessibilityLabel("Type \(entry.type.displayName)")
                }
                
                // Category (optional)
                if let category = entry.category {
                    Text(category.name)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .accessibilityLabel("Category \(category.name)")
                }
            }
            
            Spacer()
            
            // Amount on the trailing side
            Text(formattedAmount)
                .font(.title3.weight(.semibold))
                .monospacedDigit()
                .foregroundStyle(typeTint)
                .accessibilityLabel("Amount \(formattedAmount)")
        }
        .padding(14)
        .background(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
            #if canImport(UIKit)
                .fill(Color(.secondarySystemBackground))
            #endif
        )
        .overlay(
            RoundedRectangle(cornerRadius: 12, style: .continuous)
            #if canImport(UIKit)
                .stroke(Color(.separator), lineWidth: 0.5)
            #endif
        )
        .accessibilityElement(children: .contain)
    }
    
    private var typeTint: Color {
        switch entry.type {
        case .income: return .green
        case .expense: return .red
        case .none: return .secondary
        }
    }
    
    private var formattedAmount: String {
        // Use Locale currency; fall back to USD
        let code = Locale.current.currency?.identifier ?? "USD"
        // Convert Decimal to a format-friendly type using FormatStyle
        return (entry.amount.formatted(.currency(code: code)))
    }
}

#Preview {
    
    StatefulPreviewWrapper(CashflowItem.samples()) {
        entries in
        ForEach(entries, id: \.id) { entry in
            EntryCard(entry: entry)
        }
    }
}
