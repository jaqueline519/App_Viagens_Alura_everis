//
//  DetalhesViagemViewController.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 18/03/21.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    
    
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    var pacoteSelecionado: PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
