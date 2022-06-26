! Created by kiyama on 5/31/22.

module functions_module
    implicit none
contains
    ! functions
    ! 式関数は現代ではdeprecated
    ! double precision なのは real(4) だと,n=20の時に精度が一番高くなってしまったため.
    double precision function f(x)
        double precision, intent(in) :: x
        ! 被積分関数
        f = 4.0 / (1.0 + x**2.0)
        ! こっち(0<x<2.0)はrealでも精度が上がった
        ! f = (4 - x**2)**0.5
    end function
end module

program kadai5
    ! module
    use functions_module
    ! 正確な円周率と比較するためにisoのモジュールを引っ張り出す
    use, intrinsic :: iso_fortran_env

    implicit none
    ! functions

    ! tmp
    ! 正確な円周率
    real(real64), parameter :: PI = 4.0_real64 * atan(1.0_real64);
    double precision:: a = 0.0, b = 1.0;
    integer :: i;

    ! run
    do i = 1, 5
        print *, simpton(f, a, b, i * 10), "(x=", i * 10, ")"
        ! 円周率との誤差
        print *, "誤差:", simpton(f, a, b, i * 10) - PI
    end do
    ! あまり精度が上がらないのでさらに増やして比較
    print *, simpton(f, a, b, 1000), "(x=", 1000, ")"
    print *, "誤差:", simpton(f, a, b, 1000) - PI

contains
    double precision function simpton(f, a, b, n)
        ! 仮引数の型(関数)
        interface
            double precision function f(x)
                double precision, intent(in) :: x
            end function
        end interface

        ! tmp
        double precision :: a, b ;
        double precision:: h
        double precision :: tmp;
        integer :: n, i ! n=2m

        ! run
        h = (b - a) / n
        ! f(a)=f(y_0)
        tmp = f(a)
        do i = 1, n - 1
            if (mod(i, 2)==0) then
                ! f(y_n)=f(y_2k)
                ! 偶数
                tmp = tmp + 2.0 * f(a + real(i) * h)
            else
                ! 奇数
                ! f(y_n)=f(y_2k-1)
                tmp = tmp + 4.0 * f(a + real(i) * h)
            end if
        end do
        ! f(y_n)=f(y_2m)=f(b)
        tmp = tmp + f(b)
        simpton = tmp * h / 3.0
    end function simpton

end program kadai5