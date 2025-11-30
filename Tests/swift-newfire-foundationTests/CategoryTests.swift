import Testing
@testable import swift_newfire_foundation

@Suite("Category Tests")
struct CategoryTests {

    @Test("Default initializer sets sensible defaults")
    func defaultInitializer() async throws {
        let category = Category()

        // id should be non-empty UUID string
        #expect(!category.id.isEmpty, "id should be auto-generated and non-empty")

        // name/group default to empty
        #expect(category.name == "", "name should default to empty string")
        #expect(category.group == "", "group should default to empty string")

        // systemImage default to empty per implementation
        #expect(category.systemImage == "", "systemImage should default to empty string")
    }

    @Test("Initializer uses provided values")
    func initializerWithValues() async throws {
        let customID = "fixed-id-123"
        let category = Category(id: customID, name: "Groceries", group: "Food")

        #expect(category.id == customID)
        #expect(category.name == "Groceries")
        #expect(category.group == "Food")
        #expect(category.systemImage == "", "systemImage still defaults to empty unless provided")
    }

    @Test("Hashable/Equatable semantics")
    func hashableEquatable() async throws {
        let id = "same-id"
        let a = Category(id: id, name: "A", group: "G1")
        let b = Category(id: id, name: "A", group: "G1")
        let c = Category(id: "different-id", name: "A", group: "G1")

        // Hashable implies Equatable; synthesized should compare all stored properties
        #expect(a == b, "Instances with same stored properties should be equal")
        #expect(a.hashValue == b.hashValue, "Equal instances must share hashValue")

        #expect(a != c, "Different id should make instances unequal")
    }

    @Test("Sample single item is stable and sensible")
    func sampleSingle() async throws {
        let sample = Category.sample()

        #expect(sample.name == "Mortgage or Rent")
        #expect(sample.group == "Housing")
        #expect(!sample.id.isEmpty, "Sample should have a generated id")
        #expect(sample.systemImage == "", "systemImage default remains empty")
    }

    @Test("Samples collection has expected content and order")
    func samplesCollection() async throws {
        let samples = Category.samples()

        #expect(samples.count == 5, "Expected 5 sample categories")

        // Validate first and last for order stability and content
        #expect(samples.first?.name == "Mortgage or Rent")
        #expect(samples.first?.group == "Housing")

        #expect(samples.last?.name == "Other")
        #expect(samples.last?.group == "Childcare")

        // Spot-check a middle element
        #expect(samples[2].name == "Daycare/Babysitting")
        #expect(samples[2].group == "Childcare")

        // All samples should have non-empty ids and empty systemImage per implementation
        for category in samples {
            #expect(!category.id.isEmpty)
            #expect(category.systemImage == "")
        }
    }

    @Test("ACEntity conformance shape (id/name/systemImage are mutable)")
    func acentityConformance() async throws {
        var category = Category(name: "Utilities", group: "Bills")

        // Mutability checks to ensure conformance matches protocol requirements
        let originalID = category.id
        category.name = "Utilities Updated"
        category.systemImage = "bolt.fill"

        #expect(category.id == originalID)
        #expect(category.name == "Utilities Updated")
        #expect(category.systemImage == "bolt.fill")
    }
}
