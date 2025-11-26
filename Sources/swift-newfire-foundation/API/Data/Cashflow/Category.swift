//
//  Category.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//


import Foundation

public struct Category: ACEntity, Hashable {
    public var id: String
    public var name: String
    public var systemImage: String
    
    public var group: String
    
    public init(id: String? = nil, name: String? = nil, group: String? = nil) {
        self.id = id ?? UUID().uuidString
        self.name = name ?? ""
        self.group = group ?? ""
        self.systemImage = ""
    }
    
    static func sample() -> Category {
        return Category(name: "Mortgage or Rent", group: "Housing")
    }
    
    static func samples() -> [Category] {
        return [
            Category(name: "Mortgage or Rent", group: "Housing"),
            Category(name: "2nd Mortgage / Line of Credit", group: "Housing"),
            Category(name: "Daycare/Babysitting", group: "Childcare"),
            Category(name: "School (Lunch, supplies)", group: "Childcare"),
            Category(name: "Other", group: "Childcare")
        ]
    }
}
