
    mov $0x80, %al
    mov $0x643, %dx         # control register = base 0x640 + 3
    out %al, %dx

    # --- Initialize scroll ---
    mov $0, %si             # start SHE at digit 0
    mov $1, %bp             # stat scrolling right (+1)

scroll_loop:

    # --- Refresh display DI times so SHE is visible ---
    mov $200, %di

refresh_loop:

    # Display S at digit SI
    mov %si, %cx            # CX = digit position of S
    mov $0x6F, %bl          # BL = segment pattern for S
    call show_digit

    # Display H at digit SI+1
    mov %si, %cx
    inc %cx                 # CX = SI + 1
    mov $0x76, %bl          # BL = segment pattern for H
    call show_digit

    # Display E at digit SI+2
    mov %si, %cx
    add $2, %cx             # CX = SI + 2
    mov $0x79, %bl          # BL = segment pattern for E
    call show_digit

    dec %di
    jnz refresh_loop        # Keep refreshing until DI hits 0

    # --- Move SHE one step in current direction ---
    add %bp, %si

    # --- Check boundaries and flip direction if needed ---
    cmp $5, %si             # S can go up to digit 5
    jg flip_direction
    cmp $0, %si
    jl flip_direction
    jmp scroll_loop

flip_direction:
    neg %bp                 # Flip direction (+1 -> -1 or -1 -> +1)
    add %bp, %si            # Correct the overshoot
    jmp scroll_loop

# --- Subroutine: show_digit ---
# Activates one digit and sends its segment pattern
# Input: CX = digit number (0-7), BL = segment byte
show_digit:
    # write 1 << CX to Port A
    mov $1, %al
    shl %cl, %al            # Shift 1 left by digit number
    mov $0x640, %dx         # Port A address
    out %al, %dx

    # semd pattern to Port B
    mov %bl, %al            # AL = segment byte
    mov $0x641, %dx         # Port B address
    out %al, %dx

    # Short delay so digit stays lit
    push %cx
    mov $0x500, %cx
delay_loop:
    nop
    loop delay_loop
    pop %cx
    ret