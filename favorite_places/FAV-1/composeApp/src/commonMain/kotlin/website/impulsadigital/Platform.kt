package website.impulsadigital

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform