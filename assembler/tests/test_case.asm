ji start

equ foo 0xB00
equ FOO 0b0101
equ Foo 0xB0A
equ fOO 1

equ s00 0x40
equ s01 0x41
equ s02 0x42
equ s03 0x43
equ s04 0x44
equ s05 0x45
equ s06 0x46
equ s07 0x47
equ s08 0x48
equ s09 0x49

equ STDOUT 0x200

start:
	mi s00, foo
	call printhex
	mi STDOUT, '\n'

	mi s00, FOO
	call printhex
	mi STDOUT, '\n'

	mi s00, Foo
	call printhex
	mi STDOUT, '\n'

	mi s00, fOO
	call printhex
	mi STDOUT, '\n'

	hf


equ __a_printhex_num s00

equ __c_printhex_0 s01
equ __c_printhex_10 s02
equ __c_printhex_15 s03
equ __c_printhex_add_l10 s04
equ __c_printhex_add_ge10 s05

equ __v_printhex_out s06
equ __v_printhex_shift s07

printhex:
  mi __c_printhex_0, 0
  mi __c_printhex_10, 10
  mi __c_printhex_15, 15
	mi __c_printhex_add_l10, '0'
	mi __c_printhex_add_ge10, 55
	# putchar('0');
  mi STDOUT, '0'
	# putchar('x');
	mi STDOUT, 'x'
	# out = num;
	mv __v_printhex_out, __a_printhex_num
	# out >>= 12;
	mi __v_printhex_shift, 12
	sr __v_printhex_out, __v_printhex_shift
	# out &= 15;
	nd __v_printhex_out, __c_printhex_15
	# if (!(out < 10)) {
	jl __v_printhex_out, __c_printhex_10, __l_printhex_ge10_else_1
	  __l_printhex_ge10_then_1:
	#   out += 55;
		  ad __v_printhex_out, __c_printhex_add_ge10
			ji __l_printhex_ge10_end_1
	# } else {
	  __l_printhex_ge10_else_1:
	#		out += '0';
		  ad __v_printhex_out, __c_printhex_add_l10
	# }
	  __l_printhex_ge10_end_1:
	# putchar(out);
	mv STDOUT, __v_printhex_out
	# out = num;
	mv __v_printhex_out, __a_printhex_num
	# out >>= 8;
	mi __v_printhex_shift, 8
	sr __v_printhex_out, __v_printhex_shift
	# out &= 15;
	nd __v_printhex_out, __c_printhex_15
	# if (!(out < 10)) {
	jl __v_printhex_out, __c_printhex_10, __l_printhex_ge10_else_2
	  __l_printhex_ge10_then_2:
	#   out += 55;
		  ad __v_printhex_out, __c_printhex_add_ge10
			ji __l_printhex_ge10_end_2
	# } else {
	  __l_printhex_ge10_else_2:
	#		out += '0';
		  ad __v_printhex_out, __c_printhex_add_l10
	# }
	  __l_printhex_ge10_end_2:
	# putchar(out);
	mv STDOUT, __v_printhex_out
	# out = num;
	mv __v_printhex_out, __a_printhex_num
	# out >>= 4;
	mi __v_printhex_shift, 4
	sr __v_printhex_out, __v_printhex_shift
	# out &= 15;
	nd __v_printhex_out, __c_printhex_15
	# if (!(out < 10)) {
	jl __v_printhex_out, __c_printhex_10, __l_printhex_ge10_else_3
	  __l_printhex_ge10_then_3:
	#   out += 55;
		  ad __v_printhex_out, __c_printhex_add_ge10
			ji __l_printhex_ge10_end_3
	# } else {
	  __l_printhex_ge10_else_3:
	#		out += '0';
		  ad __v_printhex_out, __c_printhex_add_l10
	# }
	  __l_printhex_ge10_end_3:
	# putchar(out);
	mv STDOUT, __v_printhex_out
	# out = num;
	mv __v_printhex_out, __a_printhex_num
	# out &= 15;
	nd __v_printhex_out, __c_printhex_15
	# if (!(out < 10)) {
	jl __v_printhex_out, __c_printhex_10, __l_printhex_ge10_else_4
	  __l_printhex_ge10_then_4:
	#   out += 55;
		  ad __v_printhex_out, __c_printhex_add_ge10
			ji __l_printhex_ge10_end_4
	# } else {
	  __l_printhex_ge10_else_4:
	#		out += '0';
		  ad __v_printhex_out, __c_printhex_add_l10
	# }
	  __l_printhex_ge10_end_4:
	# putchar(out);
	mv STDOUT, __v_printhex_out
	# return;
	ret
