import Foundation
import Testing
@testable import swift_newfire_foundation

@Suite("Cashflow Item tests")
struct CashflowItemTests {

    @Test("Default initializer sets expected defaults")
    func defaultInitDefaults() async throws {
        let item = CashflowItem()

        #expect(!item.id.isEmpty, "id should be auto-generated")
        #expect(item.name == "")
        #expect(item.systemImage == "")
        #expect(item.type == .none)
        #expect(item.category == nil)
        #expect(item.repeating == nil)
        #expect(item.amount == 0)
    }

    @Test("Custom initializer assigns provided values")
    func customInitAssigns() async throws {
        let category = Category(name: "Groceries", group: "Food")
        let frequency = Frequency(id: "monthly", name: "Monthly")
        let item = CashflowItem(
            id: "fixed-id",
            name: "Grocery Budget",
            type: .expense,
            category: category,
            amount: 145.80,
            repeating: frequency
        )

        #expect(item.id == "fixed-id")
        #expect(item.name == "Grocery Budget")
        #expect(item.systemImage == "")
        #expect(item.type == .expense)
        #expect(item.category?.name == "Groceries")
        #expect(item.category?.group == "Food")
        #expect(item.amount == Decimal(string: "145.80"))
        #expect(item.repeating?.id == "monthly")
        #expect(item.repeating?.name == "Monthly")
        #expect(item.repeating?.type.id == FrequencyType.none.id, "Default FrequencyType should be .none when not specified")
    }

    @Test("Initializer fills defaults when optionals are omitted")
    func initWithNilOptionals() async throws {
        let item = CashflowItem(
            id: nil,
            name: nil,
            type: nil,
            category: nil,
            amount: nil,
            repeating: nil
        )

        #expect(!item.id.isEmpty)
        #expect(item.name == "")
        #expect(item.type == .none)
        #expect(item.category == nil)
        #expect(item.amount == 0)
        #expect(item.repeating == nil)
    }

    @Test("Mutating properties behaves as expected")
    func mutability() async throws {
        var item = CashflowItem()
        item.name = "Paycheck"
        item.type = .income
        item.amount = 2500.25

        let category = Category(name: "Salary", group: "Income")
        item.category = category

        #expect(item.name == "Paycheck")
        #expect(item.type == .income)
        #expect(item.amount == Decimal(string: "2500.25"))
        #expect(item.category?.name == "Salary")
        #expect(item.category?.group == "Income")
    }

    @Test("Sample item returns expected shape")
    func sampleItem() async throws {
        let item = CashflowItem.sample()

        #expect(item.name == "Paycheck")
        #expect(item.type == .income)
        #expect(item.category?.name == "Salary")
        #expect(item.category?.group == "Income")
        #expect(item.amount == Decimal(string: "2500.25"))
    }

    @Test("Samples collection returns expected items")
    func samplesCollection() async throws {
        let items = CashflowItem.samples()
        #expect(items.count == 3)

        try #require(items.indices.contains(0))
        try #require(items.indices.contains(1))
        try #require(items.indices.contains(2))

        // 0: Paycheck
        #expect(items[0].name == "Paycheck")
        #expect(items[0].type == .income)
        #expect(items[0].category?.name == "Salary")
        #expect(items[0].category?.group == "Income")
        #expect(items[0].amount == Decimal(string: "2500.25"))

        // 1: Groceries
        #expect(items[1].name == "Groceries")
        #expect(items[1].type == .expense)
        #expect(items[1].category?.name == "Groceries")
        #expect(items[1].category?.group == "Food")
        #expect(items[1].amount == Decimal(string: "145.80"))

        // 2: Netflix
        #expect(items[2].name == "Netflix")
        #expect(items[2].type == .expense)
        #expect(items[2].category?.name == "Subscriptions")
        #expect(items[2].category?.group == "Bills")
        #expect(items[2].amount == Decimal(string: "34.80"))
    }

    @Test("CashflowItems wrapper holds entries")
    func cashflowItemsWrapper() async throws {
        let items = CashflowItem.samples()
        let wrapper = CashflowItems(items)

        #expect(wrapper.entries.count == items.count)
        #expect(wrapper.entries.first?.name == items.first?.name)
    }
}
