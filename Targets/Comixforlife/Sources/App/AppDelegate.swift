import SwiftUI
import ComposableArchitecture
import Networking
import Combine

let client = XBCDClient()
let request = FetchComicRequest()

@main
struct MainApp: App {
    let store: Store<AppState, AppAction> = Store(
        initialState: AppState(comicState: .init()),
        reducer: appReducer,
        environment: AppEnvironment(
            mainQueue: .main,
            fetchCurrentComic: { id in client.send(FetchComicRequest()).eraseToEffect() },
            fetchRandomComic: { client.send(FetchComicRequest()).eraseToEffect() }
        )
    )
    
    var body: some Scene {
        WindowGroup {
            WithViewStore(self.store) { viewStore in
                NavigationView {
                    RandomComicView(store: store.scope(
                        state: \.comicState,
                        action: AppAction.randomComic
                    ))
                }.navigationViewStyle(.stack)
            }
        }
    }
}
