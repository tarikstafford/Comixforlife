import SwiftUI
import ComposableArchitecture
import ComixforlifeUI
import Networking

let randomComicReducer = Reducer<RandomComicView.State, RandomComicView.Action, AppEnvironment> { state, action, environment in
    switch action {
    case .fetchRandomComic:
        return environment
            .fetchRandomComic()
            .receive(on: environment.mainQueue)
            .catchToEffect(RandomComicView.Action.currentComicResponse)
        
    case let .currentComicResponse(.success(value)):
        state.currentComic = value
        return .none
    case let .currentComicResponse(.failure(error)):
        state.error = error
        return .none
    }
}

struct RandomComicView: View {
    let store: Store<RandomComicView.State, RandomComicView.Action>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            VStack(alignment: .center) {
                Text(viewStore.state.currentComic?.safeTitle ?? "Comic")
                    .font(.largeTitle)
                ImageView(urlString: viewStore.state.currentComic?.img)
                    .padding()
                Spacer()
            }.onAppear {
                viewStore.send(.fetchRandomComic)
            }
        }
    }
}


extension RandomComicView {
    struct State: Equatable {
        var currentComic: Comic?
        var error: NetworkRequestError?
    }

    enum Action: Equatable {
        case fetchRandomComic
        case currentComicResponse(Result<Comic, NetworkRequestError>)
    }
}
