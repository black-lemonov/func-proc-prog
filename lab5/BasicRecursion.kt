import kotlin.reflect.KFunction

class BasicRecursion {

    /**
     * Находит максимум из трех чисел
     * (Лаб. 5 задание 1)
     */
    fun max(x: Int, y: Int, z: Int = 0): Int {
        if (x >= y) {
            if (x >= z)
                return x
            return z
        } else {
            if (y >= z)
                return y
            return z
        }
    }

    /**
     * Находит факториал рекурсией вверх
     * (Лаб. 5 задание 1)
     */
    fun factUp(n: Int): Int {
        return if (n == 1)
            1
        else factUp(n-1) * n
    }

    /**
     * Находит факториал рекурсией вниз
     * (Лаб. 5 задание 1)
     */
    fun factDown(n: Int): Int {

        tailrec fun factDown(n: Int, accum: Int): Int {
            return if (n == 0)
                accum
            else factDown(n - 1, accum * n)
        }

        return factDown(n, 1)
    }

    /**
     * Находит сумму цифр числа рекурсией вверх
     * (Лаб. 5 задание 1)
     */
    fun sumDigitsUp(n: Int): Int {
        return if (n == 0)
            0
        else sumDigitsUp(n/10) + n % 10
    }

    /**
     * Находит сумму цифр числа рекурсией вниз
     * (Лаб. 5 задание 1)
     */
    fun sumDigitsDown(n: Int): Int {
        tailrec fun sum (n: Int, accum: Int): Int {
            return if (n == 0)
                accum
            else sum(n/10, n % 10 + accum)
        }
        return sum(n, 0)
    }

    /**
     * Функция высшего порядка
     * принимает boolean
     * если true возвращает функцию sumDigitsUp
     * иначе функцию factUp
     * (Лаб. 5 задание 1)
     */
    fun getFunc(isSum: Boolean): (Int) -> Int {
        return if (isSum)
            ::sumDigitsUp
        else
            ::factUp
    }

    /**
     * Функция высшего порядка
     * принимает число и функцию от 2-х аргументов
     * возвращает результат применения функции к цифрам числа
     * (Лаб. 5 задание 1)
     */
    tailrec fun applyToDigits(number: Int, func: (Int, Int)-> Int, accum: Int = 0): Int {
        return if (number == 0)
            accum
        else applyToDigits(number / 10, func, func(accum, number % 10))
    }

    fun sumDigits(n: Int): Int = applyToDigits(n, { a, b -> (a + b) }, 0)

    fun prodDigits(n: Int): Int = applyToDigits(n, {  a, b -> (a * b) }, 1)

    fun maxDigit(n: Int): Int = applyToDigits(n / 10, { a, b -> if (a > b) a else b }, n % 10)

    fun minDigit(n: Int): Int = applyToDigits(n / 10, { a, b -> if (a < b) a else b }, n % 10)

    /**
     * Чистая функция
     * считает произведение цифр числа
     * (Лаб. 5 задание 2.1)
     */
    fun prodDigitsLoop(n: Int): Int {
        var copy = n
        var res = 1
        while (copy != 0) {
            res *= copy % 10
            copy /= 10
        }
        return res
    }

    /**
     * Считает произведение цифр числа рекурсией вверх
     * (Лаб. 5 задание 3.1)
     */
    fun prodDigitsUp(n: Int): Int {
        return if (n == 0)
            1
        else n % 10 * prodDigitsUp(n / 10)
    }

    /**
     * Считает произведение цифр числа рекурсией вниз
     * (Лаб. 5 задание 3.1)
     */
    fun prodDigitsDown(n: Int): Int {
        tailrec fun prod(n: Int, res: Int): Int {
            return if (n == 0)
                res
            else prod(n / 10, n % 10 * res)
        }
        return prod(n, 1)
    }

    /**
     * Чистая функция
     * находит в числе макс. цифру, не делящуюся на 3
     * если такой цифры нет, возвращает 0
     * (Лаб. 5 задание 2.2)
     */
    fun maxNotDivBy3(n: Int): Int {
        var copy = n
        var max = 0
        while (copy != 0) {
            if (copy % 10 % 3 != 0)
                max = max(max, copy % 10)
            copy /= 10
        }
        return max
    }

