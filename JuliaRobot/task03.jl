#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля 
РЕЗУЛЬТАТ: Робот - в исходном положении, и все клетки поля промакированы 
=#

include("../roblib.jl")

function mark_all_cells(r)
    Nsteps = through_rectangles_into_angle(r, (Down, Left))
    side = Right
    while (isborder(r, Up) == false) || (isborder(r, Right) == false)
        putmarkers!(r, side)
        if (isborder(r, Up) == false)
            move!(r, Up)
        end
        side = inverse(side)
    end
    through_rectangles_into_angle(r, (Down, Left))
    movements!(r, (Up, Right), reverse(Nsteps))
end