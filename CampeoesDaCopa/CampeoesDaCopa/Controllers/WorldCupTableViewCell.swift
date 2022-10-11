
import UIKit

class WorldCupTableViewCell: UITableViewCell {

    @IBOutlet weak var labelYear: UILabel!
    @IBOutlet weak var imageViewWinner: UIImageView!
    @IBOutlet weak var imageViewVice: UIImageView!
    @IBOutlet weak var labelWinnner: UILabel!
    @IBOutlet weak var labelVice: UILabel!
    @IBOutlet weak var labelWinnerScore: UILabel!
    @IBOutlet weak var labelViceScore: UILabel!
    @IBOutlet weak var labelCountry: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    func prepare(with cup: WorldCup) {
        labelYear.text = "\(cup.year)"
        imageViewWinner.image = UIImage(named: cup.winner)
        imageViewVice.image = UIImage(named: cup.vice)
        labelWinnner.text = cup.winner
        labelVice.text = cup.vice
        labelCountry.text = cup.country
        labelWinnerScore.text = cup.winnerScore
        labelViceScore.text = cup.viceScore
        
    }
    

}
