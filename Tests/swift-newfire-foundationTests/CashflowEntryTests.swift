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
}
