//
//  LoggedinViewController.swift
//  challengeFour
//
//  Created by Lijie Zhao on 8/29/17.
//  Copyright © 2017 Lijie Zhao. All rights reserved.
//

import UIKit

class LoggedinViewController: UIViewController {

    @IBOutlet weak var textField: UITextView!
    var statusText:Bool?
    override func viewDidLoad() {
        super.viewDidLoad()

        if statusText == false {
            textField.text = "YOU ARE NOT LOGGED IN GO BACK AND LOGIN"
        }else{
            textField.text = "YOU ARE LOGGED IN"
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
