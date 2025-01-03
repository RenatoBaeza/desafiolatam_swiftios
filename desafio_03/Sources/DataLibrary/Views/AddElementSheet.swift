import SwiftUI

struct AddElementSheet: View {
    @Binding var isPresented: Bool
    let onSave: (String, String) -> Void
    
    @State private var name = ""
    @State private var description = ""
    @State private var selectedImage: UIImage?
    @State private var showingImagePicker = false
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                
                Button(action: {
                    showingImagePicker = true
                }) {
                    HStack {
                        Text("Select Image")
                        Spacer()
                        if let image = selectedImage {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 40)
                        }
                    }
                }
            }
            .navigationTitle("Add New Hero")
            .navigationBarItems(
                leading: Button("Cancel") {
                    isPresented = false
                },
                trailing: Button("Save") {
                    onSave(name, description)
                    isPresented = false
                }
            )
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
        }
    }
}

#Preview {
    AddElementSheet(isPresented: .constant(true)) { _, _ in }
} 