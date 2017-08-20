//
//  FriendsTableViewController.swift
//  SharedChat
//
//  Created by Kleinsche on 2017/7/15.
//  Copyright © 2017年 Kleinsche. All rights reserved.
//

import UIKit
import CoreData

class FriendsTableViewController: UITableViewController,HeadViewDelegate {
    
    fileprivate var groups : [ClassModel] = []
    fileprivate var students : [StudentModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView(frame: .zero)
        tableView.separatorColor = UIColor.clear
        tableView.sectionHeaderHeight = 40
        
        

        // Data source.
        let Aitna    = ClassModel(className: "Aitna")
        Aitna.expend = false
        Aitna.students.append(StudentModel(name: "Y.X.M.",  age: 27))
        Aitna.students.append(StudentModel(name: "Leif",    age: 12))
        Aitna.students.append(StudentModel(name: "Lennon",  age: 23))
        Aitna.students.append(StudentModel(name: "Jerome",  age: 19))
        Aitna.students.append(StudentModel(name: "Isidore", age: 15))
        
        let Melete    = ClassModel(className: "Melete")
        Melete.expend = false
        Melete.students.append(StudentModel(name: "Merle",  age: 17))
        Melete.students.append(StudentModel(name: "Paddy",  age: 31))
        Melete.students.append(StudentModel(name: "Perry",  age: 59))
        Melete.students.append(StudentModel(name: "Philip", age: 23))
        
        let Aoede    = ClassModel(className: "Aoede")
        Aoede.expend = false
        Aoede.students.append(StudentModel(name: "Verne",   age: 12))
        Aoede.students.append(StudentModel(name: "Vincent", age: 89))
        Aoede.students.append(StudentModel(name: "Walter",  age: 43))
        Aoede.students.append(StudentModel(name: "Zachary", age: 21))
        
        let Dione    = ClassModel(className: "Dione")
        Dione.expend = false
        Dione.students.append(StudentModel(name: "Timothy",  age: 72))
        Dione.students.append(StudentModel(name: "Roderick", age: 34))
        Dione.students.append(StudentModel(name: "Quentin",  age: 12))
        Dione.students.append(StudentModel(name: "Paddy",    age: 75))
        
        let Adanos    = ClassModel(className: "Adanos")
        Adanos.expend = false
        Adanos.students.append(StudentModel(name: "Mortimer", age: 43))
        Adanos.students.append(StudentModel(name: "Michael",  age: 64))
        Adanos.students.append(StudentModel(name: "Kevin",    age: 23))
        Adanos.students.append(StudentModel(name: "Jeremy",   age: 21))
        
        groups.append(Aitna)
        groups.append(Melete)
        groups.append(Aoede)
        groups.append(Dione)
        groups.append(Adanos)

    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = HeadView.init(reuseIdentifier: "header")
        headView.delegate = self
        headView.setGroupModel(groupModel: groups[section])
        
        return headView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

    func clickView() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source
    

    //多少组
    override func numberOfSections(in tableView: UITableView) -> Int {
        return groups.count
    }
    

    //每组行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let groupModel = groups[section]
        
        if groupModel.expend == true {
            return groupModel.students.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let id = "friendCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: id)
        
        if (cell == nil) {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: id)
        }
        
        let groupModel = groups[(indexPath as NSIndexPath).section]
        let studentModel = groupModel.students[indexPath.row]
        
        cell?.imageView?.image = studentModel.icon
        cell?.textLabel?.text = studentModel.name
        cell?.detailTextLabel?.text = String(describing: studentModel.age)
        
        return cell!
    }
    

    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
