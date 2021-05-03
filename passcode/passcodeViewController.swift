//
//  passcodeViewController.swift
//  passcode
//
//  Created by yousun on 2021/5/3.
//

import UIKit


// 設定一個是自己輸入的字串、自訂一組正確的密碼
var InputNumber = ""
let Code = "1234"


class passcodeViewController: UIViewController {

    
    @IBOutlet weak var textLabel: UILabel!
    
    
    @IBOutlet weak var code1ImageView: UIImageView!
    @IBOutlet weak var code2ImageView: UIImageView!
    @IBOutlet weak var code3ImageView: UIImageView!
    @IBOutlet weak var code4ImageView: UIImageView!
    
    
    @IBOutlet weak var passcodeStackView: UIStackView!
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    
    // 數字鍵全部拉在同一個 IBAction
    @IBAction func numberBtn(_ sender: UIButton) {
        
        InputNumber.append("\(sender.tag)")
        
        passcodeImage()
        
        CodeCorrect()
    }
    
    // 刪除密碼
    @IBAction func deleteBtn(_ sender: Any) {
        
        if (InputNumber.count > 0) && (InputNumber.count < 5) {
            
            InputNumber.removeLast()
        }
        
        deletecode()
    }
    
    
    // 判斷輸入的密碼是否正確
    func CodeCorrect(){
        
        if InputNumber.count == 4{
            
            if InputNumber == Code {
                
                textLabel.text = "密 碼 正 確"
                
                // 密碼正確就跳入下一頁指定的畫面
                performSegue(withIdentifier: "pass", sender: self)
            
            }else{
                
                textLabel.text = "密碼錯誤，請重新輸入"
                
                // 密碼錯誤時，左右晃動的動畫
                let codemove = CABasicAnimation(keyPath: "position")
                codemove.duration = 0.15
                codemove.repeatCount = 3
                codemove.fromValue = NSValue(cgPoint: CGPoint(x: passcodeStackView.center.x - 10, y: passcodeStackView.center.y))
                codemove.toValue = NSValue(cgPoint: CGPoint(x: passcodeStackView.center.x + 10, y: passcodeStackView.center.y))
                passcodeStackView.layer.add(codemove, forKey: "position")
                
                clearcode()
                
            }
        }
    }
    
    
    // 清除輸入的密碼
    func clearcode(){
        
        InputNumber = ""
        code1ImageView.image = UIImage(systemName: "circle")
        code2ImageView.image = UIImage(systemName: "circle")
        code3ImageView.image = UIImage(systemName: "circle")
        code4ImageView.image = UIImage(systemName: "circle")
    }
    
    
    // 輸入密碼的圖片
    func passcodeImage(){
        
        let InputImage = InputNumber.count
        
        switch InputImage {
        
            case 1:
                code1ImageView.image = UIImage(systemName: "circle.fill")
            case 2:
                code2ImageView.image = UIImage(systemName: "circle.fill")
            case 3:
                code3ImageView.image = UIImage(systemName: "circle.fill")
            case 4:
                code4ImageView.image = UIImage(systemName: "circle.fill")
            default:
                CodeCorrect()
           }
        }
    
    
    // 刪除密碼的圖片
    func deletecode(){
        
        let Delcode = InputNumber.count + 1
        
        switch Delcode {
        
            case 3:
                code3ImageView.image = UIImage(systemName: "circle")
            case 2:
                code2ImageView.image = UIImage(systemName: "circle")
            case 1:
                code1ImageView.image = UIImage(systemName: "circle")
            default:
                break
            }
        }
}
