//
//  CashflowType.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

public enum FrequencyType: String, CaseIterable, Identifiable {
    case yearly = "yearly"
    case monthly = "monthly"
    case weekly = "weekly"
    case none = ""

    public var id: String { rawValue }

    var displayName: String {
        switch self {
        case .yearly: return "Yearly"
        case .monthly: return "Monthly"
        case .weekly: return "Weekly"
        case .none: return "None"
        }
    }
}
