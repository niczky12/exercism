object SpaceAge {

    object OrbitalYears extends Enumeration {
        type OrbitalYears = Double
        val MERCURY = 0.2408467
        val VENUS = 0.61519726
        val EARTH = 1.0
        val MARS = 1.8808158
        val JUPITER = 11.862615
        val SATURN = 29.447498
        val URANUS = 84.016846
        val NEPTUNE = 164.79132
    }

    val EarthSecondsPerYear: Double = 31557600

    def EarthYears(seconds: Double) = seconds / EarthSecondsPerYear

    def onPlanet(seconds: Double, orbitLength: Double) = EarthYears(seconds) / orbitLength
    
    def onEarth(seconds: Double) = onPlanet(seconds, OrbitalYears.EARTH)
    def onMercury(seconds: Double) = onPlanet(seconds, OrbitalYears.MERCURY)
    def onVenus(seconds: Double) = onPlanet(seconds, OrbitalYears.VENUS)
    def onMars(seconds: Double) = onPlanet(seconds, OrbitalYears.MARS)
    def onJupiter(seconds: Double) = onPlanet(seconds, OrbitalYears.JUPITER)
    def onSaturn(seconds: Double) = onPlanet(seconds, OrbitalYears.SATURN)
    def onUranus(seconds: Double) = onPlanet(seconds, OrbitalYears.URANUS)
    def onNeptune(seconds: Double) = onPlanet(seconds, OrbitalYears.NEPTUNE)
}