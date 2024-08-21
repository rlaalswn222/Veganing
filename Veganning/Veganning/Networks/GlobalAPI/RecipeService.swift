import SwiftUI
import Moya
import Combine

class RecipeService {
<<<<<<< Updated upstream
    static let shared = RecipeService()
    static let provider = MoyaProvider<RecipeAPI>()
    private init() {}
    
    // MARK: - Network Error
    enum NetworkError: Error {
        case badRequest
        case forbidden
        case unhandledStatusCode(Int)
        case decodingError(Error)
        case customError(String)
        case unknownError(String)
        
        var localizedDescription: String {
            switch self {
            case .badRequest:
                return "Bad Request"
            case .forbidden:
                return "Forbidden"
            case .unhandledStatusCode(let statusCode):
                return "Unhandled status code: \(statusCode)"
            case .decodingError(let error):
                return "Decoding error: \(error.localizedDescription)"
            case .customError(let message):
                return message
            case .unknownError(let message):
                return message
            }
        }
    }
    
    // MARK: - Network Request Handler
    private func handleResponse<T: Codable>(response: Response, completion: @escaping (Result<T, NetworkError>) -> Void) {
        switch response.statusCode {
        case 200:
            do {
                let baseResponse = try JSONDecoder().decode(BaseResponse<T>.self, from: response.data)
                if baseResponse.isSuccess {
                    if let result = baseResponse.data {
                        completion(.success(result))
                    } else {
                        completion(.failure(.customError(baseResponse.message)))
                    }
                } else {
                    completion(.failure(.customError(baseResponse.message)))
                }
            } catch {
                completion(.failure(.decodingError(error)))
            }
        case 400:
            completion(.failure(.badRequest))
        case 403:
            completion(.failure(.forbidden))
        default:
            completion(.failure(.unhandledStatusCode(response.statusCode)))
        }
    }
    
    //MARK: 레시피 리스트 진입 화면
    func recipeList(type: String, fromerecruite: Bool, completion: @escaping (Result<[RecipeListResponse], NetworkError>) -> Void) {
        RecipeService.provider.request(.recipeList(type: type, fromrecruit: fromerecruite)) { result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피 상세 조회
    func recipeDetail(status: Int, success: Bool, image: String, name: String, ingredients: Array<String>, completion: @escaping (Result<RecipeDetailResponse, NetworkError>) -> Void) {
        RecipeService.provider.request(.recipeDetail(status: status, success: success, image: image, name: name, ingredients: ingredients)) {
            result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피 작성(공모)
    func recipeContest(name : String, description: String, image :String, type: String, carbonhydrate : Double, sugar : Double, protein : Double, fat : Double, completion: @escaping (Result<RecipeDetailResponse, NetworkError>) -> Void) {
        RecipeService.provider.request(.recipeContest(name: name , description: description, image: image, type: type, carbonhydrate: carbonhydrate, sugar: sugar, protein: protein, fat: fat)) { result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피 세이브닝
    //MARK: 레시피 리뷰 미리보기
    func recipePreview(is_alram : Bool, completion: @escaping (Result<RecipeDetailResponse, NetworkError>) -> Void) {
        RecipeService.provider.request(.recipePreview(is_alarm: is_alram)){
            result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피 리뷰페이지 별점 정보
    func reviewStar(rate: Array<String>, completion :@escaping (Result<RecipeDetailResponse, NetworkError>) -> Void) {
        RecipeService.provider.request(.reviewStar(rate: rate)){
            result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피 리뷰 리스트 조회
    func recipeReview(Reviews: Array<String>, completion :@escaping (Result<RecipeDetailResponse, NetworkError>) -> Void) {
        RecipeService.provider.request(.recipeReview(reviews: Reviews)){
            result in
            switch result {
            case .success(let response):
                self.handleResponse(response: response, completion: completion)
            case .failure(let error):
                completion(.failure(.customError(error.localizedDescription)))
            }
        }
    }
    //MARK: 레시피별 리뷰 작성
    

    
=======
//    static let shared = RecipeService()
//    static let provider = MoyaProvider<RecipeService>()
//    private init() {}
//    
//    // MARK: - Network Error
//    enum NetworkError: Error {
//        case badRequest
//        case forbidden
//        case unhandledStatusCode(Int)
//        case decodingError(Error)
//        case customError(String)
//        case unknownError(String)
//        
//        var localizedDescription: String {
//            switch self {
//            case .badRequest:
//                return "Bad Request"
//            case .forbidden:
//                return "Forbidden"
//            case .unhandledStatusCode(let statusCode):
//                return "Unhandled status code: \(statusCode)"
//            case .decodingError(let error):
//                return "Decoding error: \(error.localizedDescription)"
//            case .customError(let message):
//                return message
//            case .unknownError(let message):
//                return message
//            }
//        }
//    }
//    
//    // MARK: - Network Request Handler
//    private func handleResponse<T: Codable>(response: Response, completion: @escaping (Result<T, NetworkError>) -> Void) {
//        switch response.statusCode {
//        case 200:
//            do {
//                let baseResponse = try JSONDecoder().decode(BaseResponse<T>.self, from: response.data)
//                if baseResponse.isSuccess {
//                    if let result = baseResponse.result {
//                        completion(.success(result))
//                    } else {
//                        completion(.failure(.customError(baseResponse.message)))
//                    }
//                } else {
//                    completion(.failure(.customError(baseResponse.message)))
//                }
//            } catch {
//                completion(.failure(.decodingError(error)))
//            }
//        case 400:
//            completion(.failure(.badRequest))
//        case 403:
//            completion(.failure(.forbidden))
//        default:
//            completion(.failure(.unhandledStatusCode(response.statusCode)))
//        }
//    }
//    
//    //MARK: 레시피 리스트 진입 화면 
>>>>>>> Stashed changes
}
