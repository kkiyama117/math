!--------------------------------------------------------------
! 險育ｮ礼黄逅� 隱ｲ鬘後�繝ｭ繧ｰ繝ｩ繝� : 2009.12.14 / H.Fujimoto
! 繧ｷ繝ｪ繝ｳ繝蜻ｨ繧翫�髱槫悸邵ｮ諤ｧ豬√ｌ
!--------------------------------------------------------------
! 險育ｮ励�蝓ｺ遉弱ｄ縲√�繝ｭ繧ｰ繝ｩ繝�縺ｮ蜀�ｮｹ繧堤炊隗｣縺励※繧ゅｉ縺�◆繧√↓縲�撼蟶ｸ縺ｫ蜊倡ｴ斐↑
! 隗｣豕輔ｒ謗｡逕ｨ縺励※縺�∪縺呻ｼ手ｨ育ｮ鈴比ｸｭ縺ｫ蝨ｧ蜉帶険蜍輔′逋ｺ逕溘☆繧九↑縺ｩ荳埼�蜷医↑轤ｹ繧�
! 螟壹＞縺ｮ縺ｧ縲√∪縺｣縺ｨ縺�↑遐皮ｩｶ縺ｧ菴ｿ逕ｨ縺励※縺ｯ縺�￠縺ｾ縺帙ｓ�守ｧｻ豬�(蟇ｾ豬�)鬆����
! 繧ｫ繝ｯ繝�繝ｩ繧ｹ繧ｭ繝ｼ繝�(3谺｡邊ｾ蠎ｦ鬚ｨ荳雁ｷｮ蛻�)�後◎繧御ｻ･螟悶�遨ｺ髢灘ｾｮ蛻���↓縺ｯ荳ｭ蠢�ｷｮ蛻�ｒ
! 菴ｿ逕ｨ縺暦ｼ梧凾髢鍋ｩ榊�縺ｯ髯ｰ隗｣豕輔ｒ菴ｿ逕ｨ縺励※縺�∪縺呻ｼ弱さ繝ｭ繧ｱ繝ｼ繝医Γ繝�す繝･繧剃ｽｿ逕ｨ縺暦ｼ�
! 騾｣遶�1谺｡譁ｹ遞句ｼ上��後ぎ繧ｦ繧ｹ繝ｻ繧ｶ繧､繝�Ν豕輔ｂ縺ｩ縺阪〒險育ｮ励＠縺ｦ縺�∪縺呻ｼ� 
!
!     +-----+-----+-----+-----+-----+  
!     i     i     i j+2 i     i     i 
!     i     i     i  d  i     i     i
!     +-----+-----+-----+-----+-----+
!     i     i     i j+1 i     i     i
!     i     i   8 i  5  i  9  i     i
!     +-----+-----+-----+-----+-----+
!     i i-2 i i-1 i i,j i i+1 i i+2 i
!     i  a  i   2 i  1  i  3  i  b  i
!     +-----+-----+-----+-----+-----+
!     i     i     i j-1 i     i     i
!     i     i  6  i  4  i  7  i     i
!     +-----+-----+-----+-----+-----+
!     i     i     i j-2 i     i     i
!     i     i     i  c  i     i     i
!     +-----+-----+-----+-----+-----+
module common_block ! 繝｢繧ｸ繝･繝ｼ繝ｫ縺ｮ螳｣險
implicit none
      integer,parameter :: loop=2000,l=300,m=300,ix=l+4,iy=m+4 ! l,m縺ｯ蜷�ｺｧ讓呵ｻｸ譁ｹ蜷代�譬ｼ蟄先焚
      real(8),parameter :: pi=3.141592653d0 ! 蜀�捉邇�
      real(8) :: r1,r2,dt,re,dg,de
      integer :: i,j,nn
      real(8),dimension(ix,iy) :: x,y,zj,xg,xe,yg,ye,&
                       xgg,xge,xee,ygg,yge,yee,&
                       u,v,p,px,py,uu,vv,pp,ul,vl, &
                       c1,c2,c3,c4,c5, &
                       xmp1,xmp2,xmp3,xmp4,xmp5,xmp6,xmp7,xmp8,xmp9, &
                       qmp1,qmp2,qmp3,qmp4,qmp5,qmp6,qmp7,qmp8,qmp9, &
                       xmu1,xmu2,xmu3,xmu4,xmu5,xmu6,xmu7,xmu8,xmu9, &
                       xmua,xmub,xmuc,xmud
