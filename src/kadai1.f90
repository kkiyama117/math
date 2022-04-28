! Created by kiyama on 4/26/22.

program kadai1
    ! Initialize variables
    integer :: I, J, K(1000) = 0, L = 1

    do I = 2, 1000
        if(K(I) == 0) then
            do J = 2 * I, 1000, I
                K(J) = 1
            end do
            K(I) = I
        end if
    end do
    do I = 2, 1000
        if(K(I) > 1) then
            if(mod(L, 5)==0) then
                write(*, '(i6)') K(I)
            else
                write(*, '(i6)', advance = 'no') K(I)
            end if
            L = L + 1
        end if
    end do
end program kadai1