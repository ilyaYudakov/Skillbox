/*
Я зашифровал некоторое сообщение. Алгоритм, который я использовал, выглядит так:

Разделить сообщение пополам.
Обработать первую половину сообщения следующим образом:
2.1. В исходном тексте заменить все символы о на символ 0 (ноль).
2.2. В получившемся тексте заменить каждый символ сообщения символом, стоящим на 3 правее от исходного (сдвиг каждого
 символа вправо на 3).
2.3. В получившемся тексте заменить все символы u на цифру 4.
2.4. В получившемся тексте заменить все символы s на цифру 5.
2.5. В получившемся тексте заменить каждый символ сообщения символом, стоящим на 1 левее от исходного (сдвиг каждого
 символа влево на 1).
Вторую половину сообщения обработать так:
3.1. Заменить пробелы на символ _
3.2. В получившемся тексте заменить каждый символ сообщения символом, стоящим на 4 правее от исходного (сдвиг каждого
 символа вправо на 4).
3.3. Развернуть получившуюся строку.
4. Соединить обе зашифрованные половины.


В результате работы алгоритма я получил строку: F2p)v"y233{0->c}ttelciFc

Напишите программу, которая будет расшифровывать сообщение и выводить исходное сообщение в консоль.

Для расшифровки текста напишите функции, которые будут проходить алгоритм в обратном направлении: например,
заменить все символы 5 на символ s — обратное действие для пункта 2.4 моего алгоритма.

1. Создайте функцию для расшифровки первой половины сообщения. Используйте для этого алгоритм, обратный данному.

2. Создайте функцию для расшифровки второй половины сообщения. Используйте для этого алгоритм, обратный данному.

3. По желанию. Создайте функцию высшего порядка shift(), с помощью которой можно осуществлять сдвиг всех символов
в строке. Функция должна:

принимать на вход строку и функцию преобразования текущего символа (параметр функционального типа);
возвращать изменённую строку.
Используйте эту функцию в функциях 1 и 2.
*/

fun main() {

    println(decodeStr("F2p)v\"y233{0->c}ttelciFc"))

}

fun decodeStr(str: String): String {
    val firstHalf = str.take(str.length / 2)
    val secondHalf = str.takeLast(str.length / 2)
    return "${decodeFirstHalf(firstHalf)}${decodeSecondHalf(secondHalf)}"
}

fun decodeFirstHalf(str: String): String {

    return str.shift(1)
        .replace('5', 's', false)
        .replace('4', 'u', false)
        .shift(-3)
        .replace('0', 'o', false)
}

fun decodeSecondHalf(str: String): String{
    return str.reversed()
        .shift(-4)
        .replace('_', ' ', false)
}

fun String.shift(offset: Int): String = this.map { it + offset }.joinToString ("")