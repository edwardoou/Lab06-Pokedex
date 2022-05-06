//
//  PokeDetailViewController.swift
//  ProjectMVVM
//
//  Created by MAC45 on 28/04/22.
//

import UIKit

class PokeDetailViewController: UIViewController {

    var url: String = ""
    var pokemon: PokeDetail? = nil
    
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblNamePokemon: UILabel!
    @IBOutlet weak var imagePokemon: UIImageView!
    let pokeViewModel: PokeViewModel = PokeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task {
                await setUpView()
            }
        }
                
        func setUpView() async {
            await pokeViewModel.getPokeDetail(url: url)
            pokemon = pokeViewModel.pokemon
            setUpPokeData()
        }
    
        func setUpPokeData() {
            lblType.text = pokemon?.types[0].type.name.capitalized ?? ""
            view.backgroundColor = PokeTypes.types[(pokemon?.types[0].type.name)!]
            lblNamePokemon.text = pokemon?.name.capitalized
            imagePokemon.image = HelperImage.setImageFromUrl(url: (pokemon?.sprites.other.officialArtwork.front_default)!)
    
        }
}
