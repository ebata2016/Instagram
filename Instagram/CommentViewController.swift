//
//  CommentViewController.swift
//  Instagram
//
//  Created by Masamichi Ebata on 2016/06/04.
//  Copyright © 2016年 masamichi.ebata. All rights reserved.
//

import UIKit
import Firebase

class CommentViewController: UIViewController {
    
    @IBOutlet weak var commentText: UITextView!
    
    var postData:PostData!
    var firebaseRef:Firebase!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleAddButton(sender: AnyObject) {
        // NSUserDfaultsから表示名を取得する
        let ud = NSUserDefaults.standardUserDefaults()
        let name = ud.objectForKey(CommonConst.DisplayNameKey) as! String
        let currentComment = postData.comment
        let newComment = currentComment! + "\(name) : \(commentText.text!)\n"
        
        //
//        let postRef = Firebase(url: CommonConst.FirebaseURL).childByAppendingPath(CommonConst.PostPATH)
//        captionLabel.text = "\(postData!.name!) : \(postData!.caption!)"

        let childPathString = "\(CommonConst.PostPATH)/\(postData.id!)"
        let postRef = Firebase(url: CommonConst.FirebaseURL).childByAppendingPath(childPathString)
        
        // 辞書を作成してFirebaseに保存する
        let updateData = ["comment": newComment]
        postRef.updateChildValues(updateData)

        dismissViewControllerAnimated(true, completion: nil)
    }

    
    @IBAction func handleCancelButton(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
