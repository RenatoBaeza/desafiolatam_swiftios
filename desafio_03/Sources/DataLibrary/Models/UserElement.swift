import Foundation
import SwiftData

@Model
class UserElement {
    var title: String
    var dateCreated: Date
    var imageData: Data?
    
    init(title: String, description: String, imageData: Data? = nil) {
        self.title = title
        self.dateCreated = Date()
        self.imageData = imageData
    }
} 
