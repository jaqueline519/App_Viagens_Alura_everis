//
//  PacoteViagemCollectionViewCell.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 17/03/21.
//

import UIKit


class PacoteViagemCollectionViewCell: UICollectionViewCell{
    
    @IBOutlet weak var imagemViagem: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelQuantidadeDeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    
    func configuraCell(pacoteViagem: PacoteViagem){
        
        labelTitulo.text = pacoteViagem.viagem.titulo
        labelPreco.text = pacoteViagem.viagem.preco
     labelQuantidadeDeDias.text = "\(pacoteViagem.viagem.quantidadeDeDias)"
     imagemViagem.image = UIImage(named: pacoteViagem.viagem.caminhoDaImagem)
       
        
        
        layer.borderWidth = 0.2
        layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 85.0/255.0).cgColor
        layer.cornerRadius = 8
        imagemViagem.clipsToBounds = true
        imagemViagem.layer.masksToBounds = true
        imagemViagem.contentMode = .scaleAspectFill
        
        
    }
    
}
