! Created by kiyama on 5/10/22.

!kuku
program sample4_2
    implicit none
    ! function
    ! tmp
    integer, allocatable :: A(:)
    ! run
    !write (*, *) (A(I), I = 1, 10)
    write (*, '(1x,9I5)') A
end program sample4_2