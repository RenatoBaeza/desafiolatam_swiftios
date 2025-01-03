import Foundation
import SwiftData

@Model
class UserElement {
    var title: String
    var description: String
    var dateCreated: Date
    
    init(title: String, description: String) {
        self.title = title
        self.description = description
        self.dateCreated = Date()
    }
} 