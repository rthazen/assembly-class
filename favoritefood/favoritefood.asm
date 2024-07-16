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

		include	'favoritefood.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'favoritefood.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'favoritefood.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'favoritefood.consts.inc'

		include	'favoritefood.ro.inc'

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


		push	L819_str__hla_
		call	STDOUT_PUTS	; puts
		push	L824_str__hla_
		call	STDOUT_PUTS	; puts
		push	L829_str__hla_
		call	STDOUT_PUTS	; puts
		push	L834_str__hla_
		call	STDOUT_PUTS	; puts
		push	L839_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L848_str__hla_
		call	STDOUT_PUTS	; puts
		push	L853_str__hla_
		call	STDOUT_PUTS	; puts
		push	L858_str__hla_
		call	STDOUT_PUTS	; puts
		push	L863_str__hla_
		call	STDOUT_PUTS	; puts
		push	L868_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts
		push	L882_str__hla_
		call	STDOUT_PUTS	; puts
		push	L887_str__hla_
		call	STDOUT_PUTS	; puts
		push	L892_str__hla_
		call	STDOUT_PUTS	; puts
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L906_str__hla_
		call	STDOUT_PUTS	; puts
		push	L911_str__hla_
		call	STDOUT_PUTS	; puts
		push	L916_str__hla_
		call	STDOUT_PUTS	; puts
		push	L921_str__hla_
		call	STDOUT_PUTS	; puts
		push	L926_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		push	L940_str__hla_
		call	STDOUT_PUTS	; puts
		push	L945_str__hla_
		call	STDOUT_PUTS	; puts
		push	L950_str__hla_
		call	STDOUT_PUTS	; puts
		push	L955_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


