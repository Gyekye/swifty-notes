//
//  NoteCard.swift
//  notes
//
//  Created by richmond gyekye on 05/06/2023.
//

import SwiftUI

struct NoteCard: View {
    var body: some View {
        VStack(alignment:.leading) {
            Text("Note Title")
                .bold()
            Spacer()
            Text("Item, keep your face to the sunshine and you cannot see the shadow")
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            Spacer(minLength: 20)
            Text("23 May 2022")
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
        NoteCard()
    }
}
