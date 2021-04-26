#=
ДАНО: Робот в произвольной клетке поля (без внутренних перегородок и маркеров) 
РЕЗУЛЬТАТ: Робот -в исходном положении, и все клетки по периметру внешней рамки промакированы 
=#

include("../roblib.jl")

function markP(r)
    Nsteps = through_rectangles_into_angle(r, (Down, Left))
    side = Up
    for i in 0:1:3
        putmarkers!(r, side)
        side = right(side)
    end
    movements!(r, (Up, Right), reverse(Nsteps))
end