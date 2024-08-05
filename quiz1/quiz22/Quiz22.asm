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

		include	'Quiz22.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'Quiz22.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'Quiz22.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'Quiz22.consts.inc'

		include	'Quiz22.ro.inc'

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


		push	L824_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_x__hla_+0], eax	;/* x */
		push	L838_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_y__hla_+0], eax	;/* y */
		mov	ebx, dword ptr [L807_y__hla_+0]	;/* y */
		cmp	dword ptr [L806_x__hla_+0], ebx	;/* x */
		jg	L839_x_is_larger__hla_
		cmp	ebx, dword ptr [L806_x__hla_+0]	;/* x */
		jg	L840_y_is_larger__hla_
		jmp	L841_continue_execution__hla_

L839_x_is_larger__hla_:
		push	dword ptr [L807_y__hla_+0]	;/* y */
		pop	dword ptr [L810_smallestValue__hla_+0]	;/* smallestValue */
		push	dword ptr [L806_x__hla_+0]	;/* x */
		pop	dword ptr [L808_first__hla_+0]	;/* first */
		push	dword ptr [L807_y__hla_+0]	;/* y */
		pop	dword ptr [L809_second__hla_+0]	;/* second */
		jmp	L841_continue_execution__hla_

L840_y_is_larger__hla_:
		push	dword ptr [L806_x__hla_+0]	;/* x */
		pop	dword ptr [L810_smallestValue__hla_+0]	;/* smallestValue */
		push	dword ptr [L807_y__hla_+0]	;/* y */
		pop	dword ptr [L808_first__hla_+0]	;/* first */
		push	dword ptr [L806_x__hla_+0]	;/* x */
		pop	dword ptr [L809_second__hla_+0]	;/* second */
		jmp	L841_continue_execution__hla_

L841_continue_execution__hla_:
		cmp	dword ptr [L808_first__hla_+0], 0	;/* first */
		jle	L842_end_program__hla_
		cmp	dword ptr [L809_second__hla_+0], 0	;/* second */
		jle	L842_end_program__hla_

L843_repeat_first__hla_:

L844_firstLoopInit__hla_:
		mov	edx, 0

L845_firstLoopTerminationCondition__hla_:
		cmp	edx, dword ptr [L810_smallestValue__hla_+0]	;/* smallestValue */
		jge	L846_repeat_second__hla_

L847_firstLoopBody__hla_:
		push	dword ptr [L808_first__hla_+0]	; (type int32 first)
		call	STDOUT_PUTI32	; puti32

L863_firstLoopIncrement__hla_:
		inc	edx
		jmp	L845_firstLoopTerminationCondition__hla_

L846_repeat_second__hla_:
		push	L877_str__hla_
		call	STDOUT_PUTS	; puts

L878_secondLoopInit__hla_:
		mov	edx, 0

L879_secondLoopTerminationCondition__hla_:
		cmp	edx, dword ptr [L810_smallestValue__hla_+0]	;/* smallestValue */
		jge	L842_end_program__hla_

L880_secondLoopBody__hla_:
		push	dword ptr [L809_second__hla_+0]	; (type int32 second)
		call	STDOUT_PUTI32	; puti32

L896_secondLoopIncrement__hla_:
		inc	edx
		jmp	L879_secondLoopTerminationCondition__hla_

L842_end_program__hla_:
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


