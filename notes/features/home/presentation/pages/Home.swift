import SwiftUI


struct Home: View {
    // UI
    var body: some View {
            TabView {
                Folders()
                    .tabItem {
                        Label("Folders",systemImage: "folder.fill")
                }
                Text("Notifications")
                    .tabItem {
                        Label("Notifications",systemImage:"bell.fill")
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
        Home().environmentObject(FolderController())
    }
}
