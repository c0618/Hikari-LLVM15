; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -global-isel -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32,FP32
; RUN: llc  -O0 -mtriple=mipsel-linux-gnu -mattr=+fp64,+mips32r2 -global-isel -verify-machineinstrs %s -o -| FileCheck %s -check-prefixes=MIPS32,FP64

define float @i64tof32(i64 signext %a) {
; MIPS32-LABEL: i64tof32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -24
; MIPS32-NEXT:    .cfi_def_cfa_offset 24
; MIPS32-NEXT:    sw $ra, 20($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 31, -4
; MIPS32-NEXT:    jal __floatdisf
; MIPS32-NEXT:    nop
; MIPS32-NEXT:    lw $ra, 20($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    addiu $sp, $sp, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i64 %a to float
  ret float %conv
}

define float @i32tof32(i32 signext %a) {
; MIPS32-LABEL: i32tof32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    mtc1 $4, $f0
; MIPS32-NEXT:    cvt.s.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i32 %a to float
  ret float %conv
}

define float @i16tof32(i16 signext %a) {
; MIPS32-LABEL: i16tof32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 16
; MIPS32-NEXT:    sra $1, $1, 16
; MIPS32-NEXT:    mtc1 $1, $f0
; MIPS32-NEXT:    cvt.s.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i16 %a to float
  ret float %conv
}

define float @i8tof32(i8 signext %a) {
; MIPS32-LABEL: i8tof32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 24
; MIPS32-NEXT:    sra $1, $1, 24
; MIPS32-NEXT:    mtc1 $1, $f0
; MIPS32-NEXT:    cvt.s.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i8 %a to float
  ret float %conv
}

define double @i64tof64(i64 signext %a) {
; MIPS32-LABEL: i64tof64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -24
; MIPS32-NEXT:    .cfi_def_cfa_offset 24
; MIPS32-NEXT:    sw $ra, 20($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 31, -4
; MIPS32-NEXT:    jal __floatdidf
; MIPS32-NEXT:    nop
; MIPS32-NEXT:    lw $ra, 20($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    addiu $sp, $sp, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i64 %a to double
  ret double %conv
}

define double @i32tof64(i32 signext %a) {
; MIPS32-LABEL: i32tof64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    mtc1 $4, $f0
; MIPS32-NEXT:    cvt.d.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i32 %a to double
  ret double %conv
}

define double @i16tof64(i16 signext %a) {
; MIPS32-LABEL: i16tof64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 16
; MIPS32-NEXT:    sra $1, $1, 16
; MIPS32-NEXT:    mtc1 $1, $f0
; MIPS32-NEXT:    cvt.d.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i16 %a to double
  ret double %conv
}

define double @i8tof64(i8 signext %a) {
; MIPS32-LABEL: i8tof64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    sll $1, $4, 24
; MIPS32-NEXT:    sra $1, $1, 24
; MIPS32-NEXT:    mtc1 $1, $f0
; MIPS32-NEXT:    cvt.d.w $f0, $f0
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = sitofp i8 %a to double
  ret double %conv
}

define float @u64tof32(i64 zeroext %a) {
; MIPS32-LABEL: u64tof32:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -24
; MIPS32-NEXT:    .cfi_def_cfa_offset 24
; MIPS32-NEXT:    sw $ra, 20($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 31, -4
; MIPS32-NEXT:    jal __floatundisf
; MIPS32-NEXT:    nop
; MIPS32-NEXT:    lw $ra, 20($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    addiu $sp, $sp, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = uitofp i64 %a to float
  ret float %conv
}


define float @u32tof32(i32 zeroext %a) {
; FP32-LABEL: u32tof32:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    lui $1, 17200
; FP32-NEXT:    mtc1 $4, $f0
; FP32-NEXT:    mtc1 $1, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    cvt.s.d $f0, $f0
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u32tof32:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    lui $1, 17200
; FP64-NEXT:    mtc1 $4, $f0
; FP64-NEXT:    mthc1 $1, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    cvt.s.d $f0, $f0
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i32 %a to float
  ret float %conv
}

define float @u16tof32(i16 zeroext %a) {
; FP32-LABEL: u16tof32:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    andi $1, $4, 65535
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    mtc1 $1, $f0
; FP32-NEXT:    mtc1 $2, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    cvt.s.d $f0, $f0
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u16tof32:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    andi $1, $4, 65535
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    mtc1 $1, $f0
; FP64-NEXT:    mthc1 $2, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    cvt.s.d $f0, $f0
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i16 %a to float
  ret float %conv
}

define float @u8tof32(i8 zeroext %a) {
; FP32-LABEL: u8tof32:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    andi $1, $4, 255
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    mtc1 $1, $f0
; FP32-NEXT:    mtc1 $2, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    cvt.s.d $f0, $f0
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u8tof32:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    andi $1, $4, 255
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    mtc1 $1, $f0
; FP64-NEXT:    mthc1 $2, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    cvt.s.d $f0, $f0
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i8 %a to float
  ret float %conv
}

define double @u64tof64(i64 zeroext %a) {
; MIPS32-LABEL: u64tof64:
; MIPS32:       # %bb.0: # %entry
; MIPS32-NEXT:    addiu $sp, $sp, -24
; MIPS32-NEXT:    .cfi_def_cfa_offset 24
; MIPS32-NEXT:    sw $ra, 20($sp) # 4-byte Folded Spill
; MIPS32-NEXT:    .cfi_offset 31, -4
; MIPS32-NEXT:    jal __floatundidf
; MIPS32-NEXT:    nop
; MIPS32-NEXT:    lw $ra, 20($sp) # 4-byte Folded Reload
; MIPS32-NEXT:    addiu $sp, $sp, 24
; MIPS32-NEXT:    jr $ra
; MIPS32-NEXT:    nop
entry:
  %conv = uitofp i64 %a to double
  ret double %conv
}

define double @u32tof64(i32 zeroext %a) {
; FP32-LABEL: u32tof64:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    lui $1, 17200
; FP32-NEXT:    mtc1 $4, $f0
; FP32-NEXT:    mtc1 $1, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u32tof64:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    lui $1, 17200
; FP64-NEXT:    mtc1 $4, $f0
; FP64-NEXT:    mthc1 $1, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i32 %a to double
  ret double %conv
}

define double @u16tof64(i16 zeroext %a) {
; FP32-LABEL: u16tof64:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    andi $1, $4, 65535
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    mtc1 $1, $f0
; FP32-NEXT:    mtc1 $2, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u16tof64:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    andi $1, $4, 65535
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    mtc1 $1, $f0
; FP64-NEXT:    mthc1 $2, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i16 %a to double
  ret double %conv
}

define double @u8tof64(i8 zeroext %a) {
; FP32-LABEL: u8tof64:
; FP32:       # %bb.0: # %entry
; FP32-NEXT:    andi $1, $4, 255
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    mtc1 $1, $f0
; FP32-NEXT:    mtc1 $2, $f1
; FP32-NEXT:    lui $2, 17200
; FP32-NEXT:    ori $1, $zero, 0
; FP32-NEXT:    mtc1 $1, $f2
; FP32-NEXT:    mtc1 $2, $f3
; FP32-NEXT:    sub.d $f0, $f0, $f2
; FP32-NEXT:    jr $ra
; FP32-NEXT:    nop
;
; FP64-LABEL: u8tof64:
; FP64:       # %bb.0: # %entry
; FP64-NEXT:    andi $1, $4, 255
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    mtc1 $1, $f0
; FP64-NEXT:    mthc1 $2, $f0
; FP64-NEXT:    lui $2, 17200
; FP64-NEXT:    ori $1, $zero, 0
; FP64-NEXT:    mtc1 $1, $f1
; FP64-NEXT:    mthc1 $2, $f1
; FP64-NEXT:    sub.d $f0, $f0, $f1
; FP64-NEXT:    jr $ra
; FP64-NEXT:    nop
entry:
  %conv = uitofp i8 %a to double
  ret double %conv
}