/*
Напишите программу, которая работает с рассмотренными типами данных с помощью изменяемых и неизменяемых переменных.

1) Создайте переменную firstName с типом String, которая ссылается на строку с вашим именем.
2) Создайте переменную lastName с типом String, которая ссылается на строку с вашей фамилией.
3) Создайте переменную height с типом Double, которая хранит ваш рост в метрах и изменяется.
4) Создайте переменную weight с типом Float, которая хранит ваш вес в килограммах.
5) Создайте переменную isChild с типом Boolean, которая хранит значение, указывающее, что вы ребёнок. Значение переменной
должно вычисляться исходя из значений переменных height и weight. Считайте, что человек является ребёнком, если рост
меньше 150 см или вес меньше 40 кг.
6) Создайте переменную info, которая хранит строку с информацией о вас. В строке должна быть вся информация, доступная
из переменных firstName, lastName, height, weight, isChild. Используйте для этого строковые шаблоны.
7) Выведите значение переменной info в консоль.
8) Измените значение переменной height после вывода информации из info.
9) Вновь вызовите вывод информации об info на экран, убедитесь, что в консоль вывелось обновлённое значение.
10) По желанию. Добейтесь, чтобы информация в переменной isChild обновилась.
11) По желанию. Добейтесь, чтобы информация на экране согласно п. 9 обновилась.
*/


fun main() {

    val firstName = "ilya"
    val lastName = "Yudakov"
    var height = 1.76
    val weight = 80f
    var isChild = height < 1.5 || weight < 40

    var info = """
        My name is $firstName $lastName
        I'm height is $height meters and weight $weight kilogramm
        I'm ${if (isChild) "child" else "adult"}
    """.trimIndent()
    println(info)

    height = 1.4

    isChild = height < 1.5 || weight < 40

    info = """
        My name is $firstName $lastName
        I'm height is $height meters and weight $weight kilogramm
        I'm ${if (isChild) "child" else "adult"}
    """.trimIndent()

    println(info)


}