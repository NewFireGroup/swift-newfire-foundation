//
//  Cashflow.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import Foundation

public struct CashflowItems {
    public var entries: [CashflowItem]
    
    public init(_ entries: [CashflowItem]) {
        self.entries = entries
    }
    
    static func sample() -> CashflowItems {
        .init(CashflowItem.samples())
    }
    
}
