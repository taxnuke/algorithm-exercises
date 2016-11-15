! 7.19a в учебнике
! 1. Количесвто элементов матрицы B, которые положительны
! 2. Вывести их индексы

program ex_7_19a
    implicit none
    integer, allocatable    :: B(:,:), Inline(:), Indexes(:,:), Positions(:)
    logical, allocatable    :: mask(:)
    integer                 :: x = 0, y = 0, In = 1, Out = 0, i = 0, j = 0, pos = 0
    character(*), parameter :: output_file = "output.txt", &
                               input_file = "../data/input.txt"

    open (file=input_file, newunit=In)
        read(In, *) x, y
        allocate(B(x,y), Indexes(x*y,2))
        read(In, *) (B(:,i), i = 1, y)
    close (In)

    Inline = reshape(B, [x*y])

    mask = Inline > 0
    pos = count(mask)
    Positions = pack([(i,i=1,x*y)], mask)

    Indexes(:, 1) = [((i, i = 1, x), j = 1, y)]
    Indexes(:, 2) = [((j, i = 1, x), j = 1, y)]

    open (file=output_file, newunit=Out)
        write(Out, *) pos, 'positive elements found within the array, coordinates:'
        write(Out, *) 'X, Y'
        write(Out, '(I2,A1,I2)') (Indexes(Positions(i),1), ',' ,Indexes(Positions(i),2), i = 1, pos)
    close (In)

end program ex_7_19a