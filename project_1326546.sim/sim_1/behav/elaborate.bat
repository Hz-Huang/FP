@echo off
set xv_path=C:\\Xilinx\\Vivado\\2016.2\\bin
call %xv_path%/xelab  -wto 5174ce79fdf04fa180b204cfba613a6e -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot TB_behav xil_defaultlib.TB -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
