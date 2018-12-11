//
//  NotebookListTableViewController.swift
//  NoteApp
//
//  Created by Pawan Kumar on 07/12/18.
//  Copyright © 2018 Pawan Kumar. All rights reserved.
//

import UIKit

class NotebookListTableViewController: UITableViewController {

    // MARK: - Variable
    
    var notebooks = [Notebook]()
    var cellIdentifier = "Cell"
    
    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doInitialSeup()
        loadData()
    }
    
    // Mark: - Helper methods
    
    func doInitialSeup() {
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.separatorStyle = .none
    }
    
    func loadData() {
        if let notebooks = NoteManager.shared.getNotebooks() {
            self.notebooks = notebooks
            tableView.reloadData()
        }
    }
    
    // MARK: - IB Acions
    
    @IBAction func addNotebookTapped(_ sender: Any) {
        let addAlert = UIAlertController(title: "Add Notebook", message: "Enter the title of your new notebook", preferredStyle: .alert)
        
        addAlert.addTextField { textField in
            textField.placeholder = "Please enter notebook title"
        }
        
        addAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        addAlert.addAction(UIAlertAction(title: "Save", style: .default, handler: { [weak self] _ in
            if let title = addAlert.textFields?.first?.text {
                NoteManager.shared.addNotebook(title)
                self?.loadData()
            }
        }))
        
        present(addAlert, animated: true, completion: nil)
    }
    
    // MARK: - UITableViewDataSource and UITableViewDelegate Methods
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notebooks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.textLabel?.text = notebooks[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = NoteListTableViewController.noteListTableViewControllerInstanceObject()
        navigationController?.pushViewController(controller, animated: true)
    }
}
