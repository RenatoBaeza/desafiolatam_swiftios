import Foundation
import SwiftUI
import SwiftData

@MainActor
class UserElementsViewModel: ObservableObject {
    @Published var userElements: [UserElement] = []
    
    func fetchUserElements() {
        // Implement your fetch logic here
        // For now, we'll just have an empty implementation
    }
    
    func addUserElement(name: String, description: String, imageData: Data? = nil) {
        let newElement = UserElement(
            title: name,
            description: description,
            imageData: imageData
        )
        userElements.append(newElement)
    }
    
    func deleteUserElements(at indexSet: IndexSet) {
        userElements.remove(atOffsets: indexSet)
    }
} 
