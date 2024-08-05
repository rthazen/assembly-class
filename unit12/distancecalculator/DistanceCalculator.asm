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

		include	'DistanceCalculator.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'DistanceCalculator.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'DistanceCalculator.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'DistanceCalculator.consts.inc'

		include	'DistanceCalculator.ro.inc'

; Code begins here:
L810_distance__hla_:
		pop	dword ptr [L811_returnAddress__hla_+0]	;/* returnAddress */
		pop	dword ptr [ebp+8]	;/* y2 */
		pop	dword ptr [ebp+12]	;/* y1 */
		pop	dword ptr [ebp+16]	;/* x2 */
		pop	dword ptr [ebp+20]	;/* x1 */
		push	dword ptr [L811_returnAddress__hla_+0]	;/* returnAddress */
		finit
		fld	dword ptr [ebp+20]	;/* x1 */
		fld	dword ptr [ebp+16]	;/* x2 */
		fsubp
		fstp	dword ptr [L812_xSubValue__hla_+0]	;/* xSubValue */
		fld	dword ptr [L812_xSubValue__hla_+0]	;/* xSubValue */
		fld	dword ptr [L812_xSubValue__hla_+0]	;/* xSubValue */
		fmulp
		fstp	dword ptr [L812_xSubValue__hla_+0]	;/* xSubValue */
		fld	dword ptr [ebp+12]	;/* y1 */
		fld	dword ptr [ebp+8]	;/* y2 */
		fsubp
		fstp	dword ptr [L813_ySubValue__hla_+0]	;/* ySubValue */
		fld	dword ptr [L813_ySubValue__hla_+0]	;/* ySubValue */
		fld	dword ptr [L813_ySubValue__hla_+0]	;/* ySubValue */
		fmulp
		fstp	dword ptr [L813_ySubValue__hla_+0]	;/* ySubValue */
		fld	dword ptr [L812_xSubValue__hla_+0]	;/* xSubValue */
		fld	dword ptr [L813_ySubValue__hla_+0]	;/* ySubValue */
		faddp
		fstp	dword ptr [L814_dist__hla_+0]	;/* dist */
		fld	dword ptr [L814_dist__hla_+0]	;/* dist */
		fsqrt
		fstp	dword ptr [L814_dist__hla_+0]	;/* dist */
		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L814_dist__hla_+0]	; dist
		push	dword 0ah
		push	dword 05h
		call	STDOUT_PUTR32	; putr32
		call	STDOUT_NEWLN	; newln
		ret
xL810_distance__hla___hla_:
;L810_distance__hla_ endp




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


		push	L842_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_x1__hla_+0]	;/* x1 */
		pop	eax
		push	L864_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L807_x2__hla_+0]	;/* x2 */
		pop	eax
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L808_y1__hla_+0]	;/* y1 */
		pop	eax
		push	L908_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L809_y2__hla_+0]	;/* y2 */
		pop	eax
		push	dword ptr [L806_x1__hla_+0]	;/* x1 */
		push	dword ptr [L807_x2__hla_+0]	;/* x2 */
		push	dword ptr [L808_y1__hla_+0]	;/* y1 */
		push	dword ptr [L809_y2__hla_+0]	;/* y2 */
		call	L810_distance__hla_
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


