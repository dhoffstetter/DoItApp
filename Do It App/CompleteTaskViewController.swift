//
//  CompleteTaskViewController.swift
//  Do It App
//
//  Created by Diane Hoffstetter on 8/27/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
  
  @IBOutlet weak var taskLabel: UILabel!
  var task = Task()
  var previousVC = TasksViewController()


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
      if task.important == true {
        
        taskLabel.text = "❗️\(task.name)"
      } else {
        taskLabel.text = task.name
        
      }
    }

  @IBAction func completeTapped(_ sender: AnyObject) {
    
    previousVC.tasks.remove(at: previousVC.selectedIndex)
    previousVC.tableView.reloadData()
    navigationController!.popViewController(animated: true)

  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 

}
