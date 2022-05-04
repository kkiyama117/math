! Created by kiyama on 5/4/22.

program kadai2
    implicit none
    ! function
    real maclaurin
    real toRad
    ! tmp
    integer i, tmp
    real deg, rad, result
    ! run
    deg = 45.0
    rad = toRad(deg)
    write (*, *) 'rad(', deg, '度)=(', rad, ')での値'
    do i = 1, 3
        tmp = 2 * i + 1
        write (*, *)  '第', tmp, '項目まで'
        result = maclaurin(rad, tmp)
        write (6, *) '近似値:', result
        write (*, *) '誤差  :', abs(result - sin(rad)) / sin(rad)
    end do
    ! run
    deg = 90.0
    rad = toRad(deg)
    write (*, *) 'rad(', deg, '):', rad
    do i = 1, 3
        tmp = 2 * i + 1
        write (*, *)  '第', tmp, '項目'
        result = maclaurin(rad, tmp)
        write (*, *) 'maclaurin(', deg, '):', result
        write (6, *) '誤差:', abs(result - sin(rad)) / sin(rad)
    end do
end program kadai2

real function maclaurin(rad, length) result(result)
    implicit none
    ! func
    real maclaurin_sin_n
    ! args
    integer, intent(in) :: length
    real, intent(in) :: rad
    ! tmp
    real s
    integer i
    ! routine
    do i = 1, length
        s = s + maclaurin_sin_n(i, rad)
    end do
    result = s
end function maclaurin

! each item of maclaurin
real function maclaurin_sin_n(n, rad) result(result)
    implicit none
    ! func
    integer factorial
    ! args
    integer, intent(in) :: n
    real, intent(in) :: rad
    ! routine
    if (mod(n, 2)==0) then
        result = -1.0 * (rad**(2 * n - 1)) / real(factorial(2 * n - 1))
    else
        result = 1.0 * (rad**(2 * n - 1)) / real(factorial(2 * n - 1))
    end if
end function maclaurin_sin_n

! deg(int) to rad(real)
pure real function toRad(i)
    implicit none
    real, intent(in) :: i
    toRad = i / 180 * 3.141592
end function toRad

! factorial
recursive integer function factorial(n) result(result)
    implicit none
    ! args
    integer, intent(in) :: n
    ! routine
    if (n>0) then
        result = n * factorial(n - 1)
    else
        result = 1
    end if
end function factorial

