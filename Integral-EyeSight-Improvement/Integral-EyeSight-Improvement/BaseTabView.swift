

import SwiftUI

struct BaseTabView: View {
    var body: some View {
        TabView {
            CoursesView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            // Assuming UserProgressView and FavoritesView are other views you have defined
            UserProgressView()
                .tabItem {
                    Label("Progress", systemImage: "calendar")
                }

            CoursesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}


#Preview {
    BaseTabView()
}
