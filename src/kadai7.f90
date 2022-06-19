! compute eigenvalue & eigenvector by Jabobi method
program Jacobi_method
    ! state variables
    implicit none
    integer :: i, k, l, n
    integer :: p, q, fg
    real(8) :: bg, ss, tt, vv, sai, sg, csai
    real(8) :: bpi, bqi, bpp, bqq, xpq, xqp
    real(8) :: eps
    real(8), allocatable :: A(:, :), X(:, :)
    ! n is the degree of matrix (You should check.)
    parameter (n = 5)
    allocate(A(n, n))
    allocate(X(n, n))
    ! read data
    A = reshape((/5., 4., 1., 1., 4., 5., 1., 1., 1., 1., 4., 2., 1., 1., 2., 4./), (/4, 4/))
    eps = 1.0E-10
    do l = 1, n
        do k = 1, n
            if(abs(A(l, k))<eps) then
                A(l, k) = 0.0D0
            end if
        end do
    end do
    do l = 1, n
        write(*, '(16(E10.3,X))') (A(l, k), k = 1, n)
    end do
    ! judge if data is symmetric matrix
    do l = 1, n
        do k = 1, n
            if (A(l, k)==A(k, l)) then
            else
                write(*, 200)
                200 format('It is not symmetric matrix.')
            end if
        end do
    end do
    ! set initial value of matrix X
    do l = 1, n
        do k = 1, n
            X(l, k) = 0
        end do
        X(l, l) = 1
    end do
    ! find maximum element of matrix A
    fg = 0
    bg = 0
    do k = 1, n - 1
        do l = k + 1, n
            if (abs(a(k, l))>bg) then
                p = k
                q = l
                bg = abs(a(k, l))
            end if
        end do
    end do
    ! compute orthogonal matrix & diagonalize matrix A
    do i = 1, 1000
        if (bg>=eps) then
            fg = fg + 1
            ss = -A(p, q)
            tt = (A(p, p) - A(q, q)) / 2
            vv = abs(tt) / sqrt(ss * ss + tt * tt)
            sai = sqrt((1 - vv) / 2)
            sg = ss * tt
            csai = sqrt(1 - sai * sai)
            if (sg<0) then
                sai = -sai
            end if
            do l = 1, n
                if (l/=p.AND.l/=q) then
                    bpi = A(p, l) * csai - A(q, l) * sai
                    bqi = A(q, l) * csai + A(p, l) * sai
                    A(p, l) = bpi
                    A(q, l) = bqi
                end if
            end do
            bpp = A(p, p) * csai * csai + A(q, q) * sai * sai - 2 * A(p, q) * sai * csai
            bqq = A(p, p) * sai * sai + A(q, q) * csai * csai + 2 * A(p, q) * sai * csai
            A(p, p) = bpp
            A(q, q) = bqq
            A(p, q) = 0
            A(q, p) = 0
            ! compute eigenvector
            do l = 1, n
                A(l, p) = A(p, l)
                A(l, q) = A(q, l)
                xpq = X(l, p) * csai - X(l, q) * sai
                xqp = X(l, q) * csai + X(l, p) * sai
                X(l, p) = xpq
                X(l, q) = xqp
            end do
            ! find maximum element of matrix A
            bg = 0
            do k = 1, n - 1
                do l = k + 1, n
                    if (abs(A(k, l))>bg) then
                        p = k
                        q = l
                        bg = abs(A(k, l))
                    end if
                end do
            end do
            ! write result
        else
            open(12, file = 'result.dat')
            write(*, 300)
            write(12, 300)
            300 format(' 1.Eigenvalue')
            do l = 1, n
                write(*, 400) l, A(l, l)
                write(12, 400) l, A(l, l)
                400 format('lambda', i2, ')=', E12.4)
            end do
            write(*, 500)
            write(12, 500)
            500 format(' 2.Eigenvector')
            do l = 1, n
                write(*, 600) (X(l, k), k = 1, n)
                write(12, 600) (X(l, k), k = 1, n)
                600 format(1x, 10E12.4)
            end do
            write(*, 700) fg
            700 format('times:', i4)
            close(12)
            stop
        end if
    end do
    ! finish
    deallocate(A)
    deallocate(X)
    stop
end program Jacobi_method
