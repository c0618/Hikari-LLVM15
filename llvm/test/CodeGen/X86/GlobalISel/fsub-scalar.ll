; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=x86_64-linux-gnu -global-isel -verify-machineinstrs < %s -o - | FileCheck %s --check-prefix=X64

define float @test_fsub_float(float %arg1, float %arg2) {
; X64-LABEL: test_fsub_float:
; X64:       # %bb.0:
; X64-NEXT:    subss %xmm1, %xmm0
; X64-NEXT:    retq
  %ret = fsub float %arg1, %arg2
  ret float %ret
}

define double @test_fsub_double(double %arg1, double %arg2) {
; X64-LABEL: test_fsub_double:
; X64:       # %bb.0:
; X64-NEXT:    subsd %xmm1, %xmm0
; X64-NEXT:    retq
  %ret = fsub double %arg1, %arg2
  ret double %ret
}
