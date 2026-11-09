### 100 MHz clock
#set_property -dict { PACKAGE_PIN W5 IOSTANDARD LVCMOS33 } [get_ports clk]
#create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

### Center button: reset
#set_property -dict { PACKAGE_PIN U18 IOSTANDARD LVCMOS33 } [get_ports reset]

### SW0: serial input
#set_property -dict { PACKAGE_PIN V17 IOSTANDARD LVCMOS33 } [get_ports x]

### LED0: detector output
#set_property -dict { PACKAGE_PIN U16 IOSTANDARD LVCMOS33 } [get_ports z]

### LED1: changes at each sample
#set_property -dict { PACKAGE_PIN E19 IOSTANDARD LVCMOS33 } [get_ports sample_led]