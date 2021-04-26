#=
ДАНО: Робот -в произвольной клетке ограниченного прямоугольного поля, на котором могут находиться также внутренние прямоугольные перегородки
(все перегородки изолированы друг от друга, прямоугольники могут вырождаться в отрезки) 
РЕЗУЛЬТАТ: Робот - в исходном положении, и в 4-х приграничных клетках, две из которых имеют ту же широту, а две -ту же долготу, что и Робот, стоят маркеры. 
=#

include("../roblib.jl")

function mark_centers(r)
    Nsteps = through_rectangles_into_angle(r, (Down, Left))

    NstepsToR = sum(Nsteps[1:2:end])
    NstepsToU = sum(Nsteps[2:2:end])

    movements!(r, Up, NstepsToU)
    putmarker!(r)
    NstepsToD = get_num_movements!(r, Up)

    movements!(r, Right, NstepsToR)
    putmarker!(r)
    NstepsToL = get_num_movements!(r, Right)

    movements!(r, Down, NstepsToD)
    putmarker!(r)
    movements!(r, Down)

    movements!(r, Left, NstepsToL)
    putmarker!(r)
    movements!(r, Left)

    movements!(r, (Up, Right), reverse(Nsteps))
end