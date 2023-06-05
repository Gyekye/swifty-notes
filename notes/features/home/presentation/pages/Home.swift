import SwiftUI


struct Home: View {
    var body: some View {
            TabView {
                Folders()
                    .tabItem {
                        Label("Folders", systemImage: "folder.fill")
                }
                CreateFolder()
                    .tabItem {
                        Label("New Folder", systemImage: "folder.fill.badge.plus")
                }
                UserProfile()
                    .tabItem {
                        Label("Profile",systemImage:"person.crop.circle.fill")
                }
            }
        } 
    }

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
