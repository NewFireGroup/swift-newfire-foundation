import Foundation
import Testing
@testable import swift_newfire_foundation

@Suite("Cashflow Entries tests")
struct CashflowEntriesTests {

    @Test("Initializer with empty array creates empty entries")
    func initWithEmptyArray() async throws {
        let wrapper = CashflowEntries([])
        #expect(wrapper.entries.isEmpty)
    }

    @Test("Initializer preserves provided entries count")
    func initPreservesEntriesCount() async throws {
        // Replace with real sample entries once CashflowEntry is available
        let entries: [CashflowEntry] = []
        let wrapper = CashflowEntries(entries)
        #expect(wrapper.entries.count == entries.count)
    }

    @Test("orderedByDate returns entries sorted ascending by date")
    func orderedByDateSortsAscending() async throws {
        let now = Date()
        let earlier = now.addingTimeInterval(-3600) // 1 hour earlier
        let later = now.addingTimeInterval(3600)    // 1 hour later

        let baseItem = CashflowItem.sample()

        // Create entries with distinct dates
        let middle = CashflowEntry(item: baseItem, date: now)
        let first = CashflowEntry(item: baseItem, date: earlier)
        let last = CashflowEntry(item: baseItem, date: later)

        // Intentionally out of order
        let wrapper = CashflowEntries([middle, last, first])

        // Function under test – adjust name if your API differs
        let ordered = wrapper.byDate()

        try #require(ordered.count == 3)
        #expect(ordered[0].date == earlier)
        #expect(ordered[1].date == now)
        #expect(ordered[2].date == later)
    }

    @Test("orderedByDate is stable for equal dates")
    func orderedByDateStabilityForEqualDates() async throws {
        let now = Date()
        let baseItem = CashflowItem.sample()

        // Create multiple entries with the same date to check stability
        let e1 = CashflowEntry(item: baseItem, date: now)
        let e2 = CashflowEntry(item: baseItem, date: now)
        let e3 = CashflowEntry(item: baseItem, date: now)

        // Intentionally shuffled input order
        let wrapper = CashflowEntries([e2, e3, e1])

        // Function under test – adjust name if your API differs
        let ordered = wrapper.byDate()

        try #require(ordered.count == 3)
        // Expect stable ordering for items with equal keys (preserve input order)
        #expect(ordered[0].id == e2.id)
        #expect(ordered[1].id == e3.id)
        #expect(ordered[2].id == e1.id)
    }
    
    
}
