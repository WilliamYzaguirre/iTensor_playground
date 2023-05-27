include("./ITensorQTT.jl")
using .ITensorQTT
using ITensors
using ITensorUnicodePlots
using UnicodePlots

n = 2
s = siteinds("Qubit", n)

x₀ = 0.5
σ = 0.1
#f(x) = exp(-(x - x₀)^2 / σ^2)
#f(x) = exp(2x)
#f(x) = x
f(x) = abs(4x-2)
#f(x) = sqrt(x)
psi = @time function_to_mps(f, s, 0.0, 1.0; cutoff=.2)
println(psi) 
for i in psi
   println(i)
end
@show ITensorVisualizationBase.get_backend()
C = @visualize psi[1]*psi[2] edge_labels=(tags=true,)
println(C)

# show contraction

#@show ITensorVisualizationBase.get_backend()
#i = Index(3, "example tag")
#j = Index(5)
#k = Index(2)
#l = Index(7)

#A = ITensor(i,j,k)
#B = randomITensor(j,l)

# Set elements of A
#A[i=>1,j=>1,k=>1] = 11.1
#A[i=>2,j=>1,k=>2] = -21.2
#A[k=>1,i=>3,j=>1] = 31.1  # can provide Index values in any order
# ...
#println(A)
#println(B)
# Contract over shared index j
#C = @visualize A*B edge_labels=(tags=true,)
#println(C)

# phase mpo
#qft_3 = qft(3)
#println("QFT")
#println(qft_3)
#i = Index(3)
#j = Index(4)
#temp = [i]
#s = siteinds("Qubit", 4)
#println("Qubits")
#println(s)
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
#U = @time dft_mpo(s)
#for i in U
#   println(i)
#   println("\n")
#end
#println("\n\n\n\n\n")
#print(U)
#@show maxlinkdim(U)


