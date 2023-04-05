Written by coolcuber
Uploaded 04.03.2023 (Using the correct [or American] dating system)

To create the file (on windows), simply run build.cmd
This will create ssp.exe, which should be invoked as follows:
C:\> ssp [filename]

The input file formatting is very strict (the program focuses on the problem,
so input handling is kind of wacky).  Here are a few specific requirements:
- Ensure that the file is encoded using CRLF (default Windows encoding) and not
  LF (default Unix encoding)
- Tabs instead of spaces
- Exactly 1 newline between Zone parameters
- Exactly 3 newlines between Zone descriptions
- SZ parameters are given in the following order: x, y
- DZ parameters are given in the following order: x, y, w, h, v
- No extra characters should be included in the file
Warning: The inclusion of extra characters may result in undefined behavior

Example input file
------------------
input.txt
------------------
SZ {
	w = 4
	h = 3
}

DZ {
	x = 0
	y = 7
	w = 7
	h = 5
	v = 4
}

DZ {
	x = 1
	y = 0
	w = 5
	h = 10
	v = 6
}

DZ {
	x = 5
	y = 5
	w = 6
	h = 6
	v = 7
}

DZ {
	x = 4
	y = 3
	w = 6
	h = 6
	v = 3
}

DZ {
	x = 9
	y = 2
	w = 6
	h = 5
	v = 10
}
------------------

Running this file should result in the following output
----------------------------------------------------------
SZ: x = 3.000000, y = 7.000000, w = 4.000000, h = 3.000000
Optimal Reward: 162.000000
----------------------------------------------------------