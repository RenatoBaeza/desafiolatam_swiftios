import SwiftUI

struct InfoView: View {
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("App Information")) {
                    InfoRow(title: "App Name", value: "Image Gallery")
                    InfoRow(title: "Developer", value: "Renato Baeza")
                    InfoRow(title: "Version", value: "1.0.0")
                    InfoRow(title: "Build", value: "2024.1")
                    InfoRow(title: "Platform", value: "iOS 17+")
                }
                
                Section(header: Text("Description")) {
                    Text("Image Gallery is a beautiful app designed to showcase and organize your favorite images in an elegant and user-friendly interface.")
                        .font(.body)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct InfoRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .fontWeight(.medium)
        }
    }
} 