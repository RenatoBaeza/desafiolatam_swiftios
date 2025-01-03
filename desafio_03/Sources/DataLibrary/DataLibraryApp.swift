import SwiftUI
import SwiftData

@main
struct DataLibraryApp: App {
    let container: ModelContainer
    
    init() {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            container = try ModelContainer(for: UserElement.self, configurations: config)
        } catch {
            fatalError("Could not initialize ModelContainer: \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
    }
}

#Preview {
    MainView()
        .modelContainer(for: UserElement.self)
} 