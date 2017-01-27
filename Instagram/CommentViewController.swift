//
//  CommentViewController.swift
//  Instagram
//
//  Created by Kojiro Wakabayashi on 2017/01/26.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SVProgressHUD


class CommentViewController: UIViewController {
    
    var postData:PostData? = nil
    var postID: String?
    
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func handleCommentButton(_ sender: Any) {
        if let commentTextField = commentTextField.text {
            
            if commentTextField.characters.isEmpty {
                SVProgressHUD.showError(withStatus: "コメントを入力して下さい")
                return
            }
        }
        

        
        let name = FIRAuth.auth()?.currentUser?.displayName


        // 辞書を作成してFirebaseに保存する

     //   let commentRef = FIRDatabase.database().reference().child(Const.PostPath).child(postID!)
        let commentRef = FIRDatabase.database().reference().child(Const.PostPath).child((postData?.id!)!)
    //    postData?.comments.append("\(name!): \(commentTextField.text!)")
      //   comments.append("\(name!): \(commentTextField.text!)")
        
        
        postData?.comments.append("\(name!): \(commentTextField.text!)")
        let comments = ["comments":postData?.comments]
        commentRef.updateChildValues(comments)
        
    //    comments.append("\(name!): \(commentTextField.text!)")

     //   commentRef.childByAutoId().setValue(postData)
        
        
       // var commentArray = [String:String]()
       //  commentArray = [name!:commentTextField.text!]

       // let comments = ["comments":commentArray]
      //  postData?.comments.append([name!: commentTextField.text!])
      //  commentRef.childByAutoId().setValue(postData)
        
       // commentRef.childByAutoId().setValue(comments)
    
        //commentRef.updateChildValues(comments)
       //  commentRef.updateChildValues(postData)
        
        
       // commentRef.comments.append(name,comment)
        //let postRef = FIRDatabase.database().reference().child(Const.PostPath).child(postData.id!) //これは特定できないはず
       // print(postRef)
        
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        
        
        
        
        // キーボードを閉じる
       // self.view.endEditing(true)
        
        
        // 全てのモーダルを閉じる
       
        UIApplication.shared.keyWindow?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    

    @IBAction func handleCancelButton(_ sender: Any) {
        
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
