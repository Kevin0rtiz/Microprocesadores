; Programa en ensamblador para el Z80
; Suma de dos números en hexadecimal, conversión a BCD y almacenamiento del resultado
; en los registros A (centenas), H (decenas) y L (unidades)

    org 0000h   ; El programa comienza en la dirección 0000h

Inicio:
    ; Convertir y sumar los valores en B y C
    ld a, b       ; Cargar el valor de B en A
    add a, c      ; Sumar directamente el valor de C (en hexadecimal)
    
    ; Ajustar el resultado para que sea un valor BCD
    daa           ; Decimal Adjust Accumulator para convertir la suma a BCD
    
    ; Descomponer el resultado en centenas, decenas y unidades
    ld h, a       ; Guardar el valor total en H
    ld l, a       ; Guardar el valor total en L (usaremos L para extraer las unidades)
    
    rrca          ; Rotar el acumulador para desplazar las centenas
    rrca
    rrca          ; Después de tres rotaciones, A tiene las centenas en la parte baja
    and 0Fh       ; Máscara para dejar solo las centenas
    ld h, a       ; Guardar las centenas en H
    
    ld a, l       ; Recuperar el valor total original
    and 0Fh       ; Máscara para dejar solo las unidades
    ld l, a       ; Guardar las unidades en L
    
    ; Termina el programa
Fin:
    jp Fin        ; Bucle infinito para detener el programa

end

