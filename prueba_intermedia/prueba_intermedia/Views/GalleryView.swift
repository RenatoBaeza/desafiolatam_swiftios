import SwiftUI

struct GalleryView: View {
    let username: String
    @State private var showInfo = false
    @AppStorage("currentScreen") var currentScreen: String = "gallery"
    
    let galleryItems: [GalleryItem] = (1...20).map { index in
        GalleryItem(
            imageName: "image\(index)",
            title: "Image \(index)",
            description: "Description for image \(index)"
        )
    }
    
    var body: some View {
        NavigationStack {
            List(galleryItems) { item in
                HStack {
                    Image(item.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .cornerRadius(8)
                    
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .font(.headline)
                        Text(item.description)
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .navigationTitle("Welcome, \(username)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { showInfo = true }) {
                        Image(systemName: "info.circle")
                    }
                }
            }
            .sheet(isPresented: $showInfo) {
                InfoView()
                    .presentationDetents([.medium, .large])
            }
        }
    }
} 