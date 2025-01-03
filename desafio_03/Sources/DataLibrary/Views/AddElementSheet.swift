import SwiftUI

struct AddElementSheet: View {
    @Binding var isPresented: Bool
    let onSave: (String, String, Data?) -> Void
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var showingImagePicker = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                }
                
                Section {
                    if let selectedImage {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                    }
                    
                    Button(action: { showingImagePicker = true }) {
                        Label(
                            selectedImage == nil ? "Add Image" : "Change Image",
                            systemImage: "photo"
                        )
                    }
                }
            }
            .navigationTitle("New Element")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        isPresented = false
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSave(
                            title,
                            description,
                            selectedImage?.jpegData(compressionQuality: 0.8)
                        )
                        isPresented = false
                    }
                    .disabled(title.isEmpty)
                }
            }
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(image: $selectedImage)
            }
        }
    }
}

#Preview {
    AddElementSheet(isPresented: .constant(true)) { _, _, _ in }
} 