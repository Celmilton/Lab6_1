using Plots
using DifferentialEquations

a= 0.01
b= 0.02

N = 11100
y0 =220
z0 = 44
x0 =  N - y0 - z0

function ode_fn(du, u, p, t)
    x, y, z = u
    du[1] = -a*u[1]
    du[2] = a*u[1] - b*u[2]
    du[3] = b*u[3]
end

u0 = [x0, y0, z0]
tspan = (0.0, 250.0)
prob = ODEProblem(ode_fn, u0, tspan)
sol = solve(prob, dtmax=0.01)

X = [u[1] for u in sol.u]
Y = [u[2] for u in sol.u]
Z = [u[3] for u in sol.u]
T = [t for t in sol.t]

plt =
    plot(
        layout=(1),
        dpi=300,
        legend=false)
    plot!(
        plt[1],
        T,
        X,
        label="решение уравнения S",
        color=:blue)
    plot!(
        plt[1],
        T,
        Y,
        label="решение уравнения I",
        color=:red)
    plot!(
        plt[1],
        T,
        Z,
        label="решение уравнения R",
        color=:green)

savefig("lab6_2.png")