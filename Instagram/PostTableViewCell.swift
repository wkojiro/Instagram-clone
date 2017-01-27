//
//  PostTableViewCell.swift
//  Instagram
//
//  Created by Kojiro Wakabayashi on 2017/01/25.
//  Copyright © 2017年 wkojiro. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell,ModalViewControllerDelegate {
    internal func modalDidFinished(modalText: String) {
        print("Internal func")
    }

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
//    func setCommentData(commentData: CommentData){
     //   self.commentLabel.text = "\(commentData.name!) : \(commentData.comment!)"
  //      self.commentLabel.text = "ここにコメントくるで"
    //}
    func setPostData(postData: PostData){
        self.postImageView.image = postData.image
        
        self.captionLabel.text = "\(postData.name!) : \(postData.caption!)"
        let likeNumber = postData.likes.count
        likeLabel.text = "\(likeNumber)"
        
   //     if(postData.comments.isEmpty){
    //    self.commentLabel.text = ""
      //  }
        //else{
         let count = postData.comments.count
         print(count)
            var allComments = ""
            for i in 0..<count{
                allComments = allComments + "\(postData.comments[i])" + "\n"
            }
            self.commentLabel.text = allComments
        //}
        
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        let dateString:String = formatter.string(from: postData.date! as Date)
        self.dateLabel.text = dateString
        
        if postData.isLiked {
            let buttonImage = UIImage(named: "like_exist")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        } else {
            let buttonImage = UIImage(named: "like_none")
            self.likeButton.setImage(buttonImage, for: UIControlState.normal)
        }
        
        
    }
    
    
    
    
}
