//
//  Note.swift
//  NoteApp
//
//  Created by Pawan Kumar on 08/12/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import Foundation
import RealmSwift

class Note: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var content: String = ""
}
