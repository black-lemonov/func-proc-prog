import org.junit.jupiter.api.Test
import org.junit.jupiter.api.Assertions.*

class BasicRecursionKtTest {

    @Test fun max() {
        val main = BasicRecursion()
        assertEquals(3, main.max(1,2,3))
        assertEquals(3, main.max(1,3,2))
        assertEquals(3, main.max(3,2,1))
        assertEquals(3, main.max(3,2,3))
        assertEquals(3, main.max(1,3,3))
        assertEquals(3, main.max(3,3,2))
    }

    @Test fun factUp() {
        val main = BasicRecursion()
        assertEquals(2, main.factUp(2))
        assertEquals(6, main.factUp(3))
        assertEquals(24, main.factUp(4))
        assertEquals(120, main.factUp(5))
        assertEquals(720, main.factUp(6))
    }

    @Test fun factDown() {
        val main = BasicRecursion()
        assertEquals(2, main.factDown(2))
        assertEquals(6, main.factDown(3))
        assertEquals(24, main.factDown(4))
        assertEquals(120, main.factDown(5))
        assertEquals(720, main.factDown(6))
    }

    @Test fun sumDigitsUp() {
        val main = BasicRecursion();
        assertEquals(5, main.sumDigitsUp(11111))
        assertEquals(23, main.sumDigitsUp(788))
        assertEquals(21, main.sumDigitsUp(1488))
        assertEquals(6, main.sumDigitsUp(420))
        assertEquals(8, main.sumDigitsUp(404))
    }

    @Test fun sumDigitsDown() {
        val main = BasicRecursion();
        assertEquals(5, main.sumDigitsDown(11111))
        assertEquals(23, main.sumDigitsDown(788))
        assertEquals(21, main.sumDigitsDown(1488))
        assertEquals(6, main.sumDigitsDown(420))
        assertEquals(8, main.sumDigitsDown(404))
    }

    @Test fun sumDigits() {
        val main = BasicRecursion();
        assertEquals(5, main.sumDigits(11111))
        assertEquals(23, main.sumDigits(788))
        assertEquals(21, main.sumDigits(1488))
        assertEquals(6, main.sumDigits(420))
        assertEquals(8, main.sumDigits(404))
    }

    @Test fun multDigits() {
        val main = BasicRecursion();
        assertEquals(1, main.multDigits(11111))
        assertEquals(56, main.multDigits(781))
        assertEquals(256, main.multDigits(1488))
        assertEquals(0, main.multDigits(420))
        assertEquals(16, main.multDigits(414))
    }

    @Test fun minDigit() {
        val main = BasicRecursion();
        assertEquals(1, main.minDigit(11111))
        assertEquals(1, main.minDigit(781))
        assertEquals(1, main.minDigit(1488))
        assertEquals(0, main.minDigit(420))
        assertEquals(1, main.minDigit(414))
    }

    @Test fun maxDigit() {
        val main = BasicRecursion();
        assertEquals(1, main.maxDigit(11111))
        assertEquals(8, main.maxDigit(781))
        assertEquals(8, main.maxDigit(1488))
        assertEquals(4, main.maxDigit(420))
        assertEquals(4, main.maxDigit(414))
    }

    @Test fun getFunc() {
        val main = BasicRecursion()
        assertEquals(5, main.getFunc(true)(11111))
        assertEquals(23, main.getFunc(true)(788))
        assertEquals(21, main.getFunc(true)(1488))
        assertEquals(6, main.getFunc(true)(420))
        assertEquals(8, main.getFunc(true)(404))
        assertEquals(2, main.getFunc(false)(2))
        assertEquals(6, main.getFunc(false)(3))
        assertEquals(24, main.getFunc(false)(4))
        assertEquals(120, main.getFunc(false)(5))
        assertEquals(720, main.getFunc(false)(6))
    }
}