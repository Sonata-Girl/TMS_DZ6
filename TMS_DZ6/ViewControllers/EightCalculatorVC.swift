//
//  EightCalculatorVC.swift
//  TMS_DZ6
//
//  Created by Sonata Girl on 24.08.2022.
//
//1. зафиналь класс
//2. свойства сделай приватными
//3. не пиши везде self, если это явно не нужно
//4. тебе не нужно столько методов для каждой цифры. сделай один метод. в него приходит sender, это нажатая кнопка. у нее есть лейбл, доставай оттуда цифру
//5. кнопку открытия добавляй во viewDidLoad. для нее можно констрейнты из кода заюзать
//6. добавление таргета в closeButton и создание самой кнопки можно совместить
//
//private let closeButton: UIButton = {
//let closeButton = CloseButton()
//closeButton.addTarget…
//return closeButton
//}()
import UIKit

enum Operation {
    case plus, minus, equal, division, percent, multiplication, none
}

enum ButtonType {
    case digit, operation, equal, none
}

final class EightCalculatorVC: UIViewController {
   
    let closeButton = CloseButton()
    
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonPlusMinus: UIButton!
    @IBOutlet weak var buttonPercent: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonMultiplication: UIButton!
    @IBOutlet weak var buttonSubstraction: UIButton!
    @IBOutlet weak var buttonAddition: UIButton!
    @IBOutlet weak var buttonEqual: UIButton!
    @IBOutlet weak var buttonComma: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button9: UIButton!
    

    private var oneComponent = 0.0
    private var twoComponent = 0.0
    private var threeComponent = 0.0
    private var oneCompFull = false
    private var twoCompFull = false
    private var threeCompFull = false
    private var oneMark = Operation.none
    private var twoMark = Operation.none
    private var lastButton = ButtonType.none
    private var currentDigit = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        resultLabel.text = "0"
       
