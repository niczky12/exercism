object Bob {
  private def letters(xs: String): String = xs.filter(_.isLetter)

  private def hasLetter(xs: String) = xs.exists(_.isLetter)

  private def isAllCaps(xs: String) = letters(xs).forall(_.isUpper)
  
  private def isQuestion(xs: String) = xs.endsWith("?")

  private def isLoud(xs: String) = hasLetter(xs) && isAllCaps(xs)

  def response(statement: String) = statement.trim() match {
    case xs if xs.isEmpty() => "Fine. Be that way!"
    case xs if isQuestion(xs) =>
      if (isLoud(xs)) "Calm down, I know what I'm doing!" else "Sure."
    case xs if isLoud(xs) => "Whoa, chill out!"
    case _                     => "Whatever."
  }

}
