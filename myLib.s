	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.arm
	.syntax divided
	.file	"myLib.c"
	.text
	.align	2
	.global	setPixel3
	.type	setPixel3, %function
setPixel3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L2
	rsb	r0, r0, r0, lsl #4
	add	r1, r1, r0, lsl #4
	ldr	r3, [r3]
	mov	r1, r1, asl #1
	strh	r2, [r3, r1]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	setPixel3, .-setPixel3
	.align	2
	.global	drawRect3
	.type	drawRect3, %function
drawRect3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	cmp	r2, #0
	bxle	lr
	stmfd	sp!, {r4, lr}
	ldr	r4, .L12
	add	r2, r0, r2
	rsb	r2, r2, r2, lsl #4
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [r4]
	add	lr, r1, r2, lsl #4
	sub	sp, sp, #8
	add	r1, r1, r0, lsl #4
	ldr	r2, [r4, #4]
	orr	r3, r3, #-2130706432
	add	lr, ip, lr, lsl #1
	add	r1, ip, r1, lsl #1
	add	r0, sp, #6
.L6:
	str	r0, [r2, #36]
	str	r1, [r2, #40]
	add	r1, r1, #480
	cmp	lr, r1
	str	r3, [r2, #44]
	bne	.L6
	add	sp, sp, #8
	@ sp needed
	ldmfd	sp!, {r4, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawRect3, .-drawRect3
	.align	2
	.global	drawImage3
	.type	drawImage3, %function
drawImage3:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	cmp	r3, #0
	ldr	r4, [sp, #12]
	ble	.L14
	ldr	r5, .L20
	add	r3, r1, r3
	ldr	ip, [r5]
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	lr, r2, r3, lsl #4
	add	r2, r2, r1, lsl #4
	ldr	r3, [r5, #4]
	add	lr, ip, lr, lsl #1
	add	r2, ip, r2, lsl #1
	mov	r1, r4, asl #1
	orr	ip, r4, #-2147483648
.L16:
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	add	r2, r2, #480
	cmp	lr, r2
	str	ip, [r3, #44]
	add	r0, r0, r1
	bne	.L16
.L14:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LANCHOR0
	.size	drawImage3, .-drawImage3
	.align	2
	.global	fillScreen3
	.type	fillScreen3, %function
fillScreen3:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L24
	sub	sp, sp, #8
	ldmia	r2, {r2, r3}
	ldr	r1, .L24+4
	add	r0, sp, #6
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LANCHOR0
	.word	-2130668032
	.size	fillScreen3, .-fillScreen3
	.align	2
	.global	setPixel4
	.type	setPixel4, %function
setPixel4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	ip, .L29
	add	r3, r1, r1, lsr #31
	mov	r3, r3, asr #1
	rsb	r0, r0, r0, lsl #4
	ldr	ip, [ip]
	add	r0, r3, r0, lsl #3
	mov	r0, r0, asl #1
	ldrh	r3, [ip, r0]
	tst	r1, #1
	biceq	r3, r3, #255
	andne	r3, r3, #255
	orreq	r3, r3, r2
	orrne	r2, r3, r2, asl #8
	streqh	r3, [ip, r0]	@ movhi
	strneh	r2, [ip, r0]	@ movhi
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	setPixel4, .-setPixel4
	.align	2
	.global	drawRect4
	.type	drawRect4, %function
drawRect4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	sub	sp, sp, #36
	ldrb	ip, [sp, #72]	@ zero_extendqisi2
	mov	fp, ip, asl #8
	subs	r10, r2, #0
	orr	r2, ip, fp
	str	ip, [sp, #16]
	strh	r2, [sp, #30]	@ movhi
	ble	.L31
	add	r7, r1, #1
	ldr	lr, .L45
	add	r5, r1, r1, lsr #31
	rsb	r0, r0, r0, lsl #4
	add	r7, r7, r7, lsr #31
	ldr	r4, [lr]
	mov	r5, r5, asr #1
	mov	r0, r0, asl #3
	mov	r7, r7, asr #1
	add	r2, r7, r0
	add	r6, r3, r3, lsr #31
	add	r0, r5, r0
	rsb	r7, r7, r7, lsl #31
	mov	r9, r3, lsr #31
	add	r8, r3, r1
	mov	r6, r6, asr #1
	mov	r7, r7, asl #1
	add	r2, r4, r2, lsl #1
	add	r4, r4, r0, lsl #1
	rsb	r0, r5, r5, lsl #31
	sub	r8, r8, #1
	add	r3, r3, r9
	str	r7, [sp, #4]
	mov	r7, r0, asl #1
	sub	r0, r6, #1
	and	r3, r3, #1
	str	r7, [sp, #20]
	orr	r7, r0, #-2130706432
	add	r0, r8, r8, lsr #31
	orr	r6, r6, #-2130706432
	rsb	r3, r9, r3
	bic	r9, r0, #1
	and	r0, r8, #1
	mov	ip, #0
	ldr	lr, [lr, #4]
	mov	r5, r5, asl #1
	str	r7, [sp, #12]
	and	r1, r1, #1
	str	r0, [sp, #8]
	add	r8, sp, #30
	str	r6, [sp]
	b	.L38
.L43:
	ldr	r0, [sp]
	cmp	r3, #1
	str	r8, [lr, #36]
	str	r4, [lr, #40]
	str	r0, [lr, #44]
	beq	.L42
.L34:
	add	ip, ip, #1
	cmp	r10, ip
	add	r2, r2, #240
	add	r4, r4, #240
	beq	.L31
.L38:
	cmp	r1, #0
	beq	.L43
	ldr	r0, [sp, #4]
	add	r0, r2, r0
	ldrb	r7, [r0, r5]	@ zero_extendqisi2
	cmp	r3, #1
	orr	r7, r7, fp
	strh	r7, [r0, r5]	@ movhi
	beq	.L44
	ldr	r7, [sp, #8]
	ldr	r6, [sp, #12]
	cmp	r7, #0
	ldrh	r7, [r0, r9]
	str	r8, [lr, #36]
	str	r2, [lr, #40]
	str	r6, [lr, #44]
	ldreq	r6, [sp, #16]
	biceq	r7, r7, #255
	andne	r7, r7, #255
	orreq	r7, r7, r6
	orrne	r7, fp, r7
	strh	r7, [r0, r9]	@ movhi
	b	.L34
.L42:
	ldr	r0, [sp, #8]
	cmp	r0, #0
	ldr	r0, [sp, #20]
	add	r7, r4, r0
	ldrh	r0, [r7, r9]
	ldreq	r6, [sp, #16]
	biceq	r0, r0, #255
	andne	r0, r0, #255
	orreq	r0, r0, r6
	orrne	r0, r0, fp
	strh	r0, [r7, r9]	@ movhi
	b	.L34
.L44:
	ldr	r0, [sp]
	str	r8, [lr, #36]
	str	r2, [lr, #40]
	str	r0, [lr, #44]
	b	.L34
.L31:
	add	sp, sp, #36
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L46:
	.align	2
.L45:
	.word	.LANCHOR0
	.size	drawRect4, .-drawRect4
	.align	2
	.global	fillScreen4
	.type	fillScreen4, %function
fillScreen4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L49
	sub	sp, sp, #8
	ldmia	r2, {r2, r3}
	ldr	r1, .L49+4
	add	r0, sp, #6
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	add	sp, sp, #8
	@ sp needed
	bx	lr
.L50:
	.align	2
.L49:
	.word	.LANCHOR0
	.word	-2130687232
	.size	fillScreen4, .-fillScreen4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L52
	ldr	r1, .L52+4
	ldmia	r2, {r2, r3}
	str	r0, [r3, #36]
	str	r2, [r3, #40]
	str	r1, [r3, #44]
	bx	lr
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.word	-2147464448
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	tst	r2, #1
	stmfd	sp!, {r4, r5, lr}
	addne	r2, r2, #1
	cmp	r3, #0
	ldr	ip, [sp, #12]
	ble	.L54
	ldr	r5, .L64
	add	r3, r1, r3
	add	r2, r2, r2, lsr #31
	ldr	r4, [r5]
	mov	r2, r2, asr #1
	rsb	r3, r3, r3, lsl #4
	rsb	r1, r1, r1, lsl #4
	add	ip, ip, ip, lsr #31
	add	lr, r2, r3, lsl #3
	mov	ip, ip, asr #1
	add	r2, r2, r1, lsl #3
	ldr	r1, [r5, #4]
	add	r3, r4, r2, lsl #1
	add	lr, r4, lr, lsl #1
	mov	r2, ip, asl #1
	orr	r4, ip, #-2147483648
.L57:
	str	r0, [r1, #36]
	str	r3, [r1, #40]
	add	r3, r3, #240
	cmp	lr, r3
	str	r4, [r1, #44]
	add	r0, r0, r2
	bne	.L57
.L54:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawSubImage4
	.type	drawSubImage4, %function
drawSubImage4:
	@ Function supports interworking.
	@ args = 12, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}
	ldr	ip, [sp, #12]
	add	r4, sp, #16
	tst	r2, #1
	ldmia	r4, {r4, lr}
	addne	r2, r2, #1
	tst	ip, #1
	addne	ip, ip, #1
	cmp	r4, #0
	ble	.L66
	add	lr, lr, lr, lsr #31
	add	r2, r2, r2, lsr #31
	mov	lr, lr, asr #1
	mov	r2, r2, asr #1
	mla	r1, lr, r1, r2
	ldr	r2, .L80
	add	r4, r3, r4
	add	ip, ip, ip, lsr #31
	mov	ip, ip, asr #1
	rsb	r5, r4, r4, lsl #4
	rsb	r3, r3, r3, lsl #4
	ldr	r4, [r2]
	add	r3, ip, r3, lsl #3
	add	r5, ip, r5, lsl #3
	ldr	r2, [r2, #4]
	add	r0, r0, r1, lsl #1
	add	r3, r4, r3, lsl #1
	add	ip, r4, r5, lsl #1
	mov	r1, lr, asl #1
	orr	r4, lr, #-2147483648
.L70:
	str	r0, [r2, #36]
	str	r3, [r2, #40]
	add	r3, r3, #240
	cmp	ip, r3
	str	r4, [r2, #44]
	add	r0, r0, r1
	bne	.L70
.L66:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L81:
	.align	2
.L80:
	.word	.LANCHOR0
	.size	drawSubImage4, .-drawSubImage4
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #83886080
	ldr	r3, .L83
	ldr	r2, .L83+4
	ldr	r3, [r3, #4]
	str	r0, [r3, #36]
	str	r1, [r3, #40]
	str	r2, [r3, #44]
	bx	lr
.L84:
	.align	2
.L83:
	.word	.LANCHOR0
	.word	-2147483392
	.size	loadPalette, .-loadPalette
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L87
	str	lr, [sp, #-4]!
	add	r0, r0, r0, lsl #1
	ldr	lr, [ip, #4]
	mov	r0, r0, asl #2
	add	ip, lr, r0
	orr	r3, r3, #-2147483648
	str	r1, [lr, r0]
	str	r2, [ip, #4]
	ldr	lr, [sp], #4
	str	r3, [ip, #8]
	bx	lr
.L88:
	.align	2
.L87:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L90:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L90
	mov	r2, #67108864
.L92:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L92
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
	ldrh	r3, [r2]
	ldr	r1, .L98
	tst	r3, #16
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r3, r3, #16
	orreq	r3, r3, #16
	strh	r3, [r2]	@ movhi
	str	r0, [r1]
	bx	lr
.L99:
	.align	2
.L98:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	dma
	.global	backBuffer
	.global	frontBuffer
	.global	videoBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 45) 5.3.0"
