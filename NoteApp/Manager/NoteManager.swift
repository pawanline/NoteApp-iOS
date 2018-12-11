//
//  NoteManager.swift
//  NoteApp
//
//  Created by Pawan Kumar on 08/12/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import RealmSwift

class NoteManager: NSObject {
    static let shared = NoteManager()
    
    private override init() {
        super.init()
    }
    
    /* add function to add Notebook */
    
    func addNotebook(_ title: String) {
        let realm = try! Realm()
        
        let notebook = Notebook()
        notebook.title = title
        notebook.creationDate = Date()
        
        do {
            try realm.write {
                realm.add(notebook)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func getNotebooks() -> [Notebook]? {
        let realm = try! Realm()
        let notebooks = realm.objects(Notebook.self)
        
        return notebooks.map({ $0 })
    }
}
