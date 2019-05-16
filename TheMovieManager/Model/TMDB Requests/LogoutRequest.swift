import Foundation

struct Logout: Codable {
    
    let sessionId: String
    
    enum CodingKeys: String, CodingKey {
        case sessionId = "session_id"
    }
}
