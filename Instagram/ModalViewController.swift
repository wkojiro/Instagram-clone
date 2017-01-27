//
//  ModalViewController.swift
//  Instagram
//
//  Created by Kojiro Wakabayashi on 2017/01/27.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit
import SVProgressHUD

protocol ModalViewControllerDelegate{
    func modalDidFinished(modalText: String)
}

class ModalViewController: UIViewController {
    
    var delegate: ModalViewControllerDelegate! = nil
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func handleModalCommentButton(_ sender: Any) {
        if let commentTextField = textField.text {
            
            if commentTextField.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
            }
            
            self.delegate.modalDidFinished(modalText: commentTextField)
            
        }
        
    }
    
    @IBAction func handleModalCancelButton(_ sender: Any) {
        // 画面を閉じる
        self.dismiss(animated: true, completion: nil)
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
