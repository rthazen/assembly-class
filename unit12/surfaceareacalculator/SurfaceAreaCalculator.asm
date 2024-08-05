; Assembly code emitted by HLA compiler
; Version 1.76 build 9932 (prototype)
; HLA compiler written by Randall Hyde
; FASM compatible output

		format	MS COFF


offset32	equ	 
ptr	equ	 

macro global [symbol]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol
   isextrn = 1
 end if
}

macro global2 [symbol,type]
{
 local isextrn
 if defined symbol & ~ defined isextrn
   public symbol
 else if used symbol
   extrn symbol:type
   isextrn = 1
 end if
}


ExceptionPtr__hla_	equ	fs:0

		include	'SurfaceAreaCalculator.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'SurfaceAreaCalculator.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'SurfaceAreaCalculator.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'SurfaceAreaCalculator.consts.inc'

		include	'SurfaceAreaCalculator.ro.inc'

; Code begins here:
L808_surfaceFinder__hla_:
		pop	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		pop	dword ptr [ebp+8]	;/* h */
		pop	dword ptr [ebp+12]	;/* r */
		push	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		finit
		fld	dword ptr [ebp+12]	;/* r */
		fld	dword ptr [ebp+12]	;/* r */
		fmulp
		fldpi
		fmulp
		fld	dword ptr [L814_four__hla_+0]	;/* four */
		fmulp
		fstp	dword ptr [L810_surfaceAreaSphere__hla_+0]	;/* surfaceAreaSphere */
		fld	dword ptr [ebp+8]	;/* h */
		fld	dword ptr [ebp+8]	;/* h */
		fmulp
		fld	dword ptr [L815_six__hla_+0]	;/* six */
		fmulp
		fstp	dword ptr [L811_surfaceAreaCube__hla_+0]	;/* surfaceAreaCube */
		fld	dword ptr [ebp+12]	;/* r */
		fld	dword ptr [ebp+12]	;/* r */
		fmulp
		fld	dword ptr [ebp+12]	;/* r */
		fld	dword ptr [ebp+8]	;/* h */
		fmulp
		faddp
		fldpi
		fmulp
		fld	dword ptr [L813_two__hla_+0]	;/* two */
		fmulp
		fstp	dword ptr [L812_surfaceAreaCylinder__hla_+0]	;/* surfaceAreaCylinder */
		push	L829_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_surfaceAreaSphere__hla_+0]	; surfaceAreaSphere
		push	dword 0ah
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L811_surfaceAreaCube__hla_+0]	; surfaceAreaCube
		push	dword 0ah
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		push	L857_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L812_surfaceAreaCylinder__hla_+0]	; surfaceAreaCylinder
		push	dword 0ah
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		ret
xL808_surfaceFinder__hla___hla_:
;L808_surfaceFinder__hla_ endp




;/* HWexcept__hla_ gets called when Windows raises the exception. */

HWexcept__hla_ :
		jmp	HardwareException__hla_
;HWexcept__hla_  endp

DfltExHndlr__hla_:
		jmp	DefaultExceptionHandler__hla_
;DfltExHndlr__hla_ endp



_HLAMain       :


;/* Set up the Structured Exception Handler record */
;/* for this program. */

		call	BuildExcepts__hla_
		pushd	0		;/* No Dynamic Link. */
		mov	ebp, esp	;/* Pointer to Main's locals */
		push	ebp		;/* Main's display. */


		push	L871_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_radius__hla_+0]	;/* radius */
		pop	eax
		push	L911_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_height__hla_+0]	;/* height */
		pop	eax
		push	dword ptr [L806_radius__hla_+0]	;/* radius */
		push	dword ptr [L807_height__hla_+0]	;/* height */
		call	L808_surfaceFinder__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


