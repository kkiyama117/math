program sample2_5
    implicit None
    real :: Z,Y,X
    integer :: N
    X = 1
    Y = 0
    do N = 1, 8
        ! N!
        X = N * X
        ! sigma
        Y = Y + 1/X
    end do
    Write (*, *) Y
end program sample2_5
