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
	.file	"main.c"
	.text
	.align	2
	.global	setupSounds
	.type	setupSounds, %function
setupSounds:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r0, #128
	mov	r1, #0
	ldr	r2, .L2
	strh	r0, [r3, #132]	@ movhi
	strh	r1, [r3, #128]	@ movhi
	strh	r2, [r3, #130]	@ movhi
	bx	lr
.L3:
	.align	2
.L2:
	.word	-1266
	.size	setupSounds, .-setupSounds
	.align	2
	.global	setupInterrupts
	.type	setupInterrupts, %function
setupInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r0, #67108864
	stmfd	sp!, {r4, lr}
	mov	r4, #1
	ldr	r3, .L6
	ldrh	r1, [r0, #4]
	ldrh	r2, [r3]
	ldr	lr, .L6+4
	ldr	ip, .L6+8
	orr	r2, r2, r4
	orr	r1, r1, #8
	strh	r1, [r0, #4]	@ movhi
	strh	r4, [r3, #8]	@ movhi
	strh	r2, [r3]	@ movhi
	str	lr, [ip, #4092]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	.align	2
.L6:
	.word	67109376
	.word	interruptHandler
	.word	50360320
	.size	setupInterrupts, .-setupInterrupts
	.global	__aeabi_i2d
	.global	__aeabi_dmul
	.global	__aeabi_ddiv
	.global	__aeabi_d2iz
	.global	__aeabi_idiv
	.align	2
	.global	playSoundA
	.type	playSoundA, %function
playSoundA:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, r0
	mov	r6, #0
	mov	r10, #1
	ldr	r4, .L10+8
	ldr	r5, .L10+12
	str	fp, [r4]
	str	r2, [r4, #8]
	str	r10, [r4, #12]
	str	r6, [r4, #28]
	str	r1, [r4, #4]
	mov	r0, r1
	mov	r7, r2
	ldr	r8, .L10+16
	mov	lr, pc
	bx	r5
	adr	r3, .L10
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r7
	mov	r9, r1
	mov	lr, pc
	bx	r5
	ldr	r5, .L10+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L10+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L10+28
	ldr	r3, [r3]
	ldr	r5, .L10+32
	str	r0, [r4, #20]
	mov	r1, fp
	mov	r0, r10
	str	r6, [r3, #20]
	ldr	r2, .L10+36
	mov	r3, #910163968
	ldr	r4, .L10+40
	mov	lr, pc
	bx	r4
	mov	r1, r7
	strh	r6, [r5, #2]	@ movhi
	ldr	r3, .L10+44
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r5]	@ movhi
	strh	r3, [r5, #2]	@ movhi
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L11:
	.align	3
.L10:
	.word	1443109011
	.word	1078844686
	.word	soundA
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	dma
	.word	67109120
	.word	67109024
	.word	DMANow
	.word	__aeabi_idiv
	.size	playSoundA, .-playSoundA
	.align	2
	.global	playSoundB
	.type	playSoundB, %function
playSoundB:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r3, #1
	mov	r10, r0
	mov	r6, #0
	ldr	r4, .L14+8
	ldr	r5, .L14+12
	str	r10, [r4]
	str	r2, [r4, #8]
	str	r3, [r4, #12]
	str	r6, [r4, #28]
	str	r1, [r4, #4]
	mov	r0, r1
	mov	r7, r2
	ldr	r8, .L14+16
	mov	lr, pc
	bx	r5
	adr	r3, .L14
	ldmia	r3, {r2-r3}
	mov	lr, pc
	bx	r8
	mov	r8, r0
	mov	r0, r7
	mov	r9, r1
	mov	lr, pc
	bx	r5
	ldr	r5, .L14+20
	mov	r2, r0
	mov	r3, r1
	mov	r0, r8
	mov	r1, r9
	mov	lr, pc
	bx	r5
	ldr	r3, .L14+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L14+28
	ldr	r3, [r3]
	ldr	r5, .L14+32
	str	r0, [r4, #20]
	mov	r1, r10
	str	r6, [r3, #32]
	ldr	r2, .L14+36
	mov	r3, #910163968
	mov	r0, #2
	ldr	r4, .L14+40
	mov	lr, pc
	bx	r4
	mov	r1, r7
	strh	r6, [r5, #6]	@ movhi
	ldr	r3, .L14+44
	mov	r0, #16777216
	mov	lr, pc
	bx	r3
	mov	r3, #128
	rsb	r0, r0, #0
	mov	r0, r0, asl #16
	mov	r0, r0, lsr #16
	strh	r0, [r5, #4]	@ movhi
	strh	r3, [r5, #6]	@ movhi
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L15:
	.align	3
.L14:
	.word	1443109011
	.word	1078844686
	.word	soundB
	.word	__aeabi_i2d
	.word	__aeabi_dmul
	.word	__aeabi_ddiv
	.word	__aeabi_d2iz
	.word	dma
	.word	67109120
	.word	67109028
	.word	DMANow
	.word	__aeabi_idiv
	.size	playSoundB, .-playSoundB
	.align	2
	.global	interruptHandler
	.type	interruptHandler, %function
interruptHandler:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	ldr	r3, .L38
	ldrh	r1, [r3, #2]
	tst	r1, #1
	strh	r2, [r3, #8]	@ movhi
	beq	.L34
	stmfd	sp!, {r4, lr}
	ldr	r4, .L38+4
	ldr	r3, [r4, #12]
	cmp	r3, r2
	beq	.L18
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	blt	.L19
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L36
	ldr	r0, .L38+8
	ldr	r1, .L38+12
	ldr	r0, [r0]
	str	r2, [r4, #12]
	str	r2, [r0, #20]
	strh	r2, [r1, #2]	@ movhi
.L19:
	add	r3, r3, #1
	str	r3, [r4, #28]
.L18:
	ldr	r4, .L38+16
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L21
	ldr	r3, [r4, #28]
	ldr	r2, [r4, #20]
	cmp	r3, r2
	blt	.L22
	ldr	r2, [r4, #16]
	cmp	r2, #0
	bne	.L37
	ldr	r0, .L38+8
	ldr	r1, .L38+12
	ldr	r0, [r0]
	str	r2, [r4, #12]
	str	r2, [r0, #32]
	strh	r2, [r1, #6]	@ movhi
.L22:
	add	r3, r3, #1
	str	r3, [r4, #28]
.L21:
	mov	r2, #1
	ldr	r3, .L38
	strh	r2, [r3, #2]	@ movhi
	mov	r2, #1
	ldr	r3, .L38
	ldmfd	sp!, {r4, lr}
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L34:
	mov	r2, #1
	ldr	r3, .L38
	strh	r2, [r3, #8]	@ movhi
	bx	lr
.L36:
	ldmia	r4, {r0, r1, r2}
	bl	playSoundA
	ldr	r3, [r4, #28]
	b	.L19
.L37:
	ldmia	r4, {r0, r1, r2}
	bl	playSoundB
	ldr	r3, [r4, #28]
	b	.L22
.L39:
	.align	2
.L38:
	.word	67109376
	.word	soundA
	.word	dma
	.word	67109120
	.word	soundB
	.size	interruptHandler, .-interruptHandler
	.align	2
	.global	pauseSound
	.type	pauseSound, %function
pauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r2, .L41
	ldr	r0, .L41+4
	ldr	r1, .L41+8
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L42:
	.align	2
.L41:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pauseSound, .-pauseSound
	.align	2
	.global	unpauseSound
	.type	unpauseSound, %function
unpauseSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r1, #128
	mov	r3, #1
	ldr	r2, .L44
	ldr	ip, .L44+4
	ldr	r0, .L44+8
	strh	r1, [r2, #2]	@ movhi
	str	r3, [ip, #12]
	strh	r1, [r2, #6]	@ movhi
	str	r3, [r0, #12]
	bx	lr
.L45:
	.align	2
.L44:
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseSound, .-unpauseSound
	.align	2
	.global	stopSound
	.type	stopSound, %function
stopSound:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r1, .L47
	ldr	r2, .L47+4
	ldr	r1, [r1]
	ldr	ip, .L47+8
	ldr	r0, .L47+12
	str	r3, [r1, #20]
	str	r3, [ip, #12]
	strh	r3, [r2, #2]	@ movhi
	str	r3, [r0, #12]
	str	r3, [r1, #32]
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L48:
	.align	2
.L47:
	.word	dma
	.word	67109120
	.word	soundA
	.word	soundB
	.size	stopSound, .-stopSound
	.align	2
	.global	initialize
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	mov	r4, #1
	ldr	r3, .L51
	ldr	r2, .L51+4
	ldr	r1, .L51+8
	ldr	r0, .L51+12
	str	r4, [r3, #16]
	bl	playSoundA
	mov	r2, #67108864
	mov	r0, #6912
	mov	ip, #768
	mov	r3, #0
	ldr	r1, .L51+16
	strh	r0, [r2, #8]	@ movhi
	strh	r1, [r2, #10]	@ movhi
	ldr	r0, .L51+20
	ldr	r7, [r2, #304]
	ldr	r1, .L51+24
	strh	ip, [r2]	@ movhi
	ldr	r5, .L51+28
	str	r4, [r0]
	str	r7, [r1]
	ldr	lr, .L51+32
	ldr	ip, .L51+36
	ldr	r0, .L51+40
	ldr	r1, .L51+44
	ldr	r2, .L51+48
	ldr	r6, .L51+52
	str	r3, [r5]
	ldr	r4, .L51+56
	ldr	r5, .L51+60
	str	r3, [lr]
	str	r3, [ip]
	ldr	lr, .L51+64
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	ldr	ip, .L51+68
	ldr	r0, .L51+72
	ldr	r1, .L51+76
	ldr	r2, .L51+80
	str	r3, [r6]
	str	r3, [r5]
	str	r3, [r4]
	str	r3, [lr]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L52:
	.align	2
.L51:
	.word	soundA
	.word	11025
	.word	194202
	.word	Oniku_Loop
	.word	7684
	.word	level
	.word	buttons
	.word	hOff
	.word	count
	.word	count3
	.word	spriteCount
	.word	timePlayed
	.word	autoPilot
	.word	vOff
	.word	Bg0TempV
	.word	Bg0TempH
	.word	Bg1TempH
	.word	Bg1TempV
	.word	checkCollisionsLvl2
	.word	checkCollisionsLvl3
	.word	checkCollisionsLvl4
	.size	initialize, .-initialize
	.align	2
	.global	initSplash
	.type	initSplash, %function
initSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r2, .L55
	ldr	r1, .L55+4
	ldr	r0, .L55+8
	bl	playSoundB
	ldr	r0, .L55+12
	ldr	r3, .L55+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L55+20
	ldr	r3, .L55+24
	mov	r2, #100663296
	ldr	r1, .L55+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L55+32
	ldr	r1, .L55+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #0
	ldr	r2, .L55+40
	ldr	r3, [r2]
	ldr	r1, .L55+44
	add	r3, r3, #3
	str	r3, [r2]
	str	r0, [r1]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	11025
	.word	11944
	.word	levelup
	.word	splashPal
	.word	loadPalette
	.word	DMANow
	.word	6544
	.word	splashTiles
	.word	100718592
	.word	splashMap
	.word	seed
	.word	state
	.size	initSplash, .-initSplash
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	lr, #4864
	mov	r5, #1
	ldr	ip, .L79
	ldr	r8, .L79+4
	ldr	r0, .L79+8
	ldr	r7, .L79+12
	ldr	r1, .L79+16
	ldr	r2, .L79+20
	sub	sp, sp, #12
	str	r4, [r8]
	str	r5, [r0]
	strh	lr, [r3]	@ movhi
	strh	r7, [r3, #8]	@ movhi
	ldr	r0, .L79+24
	strh	ip, [r3, #10]	@ movhi
	ldr	r3, .L79+28
	ldr	r7, .L79+32
	str	r4, [r1]
	str	r4, [r2]
	mov	lr, pc
	bx	r3
	ldr	r3, .L79+36
	ldr	r2, .L79+40
	ldr	r1, .L79+44
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r2, .L79+48
	ldr	r1, .L79+52
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r2, .L79+56
	ldr	r1, .L79+60
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #1024
	ldr	r2, .L79+64
	ldr	r1, .L79+68
	mov	r0, #3
	mov	lr, pc
	bx	r7
	mov	r3, #16384
	ldr	r2, .L79+72
	ldr	r1, .L79+76
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r1, .L79+80
	mov	r3, #256
	ldr	r2, .L79+84
	mov	r0, #3
	mov	lr, pc
	bx	r7
	ldr	r2, .L79+88
	ldr	r3, .L79+92
	ldr	r0, [r2]
	mov	lr, pc
	bx	r3
	mov	lr, #100
	mov	r8, #90
	mov	r10, #3
	mov	ip, #5
	ldr	fp, .L79+96
	ldr	r9, .L79+100
	ldr	r1, [fp]
	ldr	r0, .L79+104
	ldr	r2, [r9]
	add	r1, r1, lr
	str	r1, [r0, #20]
	ldr	r1, .L79+108
	add	r2, r2, r8
	ldr	r3, .L79+112
	str	r4, [r1]
	str	r2, [r0, #16]
	str	r8, [r0]
	ldr	r2, .L79+116
	str	r4, [r1, #16]
	str	r4, [r1, #20]
	str	r4, [r1, #8]
	str	r4, [r1, #12]
	str	r4, [r1, #4]
	str	r4, [r1, #28]
	str	r4, [r1, #32]
	str	r4, [r1, #24]
	ldr	r8, .L79+120
	ldr	r1, .L79+124
	str	r4, [r0, #8]
	str	r4, [r0, #28]
	str	r4, [r0, #32]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #24]
	str	r4, [r2, #16]
	str	r4, [r2, #20]
	str	r5, [r0, #12]
	str	lr, [r0, #4]
	str	r10, [r8]
	str	ip, [r1]
	str	r4, [r2, #8]
	str	r4, [r2]
	str	r4, [r2, #12]
	str	r4, [r2, #4]
	str	r4, [r2, #28]
	str	r4, [r2, #32]
	str	r4, [r2, #24]
	ldr	r2, .L79+128
	str	ip, [r2]
	ldr	r2, .L79+132
	ldr	r0, .L79+136
	str	r10, [r2]
	mov	r7, r3
	ldr	r2, .L79+140
	ldr	r3, .L79+144
	mov	r6, r4
	str	r4, [r0, #16]
	str	r4, [r0, #20]
	str	r4, [r0, #8]
	str	r4, [r0, #12]
	str	r4, [r0]
	str	r4, [r0, #4]
	str	r4, [r0, #28]
	str	r4, [r0, #32]
	str	r4, [r0, #24]
	str	r4, [r3, #16]
	str	r4, [r3, #20]
	str	r4, [r3, #8]
	str	r4, [r3, #12]
	str	r4, [r3]
	str	r4, [r3, #4]
	str	r4, [r3, #28]
	str	r4, [r3, #32]
	str	r4, [r3, #24]
	str	r10, [r2]
	ldr	r4, .L79+148
.L58:
	mov	lr, pc
	bx	r4
	mov	r10, r0
	mov	lr, pc
	bx	r4
	ldr	r5, .L79+152
	smull	r3, r5, r0, r5
	mov	r3, r0, asr #31
	rsb	r3, r3, r5, asr #4
	add	r3, r3, r3, lsl #2
	rsb	r5, r0, r3, lsl #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+156
	smull	r2, r3, r0, r3
	mov	ip, r0, asr #31
	add	r3, r3, r0
	rsb	r3, ip, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, asl #4
	mov	r0, #7
	str	r0, [r7, #8]
	mov	r0, #1
	str	r0, [r7, #12]
	mov	r0, #0
	ldr	r2, .L79+160
	smull	r1, r2, r10, r2
	ldr	r1, [r8]
	sub	r2, r2, r10, asr #31
	add	r2, r2, r2, lsl #1
	add	r6, r6, #1
	rsb	r10, r2, r10
	cmp	r1, r6
	ldr	r2, [fp]
	ldr	r1, [r9]
	rsb	r2, r2, r3
	rsb	r1, r1, r5
	str	r5, [r7, #16]
	str	r0, [r7, #32]
	str	r0, [r7, #24]
	str	r1, [r7]
	str	r3, [r7, #20]
	str	r2, [r7, #4]
	str	r10, [r7, #28]
	add	r7, r7, #36
	bgt	.L58
	ldr	r3, .L79+124
	ldr	r3, [r3]
	cmp	r3, r0
	ble	.L63
	mov	r2, #0
	mov	r8, r2
	mov	r7, r2
	ldr	r10, .L79+164
.L62:
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	lr, pc
	bx	r4
	mov	r5, r0
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+152
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	rsb	r3, r2, r3, asr #6
	add	r3, r3, r3, lsl #2
	rsb	r2, r0, r3, lsl #5
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+156
	ldr	r1, .L79+160
	smull	r2, r3, r0, r3
	smull	r2, r1, r6, r1
	ldr	r2, .L79+124
	ldr	ip, [r2]
	add	r7, r7, #1
	ldr	r2, [sp, #4]
	cmp	ip, r7
	ldr	ip, [r9]
	str	r2, [r10]
	rsb	ip, ip, r2
	mov	r2, #1
	add	r3, r3, r0
	mov	lr, r0, asr #31
	rsb	r3, lr, r3, asr #7
	sub	r1, r1, r6, asr #31
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, asl #4
	add	r1, r1, r1, lsl #1
	mov	r0, r5, lsr #31
	rsb	r6, r1, r6
	add	r5, r5, r0
	ldr	r1, [fp]
	and	r5, r5, #1
	rsb	r5, r0, r5
	rsb	r1, r1, r3
	str	r8, [r10, #-8]
	str	r2, [r10, #-4]
	str	r8, [r10, #8]
	str	ip, [r10, #-16]
	str	r3, [r10, #4]
	str	r1, [r10, #-12]
	str	r6, [r10, #16]
	str	r5, [r10, #12]
	add	r10, r10, #36
	bgt	.L62
.L63:
	ldr	r3, .L79+128
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L61
	mov	r2, #0
	mov	r10, r2
	ldr	r8, .L79+168
.L66:
	str	r2, [sp, #4]
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	lr, pc
	bx	r4
	mov	r7, r0
	mov	lr, pc
	bx	r4
	ldr	r5, .L79+152
	smull	r3, r5, r0, r5
	mov	r3, r0, asr #31
	rsb	r5, r3, r5, asr #6
	add	r5, r5, r5, lsl #2
	sub	r5, r0, r5, asl #5
	mov	lr, pc
	bx	r4
	ldr	r3, .L79+156
	smull	r2, r3, r0, r3
	mov	lr, r0, asr #31
	add	r3, r3, r0
	rsb	r3, lr, r3, asr #7
	rsb	r3, r3, r3, lsl #4
	sub	r3, r0, r3, asl #4
	mov	r0, r6, lsr #31
	add	r6, r6, r0
	and	r6, r6, #1
	rsb	r6, r0, r6
	mov	r0, #1
	ldr	r1, .L79+160
	smull	r2, r1, r7, r1
	ldr	r2, .L79+128
	ldr	ip, [r2]
	ldr	r2, [sp, #4]
	sub	r1, r1, r7, asr #31
	add	r1, r1, r1, lsl #1
	add	r2, r2, #1
	rsb	r7, r1, r7
	cmp	ip, r2
	ldr	r1, [fp]
	ldr	ip, [r9]
	rsb	r1, r1, r3
	rsb	ip, ip, r5
	str	r5, [r8]
	str	r10, [r8, #-8]
	str	r0, [r8, #-4]
	str	r10, [r8, #8]
	str	ip, [r8, #-16]
	str	r3, [r8, #4]
	str	r1, [r8, #-12]
	str	r7, [r8, #12]
	str	r6, [r8, #16]
	add	r8, r8, #36
	bgt	.L66
.L61:
	ldr	r3, .L79+132
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L65
	mov	r10, #0
	mov	r8, r10
	ldr	r7, .L79+136
.L69:
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	lr, pc
	bx	r4
	ldr	r5, .L79+152
	smull	r3, r5, r0, r5
	mov	r3, r0, asr #31
	rsb	r5, r3, r5, asr #6
	add	r5, r5, r5, lsl #2
	sub	r5, r0, r5, asl #5
	mov	lr, pc
	bx	r4
	mov	ip, #1
	ldr	r3, .L79+156
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	ldr	r2, .L79+132
	ldr	r1, [r2]
	rsb	r3, r3, r3, lsl #4
	mov	r2, r6, lsr #31
	add	r10, r10, #1
	sub	r3, r0, r3, asl #4
	add	r6, r6, r2
	cmp	r1, r10
	ldr	r0, [r9]
	ldr	r1, [fp]
	and	r6, r6, #1
	rsb	r2, r2, r6
	rsb	r0, r0, r5
	rsb	r1, r1, r3
	str	r5, [r7, #16]
	str	r8, [r7, #8]
	str	ip, [r7, #12]
	str	r8, [r7, #32]
	str	r8, [r7, #24]
	str	r0, [r7]
	str	r3, [r7, #20]
	str	r1, [r7, #4]
	str	r2, [r7, #28]
	add	r7, r7, #36
	bgt	.L69
.L65:
	ldr	r3, .L79+140
	ldr	r3, [r3]
	cmp	r3, #0
	ble	.L68
	mov	r10, #0
	mov	r8, r10
	ldr	r7, .L79+144
.L71:
	mov	lr, pc
	bx	r4
	mov	r6, r0
	mov	lr, pc
	bx	r4
	ldr	r5, .L79+152
	smull	r3, r5, r0, r5
	mov	r3, r0, asr #31
	rsb	r5, r3, r5, asr #6
	add	r5, r5, r5, lsl #2
	sub	r5, r0, r5, asl #5
	mov	lr, pc
	bx	r4
	mov	ip, #1
	ldr	r3, .L79+156
	smull	r2, r3, r0, r3
	mov	r2, r0, asr #31
	add	r3, r3, r0
	rsb	r3, r2, r3, asr #7
	ldr	r2, .L79+140
	ldr	r1, [r2]
	rsb	r3, r3, r3, lsl #4
	mov	r2, r6, lsr #31
	add	r10, r10, #1
	sub	r3, r0, r3, asl #4
	add	r6, r6, r2
	cmp	r1, r10
	ldr	r0, [r9]
	ldr	r1, [fp]
	and	r6, r6, #1
	rsb	r2, r2, r6
	rsb	r0, r0, r5
	rsb	r1, r1, r3
	str	r5, [r7, #16]
	str	r8, [r7, #8]
	str	ip, [r7, #12]
	str	r8, [r7, #32]
	str	r8, [r7, #24]
	str	r0, [r7]
	str	r3, [r7, #20]
	str	r1, [r7, #4]
	str	r2, [r7, #28]
	add	r7, r7, #36
	bgt	.L71
.L68:
	mov	r3, #0
	mov	r2, #512
	ldr	r1, .L79+172
.L70:
	strh	r2, [r1, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L70
	ldr	r2, .L79+176
	ldr	r1, .L79+180
	ldr	r0, .L79+184
	add	sp, sp, #12
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, fp, lr}
	b	playSoundA
.L80:
	.align	2
.L79:
	.word	7685
	.word	count
	.word	state
	.word	6924
	.word	timer
	.word	playerDead
	.word	gameBG1Pal
	.word	loadPalette
	.word	DMANow
	.word	13344
	.word	100679680
	.word	gameBG1Tiles
	.word	100724736
	.word	gameBG1Map
	.word	100712448
	.word	gameBG2Tiles
	.word	100718592
	.word	gameBG2Map
	.word	100728832
	.word	spritesTiles
	.word	spritesPal
	.word	83886592
	.word	seed
	.word	srand
	.word	hOff
	.word	vOff
	.word	player
	.word	enemy2
	.word	enemy1
	.word	enemy3
	.word	enemy1Size
	.word	enemy2Size
	.word	enemy3Size
	.word	enemy4Size
	.word	enemy4
	.word	enemy4SecondTypeSize
	.word	enemy4SecondType
	.word	rand
	.word	1717986919
	.word	-2004318071
	.word	1431655766
	.word	enemy2+16
	.word	enemy3+16
	.word	shadowOAM
	.word	11025
	.word	162831
	.word	No_Monkey
	.size	initGame, .-initGame
	.align	2
	.global	splash
	.type	splash, %function
splash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L91
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L82
	ldr	r2, .L91+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L90
.L82:
	tst	r3, #4
	bxeq	lr
	ldr	r3, .L91+4
	ldr	r3, [r3]
	tst	r3, #4
	moveq	r2, #5
	ldreq	r3, .L91+8
	streq	r2, [r3]
	bx	lr
.L90:
	b	initGame
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	splash, .-splash
	.align	2
	.global	updatePlayerPosition
	.type	updatePlayerPosition, %function
updatePlayerPosition:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, [r3, #304]
	ldr	r3, .L121
	tst	r1, #16
	str	r2, [r3, #8]
	ldreq	r2, [r3, #4]
	moveq	r1, #12
	addeq	r2, r2, #2
	streq	r2, [r3, #4]
	mov	r2, #67108864
	streq	r1, [r3, #8]
	ldr	r2, [r2, #304]
	tst	r2, #32
	ldreq	r2, [r3, #4]
	moveq	r1, #20
	subeq	r2, r2, #2
	streq	r2, [r3, #4]
	mov	r2, #67108864
	streq	r1, [r3, #8]
	ldr	r2, [r2, #304]
	tst	r2, #64
	ldreq	r2, [r3]
	moveq	r1, #0
	subeq	r2, r2, #2
	streq	r2, [r3]
	mov	r2, #67108864
	streq	r1, [r3, #8]
	ldr	r1, [r2, #304]
	tst	r1, #16
	bne	.L97
	ldr	r2, [r2, #304]
	tst	r2, #64
	beq	.L120
.L97:
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #32
	bxne	lr
	ldr	r2, [r2, #304]
	tst	r2, #64
	bxne	lr
	mov	r0, #4
	ldr	r1, [r3, #4]
	ldr	r2, [r3]
	sub	r1, r1, #2
	sub	r2, r2, #2
	str	r1, [r3, #4]
	str	r2, [r3]
	str	r0, [r3, #8]
	bx	lr
.L120:
	mov	r0, #100
	ldr	r1, [r3, #4]
	ldr	r2, [r3]
	add	r1, r1, #2
	sub	r2, r2, #2
	str	r1, [r3, #4]
	str	r2, [r3]
	str	r0, [r3, #8]
	b	.L97
.L122:
	.align	2
.L121:
	.word	player
	.size	updatePlayerPosition, .-updatePlayerPosition
	.align	2
	.global	togglePlayerElevation
	.type	togglePlayerElevation, %function
togglePlayerElevation:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L127
	ldr	r3, [r2, #28]
	add	r3, r3, #1
	cmp	r3, #3
	moveq	r3, #0
	str	r3, [r2, #28]
	bx	lr
.L128:
	.align	2
.L127:
	.word	player
	.size	togglePlayerElevation, .-togglePlayerElevation
	.align	2
	.global	levelOneEnemies
	.type	levelOneEnemies, %function
levelOneEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L140
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	mov	r0, #0
	ldr	r3, .L140+4
	ldr	r2, .L140+8
	stmfd	sp!, {r4, r5, lr}
	ldr	lr, [r3]
	ldr	r4, [r2]
	ldr	r3, .L140+12
.L132:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #20]
	rsb	r2, r4, r2
	rsb	r1, lr, r1
	cmn	r2, #32
	str	r2, [r3]
	str	r1, [r3, #4]
	blt	.L135
	cmp	r2, #160
	movle	r5, #0
	movgt	r5, #1
	cmn	r1, #32
	movge	r5, #0
	cmp	r5, #0
	beq	.L139
.L135:
	mov	r1, #1
.L131:
	cmp	r2, #160
	movgt	r2, #0
	movle	r2, #1
	add	r0, r0, #1
	cmp	r0, ip
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	add	r3, r3, #36
	bne	.L132
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L139:
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
	b	.L131
.L141:
	.align	2
.L140:
	.word	enemy1Size
	.word	hOff
	.word	vOff
	.word	enemy1
	.size	levelOneEnemies, .-levelOneEnemies
	.align	2
	.global	levelTwoEnemies
	.type	levelTwoEnemies, %function
levelTwoEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L154
	ldr	r0, [r3]
	cmp	r0, #0
	bxle	lr
	ldr	r1, .L154+4
	ldr	r2, .L154+8
	ldr	r3, .L154+12
	add	r0, r0, r0, lsl #3
	stmfd	sp!, {r4, lr}
	ldr	ip, [r2]
	ldr	lr, [r1]
	add	r0, r3, r0, lsl #2
	b	.L145
.L153:
	cmp	r2, #160
	movle	r4, #0
	movgt	r4, #1
	cmn	r1, #40
	movge	r4, #0
	cmp	r4, #0
	bne	.L148
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
.L144:
	cmp	r2, #160
	movgt	r2, #0
	movle	r2, #1
	str	r1, [r3, #24]
	str	r2, [r3, #12]
	add	r3, r3, #36
	cmp	r0, r3
	beq	.L152
.L145:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #20]
	rsb	r2, lr, r2
	rsb	r1, ip, r1
	cmn	r2, #40
	str	r2, [r3]
	str	r1, [r3, #4]
	bge	.L153
.L148:
	mov	r1, #1
	b	.L144
.L152:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L155:
	.align	2
.L154:
	.word	enemy2Size
	.word	vOff
	.word	hOff
	.word	enemy2
	.size	levelTwoEnemies, .-levelTwoEnemies
	.align	2
	.global	levelThreeEnemies
	.type	levelThreeEnemies, %function
levelThreeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L170
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	ldr	r1, .L170+4
	ldr	r2, .L170+8
	ldr	r3, .L170+12
	stmfd	sp!, {r4, r5, lr}
	add	ip, ip, ip, lsl #3
	ldr	r4, [r1]
	ldr	lr, [r2]
	add	ip, r3, ip, lsl #2
.L162:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #20]
	ldr	r0, [r3, #32]
	rsb	r2, r4, r2
	rsb	r1, lr, r1
	cmp	r0, #0
	str	r2, [r3]
	str	r1, [r3, #4]
	bne	.L158
	cmn	r2, #32
	blt	.L165
	cmp	r2, #160
	movle	r0, #0
	movgt	r0, #1
	cmn	r1, #32
	movge	r0, #0
	cmp	r0, #0
	beq	.L169
.L165:
	mov	r1, #1
.L159:
	str	r1, [r3, #24]
.L160:
	cmp	r2, #160
	movgt	r2, #0
	movle	r2, #1
	add	r3, r3, #36
	str	r2, [r3, #-24]
	cmp	ip, r3
	bne	.L162
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L169:
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
	b	.L159
.L158:
	cmp	r0, #1
	bne	.L160
	cmn	r2, #24
	blt	.L161
	cmp	r2, #160
	movle	r5, #0
	movgt	r5, #1
	cmn	r1, #24
	movge	r5, #0
	cmp	r5, #0
	bne	.L161
	cmp	r1, #240
	movle	r0, #0
	movgt	r0, #1
.L161:
	str	r0, [r3, #24]
	b	.L160
.L171:
	.align	2
.L170:
	.word	enemy3Size
	.word	vOff
	.word	hOff
	.word	enemy3
	.size	levelThreeEnemies, .-levelThreeEnemies
	.align	2
	.global	levelFourEnemies
	.type	levelFourEnemies, %function
levelFourEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L190
	ldr	ip, [r3]
	cmp	ip, #0
	stmfd	sp!, {r4, r5, lr}
	ble	.L178
	mov	r0, #0
	ldr	r3, .L190+4
	ldr	r2, .L190+8
	ldr	lr, [r3]
	ldr	r4, [r2]
	ldr	r3, .L190+12
.L177:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #20]
	rsb	r2, r4, r2
	rsb	r1, lr, r1
	cmn	r2, #48
	str	r2, [r3]
	str	r1, [r3, #4]
	blt	.L182
	cmp	r2, #160
	movle	r5, #0
	movgt	r5, #1
	cmn	r1, #48
	movge	r5, #0
	cmp	r5, #0
	beq	.L188
.L182:
	mov	r1, #1
.L176:
	cmp	r2, #160
	movgt	r2, #0
	movle	r2, #1
	add	r0, r0, #1
	cmp	r0, ip
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	add	r3, r3, #36
	bne	.L177
.L178:
	ldr	r3, .L190+16
	ldr	ip, [r3]
	cmp	ip, #0
	ble	.L172
	mov	r0, #0
	ldr	r3, .L190+4
	ldr	r2, .L190+8
	ldr	lr, [r3]
	ldr	r4, [r2]
	ldr	r3, .L190+20
.L180:
	ldr	r2, [r3, #16]
	ldr	r1, [r3, #20]
	rsb	r2, r4, r2
	rsb	r1, lr, r1
	cmn	r2, #32
	str	r2, [r3]
	str	r1, [r3, #4]
	blt	.L184
	cmp	r2, #160
	movle	r5, #0
	movgt	r5, #1
	cmn	r1, #32
	movge	r5, #0
	cmp	r5, #0
	beq	.L189
.L184:
	mov	r1, #1
.L179:
	cmp	r2, #160
	movgt	r2, #0
	movle	r2, #1
	add	r0, r0, #1
	cmp	r0, ip
	str	r2, [r3, #12]
	str	r1, [r3, #24]
	add	r3, r3, #36
	bne	.L180
.L172:
	ldmfd	sp!, {r4, r5, lr}
	bx	lr
.L188:
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
	b	.L176
.L189:
	cmp	r1, #240
	movle	r1, #0
	movgt	r1, #1
	b	.L179
.L191:
	.align	2
.L190:
	.word	enemy4Size
	.word	hOff
	.word	vOff
	.word	enemy4
	.word	enemy4SecondTypeSize
	.word	enemy4SecondType
	.size	levelFourEnemies, .-levelFourEnemies
	.align	2
	.global	adjustRowColVals
	.type	adjustRowColVals, %function
adjustRowColVals:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L202
	ldr	r1, .L202+4
	ldr	ip, .L202+8
	ldr	r2, .L202+12
	stmfd	sp!, {r4, lr}
	ldr	r0, [r3]
	ldr	lr, [r1]
	ldr	ip, [ip]
	ldr	r1, [r3, #4]
	ldr	r2, [r2]
	add	r0, r0, lr
	add	r1, r1, ip
	cmp	r2, #1
	str	r0, [r3, #16]
	str	r1, [r3, #20]
	beq	.L198
	cmp	r2, #2
	beq	.L199
	cmp	r2, #3
	beq	.L200
	cmp	r2, #4
	beq	.L201
	ldmfd	sp!, {r4, lr}
	bx	lr
.L201:
	bl	levelOneEnemies
	bl	levelTwoEnemies
	bl	levelThreeEnemies
	ldmfd	sp!, {r4, lr}
	b	levelFourEnemies
.L198:
	ldmfd	sp!, {r4, lr}
	b	levelOneEnemies
.L199:
	bl	levelOneEnemies
	ldmfd	sp!, {r4, lr}
	b	levelTwoEnemies
.L200:
	bl	levelOneEnemies
	bl	levelTwoEnemies
	ldmfd	sp!, {r4, lr}
	b	levelThreeEnemies
.L203:
	.align	2
.L202:
	.word	player
	.word	vOff
	.word	hOff
	.word	level
	.size	adjustRowColVals, .-adjustRowColVals
	.align	2
	.global	levelOneEnemiesRespawn
	.type	levelOneEnemiesRespawn, %function
levelOneEnemiesRespawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L216
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L204
	mov	r5, #0
	ldr	r4, .L216+4
	ldr	r6, .L216+8
	ldr	r9, .L216+12
	ldr	r7, .L216+16
.L210:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L214
	ldr	r3, [r4, #28]
	cmp	r3, #0
	bne	.L208
	ldr	r3, [r4, #16]
	sub	r3, r3, #1
	str	r3, [r4, #16]
.L207:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #36
	bgt	.L210
.L204:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L208:
	cmp	r3, #1
	beq	.L215
	cmp	r3, #2
	ldreq	r3, [r4, #16]
	addeq	r3, r3, #3
	streq	r3, [r4, #16]
	b	.L207
.L214:
	mov	lr, pc
	bx	r6
	mov	r10, r0
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r10
	mov	r3, r10, asr #31
	rsb	r3, r3, r2, asr #5
	mov	r2, r0, asr #31
	rsb	r1, r3, r3, lsl #5
	mov	r2, r2, lsr #24
	add	r3, r3, r1, lsl #2
	add	r0, r0, r2
	ldr	r1, [r9]
	sub	r3, r10, r3, asl #2
	and	r0, r0, #255
	rsb	r3, r3, r1
	rsb	r0, r2, r0
	str	r3, [r4, #16]
	str	r0, [r4, #20]
	b	.L207
.L215:
	ldr	r3, [r4, #16]
	add	r3, r3, #1
	str	r3, [r4, #16]
	b	.L207
.L217:
	.align	2
.L216:
	.word	enemy1Size
	.word	enemy1
	.word	rand
	.word	vOff
	.word	274877907
	.size	levelOneEnemiesRespawn, .-levelOneEnemiesRespawn
	.align	2
	.global	levelTwoEnemiesRespawn
	.type	levelTwoEnemiesRespawn, %function
levelTwoEnemiesRespawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r8, .L227
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L218
	mov	r5, #0
	ldr	r4, .L227+4
	ldr	r6, .L227+8
	ldr	r9, .L227+12
	ldr	r7, .L227+16
	b	.L223
.L220:
	ldr	r3, [r4, #32]
	cmp	r3, #0
	ldr	r3, [r4, #16]
	subeq	r3, r3, #5
	addne	r3, r3, #3
	str	r3, [r4, #16]
.L221:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #36
	ble	.L218
.L223:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	bne	.L220
	mov	lr, pc
	bx	r6
	mov	r10, r0
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r10
	mov	r3, r10, asr #31
	rsb	r3, r3, r2, asr #5
	mov	r2, r0, asr #31
	rsb	r1, r3, r3, lsl #5
	mov	r2, r2, lsr #24
	add	r3, r3, r1, lsl #2
	add	r0, r0, r2
	ldr	r1, [r9]
	sub	r3, r10, r3, asl #2
	and	r0, r0, #255
	rsb	r3, r3, r1
	rsb	r0, r2, r0
	str	r3, [r4, #16]
	str	r0, [r4, #20]
	b	.L221
.L218:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L228:
	.align	2
.L227:
	.word	enemy2Size
	.word	enemy2
	.word	rand
	.word	vOff
	.word	274877907
	.size	levelTwoEnemiesRespawn, .-levelTwoEnemiesRespawn
	.align	2
	.global	levelThreeEnemiesRespawn
	.type	levelThreeEnemiesRespawn, %function
levelThreeEnemiesRespawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L240
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L229
	mov	r5, #0
	ldr	r4, .L240+4
	ldr	r6, .L240+8
	ldr	r10, .L240+12
	ldr	r7, .L240+16
	ldr	r9, .L240+20
	b	.L234
.L239:
	ldr	r3, [r4, #16]
	sub	r3, r3, #5
	str	r3, [r4, #16]
.L232:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #36
	ble	.L229
.L234:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L238
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L239
	cmp	r3, #1
	ldreq	r3, [r4, #20]
	addeq	r3, r3, #3
	streq	r3, [r4, #20]
	b	.L232
.L238:
	mov	lr, pc
	bx	r6
	mov	fp, r0
	mov	lr, pc
	bx	r6
	smull	r3, r1, r7, fp
	mov	r2, fp, asr #31
	mov	r3, r0, asr #31
	rsb	r2, r2, r1, asr #5
	mov	r3, r3, lsr #24
	rsb	r1, r2, r2, lsl #5
	add	r0, r0, r3
	add	r2, r2, r1, lsl #2
	and	r0, r0, #255
	ldr	r1, [r10]
	ldr	ip, [r9]
	sub	r2, fp, r2, asl #2
	rsb	r3, r3, r0
	rsb	r2, r2, r1
	rsb	r3, r3, ip
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	b	.L232
.L229:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L241:
	.align	2
.L240:
	.word	enemy3Size
	.word	enemy3
	.word	rand
	.word	vOff
	.word	274877907
	.word	hOff
	.size	levelThreeEnemiesRespawn, .-levelThreeEnemiesRespawn
	.align	2
	.global	levelFourEnemiesRespawn
	.type	levelFourEnemiesRespawn, %function
levelFourEnemiesRespawn:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r8, .L258
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L249
	mov	r5, #0
	ldr	r4, .L258+4
	ldr	r6, .L258+8
	ldr	r9, .L258+12
	ldr	r7, .L258+16
.L248:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L256
	ldr	r3, [r4, #16]
	add	r3, r3, #2
	str	r3, [r4, #16]
.L247:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #36
	bgt	.L248
.L249:
	ldr	r8, .L258+20
	ldr	r3, [r8]
	cmp	r3, #0
	ble	.L242
	mov	r5, #0
	ldr	r4, .L258+24
	ldr	r6, .L258+8
	ldr	r10, .L258+12
	ldr	r7, .L258+16
	ldr	r9, .L258+28
.L252:
	ldr	r3, [r4, #12]
	cmp	r3, #0
	beq	.L257
	ldr	r3, [r4, #20]
	sub	r3, r3, #3
	str	r3, [r4, #20]
.L251:
	ldr	r3, [r8]
	add	r5, r5, #1
	cmp	r3, r5
	add	r4, r4, #36
	bgt	.L252
.L242:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L256:
	mov	lr, pc
	bx	r6
	mov	r10, r0
	mov	lr, pc
	bx	r6
	smull	r3, r2, r7, r10
	mov	r3, r10, asr #31
	rsb	r3, r3, r2, asr #5
	mov	r2, r0, asr #31
	rsb	r1, r3, r3, lsl #5
	mov	r2, r2, lsr #24
	add	r3, r3, r1, lsl #2
	add	r0, r0, r2
	ldr	r1, [r9]
	sub	r3, r10, r3, asl #2
	and	r0, r0, #255
	rsb	r3, r3, r1
	rsb	r0, r2, r0
	str	r3, [r4, #16]
	str	r0, [r4, #20]
	b	.L247
.L257:
	mov	lr, pc
	bx	r6
	mov	fp, r0
	mov	lr, pc
	bx	r6
	smull	r3, r1, r7, fp
	mov	r2, fp, asr #31
	mov	r3, r0, asr #31
	rsb	r2, r2, r1, asr #5
	mov	r3, r3, lsr #24
	rsb	r1, r2, r2, lsl #5
	add	r0, r0, r3
	add	r2, r2, r1, lsl #2
	and	r0, r0, #255
	ldr	r1, [r10]
	ldr	ip, [r9]
	sub	r2, fp, r2, asl #2
	rsb	r3, r3, r0
	rsb	r2, r2, r1
	rsb	r3, r3, ip
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	b	.L251
.L259:
	.align	2
.L258:
	.word	enemy4Size
	.word	enemy4
	.word	rand
	.word	vOff
	.word	274877907
	.word	enemy4SecondTypeSize
	.word	enemy4SecondType
	.word	hOff
	.size	levelFourEnemiesRespawn, .-levelFourEnemiesRespawn
	.align	2
	.global	changeEnemyPositions
	.type	changeEnemyPositions, %function
changeEnemyPositions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L270
	ldr	r3, [r3]
	cmp	r3, #1
	stmfd	sp!, {r4, lr}
	beq	.L266
	cmp	r3, #2
	beq	.L267
	cmp	r3, #3
	beq	.L268
	cmp	r3, #4
	beq	.L269
	ldmfd	sp!, {r4, lr}
	bx	lr
.L269:
	bl	levelOneEnemiesRespawn
	bl	levelTwoEnemiesRespawn
	bl	levelThreeEnemiesRespawn
	ldmfd	sp!, {r4, lr}
	b	levelFourEnemiesRespawn
.L266:
	ldmfd	sp!, {r4, lr}
	b	levelOneEnemiesRespawn
.L267:
	bl	levelOneEnemiesRespawn
	ldmfd	sp!, {r4, lr}
	b	levelTwoEnemiesRespawn
.L268:
	bl	levelOneEnemiesRespawn
	bl	levelTwoEnemiesRespawn
	ldmfd	sp!, {r4, lr}
	b	levelThreeEnemiesRespawn
.L271:
	.align	2
.L270:
	.word	level
	.size	changeEnemyPositions, .-changeEnemyPositions
	.align	2
	.global	checkEnemyCollisions
	.type	checkEnemyCollisions, %function
checkEnemyCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r7, .L416
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L285
	ldr	r4, .L416+4
	mov	r6, #0
	mov	r8, r4
	ldr	r5, .L416+8
	ldr	r9, .L416+12
	ldr	fp, .L416+16
	ldr	r10, .L416+20
.L284:
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #28]
	cmp	r3, r2
	beq	.L408
.L277:
	ldr	r3, [r7]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #36
	bgt	.L284
.L285:
	ldr	r3, .L416+24
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L275
	ldr	r7, .L416+28
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L275
	ldr	r4, .L416+4
	mov	r6, #0
	mov	r8, r4
	ldr	r5, .L416+32
	ldr	r9, .L416+12
	ldr	fp, .L416+16
	ldr	r10, .L416+20
	b	.L296
.L289:
	ldr	r3, [r7]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #36
	ble	.L275
.L296:
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #28]
	cmp	r3, r2
	bne	.L289
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L290
	ldr	r1, [r5, #16]
	ldr	r2, [r8, #16]
	add	r0, r1, #40
	cmp	r2, r0
	bgt	.L289
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L289
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L289
	add	r2, r2, #40
	cmp	r1, r2
	bgt	.L289
.L398:
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L409
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r8, #28]
	moveq	r3, #0
	streq	r3, [r4, #28]
	b	.L289
.L275:
	ldr	r3, .L416+36
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L287
	ldr	r7, .L416+40
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L287
	ldr	r4, .L416+4
	mov	r6, #0
	mov	r8, r4
	ldr	r5, .L416+44
	ldr	r9, .L416+12
	ldr	fp, .L416+16
	ldr	r10, .L416+20
	b	.L311
.L300:
	ldr	r3, [r7]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #36
	ble	.L287
.L311:
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #28]
	cmp	r3, r2
	bne	.L300
	ldr	r2, [r5, #32]
	cmp	r2, #0
	bne	.L301
	ldr	r2, [r8, #8]
	cmp	r2, #0
	beq	.L410
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L300
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L300
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #56
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #24
	cmp	r1, r2
	bgt	.L300
	b	.L400
.L287:
	ldr	r3, .L416+48
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L272
	ldr	r7, .L416+52
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L323
	ldr	r4, .L416+4
	mov	r6, #0
	mov	r8, r4
	ldr	r5, .L416+56
	ldr	r9, .L416+12
	ldr	fp, .L416+16
	ldr	r10, .L416+20
.L322:
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #28]
	cmp	r3, r2
	beq	.L411
.L315:
	ldr	r3, [r7]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #36
	bgt	.L322
.L323:
	ldr	r7, .L416+60
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L272
	ldr	r4, .L416+4
	mov	r6, #0
	mov	r8, r4
	ldr	r5, .L416+64
	ldr	r9, .L416+12
	ldr	fp, .L416+16
	ldr	r10, .L416+20
.L332:
	ldr	r3, [r4, #28]
	ldr	r2, [r5, #28]
	cmp	r3, r2
	beq	.L412
.L325:
	ldr	r3, [r7]
	add	r6, r6, #1
	cmp	r3, r6
	add	r5, r5, #36
	bgt	.L332
.L272:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L408:
	ldr	r2, [r8, #8]
	cmp	r2, #0
	beq	.L413
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L277
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L277
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L277
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #48
	cmp	r0, r2
	bge	.L407
	b	.L277
.L413:
	ldr	r1, [r5, #16]
	ldr	r2, [r8, #16]
	add	r0, r1, #32
	cmp	r2, r0
	bgt	.L277
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L277
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #24
	cmp	r0, r2
	blt	.L277
.L407:
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L277
	ldr	r2, [r9]
	cmp	r2, #0
	bne	.L280
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L277
	mov	r3, #0
	ldr	r2, .L416+68
	ldr	r1, .L416+72
	ldr	r0, .L416+76
	str	r3, [fp, #16]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r10]
	b	.L277
.L412:
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L326
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	cmp	r1, r2
	blt	.L325
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L325
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #16
	cmp	r0, r2
	blt	.L325
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L325
.L405:
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L414
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r8, #28]
	moveq	r3, #0
	streq	r3, [r4, #28]
	b	.L325
.L411:
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L316
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	cmp	r1, r2
	blt	.L315
	add	r2, r2, #48
	cmp	r1, r2
	bgt	.L315
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #16
	cmp	r0, r2
	blt	.L315
	add	r2, r2, #40
	cmp	r1, r2
	bgt	.L315
.L403:
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L415
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r8, #28]
	moveq	r3, #0
	streq	r3, [r4, #28]
	b	.L315
.L301:
	cmp	r2, #1
	bne	.L300
	ldr	r2, [r8, #8]
	cmp	r2, #0
	bne	.L308
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	cmp	r1, r2
	blt	.L300
	add	r2, r2, #24
	cmp	r1, r2
	bgt	.L300
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #16
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #16
	cmp	r1, r2
	bgt	.L300
.L400:
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L386
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r8, #28]
	bne	.L300
.L307:
	mov	r3, #0
	str	r3, [r4, #28]
	b	.L300
.L290:
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L289
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L289
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L289
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #56
	cmp	r0, r2
	blt	.L289
	add	r2, r2, #32
	cmp	r1, r2
	ble	.L398
	b	.L289
.L316:
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L315
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L315
	add	r2, r2, #48
	cmp	r1, r2
	bgt	.L315
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #56
	cmp	r0, r2
	blt	.L315
	add	r2, r2, #56
	cmp	r1, r2
	ble	.L403
	b	.L315
.L326:
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L325
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L325
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L325
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #56
	cmp	r0, r2
	blt	.L325
	add	r2, r2, #48
	cmp	r1, r2
	ble	.L405
	b	.L325
.L410:
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	cmp	r1, r2
	blt	.L300
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L300
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #16
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #8
	cmp	r1, r2
	bgt	.L300
	b	.L400
.L308:
	sub	r2, r2, #12
	bics	r2, r2, #8
	bne	.L300
	ldr	r1, [r8, #16]
	ldr	r2, [r5, #16]
	add	r0, r1, #32
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #24
	cmp	r1, r2
	bgt	.L300
	ldr	r1, [r8, #20]
	ldr	r2, [r5, #20]
	add	r0, r1, #56
	cmp	r0, r2
	blt	.L300
	add	r2, r2, #32
	cmp	r1, r2
	bgt	.L300
	ldr	r2, [r9]
	cmp	r2, #0
	beq	.L386
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r4, #28]
	bne	.L300
	b	.L307
.L280:
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r8, #28]
	moveq	r3, #0
	streq	r3, [r4, #28]
	b	.L277
.L409:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L289
	mov	r3, #0
	ldr	r2, .L416+68
	ldr	r1, .L416+72
	ldr	r0, .L416+76
	str	r3, [fp, #16]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r10]
	b	.L289
.L415:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L315
	mov	r3, #0
	ldr	r2, .L416+68
	ldr	r1, .L416+72
	ldr	r0, .L416+76
	str	r3, [fp, #16]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r10]
	b	.L315
.L414:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L325
	mov	r3, #0
	ldr	r2, .L416+68
	ldr	r1, .L416+72
	ldr	r0, .L416+76
	str	r3, [fp, #16]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r10]
	b	.L325
.L386:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L300
	mov	r3, #0
	ldr	r2, .L416+68
	ldr	r1, .L416+72
	ldr	r0, .L416+76
	str	r3, [fp, #16]
	bl	playSoundA
	mov	r3, #1
	str	r3, [r10]
	b	.L300
.L417:
	.align	2
.L416:
	.word	enemy1Size
	.word	player
	.word	enemy1
	.word	autoPilot
	.word	soundA
	.word	playerDead
	.word	checkCollisionsLvl2
	.word	enemy2Size
	.word	enemy2
	.word	checkCollisionsLvl3
	.word	enemy3Size
	.word	enemy3
	.word	checkCollisionsLvl4
	.word	enemy4Size
	.word	enemy4
	.word	enemy4SecondTypeSize
	.word	enemy4SecondType
	.word	11025
	.word	54899
	.word	explosion
	.size	checkEnemyCollisions, .-checkEnemyCollisions
	.align	2
	.global	checkScreenCollisions
	.type	checkScreenCollisions, %function
checkScreenCollisions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L453
	ldr	r2, [r3]
	cmp	r2, #59
	bgt	.L419
	mov	r0, #60
	mov	r2, r0
	ldr	ip, .L453+4
	ldr	r1, [ip]
	sub	r1, r1, #1
	str	r1, [ip]
	str	r0, [r3]
.L419:
	ldr	r1, [r3, #4]
	cmp	r1, #20
	ldr	r0, .L453
	ble	.L420
	ldr	r0, [r0, #8]
	sub	ip, r0, #12
	bics	ip, ip, #8
	bne	.L447
	cmp	r1, #155
	movgt	r0, #156
	ble	.L430
.L434:
	ldr	r1, [r3, #28]
	cmp	r1, #0
	str	r0, [r3, #4]
	bne	.L429
	ldr	r1, .L453+8
	ldr	r3, [r1]
	add	r3, r3, #1
	str	r3, [r1]
.L430:
	cmp	r2, #159
	bxle	lr
.L452:
	mov	ip, #0
	ldr	r3, .L453+12
	stmfd	sp!, {r4, lr}
	ldr	r2, .L453+16
	ldr	r1, .L453+20
	ldr	r0, .L453+24
	str	ip, [r3, #16]
	bl	playSoundA
	mov	r2, #1
	ldr	r3, .L453+28
	ldmfd	sp!, {r4, lr}
	str	r2, [r3]
	bx	lr
.L420:
	ldr	r3, [r0, #8]
	cmp	r3, #0
	beq	.L430
	mov	r1, #20
	ldr	r3, [r0, #28]
	cmp	r3, #0
	str	r1, [r0, #4]
	beq	.L448
	cmp	r3, #1
	beq	.L449
	cmp	r3, #2
	bne	.L430
	ldr	r1, .L453+32
	ldr	r3, [r1]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r1]
	bne	.L430
	mov	ip, #0
	ldr	r0, .L453+8
	ldr	r3, [r0]
	sub	r3, r3, #1
	str	r3, [r0]
	str	ip, [r1]
	b	.L430
.L429:
	cmp	r1, #1
	beq	.L450
	cmp	r1, #2
	bne	.L430
	ldr	r1, .L453+32
	ldr	r3, [r1]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r1]
	bne	.L430
	mov	ip, #0
	ldr	r0, .L453+8
	ldr	r3, [r0]
	add	r3, r3, #1
	str	r3, [r0]
	str	ip, [r1]
	b	.L430
.L447:
	cmp	r0, #0
	beq	.L451
	cmp	r1, #171
	movgt	r0, #172
	bgt	.L434
	b	.L430
.L448:
	ldr	r1, .L453+8
	ldr	r3, [r1]
	cmp	r2, #159
	sub	r3, r3, #1
	str	r3, [r1]
	bxle	lr
	b	.L452
.L450:
	ldr	r1, .L453+8
	ldr	r3, [r1]
	add	r3, r3, #2
	str	r3, [r1]
	b	.L430
.L449:
	ldr	r1, .L453+8
	ldr	r3, [r1]
	sub	r3, r3, #2
	str	r3, [r1]
	b	.L430
.L451:
	cmp	r1, #187
	ble	.L430
	mov	r0, #188
	b	.L434
.L454:
	.align	2
.L453:
	.word	player
	.word	vOff
	.word	hOff
	.word	soundA
	.word	11025
	.word	54899
	.word	explosion
	.word	playerDead
	.word	count3
	.size	checkScreenCollisions, .-checkScreenCollisions
	.align	2
	.global	getCurShipHeight
	.type	getCurShipHeight, %function
getCurShipHeight:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L459
	ldr	r0, [r3, #8]
	sub	r3, r0, #12
	bics	r3, r3, #8
	beq	.L457
	cmp	r0, #0
	moveq	r0, #64
	movne	r0, #48
	bx	lr
.L457:
	mov	r0, #32
	bx	lr
.L460:
	.align	2
.L459:
	.word	player
	.size	getCurShipHeight, .-getCurShipHeight
	.align	2
	.global	getCurShipWidth
	.type	getCurShipWidth, %function
getCurShipWidth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L465
	ldr	r0, [r3, #8]
	sub	r3, r0, #12
	bics	r3, r3, #8
	beq	.L463
	cmp	r0, #0
	moveq	r0, #32
	movne	r0, #48
	bx	lr
.L463:
	mov	r0, #64
	bx	lr
.L466:
	.align	2
.L465:
	.word	player
	.size	getCurShipWidth, .-getCurShipWidth
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	mov	r1, #512
	ldr	r2, .L470
.L468:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L468
	bx	lr
.L471:
	.align	2
.L470:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.align	2
	.global	initPause
	.type	initPause, %function
initPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r2, #67108864
	mov	lr, #6912
	mov	r5, #2
	mov	r4, #256
	ldr	r1, .L474
	ldr	r0, .L474+4
	strh	r3, [r1, #2]	@ movhi
	ldr	ip, .L474+8
	strh	r3, [r1, #6]	@ movhi
	ldr	r1, .L474+12
	str	r5, [r0]
	strh	lr, [r2, #8]	@ movhi
	strh	r4, [r2]	@ movhi
	ldr	r0, .L474+16
	ldr	r2, .L474+20
	str	r3, [ip, #12]
	str	r3, [r1, #12]
	ldr	r4, .L474+24
	mov	lr, pc
	bx	r2
	ldr	r3, .L474+28
	mov	r2, #100663296
	ldr	r1, .L474+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L474+36
	ldr	r1, .L474+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L475:
	.align	2
.L474:
	.word	67109120
	.word	state
	.word	soundA
	.word	soundB
	.word	pausePal
	.word	loadPalette
	.word	DMANow
	.word	5392
	.word	pauseTiles
	.word	100718592
	.word	pauseMap
	.size	initPause, .-initPause
	.align	2
	.global	checkPlayerKeys
	.type	checkPlayerKeys, %function
checkPlayerKeys:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L494
	ldr	r3, [r3]
	tst	r3, #512
	beq	.L478
	ldr	r2, .L494+4
	ldr	r2, [r2]
	tst	r2, #512
	beq	.L491
.L478:
	tst	r3, #2
	beq	.L482
	ldr	r2, .L494+4
	ldr	r2, [r2]
	tst	r2, #2
	beq	.L492
.L482:
	tst	r3, #1
	bxeq	lr
.L493:
	ldr	r3, .L494+4
	ldr	r3, [r3]
	tst	r3, #1
	bxne	lr
	ldr	r2, .L494+8
	ldr	r3, .L494+12
	stmfd	sp!, {r4, r5, lr}
	ldr	r0, [r2]
	ldr	r1, [r3]
	add	r2, r0, r0, lsl #1
	ldr	r5, .L494+16
	ldr	r4, .L494+20
	ldr	lr, .L494+24
	add	r3, r1, r1, lsl #1
	add	r2, r2, r2, lsr #31
	add	r3, r3, r3, lsr #31
	ldr	ip, .L494+28
	mov	r2, r2, asr #1
	mov	r3, r3, asr #1
	str	r0, [r5]
	str	r2, [r4]
	str	r1, [lr]
	ldmfd	sp!, {r4, r5, lr}
	str	r3, [ip]
	b	initPause
.L492:
	ldr	r1, .L494+32
	ldr	r2, [r1, #28]
	cmp	r2, #2
	moveq	r2, #0
	addne	r2, r2, #1
	tst	r3, #1
	str	r2, [r1, #28]
	bne	.L493
	bx	lr
.L491:
	ldr	r1, .L494+36
	ldr	r2, [r1]
	cmp	r2, #1
	moveq	r2, #0
	addne	r2, r2, #1
	str	r2, [r1]
	b	.L478
.L495:
	.align	2
.L494:
	.word	oldButtons
	.word	buttons
	.word	hOff
	.word	vOff
	.word	Bg1TempH
	.word	Bg0TempH
	.word	Bg1TempV
	.word	Bg0TempV
	.word	player
	.word	autoPilot
	.size	checkPlayerKeys, .-checkPlayerKeys
	.align	2
	.global	unpauseInitialize
	.type	unpauseInitialize, %function
unpauseInitialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	r3, #67108864
	mov	r4, #0
	mov	r2, #4864
	ldr	ip, .L500
	ldr	r1, .L500+4
	strh	r4, [r3, #20]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r4, [r3, #22]	@ movhi
	ldr	r0, .L500+8
	strh	r4, [r3, #16]	@ movhi
	ldr	r2, .L500+12
	strh	r4, [r3, #18]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r1, [r3, #10]	@ movhi
	ldr	r5, .L500+16
	mov	lr, pc
	bx	r2
	ldr	r3, .L500+20
	ldr	r2, .L500+24
	ldr	r1, .L500+28
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L500+32
	ldr	r1, .L500+36
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L500+40
	ldr	r1, .L500+44
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1024
	ldr	r2, .L500+48
	ldr	r1, .L500+52
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #16384
	ldr	r2, .L500+56
	ldr	r1, .L500+60
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #256
	ldr	r2, .L500+64
	ldr	r1, .L500+68
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, r4
	mov	r1, #512
	ldr	r2, .L500+72
.L497:
	strh	r1, [r2, r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, #1024
	bne	.L497
	mov	r3, #0
	ldr	r2, .L500+76
	ldr	r0, .L500+80
	ldr	r1, .L500+84
	str	r3, [r0, #12]
	str	r3, [r1, #12]
	ldmfd	sp!, {r4, r5, r6, lr}
	strh	r3, [r2, #2]	@ movhi
	strh	r3, [r2, #6]	@ movhi
	bx	lr
.L501:
	.align	2
.L500:
	.word	6924
	.word	7685
	.word	gameBG1Pal
	.word	loadPalette
	.word	DMANow
	.word	13344
	.word	100679680
	.word	gameBG1Tiles
	.word	100724736
	.word	gameBG1Map
	.word	100712448
	.word	gameBG2Tiles
	.word	100718592
	.word	gameBG2Map
	.word	100728832
	.word	spritesTiles
	.word	83886592
	.word	spritesPal
	.word	shadowOAM
	.word	67109120
	.word	soundA
	.word	soundB
	.size	unpauseInitialize, .-unpauseInitialize
	.align	2
	.global	pause
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L514
	stmfd	sp!, {r4, lr}
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, [r1]
	tst	r3, #8
	beq	.L503
	ldr	r2, .L514+4
	ldr	r2, [r2]
	tst	r2, #8
	beq	.L512
.L503:
	tst	r3, #4
	beq	.L502
	ldr	r3, .L514+4
	ldr	r3, [r3]
	tst	r3, #4
	beq	.L513
.L502:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L513:
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L512:
	bl	unpauseInitialize
	mov	r3, #1
	mov	r1, #128
	ldr	lr, .L514+8
	ldr	r2, .L514+12
	ldr	ip, .L514+16
	ldr	r0, .L514+20
	str	r3, [lr]
	str	r3, [ip, #12]
	str	r3, [r0, #12]
	ldmfd	sp!, {r4, lr}
	strh	r1, [r2, #2]	@ movhi
	strh	r1, [r2, #6]	@ movhi
	bx	lr
.L515:
	.align	2
.L514:
	.word	oldButtons
	.word	buttons
	.word	state
	.word	67109120
	.word	soundA
	.word	soundB
	.size	pause, .-pause
	.align	2
	.global	initLose
	.type	initLose, %function
initLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	r3, #67108864
	mov	lr, #4
	mov	ip, #256
	mov	r1, #6912
	ldr	r2, .L518
	ldr	r0, .L518+4
	str	lr, [r2]
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L518+8
	mov	lr, pc
	bx	r2
	ldr	r4, .L518+12
	ldr	r3, .L518+16
	mov	r2, #100663296
	ldr	r1, .L518+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L518+24
	ldr	r1, .L518+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L519:
	.align	2
.L518:
	.word	state
	.word	losePal
	.word	loadPalette
	.word	DMANow
	.word	4464
	.word	loseTiles
	.word	100718592
	.word	loseMap
	.size	initLose, .-initLose
	.align	2
	.global	initWin
	.type	initWin, %function
initWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	ip, #256
	mov	r4, #3
	mov	r3, #67108864
	mov	r1, #6912
	ldr	r2, .L522
	ldr	r0, .L522+4
	str	r4, [r2]
	strh	ip, [r3]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldr	r2, .L522+8
	mov	lr, pc
	bx	r2
	ldr	r5, .L522+12
	mov	r0, r4
	mov	r3, #3152
	mov	r2, #100663296
	ldr	r1, .L522+16
	mov	lr, pc
	bx	r5
	mov	r0, r4
	mov	r3, #1024
	ldr	r2, .L522+20
	ldr	r1, .L522+24
	mov	lr, pc
	bx	r5
	mov	ip, #0
	ldr	r3, .L522+28
	ldr	r2, .L522+32
	ldr	r1, .L522+36
	ldr	r0, .L522+40
	ldmfd	sp!, {r4, r5, r6, lr}
	str	ip, [r3, #16]
	b	playSoundA
.L523:
	.align	2
.L522:
	.word	state
	.word	winPal
	.word	loadPalette
	.word	DMANow
	.word	winTiles
	.word	100718592
	.word	winMap
	.word	soundA
	.word	11025
	.word	352977
	.word	wechampions
	.size	initWin, .-initWin
	.align	2
	.global	updateLevel
	.type	updateLevel, %function
updateLevel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L534
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #500
	stmfd	sp!, {r4, lr}
	str	r3, [r2]
	beq	.L530
	ldr	r2, .L534+4
	cmp	r3, r2
	beq	.L531
	cmp	r3, #2000
	beq	.L532
	ldr	r2, .L534+8
	cmp	r3, r2
	beq	.L533
.L524:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L533:
	ldmfd	sp!, {r4, lr}
	b	initWin
.L530:
	ldr	r2, .L534+12
	ldr	r1, .L534+16
	ldr	r0, .L534+20
	bl	playSoundB
	mov	r0, #1
	mov	r2, #2
	ldr	r1, .L534+24
	ldr	r3, .L534+28
	str	r0, [r1]
	str	r2, [r3]
	b	.L524
.L531:
	mov	ip, #1
	ldr	r3, .L534+32
	ldr	r2, .L534+12
	ldr	r1, .L534+16
	ldr	r0, .L534+20
	str	ip, [r3]
	bl	playSoundB
	mov	r2, #3
	ldr	r3, .L534+28
	str	r2, [r3]
	b	.L524
.L532:
	mov	ip, #1
	ldr	r3, .L534+36
	ldr	r2, .L534+12
	ldr	r1, .L534+16
	ldr	r0, .L534+20
	str	ip, [r3]
	bl	playSoundB
	mov	r2, #4
	ldr	r3, .L534+28
	str	r2, [r3]
	b	.L524
.L535:
	.align	2
.L534:
	.word	timePlayed
	.word	1500
	.word	3000
	.word	11025
	.word	11944
	.word	levelup
	.word	checkCollisionsLvl2
	.word	level
	.word	checkCollisionsLvl3
	.word	checkCollisionsLvl4
	.size	updateLevel, .-updateLevel
	.align	2
	.global	win
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r2, #0
	ldr	r1, .L542
	strh	r2, [r3, #20]	@ movhi
	strh	r2, [r3, #22]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	strh	r2, [r3, #18]	@ movhi
	ldr	r3, [r1]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L542+4
	ldr	r3, [r3]
	tst	r3, #8
	bxne	lr
	stmfd	sp!, {r4, lr}
	bl	initialize
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L543:
	.align	2
.L542:
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	lose
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.align	2
	.global	instructions
	.type	instructions, %function
instructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #256
	mov	r2, #6912
	stmfd	sp!, {r4, lr}
	ldr	r0, .L552
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L552+4
	mov	lr, pc
	bx	r3
	ldr	r4, .L552+8
	mov	r3, #3856
	mov	r2, #100663296
	ldr	r1, .L552+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L552+16
	ldr	r1, .L552+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L552+24
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L545
	ldr	r3, .L552+28
	ldr	r3, [r3]
	tst	r3, #8
	beq	.L551
.L545:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L551:
	ldmfd	sp!, {r4, lr}
	b	initSplash
.L553:
	.align	2
.L552:
	.word	instructionsPal
	.word	loadPalette
	.word	DMANow
	.word	instructionsTiles
	.word	100718592
	.word	instructionsMap
	.word	oldButtons
	.word	buttons
	.size	instructions, .-instructions
	.align	2
	.global	displayLevelOneEnemies
	.type	displayLevelOneEnemies, %function
displayLevelOneEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L580
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}
	ldr	r4, [r3]
	cmp	r4, #0
	ble	.L554
	mov	r0, #0
	mov	r1, r0
	ldr	r6, .L580+4
	ldr	r3, .L580+8
	ldr	ip, [r6]
	ldr	lr, .L580+12
	ldr	r7, .L580+16
	ldr	r5, .L580+20
.L562:
	ldr	r2, [r3]
	cmp	r2, #2
	beq	.L579
	cmp	r2, #0
	bne	.L559
	ldr	r8, [r3, #-4]
	ldrb	r0, [r3, #-28]	@ zero_extendqisi2
	mov	r2, ip, asl #3
	orr	r0, r0, #32768
	cmp	r8, #0
	strh	r0, [lr, r2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [lr, r2]	@ movhi
	ldr	r0, [r3, #-24]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #5
	mvn	r0, r0, lsr #18
	add	r2, lr, r2
	strh	r0, [r2, #2]	@ movhi
	mov	r0, #1
	ldr	r8, [r3, #-20]
	orr	r8, r8, #1024
	add	r8, r8, #288
	strh	r8, [r2, #4]	@ movhi
	add	ip, ip, #1
.L558:
	add	r1, r1, #1
	cmp	r1, r4
	add	r3, r3, #36
	bne	.L562
	cmp	r0, #0
	strne	ip, [r6]
.L554:
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}
	bx	lr
.L559:
	cmp	r2, #1
	bne	.L558
	ldr	r8, [r3, #-4]
	cmp	r8, #0
	ldr	r8, [r3, #-24]
	mov	r8, r8, asl #23
	mvn	r8, r8, lsr #5
	ldrb	r0, [r3, #-28]	@ zero_extendqisi2
	mov	r2, ip, asl #3
	orr	r0, r0, #32768
	strh	r0, [lr, r2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [lr, r2]	@ movhi
	mvn	r8, r8, lsr #18
	mov	r0, #1
	add	r2, lr, r2
	strh	r7, [r2, #4]	@ movhi
	strh	r8, [r2, #2]	@ movhi
	add	ip, ip, r0
	b	.L558
.L579:
	ldrb	r0, [r3, #-28]	@ zero_extendqisi2
	ldr	r8, [r3, #-4]
	orr	r0, r0, #32768
	mov	r2, ip, asl #3
	cmp	r8, #0
	strh	r0, [lr, r2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [lr, r2]	@ movhi
	ldr	r0, [r3, #-24]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #5
	mvn	r0, r0, lsr #18
	add	r2, lr, r2
	strh	r0, [r2, #2]	@ movhi
	strh	r5, [r2, #4]	@ movhi
	add	ip, ip, #1
	mov	r0, #1
	b	.L558
.L581:
	.align	2
.L580:
	.word	enemy1Size
	.word	spriteCount
	.word	enemy1+28
	.word	shadowOAM
	.word	370
	.word	1884
	.size	displayLevelOneEnemies, .-displayLevelOneEnemies
	.align	2
	.global	displayLevelTwoEnemies
	.type	displayLevelTwoEnemies, %function
displayLevelTwoEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L601
	ldr	ip, [r3]
	cmp	ip, #0
	bxle	lr
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, .L601+4
	ldr	r2, [r4]
	ldr	r1, .L601+8
	add	ip, ip, r2
	mov	r3, r2, asl #3
	add	r3, r3, #2
	add	r0, r1, ip, lsl #3
	mov	r5, #548
	mov	lr, #1280
	ldr	r2, .L601+12
	add	r3, r3, r1
	add	r0, r0, #2
	b	.L588
.L600:
	ldrb	r1, [r2, #-28]	@ zero_extendqisi2
	ldr	r6, [r2, #-4]
	orr	r1, r1, #32768
	cmp	r6, #0
	strh	r1, [r3, #-2]	@ movhi
	orrne	r1, r1, #512
	strneh	r1, [r3, #-2]	@ movhi
	ldr	r1, [r2, #-24]
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #5
	mvn	r1, r1, lsr #18
	strh	lr, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
.L586:
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #36
	beq	.L599
.L588:
	ldr	r1, [r2]
	cmp	r1, #0
	beq	.L600
	cmp	r1, #1
	bne	.L586
	ldrb	r1, [r2, #-28]	@ zero_extendqisi2
	ldr	r6, [r2, #-4]
	orr	r1, r1, #32768
	cmp	r6, #0
	strh	r1, [r3, #-2]	@ movhi
	orrne	r1, r1, #512
	strneh	r1, [r3, #-2]	@ movhi
	ldr	r1, [r2, #-24]
	mov	r1, r1, asl #23
	mvn	r1, r1, lsr #5
	mvn	r1, r1, lsr #18
	strh	r5, [r3, #2]	@ movhi
	strh	r1, [r3]	@ movhi
	add	r3, r3, #8
	cmp	r3, r0
	add	r2, r2, #36
	bne	.L588
.L599:
	str	ip, [r4]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L602:
	.align	2
.L601:
	.word	enemy2Size
	.word	spriteCount
	.word	shadowOAM
	.word	enemy2+28
	.size	displayLevelTwoEnemies, .-displayLevelTwoEnemies
	.align	2
	.global	displayLevelThreeEnemies
	.type	displayLevelThreeEnemies, %function
displayLevelThreeEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L632
	ldr	r3, [r3]
	cmp	r3, #0
	bxle	lr
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	ldr	r4, .L632+4
	ldr	lr, [r4]
	ldr	ip, .L632+8
	mov	r2, lr, asl #3
	add	r1, r2, #2
	add	lr, r3, lr
	add	r1, r1, ip
	add	r2, r2, ip
	mov	r6, #20
	mov	r5, #184
	ldr	r3, .L632+12
	ldr	r8, .L632+16
	ldr	r7, .L632+20
	add	ip, ip, lr, lsl #3
	b	.L613
.L605:
	cmp	r0, #0
	bne	.L607
	ldr	r0, [r3, #-4]
	cmp	r0, #0
	bne	.L608
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	ldr	r9, [r3, #-8]
	orr	r0, r0, #32768
	cmp	r9, #0
	strh	r0, [r1, #-2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [r1, #-2]	@ movhi
	ldr	r0, [r3, #-28]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	strh	r6, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
.L607:
	add	r2, r2, #8
	cmp	r2, ip
	add	r3, r3, #36
	add	r1, r1, #8
	beq	.L630
.L613:
	ldr	r0, [r3]
	cmp	r0, #1
	bne	.L605
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	ldr	r9, [r3, #-8]
	orr	r0, r0, #16384
	cmp	r9, #0
	strh	r0, [r1, #-2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [r1, #-2]	@ movhi
	ldr	r0, [r3, #-28]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #5
	mvn	r0, r0, lsr #18
	strh	r5, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	b	.L607
.L608:
	cmp	r0, #1
	beq	.L631
	cmp	r0, #2
	bne	.L607
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	ldr	r9, [r3, #-8]
	orr	r0, r0, #32768
	cmp	r9, #0
	strh	r0, [r1, #-2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [r1, #-2]	@ movhi
	ldr	r0, [r3, #-28]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	strh	r8, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	b	.L607
.L630:
	str	lr, [r4]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}
	bx	lr
.L631:
	ldrb	r0, [r3, #-32]	@ zero_extendqisi2
	ldr	r9, [r3, #-8]
	orr	r0, r0, #32768
	cmp	r9, #0
	strh	r0, [r1, #-2]	@ movhi
	orrne	r0, r0, #512
	strneh	r0, [r1, #-2]	@ movhi
	ldr	r0, [r3, #-28]
	mov	r0, r0, asl #23
	mvn	r0, r0, lsr #6
	mvn	r0, r0, lsr #17
	strh	r7, [r2, #4]	@ movhi
	strh	r0, [r2, #2]	@ movhi
	b	.L607
.L633:
	.align	2
.L632:
	.word	enemy3Size
	.word	spriteCount
	.word	shadowOAM
	.word	enemy3+32
	.word	1048
	.word	1204
	.size	displayLevelThreeEnemies, .-displayLevelThreeEnemies
	.align	2
	.global	displayLevelFourEnemies
	.type	displayLevelFourEnemies, %function
displayLevelFourEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L654
	stmfd	sp!, {r4, r5, r6, r7, lr}
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L640
	mov	ip, #0
	ldr	r0, .L654+4
	ldr	r2, .L654+8
	ldr	r5, [r0]
	ldr	r1, .L654+12
	ldr	r4, .L654+16
	add	r2, r2, r5, lsl #3
.L639:
	ldrb	r3, [r1]	@ zero_extendqisi2
	ldr	r6, [r1, #24]
	orr	r3, r3, #16384
	cmp	r6, #0
	strh	r3, [r2, #-2]	@ movhi
	orrne	r3, r3, #512
	strneh	r3, [r2, #-2]	@ movhi
	ldr	r3, [r1, #4]
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #5
	mvn	r3, r3, lsr #18
	add	ip, ip, #1
	cmp	ip, lr
	strh	r4, [r2, #2]	@ movhi
	strh	r3, [r2]	@ movhi
	add	r1, r1, #36
	add	r2, r2, #8
	bne	.L639
	add	ip, ip, r5
	str	ip, [r0]
.L640:
	ldr	r3, .L654+20
	ldr	lr, [r3]
	cmp	lr, #0
	ble	.L634
	mov	ip, #0
	ldr	r0, .L654+4
	ldr	r1, .L654+8
	ldr	r5, [r0]
	ldr	r2, .L654+24
	ldr	r6, .L654+28
	ldr	r4, .L654+32
	add	r1, r1, r5, lsl #3
.L644:
	ldr	r7, [r2, #24]
	ldrb	r3, [r2]	@ zero_extendqisi2
	cmp	r7, #0
	orr	r3, r3, #16384
	strh	r3, [r1, #-2]	@ movhi
	orrne	r3, r3, #512
	strneh	r3, [r1, #-2]	@ movhi
	ldr	r3, [r2, #4]
	mov	r3, r3, asl #23
	mvn	r3, r3, lsr #5
	mvn	r3, r3, lsr #18
	ldr	r7, [r2, #28]
	cmp	r7, #0
	strh	r3, [r1]	@ movhi
	streqh	r4, [r1, #2]	@ movhi
	beq	.L643
	cmp	r7, #1
	streqh	r6, [r1, #2]	@ movhi
.L643:
	add	ip, ip, #1
	cmp	ip, lr
	add	r2, r2, #36
	add	r1, r1, #8
	bne	.L644
	add	ip, ip, r5
	str	ip, [r0]
.L634:
	ldmfd	sp!, {r4, r5, r6, r7, lr}
	bx	lr
.L655:
	.align	2
.L654:
	.word	enemy4Size
	.word	spriteCount
	.word	shadowOAM+2
	.word	enemy4
	.word	375
	.word	enemy4SecondTypeSize
	.word	enemy4SecondType
	.word	883
	.word	874
	.size	displayLevelFourEnemies, .-displayLevelFourEnemies
	.align	2
	.global	updateOAM
	.type	updateOAM, %function
updateOAM:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L692
	ldr	r2, [r3, #8]
	cmp	r2, #12
	stmfd	sp!, {r4, lr}
	ldr	r4, .L692+4
	beq	.L658
	bgt	.L659
	cmp	r2, #0
	beq	.L660
	cmp	r2, #4
	bne	.L657
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L682
	cmp	r2, #2
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #5
	mvn	r2, r2, lsr #18
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldreq	r1, .L692+8
	ldr	r3, .L692+12
	ldrne	r1, .L692+16
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
.L657:
	mov	r2, #2
	ldr	r3, .L692+20
	ldr	r3, [r3]
	cmp	r3, #1
	str	r2, [r4]
	beq	.L683
	cmp	r3, #2
	beq	.L684
	cmp	r3, #3
	beq	.L685
	cmp	r3, #4
	beq	.L686
.L675:
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L659:
	cmp	r2, #20
	beq	.L662
	cmp	r2, #100
	bne	.L657
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L687
	cmp	r2, #2
	ldr	r2, [r3, #4]
	ldr	r1, .L692+24
	mov	r2, r2, asl #23
	ldrb	ip, [r3]	@ zero_extendqisi2
	mov	r2, r2, lsr #23
	ldr	r3, .L692+12
	ldreq	r0, .L692+8
	ldrne	r0, .L692+16
	orr	r1, r2, r1
	strh	r1, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	b	.L657
.L662:
	ldr	r2, [r3, #28]
	cmp	r2, #1
	moveq	ip, #172
	beq	.L680
	cmp	r2, #2
	beq	.L688
	ldr	r2, [r3, #4]
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r0, .L692+24
	mov	r3, r2, asl #23
	ldr	ip, .L692+28
	ldr	r2, .L692+12
	mov	r3, r3, lsr #23
.L681:
	orr	r1, r1, #16384
	orr	r0, r3, r0
	strh	r0, [r2, #10]	@ movhi
	strh	r1, [r2, #8]	@ movhi
	strh	ip, [r2, #12]	@ movhi
	b	.L657
.L660:
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L689
	cmp	r2, #2
	ldr	r2, [r3, #4]
	ldrb	r1, [r3]	@ zero_extendqisi2
	mov	r3, r2, asl #23
	mvn	r3, r3, lsr #5
	mvn	r2, r1, asl #17
	mvn	r3, r3, lsr #18
	mvn	r2, r2, lsr #17
	movne	r0, #1024
	ldreq	r1, .L692+12
	ldrne	r1, .L692+12
	ldreq	r0, .L692+32
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	b	.L657
.L658:
	ldr	r2, [r3, #28]
	cmp	r2, #1
	beq	.L690
	cmp	r2, #2
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #5
	beq	.L691
	mvn	r2, r2, lsr #18
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r0, .L692+28
	ldr	r3, .L692+12
	orr	r1, r1, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	b	.L657
.L686:
	bl	displayLevelOneEnemies
	bl	displayLevelTwoEnemies
	bl	displayLevelThreeEnemies
	bl	displayLevelFourEnemies
	mov	r3, #0
	str	r3, [r4]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L683:
	bl	displayLevelOneEnemies
	b	.L675
.L684:
	bl	displayLevelOneEnemies
	bl	displayLevelTwoEnemies
	b	.L675
.L688:
	mov	ip, #1856
.L680:
	ldr	r2, [r3, #4]
	ldrb	r1, [r3]	@ zero_extendqisi2
	mov	r3, r2, asl #23
	ldr	r0, .L692+24
	mov	r3, r3, lsr #23
	ldr	r2, .L692+12
	b	.L681
.L685:
	bl	displayLevelOneEnemies
	bl	displayLevelTwoEnemies
	bl	displayLevelThreeEnemies
	b	.L675
.L682:
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #5
	mvn	r2, r2, lsr #18
	ldrb	r0, [r3]	@ zero_extendqisi2
	ldr	r1, .L692+36
	ldr	r3, .L692+12
	strh	r2, [r3, #10]	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
	b	.L657
.L690:
	ldr	r2, [r3, #4]
	mov	r2, r2, asl #23
	mvn	r2, r2, lsr #5
	mov	r0, #172
.L679:
	mvn	r2, r2, lsr #18
	ldrb	r1, [r3]	@ zero_extendqisi2
	ldr	r3, .L692+12
	orr	r1, r1, #16384
	strh	r2, [r3, #10]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	b	.L657
.L689:
	ldr	r2, [r3, #4]
	ldrb	r1, [r3]	@ zero_extendqisi2
	mov	r3, r2, asl #23
	mvn	r3, r3, lsr #5
	mvn	r2, r1, asl #17
	mvn	r3, r3, lsr #18
	mvn	r2, r2, lsr #17
	mov	r0, #544
	ldr	r1, .L692+12
	strh	r3, [r1, #10]	@ movhi
	strh	r2, [r1, #8]	@ movhi
	strh	r0, [r1, #12]	@ movhi
	b	.L657
.L687:
	ldr	r2, [r3, #4]
	ldr	r1, .L692+24
	mov	r2, r2, asl #23
	ldrb	ip, [r3]	@ zero_extendqisi2
	mov	r2, r2, lsr #23
	ldr	r3, .L692+12
	ldr	r0, .L692+36
	orr	r1, r2, r1
	strh	r1, [r3, #10]	@ movhi
	strh	ip, [r3, #8]	@ movhi
	strh	r0, [r3, #12]	@ movhi
	b	.L657
.L691:
	mov	r0, #1856
	b	.L679
.L693:
	.align	2
.L692:
	.word	player
	.word	spriteCount
	.word	1653
	.word	shadowOAM
	.word	1028
	.word	level
	.word	-12288
	.word	1036
	.word	1356
	.word	589
	.size	updateOAM, .-updateOAM
	.align	2
	.global	game
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L723
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r4, [r3]
	cmp	r4, #1
	beq	.L714
	cmp	r4, #0
	beq	.L715
.L694:
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L715:
	ldr	r6, .L723+4
	bl	updateLevel
	bl	updatePlayerPosition
	ldr	r3, [r6]
	add	r3, r3, #1
	cmp	r3, #3
	ldr	r5, .L723+8
	str	r3, [r6]
	beq	.L716
.L699:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L717
	cmp	r3, #1
	beq	.L718
	cmp	r3, #2
	beq	.L719
.L713:
	ldr	r3, .L723+12
	ldr	r3, [r3]
.L706:
	mov	ip, #67108864
	ldr	r2, .L723+16
	ldr	r0, [r2]
	add	r2, r3, r3, lsl #1
	add	r1, r0, r0, lsl #1
	add	r1, r1, r1, lsr #31
	add	r2, r2, r2, lsr #31
	mov	r1, r1, asl #15
	mov	r0, r0, asl #16
	mov	r3, r3, asl #16
	mov	r2, r2, asl #15
	mov	r1, r1, lsr #16
	mov	r0, r0, lsr #16
	mov	r3, r3, lsr #16
	mov	r2, r2, lsr #16
	strh	r0, [ip, #20]	@ movhi
	strh	r3, [ip, #22]	@ movhi
	strh	r1, [ip, #16]	@ movhi
	strh	r2, [ip, #18]	@ movhi
	bl	adjustRowColVals
	ldr	r4, .L723+20
	bl	checkScreenCollisions
	bl	checkEnemyCollisions
	bl	updateOAM
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L723+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	bl	checkPlayerKeys
	ldr	r3, .L723+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L717:
	ldr	r2, .L723+12
	ldr	r3, [r2]
	sub	r3, r3, #1
	str	r3, [r2]
	b	.L706
.L714:
	ldr	r3, .L723+28
	mov	lr, pc
	bx	r3
	ldr	r3, .L723+32
	ldr	r2, [r3]
	add	r2, r2, #1
	str	r2, [r3]
	ldr	r3, [r3]
	cmp	r3, #100
	bne	.L694
	mov	ip, #0
	ldr	r3, .L723+36
	ldr	r2, .L723+40
	ldr	r1, .L723+44
	ldr	r0, .L723+48
	str	ip, [r3, #16]
	bl	playSoundB
	ldmfd	sp!, {r4, r5, r6, lr}
	b	initLose
.L716:
	ldr	r3, [r5, #28]
	cmp	r3, #0
	beq	.L720
	cmp	r3, #1
	beq	.L721
	cmp	r3, #2
	beq	.L722
.L701:
	bl	changeEnemyPositions
	mov	r3, #0
	str	r3, [r6]
	b	.L699
.L720:
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	b	.L701
.L718:
	ldr	r2, .L723+12
	ldr	r3, [r2]
	sub	r3, r3, #2
	str	r3, [r2]
	b	.L706
.L719:
	ldr	r2, .L723+52
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r2]
	bne	.L713
	mov	r0, #0
	ldr	r1, .L723+12
	ldr	r3, [r1]
	sub	r3, r3, #1
	str	r3, [r1]
	str	r0, [r2]
	b	.L706
.L721:
	ldr	r3, [r5]
	add	r3, r3, #2
	str	r3, [r5]
	b	.L701
.L722:
	ldr	r2, .L723+52
	ldr	r3, [r2]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r2]
	ldreq	r3, [r5]
	addeq	r3, r3, #3
	streq	r4, [r2]
	streq	r3, [r5]
	b	.L701
.L724:
	.align	2
.L723:
	.word	playerDead
	.word	count
	.word	player
	.word	vOff
	.word	hOff
	.word	DMANow
	.word	shadowOAM
	.word	waitForVblank
	.word	timer
	.word	soundB
	.word	11025
	.word	198144
	.word	OhGod
	.word	count3
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r7, fp, lr}
	mov	r0, #0
	mov	r4, #67108864
	mov	r5, #1
	mov	r7, #128
	ldr	r3, .L738
	ldr	r2, .L738+4
	ldrh	r1, [r4, #4]
	str	r0, [r2]
	ldrh	r2, [r3]
	ldr	ip, .L738+8
	ldr	lr, .L738+12
	ldr	r6, .L738+16
	orr	r2, r2, r5
	orr	r1, r1, #8
	strh	r7, [r4, #132]	@ movhi
	strh	r0, [r4, #128]	@ movhi
	strh	r1, [r4, #4]	@ movhi
	strh	r6, [r4, #130]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	str	lr, [ip, #4092]
	ldr	r3, .L738+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L738+24
	mov	lr, pc
	bx	r3
	ldr	r8, .L738+28
	ldr	r6, .L738+32
	ldr	r5, .L738+36
	ldr	fp, .L738+40
	ldr	r10, .L738+44
	ldr	r9, .L738+48
	ldr	r7, .L738+52
.L726:
	ldr	r3, [r8]
	ldr	r2, [r6]
.L727:
	str	r3, [r5]
	ldr	r3, [r4, #304]
	str	r3, [r8]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L727
.L729:
	.word	.L728
	.word	.L730
	.word	.L731
	.word	.L733
	.word	.L733
	.word	.L734
.L733:
	mov	lr, pc
	bx	r7
	b	.L726
.L734:
	mov	lr, pc
	bx	r10
	b	.L726
.L731:
	ldr	r3, .L738+56
	mov	lr, pc
	bx	r3
	b	.L726
.L730:
	mov	lr, pc
	bx	r9
	b	.L726
.L728:
	mov	lr, pc
	bx	fp
	b	.L726
.L739:
	.align	2
.L738:
	.word	67109376
	.word	seed
	.word	50360320
	.word	interruptHandler
	.word	-1266
	.word	initialize
	.word	initSplash
	.word	buttons
	.word	state
	.word	oldButtons
	.word	splash
	.word	instructions
	.word	game
	.word	win
	.word	pause
	.size	main, .-main
	.text
	.align	2
	.global	loadMap
	.type	loadMap, %function
loadMap:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, fp, lr}
	mov	r6, r1, asl #1
	add	ip, r6, #8
	cmp	r1, #0
	bic	ip, ip, #7
	add	fp, sp, #20
	movne	r4, r2, asl #28
	sub	sp, sp, ip
	mov	r5, sp
	addne	r6, r0, r6
	movne	r4, r4, lsr #16
	subne	lr, sp, #2
	beq	.L743
.L742:
	ldrh	ip, [r0], #2
	mov	ip, ip, asl #20
	orr	ip, r4, ip, lsr #20
	cmp	r0, r6
	strh	ip, [lr, #2]!	@ movhi
	bne	.L742
.L743:
	mov	r2, r3, asl #11
	add	r2, r2, #100663296
	mov	r3, r1, lsr #1
	mov	r0, #3
	mov	r1, r5
	ldr	r4, .L747
	mov	lr, pc
	bx	r4
	sub	sp, fp, #20
	@ sp needed
	ldmfd	sp!, {r4, r5, r6, r7, fp, lr}
	bx	lr
.L748:
	.align	2
.L747:
	.word	DMANow
	.size	loadMap, .-loadMap
	.comm	enemy4SecondTypeSize,4,4
	.comm	enemy4SecondType,108,4
	.comm	enemy4Size,4,4
	.comm	enemy4,108,4
	.comm	enemy3Size,4,4
	.comm	enemy3,180,4
	.comm	enemy2Size,4,4
	.comm	enemy2,180,4
	.comm	enemy1Size,4,4
	.comm	enemy1,108,4
	.comm	playerDead,4,4
	.comm	player,36,4
	.comm	shadowOAM,1024,4
	.comm	checkCollisionsLvl4,4,4
	.comm	checkCollisionsLvl3,4,4
	.comm	checkCollisionsLvl2,4,4
	.comm	vOff,4,4
	.comm	hOff,4,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.comm	Bg1TempV,4,4
	.comm	Bg1TempH,4,4
	.comm	Bg0TempV,4,4
	.comm	Bg0TempH,4,4
	.comm	timer,4,4
	.comm	seed,4,4
	.comm	autoPilot,4,4
	.comm	timePlayed,4,4
	.comm	level,4,4
	.comm	spriteCount,4,4
	.comm	count3,4,4
	.comm	count,4,4
	.comm	state,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.ident	"GCC: (devkitARM release 45) 5.3.0"
