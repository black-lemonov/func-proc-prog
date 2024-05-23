class BasicRecursion {

    /**
     * Находит максимум из трех чисел
     * (Лаб. 5 задание 1)
     */
    fun max(x: Int, y: Int, z: Int): Int {
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
                max = max(max, copy % 10, 0)
            copy /= 10
        }
        return max
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

    fun main() {
        println(maxNotDivBy3(123456))
        println(maxNotDivBy3(3006))
        println(prodDigitsLoop(1234))
        println(countDivs(13))
        println(countDivs(26))
    }
}

fun main() {
    BasicRecursion().main()
}
