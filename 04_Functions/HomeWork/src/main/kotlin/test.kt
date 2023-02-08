//+<a{rrcjagDa,w//.ur%l.B

fun main() {

    println(decipherMain("F2p)v\"y233{0->c}ttelciFc"))

}


fun decipherMain(str: String): String {

    val strFirstPart = str.takeLast(str.length / 2)
    val strSecondPart = str.take(str.length / 2)

    return "${decipherFirstPart(strSecondPart)}${decipherSecondPart(strFirstPart)}"


}

fun decipherFirstPart(str: String): String {
    return str.shift1(1)
        .replace("5", "s", false)
        .replace("4", "u", false)
        .shift1(-3)
        .replace("0", "o", false)
}

fun decipherSecondPart(str: String): String {
    return str.reversed()
        .shift1(-4)
        .replace("_", " ", false)
}

fun String.shift1(offset: Int): String = this.map { letter -> letter + offset }.joinToString("")