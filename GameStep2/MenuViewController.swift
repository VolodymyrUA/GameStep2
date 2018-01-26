//
//  MenuViewController.swift
//  GameStep2
//
//  Created by Володимир Смульський on 1/11/18.
//  Copyright © 2018 Володимир Смульський. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // задаємо дефолтне значення для PickerView
   
    
    // числа які відображаються в pickerView
    let numberOfCards = ["6","8","12","16","24","36"]
    var numberOfCardsFromPicker = 0
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBAction func playButton(_ sender: UIButton) {
        //під час натискання кнопки переходимо на наступний контроллер
        performSegue(withIdentifier: "ArrowNumberOfCards", sender: self)
        numberOfCardsFromPicker = 6
    }
    
    // override перевизначає функцію з якогось протоколу
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // тут ми вказуємо destination as! FlipCardsViewController куди ми будемо передавати
        let temporaryVariableOfPicker = segue.destination as! FlipCardsViewController
        //тут ми вказуємо що ми змінну з нашого контроллера передаємо в іншу змінну в наступному контороллері
        temporaryVariableOfPicker.getCardNumbers = numberOfCardsFromPicker
    }
    // кількість барабанів у пікервю
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        // повертає стрінгове число що ми вибрали в пікері
//        return  numberOfCards[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
      
        //return numberOfCards.count
        return 1000
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let numberInPicker = UILabel()
        numberInPicker.text = numberOfCards[row % numberOfCards.count]
        numberInPicker.frame = CGRect(x: 0, y: 0, width: pickerView.frame.width, height: 50)
        numberInPicker.font = UIFont.boldSystemFont(ofSize: 50)
        numberInPicker.textAlignment = .center
        return numberInPicker
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            //
           self.pickerView.selectRow(100, inComponent: 0, animated: false)
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 50
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return pickerView.frame.width
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //
        numberOfCardsFromPicker = Int(numberOfCards[row % numberOfCards.count])!
       // numberOfCardsFromPicker = Int(numberOfCards[row])!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfCardsFromPicker = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool{
        return true
    }
}



