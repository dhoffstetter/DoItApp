//
//  CreateTaskViewController.swift
//  Do It App
//
//  Created by Diane Hoffstetter on 8/24/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

  @IBOutlet weak var taskNameTextField: UITextField!
  @IBOutlet weak var importantSwitch: UISwitch!
  
  var previousVC = TasksViewController()
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  @IBAction func addTapped(_ sender: AnyObject) {
    
    // Create a Task fromthe outlet information
    
    let task = Task()
    
    task.name = taskNameTextField.text!
    task.important = importantSwitch.isOn
    
    // Add new task to the array
    
    previousVC.tasks.append(task)
    previousVC.tableView.reloadData()
    navigationController!.popViewController(animated: true)
    
  }


}
