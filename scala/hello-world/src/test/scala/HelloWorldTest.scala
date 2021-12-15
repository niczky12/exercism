import org.scalatest.flatspec.AnyFlatSpec

class HelloWorldTest extends AnyFlatSpec {
  "Hello world" should "print hello, world!" in {
    assert(HelloWorld.hello() == "Hello, World!")
  }

  // test("Say Hi!") {
  //   HelloWorld.hello() should be ("Hello, World!")
  // }
}
