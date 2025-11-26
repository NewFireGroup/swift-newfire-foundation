//
//  Cashflow.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import Foundation

public struct CashflowItem: ACEntity {
    public var id: String
    public var name: String
    public var systemImage: String
    public var type: CashflowType = .none
    public var category: Category?
    
    public var amount: Decimal = 0

    public init(id: String? = nil, name: String? = nil, type: CashflowType? = nil, category: Category? = nil, amount: Decimal? = nil) {
        self.id = id ?? UUID().uuidString
        self.name = name ?? ""
        self.category = category ?? nil
        self.systemImage = ""
        
        self.type = type ?? .none
        self.amount = amount ?? 0
    }
    
    static func sample() -> CashflowItem {
        return CashflowItem(
            name: "Paycheck",
            type: .income,
            category: Category(name: "Salary", group: "Income"),
            amount: 2500)
    }
    
    static func samples() -> [CashflowItem] {
        return [
            CashflowItem(
                name: "Paycheck",
                type: .income,
                category: Category(name: "Salary", group: "Income"),
                amount: 2500),
            CashflowItem(name: "Weekly Groceries"),
            CashflowItem(name: "Netflix Subscription")
        ]
    }
}
