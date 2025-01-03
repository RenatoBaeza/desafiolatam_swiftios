import SwiftUI

struct HeroesView: View {
    @StateObject private var viewModel = HeroesViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        List(viewModel.heroes) { hero in
            Button(action: {
                viewModel.fetchHeroDetail(id: hero.id)
            }) {
                HeroRow(hero: hero)
            }
        }
        .navigationTitle("Heroes")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(item: $viewModel.selectedHero) { hero in
            HeroDetailView(hero: hero)
        }
        .onAppear {
            viewModel.fetchHeroes()
        }
    }
}

struct HeroRow: View {
    let hero: Hero
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: hero.imagen)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(hero.nombre)
                    .font(.headline)
                Text(hero.primeraAparicion)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    NavigationStack {
        HeroesView()
    }
}
