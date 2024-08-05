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

		include	'TaxTierCalculator.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'TaxTierCalculator.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'TaxTierCalculator.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'TaxTierCalculator.consts.inc'

		include	'TaxTierCalculator.ro.inc'

; Code begins here:
L808_irs__hla_ :
		pop	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		pop	dword ptr [ebp+8]	;/* income */
		push	dword ptr [L809_returnAddress__hla_+0]	;/* returnAddress */
		finit
		fld	dword ptr [L810_TIER_A__hla_+0]	;/* TIER_A */
		fld	dword ptr [ebp+8]	;/* income */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L815_yesTierA__hla_
		fld	dword ptr [L811_TIER_B__hla_+0]	;/* TIER_B */
		fld	dword ptr [ebp+8]	;/* income */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L816_yesTierB__hla_
		fld	dword ptr [L812_TIER_C__hla_+0]	;/* TIER_C */
		fld	dword ptr [ebp+8]	;/* income */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L817_yesTierC__hla_
		fld	dword ptr [L813_TIER_D__hla_+0]	;/* TIER_D */
		fld	dword ptr [ebp+8]	;/* income */
		fcomp
		fstsw	ax
		sahf
		setb	al
		cmp	al, 1
		je	L818_yesTierD__hla_
		jmp	L819_yesTierE__hla_

L815_yesTierA__hla_:
		mov	al, 65
		jmp	L820_end_irs__hla_

L816_yesTierB__hla_:
		mov	al, 66
		jmp	L820_end_irs__hla_

L817_yesTierC__hla_:
		mov	al, 67
		jmp	L820_end_irs__hla_

L818_yesTierD__hla_:
		mov	al, 68
		jmp	L820_end_irs__hla_

L819_yesTierE__hla_:
		mov	al, 69
		jmp	L820_end_irs__hla_

L820_end_irs__hla_:
		ret
xL808_irs__hla___hla_:
;L808_irs__hla_  endp




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


		push	L834_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETF	; getf
		fstp	dword ptr [L806_income__hla_+0]	;/* income */
		pop	eax
		push	dword ptr [L806_income__hla_+0]	;/* income */
		call	L808_irs__hla_
		mov	byte ptr [L807_tier_code__hla_+0], al	;/* tier_code */
		push	L856_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword 00h
		push	eax
		mov	al, byte ptr [L807_tier_code__hla_+0]	; tier_code
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTC	; putc
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


