import SwiftUI


struct Folders: View {
     var body: some View {
         NavigationStack {
             ScrollView {
                 ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                     NavigationLink(destination: FolderDetail()) {
                         FolderCard()
                     }
                 }
             }.toolbar {
                 ToolbarItem(placement: .navigationBarTrailing) {
                     Button(action: {}) {
                         Image(systemName: "arrow.clockwise.circle.fill")
                     }
                 }
             }.navigationTitle("Folders")
         }
     }
}

struct Folders_Previews: PreviewProvider {
    static var previews: some View {
        Folders()
    }
}

