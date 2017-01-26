//
//  LoginViewController.swift
//  Instagram
//
//  Created by Kojiro Wakabayashi on 2017/01/25.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

class LoginViewController: UIViewController {
    @IBOutlet weak var mailAddressTextField: UITextField!

    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var displayNameTextField: UITextField!
    
    @IBAction func handleLoginButton(_ sender: Any) {
        if let address = mailAddressTextField.text, let password = passwordTextField.text {
            
            // アドレスとパスワード名のいずれかでも入力されていない時は何もしない
            if address.characters.isEmpty || password.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "必須項目を入力して下さい")
                
                return
            }
            
            // FIRAuthクラスのsignIn:withEmail:password:completion:メソッドでログインを行い、成功したらログイン画面を閉じます。
            FIRAuth.auth()?.signIn(withEmail: address, password: password) { user, error in
                if let error = error {
                    print("DEBUG_PRINT: " + error.localizedDescription)
                    SVProgressHUD.showError(withStatus: "サインインに失敗しました。")
                    return
                } else {
                    print("DEBUG_PRINT: ログインに成功しました。")
                    // HUDを消す
                    SVProgressHUD.dismiss()
                    // 画面を閉じてViewControllerに戻る
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    
    
    @IBAction func handleCreateAcountButton(_ sender: Any) {
        
        if let address = mailAddressTextField.text, let password = passwordTextField.text, let displayName = displayNameTextField.text {

            
            // アドレスとパスワードと表示名のいずれかでも入力されていない時は何もしない
            if address.characters.isEmpty || password.characters.isEmpty || displayName.characters.isEmpty {
                print("DEBUG_PRINT: 何かが空文字です。")
                SVProgressHUD.showError(withStatus: "必須項目を入力して下さい")
                return
            }
            
            // HUDで処理中を表示
            SVProgressHUD.show()
            
            
            // アドレスとパスワードでユーザー作成。ユーザー作成に成功すると、自動的にログインする
            // Firebaseのアカウントの作成はFIRAuthクラスのcreateUser:withEmail:password:completion:メソッドで行います。メールアドレス、パスワード、完了時のクロージャを与えて呼び出します。クロージャとは、{...}で囲まれたブロックのことで、処理の塊です。クロージャではエラーと結果が渡ってくるので、エラーがnilかどうかを判断し、nilでなければアカウント作成が正常に完了したことを意味します。  
            
            FIRAuth.auth()?.createUser(withEmail: address, password: password) { user, error in
                if let error = error {
                    // エラーがあったら原因をprintして、returnすることで以降の処理を実行せずに処理を終了する.
                   // error.localizedDescriptionでStringを取り出してprintしています。
                    print("DEBUG_PRINT: " + error.localizedDescription)
                     SVProgressHUD.showError(withStatus: "ユーザー作成に失敗しました。")
                    return
                }
                
                //アカウント作成に成功すると、自動的にログインされます。
                print("DEBUG_PRINT: ユーザー作成に成功しました。")
                
                // 表示名を設定する
                let user = FIRAuth.auth()?.currentUser
                if let user = user {
                    let changeRequest = user.profileChangeRequest()
                    changeRequest.displayName = displayName
                    changeRequest.commitChanges { error in
                        if let error = error {
                             SVProgressHUD.showError(withStatus: "ユーザー作成時にエラーが発生しました。")
                            print("DEBUG_PRINT: " + error.localizedDescription)
                        }
                        print("DEBUG_PRINT: [displayName = \(user.displayName)]の設定に成功しました。")

                        // HUDを消す
                        SVProgressHUD.dismiss()
                        
                        // 画面を閉じてViewControllerに戻る
                        self.dismiss(animated: true, completion: nil)
                    }
                } else {
                    print("DEBUG_PRINT: displayNameの設定に失敗しました。")
                }
            }
            
        }
        
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
