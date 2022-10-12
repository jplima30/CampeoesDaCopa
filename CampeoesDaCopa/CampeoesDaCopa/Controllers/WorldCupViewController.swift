import UIKit

class WorldCupViewController: UIViewController {

    var worldCup: WorldCup!
    
    @IBOutlet weak var ImageViewWinner: UIImageView!
    @IBOutlet weak var imageViewVice: UIImageView!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var labelWinner: UILabel!
    @IBOutlet weak var labelVice: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "WorldCup \(worldCup.year)"
        ImageViewWinner.image = UIImage(named:"\(worldCup.winner).png")
        imageViewVice.image = UIImage(named:"\(worldCup.vice).png")
        labelWinner.text = worldCup.winner
        labelVice.text = worldCup.vice
        labelScore.text = "\(worldCup.winnerScore) * \(worldCup.viceScore)"
    }
}

extension WorldCupViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return worldCup.matches.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let games = worldCup.matches[section].games
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GamesTableViewCell
        
        let match = worldCup.matches[indexPath.section]
        let game = match.games[indexPath.row]
        
        cell.prepare(with: game)
        
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let match = worldCup.matches[section]
        return match.stage
    }
    
}

extension WorldCupViewController: UITableViewDelegate {
    
}
