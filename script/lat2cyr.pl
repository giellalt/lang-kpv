#!/usr/bin/perl -w

# lat to cyr

while (<>)
{

# Converts the latin version of jack Rueter's Komi
# dictionary to utf-8.

    s/a/а/g ;
    s/b/б/g ;
    s/c/ц/g ;
    s/d/д/g ;
    s/e/е/g ;
    s/f/ф/g ;
    s/g/г/g ;
    s/h/х/g ;
    s/i/и/g ;
    s/j/й/g ;
    s/k/к/g ;
    s/l/л/g ;
    s/m/м/g ;
    s/n/ч/g ;
    s/o/о/g ;
    s/p/п/g ;
    s/q//g ;
    s/r/р/g ;
    s/s/с/g ;
    s/t/т/g ;
    s/u/у/g ;
    s/v/в/g ;
    s/w//g ;
    s/x//g ;
    s/y/ы/g ;
    s/z/з/g ;
    s/e3//g ;
    s/i3/і/g ;
    s/i2//g ;
    s/s4/ш/g ;
    s/z4/ж/g ;
    s/c4/ч/g ;
    s/a1/я/g ;
    s/u1/ю/g ;
    s/o1/ё/g ;
    s/A/А/g ;
    s/B/Б/g ;
    s/C/Ц/g ;
    s/D/Д/g ;
    s/E/Е/g ;
    s/F/Ф/g ;
    s/G/Г/g ;
    s/H/Ч/g ;
    s/I/И/g ;
    s/J/Й/g ;
    s/K/К/g ;
    s/L/Л/g ;
    s/M/М/g ;
    s/N/Н/g ;
    s/O/О/g ;
    s/P/П/g ;
    s/Q//g ;
    s/R/Р/g ;
    s/S/С/g ;
    s/T/Т/g ;
    s/U/У/g ;
    s/V/В/g ;
    s/W//g ;
    s/X/Х/g ;
    s/Y/Ы/g ;
    s/Z/З/g ;
    s///g ;
    s/E3//g ;
    s/I3//g ;
    s/I2//g ;
    s/S4/Ш/g ;
    s/Z4/Ж/g ;
    s/C4/Ч/g ;
    s/A1/Я/g ;
    s/U1/Ю/g ;
    s/O1/Ё/g ;
    
print ;    
}
    
    
    