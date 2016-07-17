//
//  LoginViewController.swift
//  Imagine
//
//  Created by Tejas Nikumbh on 7/16/16.
//  Copyright © 2016 Personal. All rights reserved.
//

import UIKit
import AVFoundation


class LoginViewController: UIViewController {
    @IBOutlet weak var appName: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var emailTextField: OPaddedTextField!
    @IBOutlet weak var signUpButtonBottomConstraint: NSLayoutConstraint!
    
    var audioPlayer: AVAudioPlayer!
    
    // MARK:- IB Actions
    @IBAction func signUpTapped(sender: UIButton)
    {
        let validEmail = OUtils.checkValidEmail(emailTextField.text!)
        if !validEmail { // Guard against invalid email address
            let dialogBox = OUtils.getDisplayDialogBox(message: "Please enter a valid Email Address")
            self.presentViewController(dialogBox, animated: true, completion: nil)
            return
        }
        // Start the next view controller in case the email is valid
        let homeViewController: HomeViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        homeViewController.modalTransitionStyle = .CrossDissolve
        self.presentViewController(homeViewController, animated: true, completion: nil)
    }
    
    // MARK:- View Lifecycle and other View Controller based methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupGestureRecognizers()
        setupObservers()
        playRainSound()
    }
    override func viewDidAppear(animated: Bool)
    {
        fadeInAppName()
    }
    override func viewWillDisappear(animated: Bool)
    {
        stopRainSound()
        removeObservers()
    }
    override func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return .LightContent
    }
    
    
    // MARK:- Setup Methods
    func setupGestureRecognizers()
    {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self,
                                                          action: #selector(LoginViewController.resignKeyboard(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    func setupObservers()
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(LoginViewController.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: self.view.window)
    }
    func removeObservers()
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: self.view.window)
        NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillHideNotification, object: self.view.window)
    }
    
    
    // MARK:- Selectors
    func keyboardWillHide(sender: NSNotification)
    {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        self.signUpButtonBottomConstraint.constant -= keyboardSize.height
        UIView.animateWithDuration(0.1, animations: { () -> Void in
            self.view.layoutIfNeeded()
        })
    }
    func keyboardWillShow(sender: NSNotification)
    {
        let userInfo: [NSObject : AnyObject] = sender.userInfo!
        let keyboardSize: CGSize = userInfo[UIKeyboardFrameBeginUserInfoKey]!.CGRectValue.size
        let offset: CGSize = userInfo[UIKeyboardFrameEndUserInfoKey]!.CGRectValue.size
        
        if keyboardSize.height == offset.height {
            self.signUpButtonBottomConstraint.constant += keyboardSize.height
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        } else {
            self.signUpButtonBottomConstraint.constant -= keyboardSize.height - offset.height
            UIView.animateWithDuration(0.1, animations: { () -> Void in
                self.view.layoutIfNeeded()
            })
        }
    }
    func resignKeyboard(gestureRecognizer: UITapGestureRecognizer? = nil)
    {
        view.endEditing(true)
    }
    
    
    // MARK:- App Effects
    func playRainSound()
    {
        guard let audioFilePath = NSBundle.mainBundle().pathForResource("rain", ofType: "mp3") else { return }
        let audioFileUrl = NSURL.fileURLWithPath(audioFilePath)
        do { audioPlayer = try AVAudioPlayer(contentsOfURL: audioFileUrl) } catch
        {
            print("Error: Sound File for rain not found")
            return
        }
        audioPlayer.play()
    }
    func stopRainSound()
    {
        audioPlayer.stop()
    }
    func fadeInAppName()
    {
        UIView.animateWithDuration(4, animations: {
            self.appName.alpha = 1.0
        }) { (Bool) in
            self.appName.hidden = false
        }
    }
    
    
}

