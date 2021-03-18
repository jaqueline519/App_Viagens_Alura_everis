//
//  PacotesViagensViewController.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 17/03/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!
    let listaViagens: Array<Viagem> = ViagemDAO().retornaTodasAsViagens()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int {
        return self.listaViagens.count
    }

func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
    
    let viagemAtual = listaViagens[indexPath.item]
    
    celulaPacote.labelTitulo.text = viagemAtual.titulo
    celulaPacote.labelPreco.text = viagemAtual.preco
    celulaPacote.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias)"
    celulaPacote.imagemViagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
    celulaPacote.layer.borderWidth = 0.2
    celulaPacote.layer.borderColor = UIColor(red: 85.0/255.0, green: 85.0/255.0, blue: 85.0/255.0, alpha: 85.0/255.0).cgColor
    celulaPacote.layer.cornerRadius = 8
    
    celulaPacote.imagemViagem.clipsToBounds = true
    celulaPacote.imagemViagem.layer.masksToBounds = true
    celulaPacote.imagemViagem.contentMode = .scaleAspectFill
    
    return celulaPacote
}

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let larguraCelula = (collectionView.bounds.width / 2) - 8

        return CGSize(width: larguraCelula, height: larguraCelula)

    }

}
