import SwiftUI

public struct ActivityIndicator: UIViewRepresentable {
    var style: UIActivityIndicatorView.Style

    public init(
        style: UIActivityIndicatorView.Style
    ) {
        self.style = style
    }

    public func makeUIView(context: Context) -> UIActivityIndicatorView {
        UIActivityIndicatorView()
    }

    public func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}
