//
//  TableViewCell.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 16/03/21.
//

import UIKit

class TableViewCell: UITableViewCell{
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelQuantidaDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func configuraCelula (viagem: Viagem){
        
        
        labelTitulo.text = viagem.titulo
        labelQuantidaDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$\(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        imagemViagem.layer.borderWidth = 0.2
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.clipsToBounds = true
        imagemViagem.layer.masksToBounds = true
        imagemViagem.contentMode = .scaleAspectFill
    }
    
}
