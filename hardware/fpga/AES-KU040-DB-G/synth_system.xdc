# ----------------------------------------------------------------------------
#     _____
#    /     \
#   /____   \____
#  / \===\   \==/
# /___\===\___\/  AVNET Design Resource Center
#      \======/         www.em.avnet.com/drc
#       \====/    
# ----------------------------------------------------------------------------
#  
#  Disclaimer:
#     Avnet, Inc. makes no warranty for the use of this code or design.
#     This code is provided  "As Is". Avnet, Inc assumes no responsibility for
#     any errors, which may appear in this code, nor does it make a commitment
#     to update the information contained herein. Avnet, Inc specifically
#     disclaims any implied warranties of fitness for a particular purpose.
#                      Copyright(c) 2009 Avnet, Inc.
#                              All rights reserved.
# 
# ----------------------------------------------------------------------------

## System Clock 
# LVDS Programmable Clock Generator (CDCM61002)
#set_property  PACKAGE_PIN M5   [get_ports LVDS_CLK0_N]
#set_property  PACKAGE_PIN M6   [get_ports LVDS_CLK0_P]
#set_property  PACKAGE_PIN P5   [get_ports LVDS_CLK1_N]
#set_property  PACKAGE_PIN P6   [get_ports LVDS_CLK1_P]

#set_property  IOSTANDARD LVDS [get_ports LVDS_CLK0_N]
#set_property  IOSTANDARD LVDS [get_ports LVDS_CLK0_P]
#set_property  IOSTANDARD LVDS [get_ports LVDS_CLK1_N]
#set_property  IOSTANDARD LVDS [get_ports LVDS_CLK1_P]

##DDR clocks
set_property PACKAGE_PIN H22 [get_ports c0_sys_clk_clk_p]
set_property PACKAGE_PIN H23 [get_ports c0_sys_clk_clk_n]
set_property IOSTANDARD DIFF_SSTL12 [get_ports c0_sys_clk_clk_p]
set_property IOSTANDARD DIFF_SSTL12 [get_ports c0_sys_clk_clk_n]

#create_clock -period 4.000 [get_ports c0_sys_clk_clk_p]  

#derive_pll_clocks
#derive_clock_uncertainty

set_property CFGBVS VCCO [current_design]

## USB-UART Interface
set_property PACKAGE_PIN D20 [get_ports uart_txd]
set_property IOSTANDARD LVCMOS18 [get_ports uart_txd]
set_property PACKAGE_PIN C19 [get_ports uart_rxd]
set_property IOSTANDARD LVCMOS18 [get_ports uart_rxd]

###### User LEDs
#set_property PACKAGE_PIN D16 [get_ports {led[6]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[6]}]

#set_property PACKAGE_PIN G16 [get_ports {led[5]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[5]}]

#set_property PACKAGE_PIN H16 [get_ports {led[4]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[4]}]

#set_property PACKAGE_PIN E18 [get_ports {led[3]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[3]}]

#set_property PACKAGE_PIN E17 [get_ports {led[2]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[2]}]

#set_property PACKAGE_PIN E16 [get_ports {led[1]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[1]}]

#set_property PACKAGE_PIN H18 [get_ports {led[0]}]
#set_property IOSTANDARD LVCMOS18 [get_ports {led[0]}]

set_property PACKAGE_PIN H17 [get_ports {trap}]
set_property IOSTANDARD LVCMOS18 [get_ports {trap}]

####### User PUSH Switches
set_property PACKAGE_PIN K20 [get_ports {reset}]
set_property IOSTANDARD LVCMOS12 [get_ports {reset}]

#set_property PACKAGE_PIN K18 [get_ports {gpio_push_sw_tri_i[0]}]
#set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[0]}]

#set_property PACKAGE_PIN L18 [get_ports {gpio_push_sw_tri_i[1]}]
#set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[1]}]

#set_property PACKAGE_PIN K21 [get_ports {gpio_push_sw_tri_i[2]}]
#set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[2]}]

#set_property PACKAGE_PIN K20 [get_ports {gpio_push_sw_tri_i[3]}]
#set_property IOSTANDARD LVCMOS12 [get_ports {gpio_push_sw_tri_i[3]}]


############ RISCV Core ###################

