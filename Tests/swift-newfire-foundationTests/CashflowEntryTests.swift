import Foundation
import Testing
@testable import swift_newfire_foundation

@Suite("Cashflow Entry tests")
struct CashflowEntryTests {

    @Test("Adds a date to a Cashflow Entry")
    func addDateProperty() async throws {
        let now = Date()
        let item = CashflowItem.sample()
        let entry = CashflowEntry(item: item, date: now)

        #expect(entry.date == now)
    }

    
    @Test("Adds a date to a Cashflow Entry")
    func idShouldBeDifferentFromItem() async throws {
        let now = Date()
        let item = CashflowItem.sample()
        let entry = CashflowEntry(item: item, date: now)
        
        #expect(!entry.id.isEmpty, "id should be auto-generated")
        #expect(entry.id != item.id, "id should not be same as item")
    }
    
    @Test("Balance property defaults to nil and can be updated")
    func balanceDefaultsAndMutates() async throws {
        let now = Date()
        let item = CashflowItem.sample()
        let entry = CashflowEntry(item: item, date: now)

        // Default should be zero
        #expect(entry.balance == nil, "Default balance should be nil")

        // Update balance and verify
        entry.balance = Decimal(string: "1234.56")!
        #expect(entry.balance == Decimal(string: "1234.56"))
    }
}
