//
//  Frequency.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

public struct Frequency: ACEntity
{
    public var id: String
    public var name: String
    public var systemImage: String

    public var type: FrequencyType
    
    public init(id: String, name: String, type: FrequencyType? = nil ) {
        self.id = id
        self.name = name
        self.systemImage = ""
        self.type = type ?? .none
    }
    
}
