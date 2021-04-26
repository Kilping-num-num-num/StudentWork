#=
ДАНО: Робот - в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные перегородки
(все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки) 
Результат: все углы промаркированны, а робот в исходной позиции?
=#

include("../roblib.jl")

function mark_angels(r)
    num_steps = through_rectangles_into_angle(r, (Down, Left))
    putmarker!(r)
    through_rectangles_into_angle(r, (Up, Left))
    putmarker!(r)
    through_rectangles_into_angle(r, (Up, Right))
    putmarker!(r)
    through_rectangles_into_angle(r, (Down, Right))
    putmarker!(r)
    through_rectangles_into_angle(r, (Down, Left))
    movements!(r, (Up, Right), reverse(num_steps))
end