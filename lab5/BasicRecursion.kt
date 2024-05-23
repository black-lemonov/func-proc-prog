class BasicRecursion {

    /**
     * Находит максимум из трех чисел
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
     */
    fun factUp(n: Int): Int {
        return if (n == 1)
            1
        else factUp(n-1) * n
    }

    /**
     * Находит факториал рекурсией вниз
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
     */
    fun sumDigitsUp(n: Int): Int {
        return if (n == 0)
            0
        else sumDigitsUp(n/10) + n % 10
    }

    /**
     * Находит сумму цифр числа рекурсией вниз
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
     */
    tailrec fun applyToDigits(number: Int, func: (Int, Int)-> Int, accum: Int = 0): Int {
        return if (number == 0)
            accum
        else applyToDigits(number / 10, func, func(accum, number % 10))
    }

    fun sumDigits(n: Int): Int = applyToDigits(n, { a, b -> (a + b) }, 0)

    fun multDigits(n: Int): Int = applyToDigits(n, {  a, b -> (a * b) }, 1)

    fun maxDigit(n: Int): Int = applyToDigits(n / 10, { a, b -> if (a > b) a else b }, n % 10)

    fun minDigit(n: Int): Int = applyToDigits(n / 10, { a, b -> if (a < b) a else b }, n % 10)

    // мои задания

    
}
