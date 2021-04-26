#=
ДАНО: На ограниченном внешней прямоугольной рамкой поле имеется ровно одна внутренняя перегородка в форме прямоугольника.
Робот -в произвольной клетке поля между внешней и внутренней перегородками. 
РЕЗУЛЬТАТ: Робот -в исходном положении и по всему периметру внутренней перегородки поставлены маркеры. 
=#

include("../roblib.jl")

function mark_rectangle_perimeter(r)
    num_steps = through_rectangles_into_angle(r, (Down, Left))

    direction = Right

    while (isborder(r, Up) == false)
        if isborder(r, direction)
            direction = inverse(direction)
            move!(r, Up)
        else move!(r, direction)
        end
    end

    while (ismarker(r) == false)
        putmarker!(r)
        if isborder(r, right(direction))
            move!(r, direction)
        else
            direction = right(direction)
            move!(r, direction)
        end
    end

    through_rectangles_into_angle(r, (Down, Left))
    movements!(r, (Up, Right), reverse(num_steps))
end