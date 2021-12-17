import Networking
import Foundation
import UIKit

public final class XBCDClient: APIClient {
    
    public var token: String? = nil
    
    // Default URL Constructor Elements
    private let host: String = "xkcd.com"
    private let scheme: String = "https"
    
    lazy public var baseUrlComponents: URLComponents = {
        var comp = URLComponents()
        comp.host = host
        comp.scheme = scheme
        return comp
    }()
    
    public var session: URLSession = URLSession.shared
}

extension APIRequest {
    public var method: RequestMethod { return .get }
    public var contentType: String { return "application/json" }
    public var queryParams: [String: String]? { return nil }
    public var body: [String: Any]? { return nil }
    public var headers: [String: String]? { return nil }
}

public final class FetchComicRequest: APIRequest {
    public var body: Data? = nil
    
    public func localizedErrorDescription(statusCode: ResponseStatus) -> String? {
        return "FAILED"
    }
    
    public typealias ReturnType = Comic
    
    private let endpath = "info.0.json"
    
    var id: Int? = nil
    
    public var path: String? {
        if let id = id {
            return "\(id)/" + endpath
        } else {
            return endpath
        }
    }
}
