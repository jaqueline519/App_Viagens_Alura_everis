//
//  DetalhesViagemViewController.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 18/03/21.
//

import UIKit


class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!

    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    @IBOutlet weak var textFieldData: UITextField!

    @IBAction func botaoFinalizarCompra(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)
    }
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil) 
        
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.layer.borderWidth = 0.2
            self.imagemPacoteViagem.layer.cornerRadius = 8
            self.imagemPacoteViagem.clipsToBounds = true
            self.imagemPacoteViagem.layer.masksToBounds = true
            self.imagemPacoteViagem.contentMode = .scaleAspectFill
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
    @objc func exibeDataTextField(sender: UIDatePicker) {
            let formatador = DateFormatter()
            formatador.dateFormat = "dd MM yyyy"
            self.textFieldData.text = formatador.string(from: sender.date)
        }

    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        if let navigation = navigationController {
                   navigation.popViewController(animated: true)
               }
    }
    @IBAction func textFieldEntrouFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
                datePickerView.datePickerMode = .date
                sender.inputView = datePickerView
                datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
            }

}
