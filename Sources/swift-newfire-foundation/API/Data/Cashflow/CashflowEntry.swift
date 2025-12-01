import Foundation

public class CashflowEntry: CashflowItem {
    public var date: Date
    public var balance: Decimal?

    public init(id: String? = nil, date: Date, balance: Decimal? = nil, name: String? = nil, type: CashflowType? = nil, category: Category? = nil, amount: Decimal? = nil, repeating: Frequency? = nil) {
        self.date = date
        self.balance = balance

        super.init(id: id, name: name, type: type, category: category, amount: amount, repeating: repeating)
    }
    
    public init(item: CashflowItem, date: Date, balance: Decimal? = nil) {
        self.date = date
        self.balance = balance

        // Ensure a new id is generated for the entry (different from the item)
        super.init(id: nil, name: item.name, type: item.type, category: item.category, amount: item.amount, repeating: item.repeating)
    }
    
}

extension  CashflowEntry {
    static func entrySample() -> CashflowEntry {
        let item = CashflowItem.sample()
        return CashflowEntry(item: item, date: Date())
    }
    
    static func entrySamples() -> [CashflowEntry] {
        let now = Date()
        return CashflowItem.samples().map { CashflowEntry(item: $0, date: now) }
    }
}
