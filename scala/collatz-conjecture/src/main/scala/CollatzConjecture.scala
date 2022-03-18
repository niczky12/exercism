object CollatzConjecture {
    def stepsIter(n: Int, i: Int): Int = {
        if (n == 1) i
        else if (n % 2 == 0) stepsIter(n / 2, i + 1)
        else stepsIter(3*n + 1, i + 1)
    }

    def steps(n: Int) = {
        if (n < 1) None
        else Some(stepsIter(n, 0))
    }
}