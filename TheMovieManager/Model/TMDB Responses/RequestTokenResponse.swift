import Foundation

struct RequestTokenResponse: Codable {
    
    let success: Bool
    let expiresAt: String
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case success
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }

    //"success": true,
    //"expires_at": "2019-05-14 04:12:52 UTC",
    //"request_token": "eacad2d87559b90950fd646982f44c9e522ee40e"
}

