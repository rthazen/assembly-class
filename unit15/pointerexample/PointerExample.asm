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

		include	'PointerExample.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'PointerExample.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'PointerExample.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'PointerExample.consts.inc'

		include	'PointerExample.ro.inc'

; Code begins here:
L809_swap__hla_:
		mov	dword ptr [L814_dEBXRegister__hla_+0], ebx	;/* dEBXRegister */
		mov	dword ptr [L813_dECXRegister__hla_+0], ecx	;/* dECXRegister */
		mov	dword ptr [L812_dEDXRegister__hla_+0], edx	;/* dEDXRegister */
		pop	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		pop	ebx
		pop	ecx
		push	dword ptr [L810_dReturnAddress__hla_+0]	;/* dReturnAddress */
		push	dword ptr [L812_dEDXRegister__hla_+0]	;/* dEDXRegister */
		push	dword ptr [L813_dECXRegister__hla_+0]	;/* dECXRegister */
		push	dword ptr [L814_dEBXRegister__hla_+0]	;/* dEBXRegister */
		mov	dl, [ebx+0]	;/* [ebx] */
		mov	byte ptr [L811_iTemporary__hla_+0], dl	;/* iTemporary */
		mov	dl, [ecx+0]	;/* [ecx] */
		mov	[ebx+0], dl	;/* [ebx] */
		mov	dl, byte ptr [L811_iTemporary__hla_+0]	;/* iTemporary */
		mov	[ecx+0], dl	;/* [ecx] */
		pop	ebx
		pop	ecx
		pop	edx
		ret
xL809_swap__hla___hla_:
;L809_swap__hla_ endp




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


		lea	eax, byte ptr [L806_i__hla_+0]	;/* i */
		mov	dword ptr [L808_pI__hla_+0], eax	;/* pI */
		mov	byte ptr [L806_i__hla_+0], 13	;/* i */
		mov	ebx, dword ptr [L808_pI__hla_+0]	;/* pI */
		mov	cl, 13
		mov	[ebx+0], cl	;/* [ebx] */
		push	L828_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_i__hla_+0]	; (type int8 i)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L839_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_j__hla_+0]	; (type int8 j)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
		lea	eax, byte ptr [L806_i__hla_+0]	;/* i */
		push	eax
		lea	eax, byte ptr [L807_j__hla_+0]	;/* j */
		push	eax
		call	L809_swap__hla_
		push	L863_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L806_i__hla_+0]	; (type int8 i)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		push	L874_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_j__hla_+0]	; (type int8 j)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTI8	; puti8
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


