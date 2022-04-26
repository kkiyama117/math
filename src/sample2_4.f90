program sample2_4
    implicit None
    REAL :: X, Y, Z
    write (*, *) 'X='
    read(*, *) X

    Y=(X*2+4)*X-5
    Z=2*X**2+4*X-5

    write (*, *) 'Answer1 =', Y
    write (*, *) 'Answer2 =', Z
end program sample2_4