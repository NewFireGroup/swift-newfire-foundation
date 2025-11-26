//
//  CashflowType.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

public enum CashflowType: String, CaseIterable, Identifiable {
    case income = "income"
    case expense = "expense"
    case none = ""

    public var id: String { rawValue }

    var displayName: String {
        switch self {
        case .income: return "Income"
        case .expense: return "Expense"
        case .none: return "None"
        }
    }
}
