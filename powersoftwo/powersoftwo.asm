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

		include	'powersoftwo.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'powersoftwo.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'powersoftwo.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'powersoftwo.consts.inc'

		include	'powersoftwo.ro.inc'

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


		push	L821_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
		push	L843_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iExponent__hla_+0]	; (type int32 iExponent)
		push	dword 01h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L854_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iPwrOf2__hla_+0]	; (type int32 iPwrOf2)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		mov	eax, dword ptr [L806_iPwrOf2__hla_+0]	;/* iPwrOf2 */
		add	eax, eax
		mov	dword ptr [L806_iPwrOf2__hla_+0], eax	;/* iPwrOf2 */
		mov	ebx, dword ptr [L807_iExponent__hla_+0]	;/* iExponent */
		add	ebx, 1
		mov	dword ptr [L807_iExponent__hla_+0], ebx	;/* iExponent */
		push	L878_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iExponent__hla_+0]	; (type int32 iExponent)
		push	dword 01h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iPwrOf2__hla_+0]	; (type int32 iPwrOf2)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		mov	eax, dword ptr [L806_iPwrOf2__hla_+0]	;/* iPwrOf2 */
		add	eax, eax
		mov	dword ptr [L806_iPwrOf2__hla_+0], eax	;/* iPwrOf2 */
		mov	ebx, dword ptr [L807_iExponent__hla_+0]	;/* iExponent */
		add	ebx, 1
		mov	dword ptr [L807_iExponent__hla_+0], ebx	;/* iExponent */
		push	L913_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iExponent__hla_+0]	; (type int32 iExponent)
		push	dword 01h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L924_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iPwrOf2__hla_+0]	; (type int32 iPwrOf2)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		mov	eax, dword ptr [L806_iPwrOf2__hla_+0]	;/* iPwrOf2 */
		add	eax, eax
		mov	dword ptr [L806_iPwrOf2__hla_+0], eax	;/* iPwrOf2 */
		mov	ebx, dword ptr [L807_iExponent__hla_+0]	;/* iExponent */
		add	ebx, 1
		mov	dword ptr [L807_iExponent__hla_+0], ebx	;/* iExponent */
		push	L948_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_iExponent__hla_+0]	; (type int32 iExponent)
		push	dword 01h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		push	L959_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L806_iPwrOf2__hla_+0]	; (type int32 iPwrOf2)
		push	dword 02h
		push	dword 020h
		call	STDOUT_PUTI32SIZE	; puti32Size
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


