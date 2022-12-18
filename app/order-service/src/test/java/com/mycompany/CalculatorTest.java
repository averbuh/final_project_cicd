package com.mycompany;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertEquals;

import org.junit.Test;

/**
 * Unit test for simple App.
 */
public class CalculatorTest 
{

    @Test
    public void shouldAnswerWithTrue()
    {
        assertTrue( true );
    }

    @Test
    void AddTwoNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(1,1);
        assertEquals(2, result);
    }

    @Test
    void AddNegativeNumbers() {
        Calculator calc = new Calculator();
        int result = calc.add(-1,-1);
        assertEquals(-2, result);
    }

    @Test
    void AddZeroToANumber() {
        Calculator calc = new Calculator();
        int result = calc.add(1,0);
        assertEquals(1, result);
    }
}
