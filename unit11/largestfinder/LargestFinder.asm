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

		include	'LargestFinder.extpub.inc'




		section	'.data' data readable writeable align 16
		include	'LargestFinder.data.inc'

		dd	0	;dummy to keep linker happy
		section	'.bss' readable writeable align 16
		include	'LargestFinder.bss.inc'

		rb	4	;dummy to keep linker happy
		section	'.text' code readable executable align 16
		include	'LargestFinder.consts.inc'

		include	'LargestFinder.ro.inc'

; Code begins here:
L809_findLargest__hla_:
		pop	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		pop	word ptr [ebp+8]	;/* z */
		pop	word ptr [ebp+12]	;/* y */
		pop	word ptr [ebp+16]	;/* x */
		push	dword ptr [L810_iReturnAddress__hla_+0]	;/* iReturnAddress */
		mov	ax, word ptr [ebp+16]	;/* x */
		sub	ax, word ptr [ebp+12]	;/* y */
		cmp	ax, 0
		jg	L812_XisLarger__hla_
		jmp	L813_YisLarger__hla_

L812_XisLarger__hla_:
		mov	ax, word ptr [ebp+16]	;/* x */
		sub	ax, word ptr [ebp+8]	;/* z */
		cmp	ax, 0
		jg	L814_PutXinAX__hla_
		jmp	L815_PutZinAX__hla_

L813_YisLarger__hla_:
		mov	ax, word ptr [ebp+12]	;/* y */
		sub	ax, word ptr [ebp+8]	;/* z */
		cmp	ax, 0
		jg	L816_PutYinAX__hla_
		jmp	L815_PutZinAX__hla_

L814_PutXinAX__hla_:
		push	word ptr [ebp+16]	;/* x */
		pop	word ptr [L811_iMax__hla_+0]	;/* iMax */
		jmp	L817_ExitSequence__hla_

L816_PutYinAX__hla_:
		push	word ptr [ebp+12]	;/* y */
		pop	word ptr [L811_iMax__hla_+0]	;/* iMax */
		jmp	L817_ExitSequence__hla_

L815_PutZinAX__hla_:
		push	word ptr [ebp+8]	;/* z */
		pop	word ptr [L811_iMax__hla_+0]	;/* iMax */
		jmp	L817_ExitSequence__hla_

L817_ExitSequence__hla_:
		mov	ax, word ptr [L811_iMax__hla_+0]	;/* iMax */
		ret
xL809_findLargest__hla___hla_:
;L809_findLargest__hla_ endp




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


		push	L831_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L806_iValue1__hla_+0], ax	;/* iValue1 */
		pop	eax
		push	L853_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L807_iValue2__hla_+0], ax	;/* iValue2 */
		pop	eax
		push	L875_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDIN_GETI16	; geti16
		mov	word ptr [L808_iValue3__hla_+0], ax	;/* iValue3 */
		pop	eax
		push	word ptr [L806_iValue1__hla_+0]	;/* iValue1 */
		push	word ptr [L807_iValue2__hla_+0]	;/* iValue2 */
		push	word ptr [L808_iValue3__hla_+0]	;/* iValue3 */
		call	L809_findLargest__hla_
		push	L897_str__hla_
		call	STDOUT_PUTS	; puts
		push	eax
		call	STDOUT_PUTI16	; puti16
		call	STDOUT_NEWLN	; newln
QuitMain__hla_:
		push	dword 00h
		call	dword ptr [__imp__ExitProcess@4]
;_HLAMain        endp


