
import SwiftUI


struct FolderCard: View {
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            VStack {
                Text("01.")
                    .font(.system(size: 18, weight: .light))
                    .foregroundColor(.primary)
                    .padding(15)
            }
            Spacer(minLength: 30)
            VStack(alignment:.leading){
                Text("Folder Title")
                        .font(.system(size: 34, weight: .black))
                        .foregroundColor(.primary)
                Label("20 notes", systemImage: "note.text")
                    .font(.system(size: 18))
                    .padding([.top], -10)
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
            FolderCard()
            FolderCard()
            FolderCard()
            FolderCard()
        }
    }
}
