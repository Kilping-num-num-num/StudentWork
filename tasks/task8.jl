#=
ДАНО: Робот - рядом с горизонтальной перегородкой (под ней), бесконечно продолжающейся в обе стороны, в которой имеется проход шириной в одну клетку. 
РЕЗУЛЬТАТ: Робот - в клетке под проходом 
=#

include("../roblib.jl")

function find_entrance(r)
    n = 0
    side = Right
    while isborder(r, Up)
        n += 1
        movements!(r, side, n)
        side = inverse(side)
    end
end