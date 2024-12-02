import Foundation
import Alamofire


//MARK: Network Implementation
//Defining the request method that returns the [T: Codable] object as a list.
class NetworkManager {
    
    static let instance = NetworkManager()
    
    init(){}
    
    func request<T: Codable>(
        url: String,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        headers: HTTPHeaders? = ["x-rapidapi-key": "9194cd535dmsh546000b51ff3448p152214jsn46715d81b44b"],
        onResponse: @escaping (Result<T, AFError>) -> Void) {
        
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: ResponseWrapper<T>.self) { response in
                switch response.result {
                case .success(let wrapper):
                    onResponse(.success(wrapper.results))
                case .failure(let error):
                    onResponse(.failure(error))
                }
            }
    }
}
