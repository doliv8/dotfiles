#!/usr/bin/env python3
# -*- coding: utf-8 -*-
from pwn import *

context.terminal = ['konsole', '-e']

exe = context.binary = ELF(args.EXE or '<exe_debug_relpath:EXE_DEBUG_PATH>')
# exe = context.binary = ELF(args.EXE or '<exe_relpath:EXE_PATH>') # for unpatched binary
libc = exe.libc
# libc = ELF("<libc_relpath:LIBC_PATH>", checksec=False)

nc = '<host:localhost> <port:1337>'
nc = nc.split()
if len(nc) == 3:
    host, port = nc[1:]
else:
    host, port = nc[:2]

host = args.HOST or host
port = int(args.PORT or port)

def start_local(argv=[], *a, **kw):
    '''Execute the target binary locally'''
    if args.GDB:
        return gdb.debug([exe.path] + argv, gdbscript=gdbscript, *a, **kw)
    else:
        return process([exe.path] + argv, *a, **kw)

def start_remote(argv=[], *a, **kw):
    '''Connect to the process on the remote host'''
    io = connect(host, port)
    # io = connect(host, port, ssl=True) # for ssl enabled
    if args.GDB:
        gdb.attach(io, gdbscript=gdbscript)
    return io

def start(argv=[], *a, **kw):
    '''Start the exploit against the target.'''
    if args.LOCAL:
        return start_local(argv, *a, **kw)
    else:
        return start_remote(argv, *a, **kw)

gdbscript = '''
tbreak main
continue
'''.format(**locals())

ru  = lambda *x, **y: io.recvuntil(*x, **y)
rl  = lambda *x, **y: io.recvline(*x, **y)
rc  = lambda *x, **y: io.recv(*x, **y)
sla = lambda *x, **y: io.sendlineafter(*x, **y)
sa  = lambda *x, **y: io.sendafter(*x, **y)
sl  = lambda *x, **y: io.sendline(*x, **y)
sn  = lambda *x, **y: io.send(*x, **y)
ia  = lambda *x, **y: io.interactive(*x, **y)

protect_ptr = lambda pos, ptr: (pos >> 12) ^ ptr

def decrypt_ptr(val):
    mask = 0xfff << (64-12)
    while mask:
        v = val & mask
        val ^= v >> 12
        mask >>= 12
    return val

def parse_leak(leak):
    return u64(leak + bytes(8-len(leak)))

def bhtoi(buf):
    return shtoi(buf.decode())

def shtoi(string):
    if string.startswith('0x'):
        string = string[2:]
    return int(string, 16)

def trace(func):
    def wrapper(*args, **kwargs):
        info(f"{{func.__name__}}({{args}} {{kwargs}})")
        ret_val = func(*args, **kwargs)
        info(f"{{func.__name__}} returned {{ret_val}}")
        return ret_val
    return wrapper


# -- Exploit goes here --

io = start()

# <interactions>


ia()

