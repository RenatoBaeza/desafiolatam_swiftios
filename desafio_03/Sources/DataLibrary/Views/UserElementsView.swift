import SwiftUI
import SwiftData

struct UserElementsView: View {
    @StateObject private var viewModel = UserElementsViewModel()
    @State private var showingAddSheet = false
    @State private var selectedElement: UserElement? = nil
    
    var body: some View {
        NavigationStack {
            List(viewModel.userElements) { element in
                Button(action: { selectedElement = element }) {
                    HStack {
                        if let imageData = element.imageData,
                           let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                        } else {
                            Image(systemName: "photo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(element.title)
                                .font(.headline)
                            Text(element.dateCreated, style: .date)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("User Elements")
            .toolbar {
                Button(action: { showingAddSheet = true }) {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddElementSheet(
                    isPresented: $showingAddSheet,
                    onSave: viewModel.addUserElement
                )
            }
            .sheet(item: $selectedElement) { element in
                UserElementDetailView(element: element)
            }
        }
        .onAppear {
            viewModel.fetchUserElements()
        }
    }
}

struct UserElementDetailView: View {
    let element: UserElement
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    if let imageData = element.imageData,
                       let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                    } else {
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(element.title)
                            .font(.title)
                            .bold()
                        
                        Text("Created on:")
                            .font(.headline)
                        Text(element.dateCreated, style: .date)
                            .foregroundColor(.gray)
                    }
                    .padding()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    UserElementsView()
}