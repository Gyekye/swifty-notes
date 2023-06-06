import Foundation


/// Folder Entity
struct Folder: Identifiable, Codable, Hashable {
    
    /// Firebase document ID
    var id: String
    
    /// Title of folder
    var title: String
    
    /// Description of folder
    var description: String
    
    /// Notes in folder
    var notes: [Note]
    
    /// Date folder was created
    var date: String
}
