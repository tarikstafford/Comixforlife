import SwiftUI
import ComposableArchitecture

struct MainView: View {
    let store: Store<AppState, AppAction>
    
    @ViewBuilder
    func image(_ state: AppState) -> some View {
        if let img = state.currentComic?.img {
            AsyncImage(url: URL(string: img))
        } else if let error = state.error {
            EmptyView()
        } else {
            
        }
    }
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack {
                Text(viewStore.state.currentComic?.safeTitle ?? "Comic")
                    .font(.largeTitle)
                ScrollView(.horizontal) {
                    HStack {
                        image(viewStore.state)
                    }.padding(10)
                }
            }.onAppear {
                viewStore.send(.fetchCurrentComic(id: 1))
            }
        }
    }
}
