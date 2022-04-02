object Hamming {
    def distance(s1: String, s2: String): Option[Int] = {
        if (s1.length == s2.length)
            Some((s1 zip s2).map({case (a, b) => if (a != b) 1 else 0}).sum)
        else None
    }
}