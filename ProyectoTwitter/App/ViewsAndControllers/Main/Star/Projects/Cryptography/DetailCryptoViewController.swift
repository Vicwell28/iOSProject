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

}
//MARK: - public func
extension DetailCryptoViewController {
    
    

}
//MARK: - Private func
extension DetailCryptoViewController {
    private func algorithmToEncrypt() {
        
        if self.textContentView.text.isEmpty {
            NotificationBanner(title: "", subtitle: "Llenar los campos",  style: .danger).show()
            return
        }
        
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {

            let fileURL = dir.appendingPathComponent("file.txt")

            print("Este serai la url del archivo \(fileURL)")

            do {
                if let text = self.textContentView.text {
                    try text.write(to: fileURL, atomically: false, encoding: .utf8)
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
            NotificationBanner(title: "", subtitle: "Selec Archvio",  style: .danger).show()
            return
        }
        
        if let pass = self.passwordTextField.text, pass.isEmpty {
            NotificationBanner(title: "", subtitle: "Campo password es requerido",  style: .danger).show()
            return
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
