! Created by kiyama on 5/31/22.

! 2x^3-3x^2-12x+5
module m_base
    implicit none
contains
    ! 文関数は現在のfortranでは非推奨なので
    real function f(x)
        real x
        f = 2 * (x**3) - 3 * (x**2) - 12 * x + 5
    end function f
    real function df(x)
        real x
        df = 6 * (x**2) - 6 * x - 12
    end function df
end module m_base

module m_newton
    use m_base
    implicit none
contains
    function newton(eps)
        real, intent(in) :: eps
        real :: newton(2)
        ! tmp
        real :: x = 1.5
        ! 比較用
        integer :: cnt = 0
        do
            cnt = cnt + 1
            x = x - f(x) / df(x)
            if(abs(f(x))<eps) then
                exit
            end if
        end do
        newton = [real(cnt), x]
    end function newton
end module m_newton

program kadai4
    ! module
    use m_newton
    use m_base
    implicit none
    ! function
    ! tmp
    real :: eps;
    real :: r_newton(2);

    ! run
    eps = 1.0E-6
    print '("基準値: ", e7.1)', eps
    r_newton = newton(eps)
    print '("回数: ",I2 ," 近似値: " f11.9)', nint(r_newton(1)), r_newton(2)
end program kadai4