//
//  TasksViewController.swift
//  Do It App
//
//  Created by Diane Hoffstetter on 8/24/16.
//  Copyright © 2016 Dumb Blonde Software. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

  @IBOutlet weak var tableView: UITableView!
  
  var tasks : [Task] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    tasks = makeTasks();
    
    tableView.dataSource = self
    tableView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    getTasks()
    tableView.reloadData()
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return tasks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = UITableViewCell()
    let task = tasks[indexPath.row]
    
    if task.important == true {
      
      cell.textLabel?.text = "❗️\(task.name!)"
    } else {
      cell.textLabel?.text = task.name!

    }
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let task = tasks[indexPath.row]
    performSegue(withIdentifier: "selectTaskSegue", sender: task)
  }
  
/*  func makeTasks() -> [Task] {
    
    let task1 = Task()
    task1.name = "Walk the dog"
    task1.important = false
    
    let task2 = Task()
    task2.name = "Buy cheese"
    task2.important = true
    
    let task3 = Task()
    task3.name = "Mow the lawn"
    task3.important = false
    
    return [task1, task2, task3]
    
  } */
  

  @IBAction func plusTapped(_ sender: AnyObject) {
    
    performSegue(withIdentifier: "addSegue", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "selectTaskSegue" {
      let nextVC = segue.destination as! CompleteTaskViewController
      nextVC.task = sender as! Task
    }

  }
  
  func getTasks() {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    do {
      tasks = try context.fetch(Task.fetchRequest()) as! [Task]
      print(tasks)
    } catch {
      print("Oops we have an error")
    }

  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

