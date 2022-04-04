import scala.collection.immutable.SortedMap

class School {
    type Grade = Seq[String]
    type DB = Map[Int, Grade]
    private var _db: DB = Map()
    private val emptyGrade: Seq[String] = Seq()

    def db(): DB = _db
    def grade(gradeNum: Int): Grade = _db.getOrElse(gradeNum, emptyGrade)

    def add(name: String, gradeNum: Int) = {
        val thisGrade = grade(gradeNum).appended(name)
        _db = _db + (gradeNum -> thisGrade)
    }

  def sorted: DB = SortedMap.from(_db) map { case (grade, students) => (grade, students.sorted) }
}
