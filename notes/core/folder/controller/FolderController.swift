import Foundation
import FirebaseCore
import FirebaseFirestore


/// Controls how interactions with firebase are made
class FolderController: ObservableObject {
    
    /// All folders from firebase
    @Published var folders:[Folder] = []
    
    
    /// Create a folder
    func createFolder(folder: Folder) {
        do {
            let collectionRef = Firestore.firestore().collection("folders")
            let document = collectionRef.document()
            
            // Add a new document
            collectionRef.document(document.documentID).setData([
                "id":document.documentID,
                "title":folder.title,
                "description":folder.description,
                "notes":folder.notes,
                "date": FieldValue.serverTimestamp()
            ]) { error in
                if let error = error {
                    print("Error sending data to Firestore: \(error)")
                } else {
                    print("Data sent successfully to Firestore")
                }
            }
        }
    }
    
    
    /// Create a note within  folder
    func createNote(note: inout Note, folder: Folder) {
        do {
            let collectionRef = Firestore.firestore().collection("folders")
            let document = collectionRef.document()
            
            /// Update id and date of note
            note.id = document.documentID
            
            let serverTimestamp = Timestamp()
            let dateFormatter = DateFormatter()
            let dateString = dateFormatter.string(from: serverTimestamp.dateValue())
            note.date = dateString
            
            
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(note)
            
            
            if let json = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any] {
                // Update folder with new note
                collectionRef.document(folder.id).updateData([
                    "notes": FieldValue.arrayUnion([json])
                ]) { error in
                    if let error = error {
                        print("Error sending data to Firestore: \(error)")
                    } else {
                        print("Data sent successfully to Firestore")
                    }
                }
            }
            
        } catch {
            print("Error encoding model to JSON: \(error)")
        }
    }
    
    
    /// Function that list all folders in the folders collection
    func listFolders() {
        let collectionRef = Firestore.firestore().collection("folders")
        collectionRef.addSnapshotListener {
            snapshot, error in
            
            // Safely unwrap documents from snapshot
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            // Convert documents to Folder instance
            DispatchQueue.main.async {
                self.folders = documents.map { doc  in
                    
                    let jsonArray = doc["notes"] as? [[String: Any]]
                    let notes = jsonArray?.compactMap { jsonNote -> Note? in
                        guard let title = jsonNote["title"] as? String,
                              let content = jsonNote["content"] as? String,
                              let id = jsonNote["id"] as? String,
                              let timestamp = jsonNote["date"] as? String else {
                            return nil
                        }
                        return Note(
                            id: id,
                            title: title,
                            content: content,
                            date: timestamp
                        )
                    }
                        return Folder(
                            id: doc.documentID,
                            title: doc["title"] as? String ?? "" ,
                            description: doc["description"] as? String ?? "" ,
                            notes: notes ?? [],
                            date: doc["date"] as? String ??  ""
                    )
                }
            }
        }
    }
}
