import ComposableArchitecture
import Network
import Networking

enum AppAction {
    case randomComic(RandomComicView.Action)
}

struct AppState: Equatable {
    var comicState: RandomComicView.State
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    randomComicReducer.pullback(
        state: \.comicState,
        action: /AppAction.randomComic,
        environment: { $0 }
    )
)
