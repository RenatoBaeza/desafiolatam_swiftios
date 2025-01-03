import SwiftUI
import SwiftData

@main
struct DataLibraryApp: App {
    let container: ModelContainer
    
    init() {
        do {
            container = try ModelContainer(for: UserElement.self)
        } catch {
            fatalError("Failed to create ModelContainer for UserElement: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
    }
} 