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

		include	'BinaryOutput.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'BinaryOutput.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'BinaryOutput.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'BinaryOutput.consts.inc'

		include	'BinaryOutput.ro.inc'

; Code begins here:



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


		push	L820_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	eax
		call	STDIN_GETI8	; geti8
		mov	byte ptr [L806_iDataValue__hla_+0], al	;/* iDataValue */
		pop	eax
		mov	bh, byte ptr [L806_iDataValue__hla_+0]	;/* iDataValue */
		push	L846_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
		shl	bh, 1
		lahf
		and	ah, 1
		sub	esp, 4
		mov	byte ptr [ESP+0], ah
		call	STDOUT_PUTI8	; puti8
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


