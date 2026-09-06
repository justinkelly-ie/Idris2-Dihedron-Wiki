module Main

import QuickCheck
import Data.String
import Dihedrons_And_Infinitesimals
import Product_And_Chain_Rules
import Finite_Field_Calculus
import QuantumMechanicsAlgebra

%default covering

markdownTable : List (String, String, QCRes) -> String
markdownTable results =
  let header = "| Test | Description | Status | Details |\n|------|-------------|--------|---------|\n"
      rows = concat $ map formatRow results
  in header ++ rows
  where
    formatRow : (String, String, QCRes) -> String
    formatRow (name, desc, res) =
      let statusStr = case pass res of
                        Nothing => "❓ Unknown"
                        Just True => "✅ PASS"
                        Just False => "❌ FAIL"
      in "| " ++ name ++ " | " ++ statusStr ++ " | " ++ trim (msg res) ++ " |\n"

partial
main : IO ()
main = do
  putStrLn "Starting Idris2-Dihedron-Wiki QuickCheck Suite...\n"
  
  putStrLn "Running Test 1: Subalgebra Metric Signatures"
  let res1 = quickCheck Dihedrons_And_Infinitesimals.prop_subalgebraSignatures

  putStrLn "Running Test 2: Dual Derivative Theorem"
  let res2 = quickCheck Dihedrons_And_Infinitesimals.prop_dualDerivativeTheorem

  putStrLn "Running Test 3: Algebraic Product Rule"
  let res3 = quickCheck Product_And_Chain_Rules.prop_productRuleAlgebraic

  putStrLn "Running Test 4: Tangent Vector Readout"
  let res4 = quickCheck Finite_Field_Calculus.prop_tangentVectorReadout

  putStrLn "Running Test 5: Pauli Anti-Commutativity Law"
  let res5 = quickCheck QuantumMechanicsAlgebra.qc_pauliAntiCommutation

  putStrLn "Running Test 6: Spin-1/2 Commutator Law"
  let res6 = quickCheck QuantumMechanicsAlgebra.qc_spinCommutator

  putStrLn "Running Test 7: Blue Phase Quadrance Invariance"
  let res7 = quickCheck QuantumMechanicsAlgebra.qc_bluePhaseQuadranceInvariance

  putStrLn "Running Test 8: Monadic Feynman Path Propagator Composition"
  let res8 = quickCheck QuantumMechanicsAlgebra.qc_monadicPathBinding

  let tableStr = markdownTable [
        ("Subalgebra Signatures", "Verifies Blue, Red, Green metric quadrances.", res1),
        ("Dual Derivative Theorem", "Verifies exact derivative readout via dual complex numbers.", res2),
        ("Algebraic Product Rule", "Verifies algebraic product rule for PolyNumbers.", res3),
        ("Tangent Vector Readout", "Verifies tangent vector calculation for semi-cubical parabola.", res4),
        ("Pauli Anti-Commutativity", "Verifies Pauli ZX = -XZ anti-commutation law on discrete dihedrons.", res5),
        ("Spin-1/2 Commutator", "Verifies [i, j] = 2k spin algebra commutator law.", res6),
        ("Blue Quadrance Invariance", "Verifies exact energy/norm conservation under U(1) blue rotations.", res7),
        ("Monadic Path Binding", "Verifies monadic propagator composition (>>=) across discrete paths.", res8)
      ]

  putStrLn "\n--- Test Results ---"
  putStrLn tableStr
  putStrLn "Idris2-Dihedron-Wiki tests complete!"
