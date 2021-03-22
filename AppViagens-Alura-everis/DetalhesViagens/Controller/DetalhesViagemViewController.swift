//
//  DetalhesViagemViewController.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 18/03/21.
//

import UIKit
import ObjectiveC

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let navigation = navigationController {
                   navigation.popViewController(animated: true)
               }
    }
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker().date
    }
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil) 
        
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
            self.labelDescricaoPacoteViagem.text = pacote.descricao
    }
    }
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        @objc func aumentarScroll(notification: Notification){
            self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        }
    
}
