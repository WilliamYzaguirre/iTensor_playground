include("./../QTT/ITensorQTT.jl/src/ITensorQTT.jl")
using .ITensorQTT
using ITensors
using ITensorUnicodePlots
using UnicodePlots

# From paper "Tensor networks in a nutshell", creating quantum circuit tensor netwokr in equation 19

s = siteinds("Qubit", 3)
println(s)

# in iTensor, to visualize, you must first select your backend
@show ITensorVisualizationBase.get_backend()

# Create indices for hadamard and input |0>, they will share one index k
k = Index(2)
j = Index(2)

# Hadamard tensor
Had = ITensor(k, j)

# input |0> tensor
zero_input = ITensor(k)

# You can set elements with direct referencing
# Set elements of Hadamard
Had[k=>1,j=>1] = 0.707
Had[k=>1,j=>2] = 0.707
Had[k=>2,j=>1] = 0.707
Had[k=>2,j=>2] = -0.707

# set elements of input
zero_input[k=>1] = 1
zero_input[k=>2] = 0

# output of contractong should be 1/sqrt(2) |0> + |1>
zero_Had = @visualize zero_input*Had

println(zero_Had)

# Now let's mess with CNOT

m = Index(2)
i = Index(2)
l = Index(2)

CNOT = ITensor(j, m, i, l)

CNOT[j=>1, m=>1, i=>1, l=>1] = 1
CNOT[j=>1, m=>2, i=>1, l=>1] = 1
#CNOT[j=>1, m=>1, i=>1, l=>1] = 1
#CNOT[j=>1, m=>1, i=>1, l=>1] = 1
#println(Had)
#println(CNOT)

# Contract over shared index j, and visualize
#C = @visualize A*B edge_labels=(tags=true,)
#println(C)


