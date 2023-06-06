import SwiftUI


struct NoteCard: View {
    // External dependencies
    var note: Note
    
    // UI
    var body: some View {
        VStack(alignment:.leading) {
            Text(note.title)
                .bold()
            Spacer()
            Text(note.content)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 20)
            Text(note.date)
                .font(.caption)
                .foregroundColor(.gray.opacity(0.8))
            
        }.padding(EdgeInsets(top: 25, leading: 10, bottom: 25, trailing: 10))
         .border(.ultraThinMaterial.shadow(.drop(radius: 20)))
         .cornerRadius(10)
         .frame(maxWidth:.infinity)
    }
}

struct NoteCard_Previews: PreviewProvider {
    static var previews: some View {
        NoteCard(note: Note(id: "100", title: "First Time", content: "Keep your face to the sunshine and the shadow disappears", date: "23 May 2033"))
    }
}
