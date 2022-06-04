! Created by kiyama on 5/31/22.

! 2x^3-3x^2-12x+5
program kadai5
    ! module
    implicit none
    ! function
    ! tmp
    real :: r_newton(2), r_nibun(2);

    ! run
    print *, simpton()
contains

    ! function
    real function simpton()
        ! tmp
        real :: a = 0.0, b = 1.0;
        integer :: m = 5
        real :: h
        h = (b - a) / m
        simpton = h

    end function simpton

end program kadai5