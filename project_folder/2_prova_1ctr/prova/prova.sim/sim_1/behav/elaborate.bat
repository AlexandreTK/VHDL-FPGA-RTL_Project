@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 78bae211ef3b48978bcf75412a63c28e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot toplevel_tb_behav xil_defaultlib.toplevel_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
