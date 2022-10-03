//
//  DetailCryptoViewController.swift
//  ProyectoTwitter
//
//  Created by soliduSystem on 25/09/22.
//

import UIKit
import MobileCoreServices
import UniformTypeIdentifiers
import NotificationBannerSwift
import CryptoSwift

class DetailCryptoViewController: UIViewController {
    
    //MARK: - Override func
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Private Var / Let
    
    //MARK: - Public Var / Let
    
    //MARK: - @IBOutlet
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var textContentView: UITextView!
}



//MARK: - @IBAction
extension DetailCryptoViewController {
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func selectFileAction(_ sender: UIButton) {
        self.selectFile()
    }
    
    @IBAction func encryptAction(_ sender: UIButton) {
        self.algorithmToEncrypt()
    }
    
    @IBAction func decryptAction(_ sender: UIButton) {
        self.algorithToDecrypt()
    }
    
    @IBAction func passwordChangeAction(_ sender: UITextField) {
        self.validatePasswrod(sender)
    }
    
}
//MARK: - public func
extension DetailCryptoViewController {
    public func encryptMessage(message: String, encryptionKey: String, iv: String) -> String? {
        if let aes = try? AES(key: encryptionKey, iv: iv),
           let encrypted = try? aes.encrypt(Array<UInt8>(message.utf8)) {
            return encrypted.toHexString()
        }
        return nil
    }
    
    public func decryptMessage(encryptedMessage: String, encryptionKey: String, iv: String) -> String? {
        if let aes = try? AES(key: encryptionKey, iv: iv),
           let decrypted = try? aes.decrypt(Array<UInt8>(hex: encryptedMessage)) {
            return String(data: Data(decrypted), encoding: .utf8)
        }
        return nil
    }
}

//MARK: - Private func
extension DetailCryptoViewController {
    
    private func validatePasswrod(_ sender : UITextField){
        if let text = sender.text {
            print(text.count)
            if text.count == 16 {
                sender.superview!.borderColor = UIColor.black
                sender.superview!.borderWidth = 1
            } else {
                sender.superview!.borderColor = UIColor.red
                sender.superview!.borderWidth = 2
            }
        }
    }
    
    private func algorithmToEncrypt() {
        
        if let txt = self.passwordTextField.text, txt.isEmpty {
            self.passwordTextField.superview!.borderColor = UIColor.red
            self.passwordTextField.superview!.borderWidth = 2
            NotificationBanner(title: "", subtitle: "Password Es Resquerido",  style: .danger).show()
            return
        }
        
        if self.textContentView.text.isEmpty {
            NotificationBanner(title: "", subtitle: "Colocar Mensaje",  style: .danger).show()
            return
        }
        
        if self.passwordTextField.text!.count != 16 {
            self.passwordTextField.superview!.borderColor = UIColor.red
            self.passwordTextField.superview!.borderWidth = 2
            NotificationBanner(title: "", subtitle: "Password Invalido",  style: .danger).show()
            return
        }
        
        self.passwordTextField.superview!.borderColor = UIColor.black
        self.passwordTextField.superview!.borderWidth = 1

        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            
            let fileURL = dir.appendingPathComponent("file.txt")
            
            print("Este serai la url del archivo \(fileURL)")
            
            do {
                if let text = self.textContentView.text {
                    let encryptMessage = encryptMessage(message: text, encryptionKey: self.passwordTextField.text!, iv: "myivmyivmyivmyiv")
                    if let mesa = encryptMessage {
                        try mesa.write(to: fileURL, atomically: false, encoding: .utf8)
                    }
                }
            }
            catch {
                print("Error al momento de escribri en el documento")
            }
            
            do {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print("Texto: \(text2)")
            }
            catch {
                print("Error al querer leer el documento")
            }
            
            let textToShare = [ fileURL ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
            activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
            self.present(activityViewController, animated: true, completion: nil)
        } else {
            print("Que no encontro algo dice")
        }
        
        
        
    }
    
    private func algorithToDecrypt(){
        if self.textContentView.text.isEmpty {
            NotificationBanner(title: "", subtitle: "Seleccionar Archivo",  style: .danger).show()
            return
        }
        
        if let pass = self.passwordTextField.text, pass.isEmpty {
            NotificationBanner(title: "", subtitle: "Password Es Requerido",  style: .danger).show()
            return
        }
        
        if self.passwordTextField.text!.count != 16 {
            self.passwordTextField.superview!.borderColor = UIColor.red
            self.passwordTextField.superview!.borderWidth = 2
            NotificationBanner(title: "", subtitle: "Password Invalido",  style: .danger).show()
            return
        }
        
        self.passwordTextField.superview!.borderColor = UIColor.black
        self.passwordTextField.superview!.borderWidth = 1
        
        if let msj = self.textContentView.text {
            
            if let msj2 = decryptMessage(encryptedMessage: msj, encryptionKey: self.passwordTextField.text!, iv: "myivmyivmyivmyiv") {
                print("3")
                self.textContentView.text = msj2
            } else {
                print("1")
                if let pass = self.passwordTextField.text, !pass.isEmpty {
                    print("2")
                    NotificationBanner(title: "", subtitle: "Password Incorrecto. No Fue Posible Desencriptar El Mensaje",  style: .danger).show()
                    return
                }
            }
        }
    }
    
    private func selectFile() {
        let types = UTType.types(tag: "txt", tagClass: UTTagClass.filenameExtension, conformingTo: nil)
        let documentPickerController = UIDocumentPickerViewController(forOpeningContentTypes: types)
        documentPickerController.delegate = self
        self.present(documentPickerController, animated: true, completion: nil)
    }
    
}
//MARK: - Services
extension DetailCryptoViewController {
    
}
//MARK: - Other
extension DetailCryptoViewController :  UIDocumentPickerDelegate, UINavigationControllerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        print("url = \(url)")
        do {
            let _ = url.startAccessingSecurityScopedResource()
            
            let contenString = try String(contentsOf: url)
            
            self.textContentView.text = contenString
        }
        catch {
            print(error.localizedDescription)
        }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        dismiss(animated: true, completion: nil)
    }
}


//MARK: - Services
extension DetailCryptoViewController : UITextViewDelegate{
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
}

//MARK: - Services
extension DetailCryptoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
