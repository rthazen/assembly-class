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

		include	'MatchGame.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'MatchGame.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'MatchGame.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'MatchGame.consts.inc'

		include	'MatchGame.ro.inc'

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


		push	L825_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L806_matchNumber__hla_+0], eax	;/* matchNumber */

L826_input_loop__hla_:
		push	L840_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDIN_GETI32	; geti32
		mov	dword ptr [L807_userInput__hla_+0], eax	;/* userInput */
		cmp	eax, dword ptr [L806_matchNumber__hla_+0]	;/* matchNumber */
		je	L841_hit_match__hla_
		test	eax, eax
		jns	L842_positive_input__hla_
		inc	dword ptr [L809_negativeCount__hla_+0]	;/* negativeCount */
		mov	ecx, dword ptr [L811_maxNegativeStreak__hla_+0]	;/* maxNegativeStreak */
		cmp	dword ptr [L809_negativeCount__hla_+0], ecx	;/* negativeCount */
		jle	L843_continue_input__hla_
		push	dword ptr [L809_negativeCount__hla_+0]	;/* negativeCount */
		pop	dword ptr [L811_maxNegativeStreak__hla_+0]	;/* maxNegativeStreak */
		jmp	L843_continue_input__hla_

L842_positive_input__hla_:
		inc	dword ptr [L808_positiveCount__hla_+0]	;/* positiveCount */
		mov	edx, dword ptr [L810_maxPositiveStreak__hla_+0]	;/* maxPositiveStreak */
		cmp	dword ptr [L808_positiveCount__hla_+0], edx	;/* positiveCount */
		jle	L843_continue_input__hla_
		push	dword ptr [L808_positiveCount__hla_+0]	;/* positiveCount */
		pop	dword ptr [L810_maxPositiveStreak__hla_+0]	;/* maxPositiveStreak */

L843_continue_input__hla_:
		jmp	L826_input_loop__hla_

L841_hit_match__hla_:
		push	L857_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L875_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L808_positiveCount__hla_+0]	; positiveCount
		call	STDOUT_PUTI32	; puti32
		push	L889_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L809_negativeCount__hla_+0]	; negativeCount
		call	STDOUT_PUTI32	; puti32
		push	L903_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L921_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L810_maxPositiveStreak__hla_+0]	; maxPositiveStreak
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
		push	L935_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L811_maxNegativeStreak__hla_+0]	; maxNegativeStreak
		call	STDOUT_PUTI32	; puti32
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


