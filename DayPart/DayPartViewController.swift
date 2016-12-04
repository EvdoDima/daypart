//
//  ViewController.swift
//  DayPart
//
//  Created by evdodima on 30/11/2016.
//  Copyright © 2016 Evdodima. All rights reserved.
//

import UIKit

class DayPartViewController: UIViewController {

    @IBOutlet weak var installReminder: UILabel!
    @IBOutlet weak var beginingDatePicker: UIDatePicker!
    @IBOutlet weak var endingDatePicker: UIDatePicker!
    @IBOutlet weak var durationLabel: UILabel!
    let userDef = UserDefaults(suiteName: "group.dayPart")

    @IBAction func beginingValueChange(_ sender: Any) {
        let beginingDate = beginingDatePicker.date
        userDef?.set(beginingDate, forKey: "beginingTime")
        updateDuration()
    }
    @IBAction func endingValueChanged(_ sender: Any) {
        let endingDate = endingDatePicker.date
        userDef?.set(endingDate, forKey: "endingTime")
        updateDuration()
    }
    
    func updateDuration(){
        durationLabel.text = countInterval(endingDate: endingDatePicker.date.asTodayDate(), beginingDate: beginingDatePicker.date.asTodayDate())
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        userDef?.set(beginingDatePicker.date, forKey: "beginingTime")
        userDef?.set(endingDatePicker.date, forKey: "endingTime")
        
        beginingDatePicker.minuteInterval = 1
        endingDatePicker.minuteInterval = 1
        updateDuration()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        print("willAppear")
        beginingDatePicker.setDate(userDef?.object(forKey: "beginingTime") as! Date, animated: animated)
        endingDatePicker.setDate(userDef?.object(forKey: "endingTime") as! Date, animated: animated)
        updateDuration()
        installReminder.isHidden = (userDef?.object(forKey: "widgetInstalled") != nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