endmodule common_block 
!
program aaa
use common_block
implicit none
character*10 :: abc=""
!
       call init                ! 螟画焚蛻晄悄蛹悶↑縺ｩ縺ｮ蜃ｦ逅�
       do nn=1,loop             ! 繝｡繧､繝ｳ繝ｫ繝ｼ繝励�髢句ｧ�
          call bound            ! 蠅�阜譚｡莉ｶ
          call press            ! 蝨ｧ蜉帙�險育ｮ�
          call umatr            ! 騾溷ｺｦ險育ｮ励�荳区ｺ門ｙ
          call velo(1)          ! 騾溷ｺｦ謌仙�u縺ｮ險育ｮ�
          call velo(2)          ! 騾溷ｺｦ謌仙�v縺ｮ險育ｮ�
!************ 險育ｮ礼ｵ先棡縺ｮ蜃ｺ蜉� ************* 驕ｩ螳懷､画峩縺ｮ縺薙→/ TECPLOT縺ｨ縺�≧蜿ｯ隕門喧繧ｽ繝輔ヨ逕ｨ縺ｮ蜃ｺ蜉�
          write(6,'(a,f0.1)') 'Time = ',nn*dt
          if( mod(nn,10) == 0 ) then
             write(abc,'(i0)') nn ! 謨ｴ謨ｰ繧呈枚蟄怜�縺ｫ螟画鋤
             open(15,file= '_dat_'//trim(abc)//'.plt', recl=2048)
             write(15,"(a)") 'TITLE="Computational Physics"'
             write(15,"(a)") 'VARIABLES="x","y","u","v","p"'
             write(15,"(' ZONE T=',a,' I=',i0,', J=', i0,', F=POINT')") 'test', ix-2, iy-2
             do j = 2, iy-1
             do i = 2, ix-1
                write(15,*) real(x(i,j)),real(y(i,j)), real(u(i,j)), real(v(i,j)), real(p(i,j))
             enddo
             enddo
             close(15)
          endif
       enddo                    ! 繝｡繧､繝ｳ繝ｫ繝ｼ繝励�邨ゆｺ�
!
contains
!-------------------------------------------------------
subroutine init  ! 蛻晄悄蛹�
!-------------------------------------------------------
implicit none
real(8) :: g,e,zc1,zc2,zc3,zc4,zc5
!
       r1=0.5d0 ; r2=30.0d0+r1   ! r1:蜀�浤陦ｨ髱｢(=蜀�浤蜊雁ｾ�), r2:險育ｮ鈴�伜沺螟夜Κ蠅�阜
       dg=1.0d0/dble(l)          ! ﾎｾ譁ｹ蜷代�譬ｼ蟄宣俣髫�
       de=1.0d0/dble(m)          ! ﾎｷ譁ｹ蜷代�譬ｼ蟄宣俣髫�
       dt=0.1d0                  ! 譎る俣蛻ｻ縺ｿ蟷�:譎る俣遨榊�縺ｯ髯ｰ隗｣豕輔〒隗｣縺�※縺�ｋ縺溘ａ邨ｶ蟇ｾ螳牙ｮ�
       re=100.0d0                ! 繝ｬ繧､繝弱Ν繧ｺ謨ｰ
!
       do j=1,iy      ! 蠎ｧ讓吝､画鋤縺ｫ髢｢縺吶ｋ驟榊�
       do i=1,ix      ! 縺薙�菫よ焚縺ｯ險育ｮ嶺ｸｭ螟牙喧縺励↑縺��縺ｧ譛蛻昴↓螳夂ｾｩ縺励※縺翫￥
          g       = dg*dble(i-2)
          e       = de*dble(j-2)
          x(i,j)  =  ((r2-r1)*e+r1)*cos(2.0*pi*g)           !  x-蠎ｧ讓�
          y(i,j)  =  ((r2-r1)*e+r1)*sin(2.0*pi*g)           !  y-蠎ｧ讓�
          xg(i,j) = -2.0*pi*((r2-r1)*e+r1)*sin(2.0*pi*g)    ! 竏Ｙ/竏ばｾ
          xe(i,j) =  (r2-r1)*cos(2.0*pi*g)                  ! 竏Ｙ/竏ばｷ
          yg(i,j) =  2.0*pi*((r2-r1)*e+r1)*cos(2.0*pi*g)    ! 竏Ｚ/竏ばｾ
          ye(i,j) =  (r2-r1)*sin(2.0*pi*g)                  ! 竏Ｚ/竏ばｷ
          zj(i,j) =  xg(i,j)*ye(i,j)-yg(i,j)*xe(i,j)        ! 繝､繧ｳ繝薙い繝ｳ,J
!
          xgg(i,j) = -((2.0*pi)**2)*((r2-r1)*e+r1)*cos(2.0*pi*g)  ! 竏�^2 x/竏ばｾ^2
          xge(i,j) = -2.0*pi*(r2-r1)*sin(2.0*pi*g)                ! 竏�^2 x/竏ばｾ竏ばｷ
          xee(i,j) =  0.0d0                                       ! 竏�^2 x/竏ばｷ^2
          ygg(i,j) = -((2.0*pi)**2)*((r2-r1)*e+r1)*sin(2.0*pi*g)  ! 竏�^2 y/竏ばｾ^2
          yge(i,j) =  2.0*pi*(r2-r1)*cos(2.0*pi*g)                ! 竏�^2 y/竏ばｾ竏ばｷ
          yee(i,j) =  0.0d0                                       ! 竏�^2 y/竏ばｷ^2
!
!    騾溷ｺｦ縺ｨ蝨ｧ蜉帙�蛻晄悄蛟､(騾溷ｺｦ縺ｮ蛻晄悄蛟､縺ｯ繝昴ユ繝ｳ繧ｷ繝｣繝ｫ豬√�蜴ｳ蟇�ｧ｣)
!
          u(i,j) = 1.0 - cos(2.0*(2.0*pi*g))/((r2-r1)*e+r1)**2  ! x-譁ｹ蜷鷹溷ｺｦ謌仙�蛻晄悄蛟､
          v(i,j) =     - sin(2.0*(2.0*pi*g))/((r2-r1)*e+r1)**2  ! y-譁ｹ蜷鷹溷ｺｦ謌仙�蛻晄悄蛟､
          p(i,j) = 3.0 - 0.5*(u(i,j)**2+v(i,j)**2)              ! 蝨ｧ蜉帛�譛溷､
   enddo
   enddo
!
   do j=2,iy-1      ! 蝨ｧ蜉帙�Poisson譁ｹ遞句ｼ上�菫よ焚
   do i=2,ix-1      ! 縺薙�菫よ焚縺ｯ險育ｮ嶺ｸｭ螟牙喧縺励↑縺��縺ｧ譛蛻昴↓螳夂ｾｩ縺励※縺翫￥
          zc1     = xe(i,j)**2+ye(i,j)**2
          zc2     = xg(i,j)*xe(i,j)+yg(i,j)*ye(i,j)
          zc3     = xg(i,j)**2+yg(i,j)**2
          c1(i,j) = zc1/(zj(i,j)**2)
          c2(i,j) = zc2/(zj(i,j)**2)
          c3(i,j) = zc3/(zj(i,j)**2)
!
          zc4=zc1*xgg(i,j)-2.0*zc2*xge(i,j)+zc3*xee(i,j)
          zc5=zc1*ygg(i,j)-2.0*zc2*yge(i,j)+zc3*yee(i,j)
          c4(i,j)   = ( -ye(i,j)*zc4 + xe(i,j)*zc5 ) / ( zj(i,j)**3 )
          c5(i,j)   = (  yg(i,j)*zc4 - xg(i,j)*zc5 ) / ( zj(i,j)**3 )
   enddo
   enddo
!
   do j=2,iy-1
   do i=2,ix-1
          xmp1(i,j) = -2.0*c1(i,j) / (dg**2) -2.0*c3(i,j)/(de**2) ! (i,j)縺ｮ菫よ焚
          xmp2(i,j) = c1(i,j) / (dg**2)     - c4(i,j)/(2.0*dg)    ! (i-1,j)
          xmp3(i,j) = c1(i,j) / (dg**2)     + c4(i,j)/(2.0*dg)    ! (i+1,j)
          xmp4(i,j) = c3(i,j) / (de**2)     - c5(i,j)/(2.0*de)    ! (i,j-1)
          xmp5(i,j) = c3(i,j) / (de**2)     + c5(i,j)/(2.0*de)    ! (i,j+1)
          xmp6(i,j) = c2(i,j) / (4.0*dg*de)                       ! (i-1,j-1)
          xmp7(i,j) = c2(i,j) / (4.0*dg*de)                       ! (i+1,j-1)
          xmp8(i,j) = c2(i,j) / (4.0*dg*de)                       ! (i-1,j+1)
          xmp9(i,j) = c2(i,j) / (4.0*dg*de)                       ! (i+1,j+1)
!
          qmp1(i,j) = 1.0d0    ! 轤ｹ(i,j)縺ｮ菫よ焚繧抵ｼ代→縺吶ｋ繧医≧螟画鋤
          qmp2(i,j) = xmp2(i,j) / xmp1(i,j)
          qmp3(i,j) = xmp3(i,j) / xmp1(i,j)
          qmp4(i,j) = xmp4(i,j) / xmp1(i,j)
          qmp5(i,j) = xmp5(i,j) / xmp1(i,j)
          qmp6(i,j) = xmp6(i,j) / xmp1(i,j)
          qmp7(i,j) = xmp7(i,j) / xmp1(i,j)
          qmp8(i,j) = xmp8(i,j) / xmp1(i,j)
          qmp9(i,j) = xmp9(i,j) / xmp1(i,j)
   enddo
   enddo
!
end subroutine init
!-------------------------------------------------------------
subroutine bound  ! 騾溷ｺｦ縺ｮ蠅�阜譚｡莉ｶ
!-------------------------------------------------------------
implicit none
         u(:,1)   = u(:,3)  ! 莉ｮ諠ｳ繧ｻ繝ｫ
         v(:,1)   = v(:,3)  ! 莉ｮ諠ｳ繧ｻ繝ｫ
         u(:,2)   = 0.0d0   ! 蜀�浤髱｢縺ｮ騾溷ｺｦ謌仙� u
         v(:,2)   = 0.0d0   ! 蜀�浤髱｢縺ｮ騾溷ｺｦ謌仙� v
         u(:,m+3) = 1.0d0   ! 蜀�浤縺九ｉ蜈��髮｢繧後◆轤ｹ縺ｮ騾溷ｺｦ(荳讒俶ｵ�)
         v(:,m+3) = 0.0d0   ! 蜀�浤縺九ｉ蜈��髮｢繧後◆轤ｹ縺ｮ騾溷ｺｦ(荳讒俶ｵ�)
         u(:,m+4) = 1.0d0   ! 蜀�浤縺九ｉ蜈��髮｢繧後◆轤ｹ縺ｮ騾溷ｺｦ(荳讒俶ｵ�)
         v(:,m+4) = 0.0d0   ! 蜀�浤縺九ｉ蜈��髮｢繧後◆轤ｹ縺ｮ騾溷ｺｦ(荳讒俶ｵ�)
!
         u(  1,:) = u(l+1,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         v(  1,:) = v(l+1,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         u(  2,:) = u(l+2,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         v(  2,:) = v(l+2,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         u(l+3,:) = u(  3,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         v(l+3,:) = v(  3,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         u(l+4,:) = u(  4,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
         v(l+4,:) = v(  4,:) ! 蜻ｨ譛溷｢�阜譚｡莉ｶ
!
! 騾溷ｺｦ�悟悸蜉帙�譖ｴ譁ｰ
!
         uu(:,:)  = u(:,:)
         vv(:,:)  = v(:,:)
         pp(:,:)  = p(:,:)
         ul(:,:)  =  ye(:,:)*u(:,:)/zj(:,:)-xe(:,:)*v(:,:)/zj(:,:)
         vl(:,:)  = -yg(:,:)*u(:,:)/zj(:,:)+xg(:,:)*v(:,:)/zj(:,:)
endsubroutine bound
!---------------------------------------------------
subroutine press  ! 蝨ｧ蜉帙�險育ｮ�
!---------------------------------------------------
implicit none
real(8) :: xcon(ix,iy),check,za1,za2,za3,za4,a1,a2,a3,a4,aa,aau,aav
integer :: kpp,aflag
!
      do j=2,m+3 ! 螳壽焚驛ｨ蛻� B_i,j縺ｮ險育ｮ�
      do i=2,l+3
         za1=(u(i+1,j)-u(i-1,j))/(2.0d0 * dg)
         za2=(u(i,j+1)-u(i,j-1))/(2.0d0 * de)
         za3=(v(i+1,j)-v(i-1,j))/(2.0d0 * dg)
         za4=(v(i,j+1)-v(i,j-1))/(2.0d0 * de)
         a1=( ye(i,j)*za1-yg(i,j)*za2)/zj(i,j)
         a2=(-xe(i,j)*za3+xg(i,j)*za4)/zj(i,j)
         a3=(-xe(i,j)*za1+xg(i,j)*za2)/zj(i,j)
         a4=( ye(i,j)*za3-yg(i,j)*za4)/zj(i,j)
         xcon(i,j)= ( (a1+a2)/dt-a1**2-2.0*a3*a4-a2**2 )/xmp1(i,j)
      enddo
      enddo
!
         check = 0.0d0
         kpp=1
         aflag=0
! OpenMP
!$omp parallel
      do while( aflag == 0)
!$omp do schedule(static) reduction(max:check) private(aa)
         do j=3,m+2    ! 蝨ｧ蜉帙ｒ繧ｬ繧ｦ繧ｹ繧ｶ繧､繝�Ν豕輔〒險育ｮ�
         do i=3,l+2
            aa= p(i,j) + qmp2(i,j)*p(i-1,j) + qmp3(i,j)*p(i+1,j) &
                       + qmp4(i,j)*p(i,j-1) + qmp5(i,j)*p(i,j+1) &
                       + qmp6(i,j)*(p(i+1,j+1)-p(i+1,j-1)-p(i-1,j+1)+p(i-1,j-1)) - xcon(i,j)
            aa = -aa* 1.0d0
            check=max(check,abs(aa))
            pp(i,j)=p(i,j)+ aa
         enddo
         enddo
!$omp end do
!$omp do schedule(static)
         do j=3,m+2
         do i=3,l+2
            p(i,j)=pp(i,j)
         enddo
         enddo
!$omp end do
!$omp do schedule(static) private(aau,aav)
         do i=2,l+3     ! 蝨ｧ蜉帙�蠅�阜譚｡莉ｶ
           aau=xmp5(i,2)*u(i,3)+xmp4(i,2)*u(i,1) &
             +xmp6(i,j)*(u(i+1,3)-u(i+1,1)-u(i-1,3)+u(i-1,1))
           aav=xmp5(i,2)*v(i,3)+xmp4(i,2)*v(i,1) &
             +xmp6(i,j)*(v(i+1,3)-v(i+1,1)-v(i-1,3)+v(i-1,1))
           p(i,  2)=pp(i,3)-de/re*(xe(i,2)*aau+ye(i,2)*aav)
           p(i,  1)=pp(i,2)
           p(i,m+3)=2.5d0
           p(i,m+4)=2.5d0
         enddo
!$omp end do
!$omp do schedule(static)
         do j=1,m+4     ! 蝨ｧ蜉帙�蠅�阜譚｡莉ｶ
           p(  1,j)=pp(l+1,j)
           p(  2,j)=pp(l+2,j)
           p(l+3,j)=pp(  3,j)
           p(l+4,j)=pp(  4,j)
         enddo
!$omp end do
!$omp single
         if( check < 1.0d-5 .or. kpp > 10*ix*iy) aflag=1
         check=0.0
         kpp=kpp+1
!$omp end single
      enddo
!$omp end parallel
! 
      do j=2,m+3   ! 蝨ｧ蜉帛鏡驟埼���險育ｮ�
      do i=2,l+3
         px(i,j)= ye(i,j)/zj(i,j)*(p(i+1,j)-p(i-1,j))/(2.0d0 * dg) &
                 -yg(i,j)/zj(i,j)*(p(i,j+1)-p(i,j-1))/(2.0d0 * de)
         py(i,j)=-xe(i,j)/zj(i,j)*(p(i+1,j)-p(i-1,j))/(2.0d0 * dg) &
                 +xg(i,j)/zj(i,j)*(p(i,j+1)-p(i,j-1))/(2.0d0 * de)
      enddo
      enddo
endsubroutine press
!------------------------------------------------------------
subroutine umatr  ! 騾溷ｺｦ縺ｮ菫よ焚繧呈ｱｺ繧√※縺翫￥
!------------------------------------------------------------
implicit none
!
!   騾溷ｺｦ縺ｮ菫よ焚陦悟�縺ｫ縺ｯ ul,vl縺悟性縺ｾ繧後ｋ縺溘ａ縲∵ｯ取凾髢薙せ繝�ャ繝怜ｮ夂ｾｩ縺吶ｋ蠢�ｦ∵怏
!
      xmu1(:,:)=3.0*abs(ul(:,:))/(2.0*dg)+3.0*abs(vl(:,:))/(2.0*de) &
           -(-2.0*c1(:,:)/(dg**2)-2.0*c3(:,:)/(de**2))/re +1.0/dt
      xmu2(:,:)=(-2.0*ul(:,:)-3.0*abs(ul(:,:)))/(3.0*dg) &
           -(c1(:,:)/(dg**2)-c4(i,j)/(2.0*dg))/re
      xmu3(:,:)=( 2.0*ul(:,:)-3.0*abs(ul(:,:)))/(3.0*dg) &
           -(c1(:,:)/(dg**2)+c4(:,:)/(2.0*dg))/re
      xmu4(:,:)=(-2.0*vl(:,:)-3.0*abs(vl(:,:)))/(3.0*de) &
           -(c3(:,:)/(de**2)-c5(:,:)/(2.0*de))/re
      xmu5(:,:)=( 2.0*vl(:,:)-3.0*abs(vl(:,:)))/(3.0*de) &
           -(c3(:,:)/(de**2)+c5(:,:)/(2.0*de))/re
      xmu6(:,:)=-c2(:,:)/(4.0*dg*de)/re
      xmu7(:,:)= c2(:,:)/(4.0*dg*de)/re
      xmu8(:,:)= c2(:,:)/(4.0*dg*de)/re
      xmu9(:,:)=-c2(:,:)/(4.0*dg*de)/re
      xmua(:,:)=( ul(:,:)+3.0*abs(ul(:,:)))/(12.0*dg)
      xmub(:,:)=(-ul(:,:)+3.0*abs(ul(:,:)))/(12.0*dg)
      xmuc(:,:)=( vl(:,:)+3.0*abs(vl(:,:)))/(12.0*de)
      xmud(:,:)=(-vl(:,:)+3.0*abs(vl(:,:)))/(12.0*de)
!
endsubroutine umatr
!---------------------------------------------------------------
subroutine velo(isn) ! 騾溷ｺｦ縺ｮ險育ｮ�
!---------------------------------------------------------------
use common_block
implicit none
real(8) :: xcon(ix,iy),ans(ix,iy),uinf,check,aa
integer,intent(in) :: isn 
integer :: kpp
!
      if(isn.eq.1) then    !  u繧定ｨ育ｮ励☆繧九→縺�
         uinf=1.0d0
         xcon(:,:)=-px(:,:)+uu(:,:)/dt
         ans(:,:)=uu(:,:)
      else                 !  v繧定ｨ育ｮ励☆繧九→縺�
         uinf=0.0d0
         xcon(:,:)=-py(:,:)+vv(:,:)/dt
         ans(:,:)=vv(:,:)
      endif
!
    do kpp=1,100001      ! 蜈��螟ｧ縺阪↑謨ｰ
        check=0.0d0
        do j=3,m+2   ! 繧ｬ繧ｦ繧ｹ繧ｶ繧､繝�Ν豕�
        do i=3,l+2
           aa= xmu2(i,j)*ans(i-1,  j)+xmu3(i,j)*ans(i+1,  j) &
              +xmu4(i,j)*ans(  i,j-1)+xmu5(i,j)*ans(  i,j+1) &
              +xmu6(i,j)*ans(i-1,j-1)+xmu7(i,j)*ans(i+1,j-1) &
              +xmu8(i,j)*ans(i-1,j+1)+xmu9(i,j)*ans(i+1,j+1) &
              +xmua(i,j)*ans(i-2,  j)+xmub(i,j)*ans(i+2,  j) &
              +xmuc(i,j)*ans(  i,j-2)+xmud(i,j)*ans(  i,j+2)
           aa=(xcon(i,j)-aa)/xmu1(i,j)
           check=max(check,abs(ans(i,j)-aa))
           ans(i,j)=aa
        enddo
        enddo
!                        !騾溷ｺｦ縺ｮ蠅�阜譚｡莉ｶ
          ans(:,2)=0.0
          ans(:,1)=ans(:,3)
          ans(:,iy-1)=uinf
          ans(:,iy)=uinf
          ans(1,:)=ans(l+1,:)
          ans(2,:)=ans(l+2,:)
          ans(l+3,:)=ans(3,:)
          ans(l+4,:)=ans(4,:)
!
        if(check.le.1.0d-6) exit
   enddo
!
   if(isn.eq.1) then
           u(:,:)=ans(:,:)
   else
           v(:,:)=ans(:,:)
   endif
endsubroutine velo
!
end
