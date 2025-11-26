import SwiftUI

public struct TextEditorPlaceHolder: View {
    @Binding private var text: String
    private let placeholder: String
    private let minHeight: CGFloat
    private let accessibilityLabel: String?

    public init(text: Binding<String>,
                placeholder: String,
                minHeight: CGFloat = 80,
                accessibilityLabel: String? = nil) {
        self._text = text
        self.placeholder = placeholder
        self.minHeight = minHeight
        self.accessibilityLabel = accessibilityLabel
    }

    public var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                Text(placeholder)
                    .foregroundStyle(.secondary)
                    .padding(.horizontal, 4)
                    .padding(.vertical, 8)
            }
            TextEditor(text: $text)
                .frame(minHeight: minHeight)
                .accessibilityLabel(accessibilityLabel ?? placeholder)
        }
    }
}

#Preview {
    StatefulPreviewWrapper("") { binding in
        Form {
            TextEditorPlaceHolder(text: binding,
                                  placeholder: "Notes",
                                  minHeight: 80,
                                  accessibilityLabel: "Notes")
        }
    }
}
