#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля 
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы
ДОПОЛНИТЕЛЬНО: на поле могут находиться внутренние перегородки прямоугольной формы,
среди которых могут быть и вырожденные прямоугольники (отрезки), эти внутренние перегородки изолированы друг от друга и от внешней рамки.
=#

include("../roblib.jl")

function mark_all_cells(r)
    num_steps = through_rectangles_into_angle(r, (Down, Left))

    side = Right
    while (isborder(r, Up) == false) || (isborder(r, Right) == false)
        putmarkers_if_possible!(r, side)
        if (isborder(r, Up) == false)
            move!(r, Up)
        end
        side = inverse(side)
    end
    through_rectangles_into_angle(r, (Down, Left))
    movements_if_possible!(r, (Up, Right), reverse(num_steps))
end