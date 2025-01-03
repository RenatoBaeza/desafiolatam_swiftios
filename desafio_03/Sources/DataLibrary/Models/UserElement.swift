import Foundation
import SwiftData

@Model
class UserElement {
    var title: String
    var dateCreated: Date
    
    init(title: String, description: String) {
        self.title = title
        self.dateCreated = Date()
    }
} 
