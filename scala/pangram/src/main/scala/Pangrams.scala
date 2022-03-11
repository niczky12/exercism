object Pangrams {
  def isPangram(input: String): Boolean = {
      val all_chars = Range('a', 'z').toSet
      val input_chars = input.toLowerCase().map(i => i.toInt).toSet
      all_chars.diff(input_chars).isEmpty
  }
}
