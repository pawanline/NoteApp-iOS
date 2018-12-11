//
//  NoteListTableViewController.swift
//  NoteApp
//
//  Created by Pawan Kumar on 11/12/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import UIKit

class NoteListTableViewController: UITableViewController {
    // Mark: - Instance Objects
    class func noteListTableViewControllerInstanceObject() -> NoteListTableViewController {
        let noteListTableViewController: NoteListTableViewController = (UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: noteListController) as? NoteListTableViewController)!
        return noteListTableViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        doInitialSetup()
    }

    // MARK: - Helper methods

    func doInitialSetup() {
        navigationController?.navigationBar.isHidden = false
    }
}
