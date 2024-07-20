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

		include	'FlightCalculator.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'FlightCalculator.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'FlightCalculator.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'FlightCalculator.consts.inc'

		include	'FlightCalculator.ro.inc'

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
		push	eax
		call	STDIN_GETB	; getb
		mov	bl, al
		pop	eax
		mov	byte ptr [L806_input__hla_+0], bl	;/* input */
		and	bl, 3
		mov	byte ptr [L809_bags__hla_+0], bl	;/* bags */
		mov	bl, byte ptr [L806_input__hla_+0]	;/* input */
		shr	bl, 2
		and	bl, 15
		mov	byte ptr [L808_miles__hla_+0], bl	;/* miles */
		mov	bl, byte ptr [L806_input__hla_+0]	;/* input */
		shr	bl, 6
		and	bl, 1
		mov	byte ptr [L810_meal__hla_+0], bl	;/* meal */
		mov	bl, byte ptr [L806_input__hla_+0]	;/* input */
		shr	bl, 7
		and	bl, 1
		mov	byte ptr [L811_firstClass__hla_+0], bl	;/* firstClass */
		cmp	byte ptr [L808_miles__hla_+0], 0	;/* miles */
		je	L834_milesZeroEerror__hla_
		mov	dword ptr [L807_totalCost__hla_+0], 0	;/* totalCost */

L835_loopAddMiles__hla_:

L836_loopAddMilesInit__hla_:
		mov	dh, 0

L837_loopAddMilesTerminationCondition__hla_:
		cmp	dh, byte ptr [L808_miles__hla_+0]	;/* miles */
		jge	L838_loopAddMilesEnd__hla_

L839_loopAddMilesBody__hla_:
		add	dword ptr [L807_totalCost__hla_+0], 50	;/* totalCost */
		mov	ecx, dword ptr [L807_totalCost__hla_+0]	;/* totalCost */

L840_loopAddMilesIncrement__hla_:
		inc	dh
		jmp	L837_loopAddMilesTerminationCondition__hla_

L838_loopAddMilesEnd__hla_:
		cmp	byte ptr [L809_bags__hla_+0], 0	;/* bags */
		je	L841_noBags__hla_
		cmp	byte ptr [L809_bags__hla_+0], 1	;/* bags */
		je	L842_oneBag__hla_

L843_loopAddBags__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_bags__hla_+0]	; (type uns8 bags)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTU8	; putu8
		push	L863_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L868_loopAddBagsInit__hla_:
		mov	dh, 0

L869_loopAddBagsTerminationCondition__hla_:
		cmp	dh, byte ptr [L809_bags__hla_+0]	;/* bags */
		jge	L870_mealCheck__hla_

L871_loopAddBagsBody__hla_:
		add	dword ptr [L807_totalCost__hla_+0], 25	;/* totalCost */
		mov	ecx, dword ptr [L807_totalCost__hla_+0]	;/* totalCost */

L872_loopAddBagsIncrement__hla_:
		inc	dh
		jmp	L869_loopAddBagsTerminationCondition__hla_

L841_noBags__hla_:
		push	L886_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L870_mealCheck__hla_

L842_oneBag__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L809_bags__hla_+0]	; (type uns8 bags)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTU8	; putu8
		push	L910_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L870_mealCheck__hla_:
		cmp	byte ptr [L810_meal__hla_+0], 0	;/* meal */
		je	L915_noMeal__hla_
		add	dword ptr [L807_totalCost__hla_+0], 10	;/* totalCost */
		mov	ecx, dword ptr [L807_totalCost__hla_+0]	;/* totalCost */
		push	L929_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L934_firstClassCheck__hla_

L915_noMeal__hla_:
		push	L948_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L934_firstClassCheck__hla_

L934_firstClassCheck__hla_:
		cmp	byte ptr [L811_firstClass__hla_+0], 0	;/* firstClass */
		je	L953_noFirstClass__hla_
		shl	dword ptr [L807_totalCost__hla_+0], 1	;/* totalCost */
		mov	ecx, dword ptr [L807_totalCost__hla_+0]	;/* totalCost */
		push	L967_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L972_addUp__hla_

L953_noFirstClass__hla_:
		push	L986_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		jmp	L972_addUp__hla_

L972_addUp__hla_:
		push	dword 00h
		push	eax
		mov	al, byte ptr [L808_miles__hla_+0]	; (type uns8 miles)
		mov	byte ptr [ESP+4], al
		pop	eax
		call	STDOUT_PUTU8	; putu8
		push	L1010_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln
		push	L1028_str__hla_
		call	STDOUT_PUTS	; puts
		push	dword ptr [L807_totalCost__hla_+0]	; (type uns32 totalCost)
		call	STDOUT_PUTU32	; putu32
		call	STDOUT_NEWLN	; newln
		jmp	L1039_endProgram__hla_

L834_milesZeroEerror__hla_:
		push	L1053_str__hla_
		call	STDOUT_PUTS	; puts
		call	STDOUT_NEWLN	; newln

L1039_endProgram__hla_:
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


