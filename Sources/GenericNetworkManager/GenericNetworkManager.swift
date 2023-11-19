
import Foundation

final public class CatFactsNetworkManager {
    private let baseURL: String
    private let endpoint: String
    
    public init(baseURL: String, endpoint: String) {
        self.baseURL = baseURL
        self.endpoint = endpoint
    }
    
    public func fetchFacts<T: Decodable>(baseURL: String, endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlStr = "\(baseURL + endpoint)"
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "", code: -2, userInfo: [NSLocalizedDescriptionKey: "No data received"])))
                return
            }
            
            do {
                let catFactsResponse = try JSONDecoder().decode(T.self, from: data)
                completion(.success(catFactsResponse))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
