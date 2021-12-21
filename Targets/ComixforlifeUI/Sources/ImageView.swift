import SwiftUI

public struct ImageView: View {
    public init(urlString: String? = nil) {
        self.urlString = urlString
    }
    
    var urlString: String?
    
    public var body: some View {
        if let urlString = urlString {
                AsyncImage(url: URL(string: urlString)) { phase in
                    if let image = phase.image {
                        ScrollView(.horizontal) {
                            image
                        }
                    } else if let _ = phase.error {
                        Text("Could not load image").font(.callout)
                    } else {
                        ProgressView().frame(alignment: .center)
                    }
            }
        } else {
            EmptyView()
        }
    }
}
