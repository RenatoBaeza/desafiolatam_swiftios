import Foundation

struct GalleryItem: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let description: String
} 