import Testing
@testable import swift_newfire_foundation

@Suite("Cashflow Type tests")
struct CashflowTypeTests {

    @Test("Raw values match expected strings")
    func rawValues() async throws {
        #expect(CashflowType.income.rawValue == "income")
        #expect(CashflowType.expense.rawValue == "expense")
        #expect(CashflowType.none.rawValue == "")
    }

    @Test("Identifier equals raw value")
    func idEqualsRawValue() async throws {
        #expect(CashflowType.income.id == CashflowType.income.rawValue)
        #expect(CashflowType.expense.id == CashflowType.expense.rawValue)
        #expect(CashflowType.none.id == CashflowType.none.rawValue)
    }

    @Test("All cases order and count")
    func allCasesOrder() async throws {
        let cases = CashflowType.allCases
        #expect(cases.count == 3)
        #expect(cases[0] == .income)
        #expect(cases[1] == .expense)
        #expect(cases[2] == .none)
    }

    @Test("Display names are user-friendly")
    func displayNames() async throws {
        #expect(CashflowType.income.displayName == "Income")
        #expect(CashflowType.expense.displayName == "Expense")
        #expect(CashflowType.none.displayName == "None")
    }
}
