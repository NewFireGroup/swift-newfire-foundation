//
//  MilkCarton.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//


import SwiftUI

public struct MilkCarton: View {
    let missing: String?
    public init(missing: String? = nil) {
        self.missing = missing
    }    
    public var body: some View {
        VStack {
            if let hasAName = missing {
                Text("Missing: '\(hasAName)'")
            } else {
                Text("Something is afoot!")
            }
            Text("A developer may have fallen down the rabbit hole.")
            Text("Or just need a fresh cup of coffee")
            Text("☕️").font(.largeTitle)
        }
    }
}

#Preview("Empty") {
    MilkCarton()
}
#Preview("Name") {
    MilkCarton(missing: "Whiskers 🐈‍⬛")
}
