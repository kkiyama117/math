! Created by kiyama on 5/31/22.

module functions_module
    implicit none
contains
    ! functions
    ! 式関数は現代ではdeprecated
    ! 被積分関数
    real function f(x)
        real, intent(in) :: x
        f = 4 / (1 + x**2)
        !        f = sin(x) ** 2
    end function
end module

! 2x^3-3x^2-12x+5
program kadai5
    ! module
    use functions_module

    implicit none
    ! function
    ! tmp
    real :: a = 0.0, b = 1.0;
    ! run
    print *, simpton(f, a, b, 10)
    print *, simpton(f, a, b, 20)
    print *, simpton(f, a, b, 30)
    print *, simpton(f, a, b, 40)
    print *, simpton(f, a, b, 50)

contains
    real function simpton(f, a, b, n)
        ! 仮引数の型(関数)
        interface
            real function f(x)
                real, intent(in) :: x
            end function
        end interface

        ! tmp
        real :: a, b ;
        real :: h
        real :: tmp;
        integer :: n, i ! n=2m

        ! run
        h = (b - a) / n
        ! f(a)=f(y_0)
        tmp = f(a)
        do i = 1, n - 1
            if (mod(i, 2)==0) then
                ! f(y_n)=f(y_2k)
                ! 偶数
                tmp = tmp + 2 * f(a + real(i) * h)
            else
                ! 奇数
                ! f(y_n)=f(y_2k-1)
                tmp = tmp + 4 * f(a + real(i) * h)
            end if
        end do
        ! f(y_n)=f(y_2m)=f(b)
        tmp = tmp + f(b)
        simpton = tmp * h / 3
    end function simpton

end program kadai5