    /**
     * Находит макс. цифру числа не делящуюся на 3
     * рекурсией вверх
     * (Лаб. 5 задание 3.2)
     */
    fun maxNotDivBy3Up(n: Int): Int {
        if (n == 0)
            return 0
        if (n % 10 % 3 != 0)
            return max(n % 10, maxNotDivBy3(n / 10))
        return maxNotDivBy3(n / 10)
    }

    /**
     * Находит макс. цифру числа не делящуюся на 3
     * рекурсией вниз
     * (Лаб. 5 задание 3.2)
     */
    fun maxNotDivBy3Down(n: Int): Int {
        tailrec fun inner(n: Int, res: Int ): Int {
            if (n == 0)
                return res
            if (n % 10 % 3 != 0)
                return inner(n / 10, max(res, n % 10))
            return inner(n / 10, res)
        }
        return inner(n, 0)
    }

    /**
     * Чистая функция
     * считает кол-во делителей числа
     * (Лаб. 5 задание 2.3)
     */
    fun countDivs(n: Int): Int {
        var count = 0
        for (d in 1..n)
            if (n % d == 0) count ++;
        return count
    }

    /**
     * Считает кол-во делителей числа
     * рекурсией вверх
     * (Лаб. 5 задание 3.3)
     */
    fun countDivsUp(n: Int, d: Int = 1): Int {
        if (d > n)
            return 0
        if (n % d == 0)
            return 1 + countDivsUp(n, d + 1)
        return countDivsUp(n, d + 1)
    }

    /**
     * Считает кол-во делителей числа
     * рекурсией вниз
     * (Лаб. 5 задание 3.3)
     */
    fun countDivsDown(n: Int, d: Int = 1): Int {
        fun inner(n: Int, d: Int, count: Int): Int {
            if (d > n)
                return count
            if (n % d == 0)
                return inner(n, d + 1, count + 1)
            return inner(n, d + 1, count)
        }
        return inner(n, d, 0)
    }

    /**
     * Принимает функции в качестве аргумента
     * может считать делители, искать макс. цифру в числе и находить произведение цифр числа
     * (Лаб. 5 задание 4)
     */
    fun funcWrapper(vararg funcs: (Int) -> Int) {
         for (f in funcs) {
             println("Вызов функции: $f")
             println("Результат: " + f(readln().toInt()))
         }
    }

    /**
     * Возвращает функцию по имени
     */
    fun getFuncByName(name: String): (Int)->Int? {
        val funcs = mapOf(
            "prodDigitsLoop" to ::prodDigitsLoop,
            "prodDigitsUp" to ::prodDigitsUp,
            "prodDigitsDown" to ::prodDigitsDown,
            "maxNotDivBy3" to ::maxNotDivBy3,
            "maxNotDivBy3Up" to ::maxNotDivBy3Up,
            "maxNotDivBy3Down" to ::maxNotDivBy3Down,
            "countDivs" to ::countDivs,
            "countDivsUp" to ::countDivsUp,
            "countDivsDown" to ::countDivsDown
        )

        return {n: Int -> funcs[name]?.call(n)}
    }



    fun main() {

        val prod = getFuncByName("prodDigitsUp")
        val count = getFuncByName("countDivs")
        val maxD = getFuncByName("maxNotDivBy3")
        println(prod(1234))
        println(count(720))
        println(maxD(1237))

        println(maxNotDivBy3(123456))
        println(maxNotDivBy3Up(123456))
        println(maxNotDivBy3Down(123456))

        println(prodDigitsLoop(1234))
        println(prodDigitsUp(1234))
        println(prodDigitsDown(1234))

        println(countDivs(720))
        println(countDivsUp(720))
        println(countDivsDown(720))

        funcWrapper(::maxNotDivBy3Up, ::maxNotDivBy3Down, ::maxNotDivBy3)
        funcWrapper(::prodDigitsLoop, ::prodDigitsDown, ::prodDigitsUp)
        funcWrapper(::countDivs, ::countDivsDown, ::countDivsUp)
    }
}

fun main() {
    BasicRecursion().main()
}
