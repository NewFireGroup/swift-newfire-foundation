//
//  Cashflow.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import Foundation

public struct CashflowEntries {
    public var entries: [CashflowEntry]
    
    public init(_ entries: [CashflowEntry]) {
        self.entries = entries
    }
    
    static func sample() -> CashflowEntries {
        .init(CashflowEntry.entrySamples())
    }
    
    public func byDate() -> [CashflowEntry] {
        entries.sorted(by: { $0.date < $1.date })
    }
    
}