        view.addSubview(closeButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    private func setupUI() {
        self.view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closeButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10),
            closeButton.heightAnchor.constraint(equalToConstant: 20), // высота
            closeButton.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        closeButton.addTarget(self, action: #selector(closeButtonAction), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        closeButton.frame.origin.x = view.frame.width - view.safeAreaInsets.right - closeButton.frame.size.width - 5
        closeButton.frame.origin.y = view.safeAreaInsets.top + 1
    }
    
    @IBAction func closeButtonAction() {
        navigationController?.popViewController(animated: true)
    }
  
    
    @IBAction func buttonACAction(_ sender: UIButton) {
        if currentDigit.isEmpty {
            oneComponent = 0.0
            twoComponent = 0.0
            threeComponent = 0.0
            oneCompFull = false
            twoCompFull = false
            threeCompFull = false
            oneMark = .none
            twoMark = .none
            lastButton = .none
        }
        currentDigit = "0"
        updateLabel()
    }
    
    @IBAction func buttonAdditionAction(_ sender: UIButton) {
        putComponent(operation: .plus)
        toCountUpAndReset(operation: .plus)
        updateLabel()
        lastButton = .operation
    }
    
    @IBAction func buttonSubstractionAction(_ sender: UIButton) {
        putComponent(operation: .minus)
        toCountUpAndReset(operation: .minus)
        updateLabel()
        lastButton = .operation
    }
    
    @IBAction func buttonMultiplicationAction(_ sender: UIButton) {
        putComponent(operation: .multiplication)
        toCountUpAndReset(operation: .multiplication)
        updateLabel()
        lastButton = .operation
    }
    
    @IBAction func buttonDivisionAction(_ sender: UIButton) {
        putComponent(operation: .division)
        toCountUpAndReset(operation: .division)
        updateLabel()
        lastButton = .operation
   }
    
    @IBAction func buttonEqualAction(_ sender: UIButton) {
        guard lastButton == .digit || lastButton == .equal else {return}

        putComponent(operation: .equal)
        toCountUpAndReset(operation: .equal)
        updateLabel()
        lastButton = .equal
  }
    
    @IBAction func button1Action(_ sender: UIButton) {
        if lastButton == .operation {
            currentDigit = "1"
        } else {
            currentDigit.append(String(1))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button0Action(_ sender: UIButton) {
        if !currentDigit.isEmpty || (currentDigit.count == 1 && !currentDigit.contains("0"))  {
            currentDigit.append(String(0))
            updateLabel()
            lastButton = .digit
        }
    }

    @IBAction func button2Action(_ sender: UIButton) {
        if lastButton == .operation {
            currentDigit = "2"
        } else {
            currentDigit.append(String(2))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button3Action(_ sender: UIButton) {
        if lastButton == .operation {
           currentDigit = "3"
        } else {
            currentDigit.append(String(3))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button4Action(_ sender: UIButton) {
       if lastButton == .operation {
           currentDigit = "4"
        } else {
           currentDigit.append(String(4))
        }
        updateLabel()
    }
    
    @IBAction func button5Action(_ sender: UIButton) {
       if lastButton == .operation {
           currentDigit = "5"
       } else {
           currentDigit.append(String(5))
       }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button6Action(_ sender: UIButton) {
       if lastButton == .operation {
            currentDigit = "6"
        } else {
            currentDigit.append(String(6))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button7Action(_ sender: UIButton) {
        if lastButton == .operation {
            currentDigit = "7"
        } else {
            currentDigit.append(String(7))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button8Action(_ sender: UIButton) {
        if lastButton == .operation {
            currentDigit = "8"
        } else {
            currentDigit.append(String(8))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func button9Action(_ sender: UIButton) {
        if lastButton == .operation {
            currentDigit = "9"
        } else {
            currentDigit.append(String(9))
        }
        updateLabel()
        lastButton = .digit
    }
    
    @IBAction func buttonCommaAction(_ sender: UIButton) {
        if !currentDigit.contains(".") {
            currentDigit.append(".")
            updateLabel()
            lastButton = .digit
        }
    }
    
    @IBAction func buttonPercentAction(_ sender: UIButton) {
        if lastButton == .digit {
            if oneCompFull {
                putComponent(operation: .percent)
                toCountUpAndReset(operation: .percent)
            } else {
                var currentDigitDouble = Double(currentDigit) ?? 0
                currentDigitDouble /= 100
                currentDigit = String(currentDigitDouble)
            }
            updateLabel()
        }
    }
    
    @IBAction func buttonPlusMinusAction(_ sender: UIButton) {
        var currentDigitDouble = Double(currentDigit) ?? 0
        currentDigitDouble *= (-1)
        currentDigit = String(currentDigitDouble)
        updateLabel()
        lastButton = .digit
    }
    
    private func putComponent(operation: Operation) {
        guard !currentDigit.isEmpty else {return}
        
        if oneMark == .none {
            oneMark = operation == .equal ? oneMark : operation
            oneComponent = Double(currentDigit) ?? 0
            oneCompFull = true
            return
        }
        
        if twoMark == .none {
            if operation == .multiplication || operation == .division
                ||  operation == .percent {
                twoMark = operation
                twoComponent = Double(currentDigit) ?? 0
                twoCompFull = true
                return
            } else {
                if twoCompFull == false {
                    twoComponent = Double(currentDigit) ?? 0
                    twoCompFull = true
                }
            }
        } else {
            if operation == .multiplication || operation == .division
                || operation == .equal {
                threeComponent = Double(currentDigit) ?? 0
                threeCompFull = true
            }
        }
    }

       
    private func toCountUpAndReset(operation: Operation) {
        if oneMark == .none && operation == .equal {
            return
        }

        var result = 0.0
        if threeCompFull {
            if twoMark == .division {
                result = twoComponent / threeComponent
            }
            if twoMark == .multiplication {
                result = twoComponent * threeComponent
            }
            
            if oneMark == .plus {
                result += oneComponent
            } else if oneMark == .minus {
                result -= oneComponent
            }
            
            if operation == .equal {
                oneMark = twoMark
                twoComponent = threeComponent
            } else {
//                oneMark = .none
//                oneCompFull = false
//                twoCompFull = false
//                twoComponent = 0
            }
            twoMark = Operation.none
            threeCompFull = false
            threeComponent = 0
            oneComponent = result
            currentDigit = String(result)

            return
        }
        
        if twoMark == .none && twoCompFull || operation == .percent {
           if oneMark == .division {
               result = oneComponent / twoComponent
            }
            if oneMark == .plus {
               result = oneComponent + twoComponent
            }
            if oneMark == .minus {
               result = oneComponent - twoComponent
            }
            if oneMark == .multiplication {
                result = oneComponent * twoComponent
            }
            
            if twoMark == .percent {
                result = oneComponent/100 * twoComponent
                if oneMark == .plus {
                    result = oneComponent + result
                } else if oneMark == .minus {
                    result = oneComponent - result
                } else if oneMark == .multiplication {
                    result = oneComponent * result
                } else if oneMark == .division {
                    result = oneComponent / result
                }
            }
            
            if operation == .equal {
//               oneMark = twoMark
            } else {
//                oneMark = .none
//                oneCompFull = false
//                twoCompFull = false
//                twoComponent = 0
            }
            twoMark = Operation.none
            threeCompFull = false
            threeComponent = 0

            oneComponent = result
            currentDigit = String(result)
       }
    }
        
    private func updateLabel(){
        if currentDigit.count == 1 && currentDigit.contains("0")  {
            currentDigit = ""
            resultLabel.text = "0"
        } else {
            if Double(currentDigit) ?? 0  == Double(Int(Double(currentDigit) ?? 0 )) {
                resultLabel.text = String(Int(Double(currentDigit) ?? 0))
            } else {
                resultLabel.text = currentDigit
            }
        }
    }
    
}
