#!/usr/bin/perl -w

# lat to cyr

while (<>)
{

# Converts the latin version of jack Rueter's Komi
# dictionary to utf-8.

# "*" is used to mark capital letters in the dictionary, 
# here the * is prefixed by \ since it is a special symbol
# in perl.

# Trigraphs

    s/*e2/Э/g ;
    s/\*e3//g ;
    s/\*i3//g ;
    s/\*i2//g ;
    s/\*s4/Ш/g ;
    s/\*s5/Щ/g ;
    s/\*z4/Ж/g ;
    s/\*c4/Ч/g ;
    s/\*a1/Я/g ;
    s/\*u1/Ю/g ;
    s/\*o1/Ё/g ;


# then capital digraphs

    s/\*a/А/g ;
    s/\*b/Б/g ;
    s/\*c/Ц/g ;
    s/\*d/Д/g ;
    s/\*e/Е/g ;
    s/\*f/Ф/g ;
    s/\*g/Г/g ;
    s/\*h/Ч/g ;
    s/\*i/И/g ;
    s/\*j/Й/g ;
    s/\*k/К/g ;
    s/\*l/Л/g ;
    s/\*m/М/g ;
    s/\*n/Н/g ;
    s/\*o/О/g ;
    s/\*p/П/g ;
    s/\*q//g ;
    s/\*r/Р/g ;
    s/\*s/\*С/g ;
    s/\*t/Т/g ;
    s/\*u/У/g ;
    s/\*v/В/g ;
    s/\*w//g ;
    s/\*x/Х/g ;
    s/\*y/Ы/g ;
    s/\*z/З/g ;

# Then other digraphs

    s/e3//g ;
    s/e/э/g ;
    s/i3/і/g ;
    s/i2//g ;
    s/s4/ш/g ;
    s/s/щ/g ;
    s/z4/ж/g ;
    s/c4/ч/g ;
    s/a1/я/g ;
    s/u1/ю/g ;
    s/o1/ё/g ;
    

# Then we take the singleton letters

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
    s/r/р/g ;
    s/s/с/g ;
    s/t/т/g ;
    s/u/у/g ;
    s/v/в/g ;
    s/w/ъ/g ;
    s/x//g ;
    s/y/ы/g ;
    s/z/з/g ;
    
    
# Then real capital letters, 
# although there are probably none.
    
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
    s/R/Р/g ;
    s/S/С/g ;
    s/T/Т/g ;
    s/U/У/g ;
    s/V/В/g ;
    s/W/Ъ/g ;
    s/X/Х/g ;
    s/Y/Ы/g ;
    s/Z/З/g ;
    
print ;    
}
    
    
    