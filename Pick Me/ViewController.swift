//
//  ViewController.swift
//  Pick Me
//
//  Created by James Young on 1/18/18.
//  Copyright © 2018 James Young. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var thePicker: UIPickerView!
    @IBOutlet var message:UITextView!
    let model = PickMeModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Actions -
    @IBAction func buttonPick (sender: AnyObject)
    {
        let row1 = thePicker.selectedRow(inComponent: 0)
        let row2 = thePicker.selectedRow(inComponent: 1)
        let row3 = thePicker.selectedRow(inComponent: 2)
        let theMessage = "I \(model.getVerbs(row1) ?? "") \(model.getNumbers(row2) ?? "") \(model.getNouns(row3) ?? "")"
        //let output = UIAlertController(title: "itwit Pick!", message: theMessage, preferredStyle: .alert)
        //utput.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        //present(output, animated: true, completion: nil)
        //print(theMessage);
        
        message.text! += "\(theMessage)\n"
        let range = NSMakeRange(message.text.characters.count - 1, 0)
        message.scrollRangeToVisible(range)
        
    }
    @IBAction func buttonClear (sender: AnyObject)
    {
        message.text = ""
    }



    // MARK: - Protocols -
    // MARK: Datasource
    func numberOfComponents(in: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int)
        -> Int {
            if component == 0
            {
                return model.getVerbsCount()
            }
            else if component == 1
            {
                return model.getNumbersCount()
            }
            else
            {
                return model.getNounsCount()
            }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int)
        -> String? {
            if component == 0
            {
                return model.getVerbs(row)
            }
            else if component == 1
            {
                return model.getNumbers(row)
            }
            else
            {
                return model.getNouns(row)
            }
    }
    
}
