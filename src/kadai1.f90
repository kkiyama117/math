! Created by kiyama on 4/26/22.

program kadai1
    integer :: I, J, K(1000) = 1

    do I = 2, 1000
        if(K(I) == 0) then
            WRITE(6, *) I
            do J = 2 * I, 1000, I
                K(J) = 1
            end do
        end if
    end do
end program kadai1