//
//  CashflowItemTests 2.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/30/25.
//

import Foundation
import Testing
@testable import swift_newfire_foundation

@Suite("Cashflow Items tests")
struct CashflowItemsTests {

    @Test("Initializer preserves entries array")
    func initPreservesEntries() async throws {
        let items = CashflowItem.samples()
        let wrapper = CashflowItems(items)

        #expect(wrapper.entries.count == items.count)

        try #require(wrapper.entries.indices.contains(0))
        #expect(wrapper.entries[0].name == items[0].name)
        #expect(wrapper.entries[0].type == items[0].type)
        #expect(wrapper.entries[0].amount == items[0].amount)
    }

    @Test("Entries is mutable and reflects changes")
    func entriesMutability() async throws {
        var wrapper = CashflowItems([])
        #expect(wrapper.entries.isEmpty)

        // Append a new item
        let newItem = CashflowItem(name: "Test", type: .expense, amount: 10)
        wrapper.entries.append(newItem)

        #expect(wrapper.entries.count == 1)
        #expect(wrapper.entries.first?.name == "Test")
        #expect(wrapper.entries.first?.type == .expense)
        #expect(wrapper.entries.first?.amount == Decimal(string: "10"))

        // Replace entries wholesale
        let replacement = CashflowItem.samples()
        wrapper.entries = replacement
        #expect(wrapper.entries.count == replacement.count)
        #expect(wrapper.entries[0].name == "Paycheck")
    }

    @Test("sample() returns wrapper around CashflowItem.samples()")
    func sampleReturnsExpected() async throws {
        let expected = CashflowItem.samples()
        let wrapper = CashflowItems.sample()

        #expect(wrapper.entries.count == expected.count)

        // Spot-check contents to ensure passthrough
        #expect(wrapper.entries[0].name == expected[0].name)
        #expect(wrapper.entries[0].type == expected[0].type)
        #expect(wrapper.entries[0].amount == expected[0].amount)

        #expect(wrapper.entries[1].name == expected[1].name)
        #expect(wrapper.entries[2].name == expected[2].name)
    }
}
