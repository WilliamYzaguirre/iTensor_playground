include("./ITensorQTT.jl")
using .ITensorQTT
using ITensors
using ITensorUnicodePlots
using UnicodePlots

# Create tensor, contract tensor, and visualize contraction

# in iTensor, to visualize, you must first select your backend
#@show ITensorVisualizationBase.get_backend()

# In order to create a tensor, you must first create indices, which accept a dimension and tag
#i = Index(3, "example tag")
#j = Index(5)
#k = Index(2)
#l = Index(7)

# You can then create a tensor with all zeroes, use ITensor and feed it the created indices. For a tensor with all random values, use randomITensor
# Below, A is a 3x5x2 tensor, and B is a 5x7 tensor
#A = ITensor(i,j,k)
#B = randomITensor(j,l)

# You can set elements with direct referencing
# Set elements of A
#A[i=>1,j=>1,k=>1] = 11.1
#A[i=>2,j=>1,k=>2] = -21.2
#A[k=>1,i=>3,j=>1] = 31.1  # can provide Index values in any order
#println(A)
#println(B)

# Contract over shared index j, and visualize
#C = @visualize A*B edge_labels=(tags=true,)
#println(C)

# Creating a qft quantum circuit, and the phase mpo

# qft returns a vector of gates that make up the qft for a given number of qubits
#qft_3 = qft(3)
#println("QFT")
#println(qft_3)

# siteinds returns a vector of indices. site is the name given to the different 'things' you can use in a tensor. Qubits, bosons, and spin 1/2 particles are examples
#s = siteinds("Qubit", 4)
#println("Qubits")
#println(s)

# phase_mpo takes in a vector of indices, and returns a phase mpo for the given number of qubits. 
#pmpo = @time phase_mpo(s)
#println("Phase mpo")
#println(pmpo)
#println("\n\n\n")
#for i in s
#  println(i)
#end

# dft MPO

#n = 4
#s = siteinds("Qubit", n)

# dft_mpo takes in a vector of indices and returns the MPO for the qft
#U = @time dft_mpo(s)
#for i in U
#   println(i)
#   println("\n")
#end
#println("\n\n\n\n\n")
#print(U)
#@show maxlinkdim(U)

n = 2
s = siteinds("Qubit", n)

# function to mps


x₀ = 0.5
σ = 0.1

# gaussian
#f(x) = exp(-(x - x₀)^2 / σ^2)

# easy exponential
#f(x) = exp(2x)

# figure it out 
#f(x) = x

# non-lipscitz continuous function
f(x) = abs(4x-2)

# non-lipschitz continuous function
#f(x) = sqrt(x)

# function_to_mps takes in a function, list of indices, xrange (xstart, then xend), and a cutoff, and return a function approximation in MPS form
psi = @time function_to_mps(f, s, 0.0, 1.0; cutoff=.2)
println(psi) 
for i in psi
   println(i)
end
@show ITensorVisualizationBase.get_backend()
C = @visualize psi[1]*psi[2] edge_labels=(tags=true,)
println(C)


