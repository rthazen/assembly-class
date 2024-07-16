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

		include	'Quiz21.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Quiz21.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Quiz21.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Quiz21.consts.inc'

		include	'Quiz21.ro.inc'

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


		push	L826_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_x__hla_+0], eax	;/* x */
		mov	dword ptr [L806_xHold__hla_+0], eax	;/* xHold */
		push	L840_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L808_y__hla_+0], eax	;/* y */
		add	dword ptr [L807_x__hla_+0], 1	;/* x */
		push	dword ptr [L807_x__hla_+0]	;/* x */
		pop	dword ptr [L809_answer1__hla_+0]	;/* answer1 */
		add	dword ptr [L807_x__hla_+0], 1	;/* x */
		push	dword ptr [L807_x__hla_+0]	;/* x */
		pop	dword ptr [L810_answer2__hla_+0]	;/* answer2 */
		add	dword ptr [L808_y__hla_+0], 1	;/* y */
		push	dword ptr [L808_y__hla_+0]	;/* y */
		pop	dword ptr [L811_answer3__hla_+0]	;/* answer3 */
		add	dword ptr [L808_y__hla_+0], 1	;/* y */
		push	dword ptr [L808_y__hla_+0]	;/* y */
		pop	dword ptr [L812_answer4__hla_+0]	;/* answer4 */
		push	dword ptr [L809_answer1__hla_+0]	; (type int32 answer1)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L810_answer2__hla_+0]	; (type int32 answer2)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		mov	ebx, dword ptr [L811_answer3__hla_+0]	;/* answer3 */
		cmp	ebx, dword ptr [L806_xHold__hla_+0]	;/* xHold */
		je	L879_skip_answer4__hla_
		push	dword ptr [L811_answer3__hla_+0]	; (type int32 answer3)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	dword ptr [L812_answer4__hla_+0]	; (type int32 answer4)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		jmp	L918_end_printing__hla_

L879_skip_answer4__hla_:
		push	dword ptr [L811_answer3__hla_+0]	; (type int32 answer3)
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln

L918_end_printing__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


