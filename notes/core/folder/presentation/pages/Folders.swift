import SwiftUI


struct Folders: View {
     var body: some View {
         NavigationView {
             ScrollView {
                 ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                     NavigationLink(destination: FolderDetail()) {
                         FolderCard()
                     }
                 }
             }
             .navigationTitle("Folders")
             .navigationColor(.black)
             .padding([.top], 50)
         }
     }
}

struct Folders_Previews: PreviewProvider {
    static var previews: some View {
        Folders()
    }
}

