! Created by kiyama on 5/10/22.

module m_sort
    implicit none
contains
    recursive function qsort(a) result(result)
        real, allocatable :: result(:)
        real, intent(in) :: a(:)
        real :: k
        if (size(a) <= 1) then
            result = a
        else
            k = a(size(a) / 2)
            result = [qsort(pack(a, a < k)), pack(a, a == k), qsort(pack(a, a > k))]
        end if
    end function qsort
end module m_sort


module m_hensa
    implicit none
contains
    pure function hensa(a, b) result(result)
        real, allocatable :: r(:)
        real :: result
        real, intent(in) :: a(:)
        real, intent(in) :: b
        real :: k

    end function hensa
end module m_hensa

program kadai3
    ! module
    use m_sort
    use m_hensa
    implicit none
    ! function
    ! tmp
    real, dimension(30) :: A = [-1.48, 4.96, 7.84, 4.27, 0.83, -0.31, 0.18, &
            3.57, 1.48, -5.34, 9.12, -7.98, -0.75, -2.22, -1.16, 6.53, 5.38, &
            1.63, -2.85, 7.89, -5.96, 8.23, 8.76, 2.97, 4.57, 5.21, 9.43, &
            3.12, 6.52, -1.58], RESULT
    integer :: i
    real :: ave
    ! run
    ave = sum(A) / real(30)
    print '(A,f6.2)', '平均値:', ave
    !do-loopで回すと手計算できるがquicksortとやることが変わらず,qsort(a)[0]を取り出すだけなので割愛.
    print '(A,f6.2)', '最小値:', minval(A)
    print '(A,f6.2)', '標準偏差:', hensa(A,ave)

    RESULT = qsort(a)
    !write (*, '(f5.2)') A

    ! 書式整理
    write (*, *) "ソート結果(quick sort)"
    do I = 1, 30
        write (*, '(f6.2)', advance = 'no') RESULT(i)
    end do
    !write (*, fmt = '(f5.2)') qsort(a)
end program kadai3
