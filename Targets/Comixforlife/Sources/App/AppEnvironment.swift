import ComposableArchitecture
import Networking

typealias ComicEffect = Effect<Comic, NetworkRequestError>

struct AppEnvironment {
    var mainQueue: AnySchedulerOf<DispatchQueue>
    var fetchCurrentComic: (Int) -> ComicEffect
    var fetchRandomComic: () -> ComicEffect
}
