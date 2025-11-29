//
//  StatefulPreviewWrapper.swift
//  swift-newfire-foundation
//
//  Created by David Boster on 11/26/25.
//

import SwiftUI

// Simple helper to preview bindings
internal struct StatefulPreviewWrapper<Value, Content: View>: View {
    @State var value: Value
    var content: (Binding<Value>) -> Content

    init(_ value: Value, content: @escaping (Binding<Value>) -> Content) {
        _value = State(initialValue: value)
        self.content = content
    }

    public var body: some View {
        content($value)
    }
}
