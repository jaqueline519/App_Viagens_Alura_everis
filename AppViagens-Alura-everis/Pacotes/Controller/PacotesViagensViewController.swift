//
//  PacotesViagensViewController.swift
//  AppViagens-Alura-everis
//
//  Created by Jaqueline Bittencourt Santos on 17/03/21.
//

import UIKit

class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate{
  
    
    
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    @IBOutlet weak var labelContadorPacotes: UILabel!
    
    @IBOutlet weak var colecaoPacotesViagens: UICollectionView!

    var listaComTodasViagens: Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var listaViagens:Array<PacoteViagem> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listaViagens = listaComTodasViagens
        colecaoPacotesViagens.dataSource = self
        colecaoPacotesViagens.delegate = self
        pesquisarViagens.delegate = self
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int ) -> Int {
        return self.listaViagens.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = listaViagens[indexPath.item]
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhes") as! DetalhesViagemViewController
        controller.pacoteSelecionado = pacote
        self.present(controller, animated: true, completion: nil    )
    }
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
    
    let pacoteAtual = listaViagens[indexPath.item]
    
    celulaPacote.labelTitulo.text = pacoteAtual.viagem.titulo
    celulaPacote.labelPreco.text = pacoteAtual.viagem.preco
    celulaPacote.labelQuantidadeDeDias.text = "\(pacoteAtual.viagem.quantidadeDeDias)"
    celulaPacote.imagemViagem.image = UIImage(named: pacoteAtual.viagem.caminhoDaImagem)
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
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        listaViagens = listaComTodasViagens
        if searchText != ""{
            let filtroListaViagem = NSPredicate(format: "titulo contains %@", searchText)
            let listaFiltrada: Array<PacoteViagem> = (listaViagens as NSArray).filtered(using: filtroListaViagem) as! Array
            listaViagens = listaFiltrada
        }
        self.labelContadorPacotes.text = self.atualizaContadorLabel()
        
        colecaoPacotesViagens.reloadData()
    }

    func atualizaContadorLabel() -> String {
        return listaViagens.count == 1 ? " 1 Pacote encontrado " : " \(listaViagens.count) pacotes encontrados "
    }
}
