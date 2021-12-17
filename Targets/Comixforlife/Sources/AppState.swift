import ComposableArchitecture
import Network
import Networking

struct AppState: Equatable {
    var currentComic: Comic?
    var error: NetworkRequestError?
}

enum AppAction: Equatable {
    case fetchCurrentComic(id: Int)
    case currentComicResponse(Result<Comic, NetworkRequestError>)
}

enum ApiError: Equatable, Error {}

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var fetchCurrentComic: (Int) -> Effect<Comic, NetworkRequestError>
}

let appReducer = Reducer<AppState, AppAction, AppEnvironment> { state, action, environment in
    switch action {
    case .fetchCurrentComic(id: let id):
        return environment
            .fetchCurrentComic(id)
            .receive(on: environment.mainQueue)
            .catchToEffect(AppAction.currentComicResponse)
        
    case let .currentComicResponse(.success(value)):
        state.currentComic = value
        return .none
    case let .currentComicResponse(.failure(error)):
        state.error = error
        return .none
    }
}
