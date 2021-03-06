@testset "Testing FPS-solver" begin
  @testset "$foo with 1st approximation" for foo in [
    unconstrained_nlp,
    bound_constrained_nlp, # Problem Extended Rosenbrock: very close to 1 but not exactly
    equality_constrained_nlp, # all but one, which is solved but lead to another solution.
  ]
    foo(nlp -> fps_solve(nlp, nlp.meta.x0, hessian_approx = Val(1)))
  end

  @testset "$foo with 2nd approximation" for foo in [
    unconstrained_nlp,
    bound_constrained_nlp, # Problem Extended Rosenbrock: very close to 1 but not exactly
    equality_constrained_nlp, # all but one, which is solved but lead to another solution.
  ]
    foo(nlp -> fps_solve(nlp, nlp.meta.x0, hessian_approx = Val(2)))
  end

  @testset "Multiprecision tests with 1st approximation" begin
    for ptype in [:unc, :bnd, :equ, :ineq, :eqnbnd, :gen]
      # multiprecision_nlp((nlp; kwargs...) -> fps_solve(nlp, nlp.meta.x0, hessian_approx = Val(1); kwargs...), ptype)
    end
  end
  @testset "Multiprecision tests with 2nd approximation" begin
    for ptype in [:unc, :bnd, :equ, :ineq, :eqnbnd, :gen]
      # multiprecision_nlp((nlp; kwargs...) -> fps_solve(nlp, nlp.meta.x0, hessian_approx = Val(2); kwargs...), ptype)
    end
  end
end
