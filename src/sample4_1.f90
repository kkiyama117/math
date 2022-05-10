! Created by kiyama on 5/10/22.

program sample4_1
    implicit none
    ! function
    ! tmp
    integer :: A(10) = 1, i, j, k
    ! run
    do i = 1, 10
        if (i == 1) then
            A(i) = 1
        else if (i == 2) then
            j = A(i - 1)
            k = 0
            A(i) = j + k
        else
            j = A(i - 1)
            k = A(i - 2)
            A(i) = j + k
        end if
        write (*, '(1x,11I5)') A(i)
    end do
end program sample4_1