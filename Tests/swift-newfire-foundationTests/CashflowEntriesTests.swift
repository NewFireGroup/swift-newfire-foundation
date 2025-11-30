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
}
