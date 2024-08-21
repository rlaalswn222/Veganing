import Foundation

struct BaseResponse<T: Codable>: Codable {
    let isSuccess: Bool
    let code: Int
    let message: String
    let data: T?
}

