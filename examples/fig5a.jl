using CurveProximityQueries
using ConvexBodyProximityQueries
using IntervalArithmetic
using Plots
using StaticArrays
import Random: seed!

pgfplots()
seed!(22)

curve = Bernstein([[-0.6, 0.0], [-0.6, 0.0], [0.1, -0.4], [0.4, 1.6], [-0.2, -1.6], [-0.1, 0.4], [0.8, 0.0], [0.8, 0.0]])

poly = randpoly([0.3, 0.7]; n=20, scale=0.5)
pts = closest_points(curve(0.5), poly, @SVector(ones(2)))

plot(curve, 0.0..0.2,
     linewidth=2.0,
     linestyle=:dash,
     linecolor=Gray(0.5),
    )
plot!(curve, 0.2..0.8,
      linewidth=2.0,
      linecolor=:black,
     )
plot!(curve, 0.8..1.0,
      linewidth=2.0,
      linestyle=:dash,
      linecolor=Gray(0.5),
     )
scatter!(curve(0.2), markersize=4, markercolor=:black)
scatter!(curve(0.8), markersize=4, markercolor=:black)

plot!(poly,
      fillalpha=1.0,
      fillcolor=Gray(0.7),
     )
plot!(pts,
      linestyle=:dash,
      markersize=8.0,
      linewidth=2.0,
     )
savefig("out/fig5a.pdf")
