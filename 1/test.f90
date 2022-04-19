    program test
        implicit None
        real :: A,B,WA,SA,SEKI, SHOU

        write (*, *) 'A,B='
        read (*, *) A,B
        WA = A+B
        SA = A-B
        SEKI =  A * B
        SHOU = A / B
        write (*, *) 'A+B=', WA
        write (*, *) 'A-B=', SA
        write (*, *) 'A*B=', SEKI
        write (*, *) 'A/B=', SHOU
        stop
    end program test