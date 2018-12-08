//
//  AppDelegate.swift
//  NoteApp
//
//  Created by Pawan Kumar on 07/12/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import RealmSwift
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let realm = try! Realm()
        
        // createNoteBook("Notebook 2")
        
        if let notebook = realm.objects(Notebook.self).last {
            print("Notebook: \n \(notebook)")
            
            if let firstNote = notebook.notes.first {
                print(firstNote)
                
                print(firstNote.notebook.first?.title as Any)
            }
        }
        
        // Many to Relationship
        
//        let myFirstNote = Note()
//        myFirstNote.title = "My second note 2 "
//        myFirstNote.content = "this is free for deletion don't worry"
//
//        do {
//            try realm.write {
//                realm.add(myFirstNote)
//            }
//        } catch {
//            debugPrint(error.localizedDescription )
//        }
//
//        let allNotes = realm.objects(Note.self)
//
//        print("all Notes before deleting \(allNotes) \n \n \n ")
        
//        if let firstNote = allNotes.first {
//            try! realm.write {
//                firstNote.title = "this is my first though I am changing it"
//            }
//        }
//
//
//
//
//
//        for note in allNotes {
//            print("Note title: \(note.title)" + "\n" + "Note content: \(note.content)"  + "\n" + " ============")
        //      }
        
        /* filter to delete duplicate notes  */
        
//        let lastDuplicateNotes = allNotes.filter("title CONTAINS '2'")
//        try! realm.write {
//            realm.delete(lastDuplicateNotes)
//        }
        
        /* a basic filter example */
//        let filterNote = allNotes.filter("title CONTAINS 'this' ")
//        print("filter note is \(filterNote)")
        
        /* a complex filter example */
        
//        let moreComplexFilter =  NSPredicate(format: "title CONTAINS %@ AND content CONTAINS %@", "this","cool")
//        let result = allNotes.filter(moreComplexFilter)
//        print(" more complex all \(result)")
        
        // print all notes
        
//        print(allNotes)
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate {
    func createNoteBook(_ title: String) {
        let realm = try! Realm()
        
        let notebook = Notebook()
        notebook.title = title
        notebook.creationDate = Data()
        
        try! realm.write {
            realm.add(notebook)
        }
        
        addNotes(notebook)
    }
    
    func addNotes(_ notebook: Notebook) {
        let realm = try! Realm()
        
        for i in 1...5 {
            let note = Note()
            note.title = "Note \(i)"
            note.content = "\(Data())"
            
            try! realm.write {
                notebook.notes.append(note)
            }
        }
    }
}
