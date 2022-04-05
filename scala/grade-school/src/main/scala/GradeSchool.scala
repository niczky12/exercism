import scala.collection.immutable.SortedMap

class School {
  type Grade = Seq[String]
  type DB = Map[Int, Grade]
  private var _db: DB = Map()
  private val emptyGrade: Grade = Seq()

  def db: DB = _db
  def grade(gradeNum: Int): Grade = _db.getOrElse(gradeNum, emptyGrade)

  def add(name: String, gradeNum: Int) = {
    _db = db.updated(gradeNum, grade(gradeNum).appended(name))
  }

  def sorted: DB = SortedMap.from(_db) map { case (grade, students) =>
    (grade, students.sorted)
  }
}

object GradeSchool {
  def main(args: Array[String]) = println("hello world")
}