create_pblock RISCV
add_cells_to_pblock [get_pblocks RISCV] [get_cells -quiet [list system/cpu system/dbus_split system/ibus_split system/int_mem0 system/pbus_split system/timer system/uart_0 system/uart_1]]
resize_pblock [get_pblocks RISCV] -add {SLICE_X2Y0:SLICE_X13Y55}
resize_pblock [get_pblocks RISCV] -add {DSP48E2_X0Y0:DSP48E2_X1Y21}
resize_pblock [get_pblocks RISCV] -add {RAMB18_X0Y0:RAMB18_X1Y21}
resize_pblock [get_pblocks RISCV] -add {RAMB36_X0Y0:RAMB36_X1Y10}

############ Adder Cores ###################

create_pblock pblock_adder1
add_cells_to_pblock [get_pblocks pblock_adder1] [get_cells -quiet [list system/adder1]]
resize_pblock [get_pblocks pblock_adder1] -add {SLICE_X0Y0:SLICE_X0Y4}

create_pblock pblock_adder2
add_cells_to_pblock [get_pblocks pblock_adder2] [get_cells -quiet [list system/adder2]]
resize_pblock [get_pblocks pblock_adder2] -add {SLICE_X1Y0:SLICE_X1Y4}

create_pblock pblock_adder3
add_cells_to_pblock [get_pblocks pblock_adder3] [get_cells -quiet [list system/adder3]]
resize_pblock [get_pblocks pblock_adder3] -add {SLICE_X0Y5:SLICE_X0Y9}

create_pblock pblock_adder4
add_cells_to_pblock [get_pblocks pblock_adder4] [get_cells -quiet [list system/adder4]]
resize_pblock [get_pblocks pblock_adder4] -add {SLICE_X1Y5:SLICE_X1Y9}

create_pblock pblock_adder5
add_cells_to_pblock [get_pblocks pblock_adder5] [get_cells -quiet [list system/adder5]]
resize_pblock [get_pblocks pblock_adder5] -add {SLICE_X99Y0:SLICE_X99Y4}

create_pblock pblock_adder6
add_cells_to_pblock [get_pblocks pblock_adder6] [get_cells -quiet [list system/adder6]]
resize_pblock [get_pblocks pblock_adder6] -add {SLICE_X100Y0:SLICE_X100Y4}

create_pblock pblock_adder7
add_cells_to_pblock [get_pblocks pblock_adder7] [get_cells -quiet [list system/adder7]]
resize_pblock [get_pblocks pblock_adder7] -add {SLICE_X99Y5:SLICE_X99Y9}

create_pblock pblock_adder8
add_cells_to_pblock [get_pblocks pblock_adder8] [get_cells -quiet [list system/adder8]]
resize_pblock [get_pblocks pblock_adder8] -add {SLICE_X100Y5:SLICE_X100Y9}

create_pblock pblock_adder9
add_cells_to_pblock [get_pblocks pblock_adder9] [get_cells -quiet [list system/adder9]]
resize_pblock [get_pblocks pblock_adder9] -add {SLICE_X0Y290:SLICE_X0Y294}

create_pblock pblock_adder10
add_cells_to_pblock [get_pblocks pblock_adder10] [get_cells -quiet [list system/adder10]]
resize_pblock [get_pblocks pblock_adder10] -add {SLICE_X1Y290:SLICE_X1Y294}

create_pblock pblock_adder11
add_cells_to_pblock [get_pblocks pblock_adder11] [get_cells -quiet [list system/adder11]]
resize_pblock [get_pblocks pblock_adder11] -add {SLICE_X0Y295:SLICE_X0Y299}

create_pblock pblock_adder12
add_cells_to_pblock [get_pblocks pblock_adder12] [get_cells -quiet [list system/adder12]]
resize_pblock [get_pblocks pblock_adder12] -add {SLICE_X1Y295:SLICE_X1Y299}

create_pblock pblock_adder13
add_cells_to_pblock [get_pblocks pblock_adder13] [get_cells -quiet [list system/adder13]]
resize_pblock [get_pblocks pblock_adder13] -add {SLICE_X99Y290:SLICE_X99Y294}

create_pblock pblock_adder14
add_cells_to_pblock [get_pblocks pblock_adder14] [get_cells -quiet [list system/adder14]]
resize_pblock [get_pblocks pblock_adder14] -add {SLICE_X100Y290:SLICE_X100Y294}

create_pblock pblock_adder15
add_cells_to_pblock [get_pblocks pblock_adder15] [get_cells -quiet [list system/adder15]]
resize_pblock [get_pblocks pblock_adder15] -add {SLICE_X99Y295:SLICE_X99Y299}

create_pblock pblock_adder16
add_cells_to_pblock [get_pblocks pblock_adder16] [get_cells -quiet [list system/adder16]]
resize_pblock [get_pblocks pblock_adder16] -add {SLICE_X100Y295:SLICE_X100Y299}






