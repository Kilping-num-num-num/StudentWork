#=
ДАНО: Робот находится в произвольной клетке ограниченного прямоугольного поля без внутренних перегородок и маркеров.
РЕЗУЛЬТАТ: Робот — в исходном положении в центре прямого креста из маркеров, расставленных вплоть до внешней рамки.
=#

include("../roblib.jl")

function mark_kross(r)
    side = Up
    for i in 0:1:3
        steps = 0
        while isborder(r,side)==false
            move!(r,side)
            putmarker!(r)
            steps += 1
        end
        movements!(r, inverse(side), steps)
        side = left(side)
    end
    putmarker!(r)
end
