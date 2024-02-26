//
//  ViewController.swift
//  Apple Pie
//
//  Created by Gabriela Medeiros da Silva on 18/08/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var correctWordsLaabel: UILabel!
    @IBOutlet weak var treeImage: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    
    let incorrectMovesAllowed = 7
    
    var words = [
        "Abacaxi",
        "Janela",
        "Correr",
        "Felicidade",
        "Livro",
        "Girassol",
        "Computador",
        "Chocolate",
        "Montanha",
        "Avião",
        "Oceano",
        "Caneta",
        "Guitarra",
        "Aventura",
        "Risada"
      ]
    var totalWins = 0 {
        didSet {
            startNewRound()
        }
    }
    
    var totalLosses = 0 {
        didSet {
            startNewRound()
        }
    }
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewRound()
    }
    
    func startNewRound(){
        if(!words.isEmpty){
            let newWord = words.removeFirst()
            currentGame = Game(newWord.lowercased(), incorrectMovesAllowed)
            changeAllButton(active: true)
            updateUi()
        } else {
            changeAllButton(active: false)
        }

    }
    
    func changeAllButton(active: Bool){
        for button in letterButtons {
            button.isEnabled = active
        }
    }
    
    func updateUi(){
        correctWordsLaabel.text = "Ganhou: \(totalWins), Perdeu: \(totalLosses)"
        treeImage.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        scoreLabel.text = currentGame.currentStateWord.joined(separator: " ")
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.currentStateWord.joined() == currentGame.word {
            totalWins += 1
        } else {
            updateUi()
        }
    }

    @IBAction func onClickedLetterButtons(_ sender: UIButton) {
        sender.isEnabled = false
        currentGame.playerGuessed(letter: Character(sender.titleLabel!.text!.lowercased()))
        updateGameState()
    }
    
}

