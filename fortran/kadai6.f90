! Created by kiyama on 6/13/22.
program kadai6
    ! module
    ! set implicit none
    implicit none
    ! functions
    ! tmp
    integer i, j, k, l, LoopMax
    logical checker
    doubleprecision sum1, sum2, eps, omega
    doubleprecision, dimension(4, 4) :: A
    doubleprecision, dimension(4) :: x, b, xnew, answer
    ! run
    ! initialize
    answer = (/1.0, 2.0, 3.0, 4.0/)

    eps = 0.00001 ! based standard value
    LoopMax = 10000000
    omega = 1.0
    ! input matrix and vector
    A = reshape((/7.0, 2.0, -1.0, 1.0, 1.0, 5.0, 1.0, -2.0, 2.0, 3.0, 8.0, 1.0, 2.0, -2.0, -1.0, 10.0/), shape(A))
    b = (/12.0, 6.0, 36.0, 35.0/)
    x = (/12.0, 6.0, 36.0, 35.0/)
    xnew = (/12.0, 6.0, 36.0, 35.0/)
    !x = (/0.0, 0.0, 0.0, 0.0/)
    !xnew = (/0.0, 0.0, 0.0, 0.0/)

    do k = 1, LoopMax
        checker = .true.
        ! 各 i
        do i = 1, 4
            sum1 = 0.0
            sum2 = 0.0
            do j = 1, i - 1
                sum1 = sum1 + a(i, j) * xnew(j)
            end do
            do j = i, 4
                sum2 = sum2 + a(i, j) * x(j)
            end do
            xnew(i) = (omega / a(i, i)) * (b(i) - sum1 - sum2) + x(i)
        end do !i
        do l = 1, 4
            if (abs(answer(l) - xnew(l))<eps) then
                checker = checker .and. .true.
            else
                checker = .false.
            end if
        end do
        if (checker) then
            exit
        else
            x = xnew
        end if
    end do
    print *, x
    print *, '収束までの計算回数:', k
contains

end program kadai6
