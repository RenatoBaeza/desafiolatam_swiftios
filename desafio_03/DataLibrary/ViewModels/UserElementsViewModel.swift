import Foundation
import SwiftData

@MainActor
class UserElementsViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    
    func createElement(modelContext: ModelContext) {
        let element = UserElement(title: title, description: description)
        modelContext.insert(element)
        
        // Reset form
        title = ""
        description = ""
    }
    
    func deleteElement(_ element: UserElement, modelContext: ModelContext) {
        modelContext.delete(element)
    }
    
    func updateElement(_ element: UserElement) {
        element.title = title
        element.description = description
    }
} 