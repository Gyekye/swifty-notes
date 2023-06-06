import SwiftUI


struct FolderCard: View {
    // External dependencies
    var folder: Folder
    var index: String
    
    // UI
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack {
                Text(index)
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.primary)
                    .padding(15)
            }
            Spacer(minLength: 30)
            VStack(alignment:.leading){
                Text(folder.title)
                    .font(.system(size: 34, weight: .black))
                    .foregroundColor(.primary)
                    .padding([.bottom], -12)
                Text(folder.description)
                    .font(.system(size: 18, weight: .medium))
                    .padding([.vertical], 10)
                    .foregroundColor(.black)
                Label("\(folder.notes.count) note(s)", systemImage: "note.text")
                    .font(.system(size: 18))
                    .padding([.top], -10)
                    .bold()
                    .foregroundColor(.purple)
                Divider()
            }
        }.background(.white)
         .padding([.vertical], 15)
    }
}

struct FolderCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            FolderCard(folder: Folder(id: "01", title: "Finances 101", description: "For my finances", notes: [
                Note(id: "100", title: "First Time", content: "Keep your face to the sunshine and the shadow disappears", date: "23 May 2033"),
                Note(id: "101", title: "Second Time", content: "Keep your face to the sunshine and the shadow disappears", date: "22 May 2033")
            ], date: "20 May 2033"), index: "1")
        }
    }
}
