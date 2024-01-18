
import Foundation

final public class GenericNetworkManager {
    //MARK: - Properties
    public static var shared = GenericNetworkManager()
    private let baseURL: String?
    
    //MARK: - Inits
    public init(baseURL: String? = nil) {
        self.baseURL = baseURL
    }
    
    //MARK: - Methods
    public func fetchData<T: Decodable>(endpoint: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = (baseURL ?? "") + endpoint
        
        guard !urlString.isEmpty, let url = URL(string: urlString) else {
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
                let dataResponse = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(dataResponse))
                }
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
