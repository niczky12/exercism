object Etl {
    def transform(oldSystem: Map[Int, Seq[String]]) = {
        for {
            (score, letters) <- oldSystem
            letter <- letters
        } yield letter.toLowerCase -> score
    }
}