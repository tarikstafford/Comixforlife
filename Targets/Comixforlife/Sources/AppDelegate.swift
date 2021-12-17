import SwiftUI
import ComixforlifeKit
import ComixforlifeUI
import ComposableArchitecture
import Networking
import Combine

let client = XBCDClient()
let request = FetchComicRequest()

@main
struct MainApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(store: .init(
                initialState: AppState(),
                reducer: appReducer,
                environment: AppEnvironment(
                    mainQueue: .main,
                    fetchCurrentComic: { id in client.send(FetchComicRequest()).eraseToEffect() }
                )
            )
        )}
    }
}
