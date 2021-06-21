EESchema Schematic File Version 4
LIBS:stupid-solar-thing-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 60C605BE
P 4700 4450
F 0 "U1" H 4700 3365 50  0000 R CNN
F 1 "WeMos_D1_mini" H 4700 3233 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 4700 3300 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 2850 3300 50  0001 C CNN
	1    4700 4450
	1    0    0    -1  
$EndComp
$Comp
L SparkFun-DiscreteSemi:TRANS_NPN-2N3904 Q1
U 1 1 60C68CA6
P 1650 1550
F 0 "Q1" H 1794 1645 45  0000 L CNN
F 1 "2N3904" H 1794 1561 45  0000 L CNN
F 2 "TO-92" H 1650 1800 20  0001 C CNN
F 3 "" H 1650 1550 50  0001 C CNN
F 4 "TRANS-08447" H 1794 1466 60  0000 L CNN "Field4"
	1    1650 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60C6A971
P 5900 1500
F 0 "R1" H 5970 1546 50  0000 L CNN
F 1 "R100K" H 5970 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 1500 50  0001 C CNN
F 3 "~" H 5900 1500 50  0001 C CNN
	1    5900 1500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_PHOTO R3
U 1 1 60C6B179
P 9900 1400
F 0 "R3" H 9712 1354 50  0000 R CNN
F 1 "R_PHOTO" H 9712 1445 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" V 9950 1150 50  0001 L CNN
F 3 "~" H 9900 1350 50  0001 C CNN
	1    9900 1400
	-1   0    0    1   
$EndComp
$Comp
L Sensor:DHT11 U3
U 1 1 60C6BCC1
P 4000 1650
F 0 "U3" V 3711 1650 50  0000 C CNN
F 1 "DHT11" V 3620 1650 50  0000 C CNN
F 2 "Sensor:Aosong_DHT11_5.5x12.0_P2.54mm" H 4000 1250 50  0001 C CNN
F 3 "http://akizukidenshi.com/download/ds/aosong/DHT11.pdf" H 4150 1900 50  0001 C CNN
	1    4000 1650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60C8AB4D
P 5900 1950
F 0 "#PWR0101" H 5900 1700 50  0001 C CNN
F 1 "GND" H 5905 1777 50  0000 C CNN
F 2 "" H 5900 1950 50  0001 C CNN
F 3 "" H 5900 1950 50  0001 C CNN
	1    5900 1950
	1    0    0    -1  
$EndComp
$Comp
L Analog_Switch:CD4051B U2
U 1 1 60CF08B7
P 7050 4050
F 0 "U2" H 7050 4931 50  0000 R CNN
F 1 "CD4051B" H 7050 4840 50  0000 R CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7200 3300 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4052b.pdf" H 7030 4150 50  0001 C CNN
	1    7050 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1150 4000 1350
$Comp
L power:GND #PWR0102
U 1 1 60D097B4
P 6350 4050
F 0 "#PWR0102" H 6350 3800 50  0001 C CNN
F 1 "GND" H 6355 3877 50  0000 C CNN
F 2 "" H 6350 4050 50  0001 C CNN
F 3 "" H 6350 4050 50  0001 C CNN
	1    6350 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60D09EF3
P 6950 4900
F 0 "#PWR0103" H 6950 4650 50  0001 C CNN
F 1 "GND" H 6955 4727 50  0000 C CNN
F 2 "" H 6950 4900 50  0001 C CNN
F 3 "" H 6950 4900 50  0001 C CNN
	1    6950 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 4750 6950 4850
Wire Wire Line
	7050 4750 7050 4850
Wire Wire Line
	7050 4850 6950 4850
Connection ~ 6950 4850
Wire Wire Line
	6950 4850 6950 4900
Wire Wire Line
	6550 4050 6350 4050
Wire Wire Line
	7150 3350 7150 3000
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 60D108B4
P 7850 1600
F 0 "J1" H 7878 1626 50  0000 L CNN
F 1 "Cap. Moist. Sensor" H 7878 1535 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7850 1600 50  0001 C CNN
F 3 "~" H 7850 1600 50  0001 C CNN
	1    7850 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 60D175AC
P 7450 1800
F 0 "#PWR0104" H 7450 1550 50  0001 C CNN
F 1 "GND" H 7455 1627 50  0000 C CNN
F 2 "" H 7450 1800 50  0001 C CNN
F 3 "" H 7450 1800 50  0001 C CNN
	1    7450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1600 7650 1600
Wire Wire Line
	7650 1700 7450 1700
Wire Wire Line
	7450 1700 7450 1800
Wire Wire Line
	7650 1500 6950 1500
$Comp
L Device:R R4
U 1 1 60D1A25F
P 9900 1700
F 0 "R4" H 9970 1746 50  0000 L CNN
F 1 "10k" H 9970 1655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9830 1700 50  0001 C CNN
F 3 "~" H 9900 1700 50  0001 C CNN
	1    9900 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 1550 9300 1550
Connection ~ 9900 1550
$Comp
L power:GND #PWR0105
U 1 1 60D1C427
P 9900 1850
F 0 "#PWR0105" H 9900 1600 50  0001 C CNN
F 1 "GND" H 9905 1677 50  0000 C CNN
F 2 "" H 9900 1850 50  0001 C CNN
F 3 "" H 9900 1850 50  0001 C CNN
	1    9900 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60D1D605
P 4450 1650
F 0 "#PWR0106" H 4450 1400 50  0001 C CNN
F 1 "GND" H 4455 1477 50  0000 C CNN
F 2 "" H 4450 1650 50  0001 C CNN
F 3 "" H 4450 1650 50  0001 C CNN
	1    4450 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 1650 3700 1650
Wire Wire Line
	4300 1650 4450 1650
Wire Wire Line
	5900 1650 5350 1650
Wire Wire Line
	5900 1350 5900 1100
Text GLabel 5650 1100 0    50   Input ~ 0
BATT+
Wire Wire Line
	5650 1100 5900 1100
Text GLabel 5350 1650 0    50   Input ~ 0
X0
Wire Notes Line
	5000 950  6350 950 
Wire Notes Line
	6350 950  6350 2250
Wire Notes Line
	6350 2250 5000 2250
Wire Notes Line
	5000 2250 5000 950 
Text GLabel 9300 1550 0    50   Input ~ 0
X1
Text GLabel 6950 1500 0    50   Input ~ 0
X2
Wire Notes Line
	6600 950  8650 950 
Wire Notes Line
	8650 950  8650 2200
Wire Notes Line
	8650 2200 6600 2200
Wire Notes Line
	6600 2200 6600 950 
Wire Notes Line
	10550 950  10550 2200
Wire Notes Line
	10550 2200 8900 2200
Wire Notes Line
	8900 2200 8900 950 
Wire Notes Line
	8900 950  10550 950 
Text GLabel 7550 3850 2    50   Input ~ 0
X0
Text GLabel 7550 3950 2    50   Input ~ 0
X1
Text GLabel 7550 4050 2    50   Input ~ 0
X2
Text GLabel 4000 1150 0    50   Input ~ 0
DHT22-SIG
Text GLabel 5100 4450 2    50   Input ~ 0
DHT22-SIG
Wire Notes Line
	4750 900  4750 2250
Wire Notes Line
	3000 2250 3000 900 
Text GLabel 6550 3550 0    50   Input ~ 0
MUX-S0
Text GLabel 5100 4150 2    50   Input ~ 0
MUX-S0
Text GLabel 6550 3650 0    50   Input ~ 0
MUX-S1
Text GLabel 5100 4250 2    50   Input ~ 0
MUX-S1
Text GLabel 6550 3750 0    50   Input ~ 0
MUX-S2
Text GLabel 5100 4350 2    50   Input ~ 0
MUX-S2
Text GLabel 7000 3000 0    50   Input ~ 0
S_PWR+
Text GLabel 7450 1250 0    50   Input ~ 0
S_PWR+
Text GLabel 9900 1100 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	7450 1250 7450 1600
Wire Wire Line
	9900 1100 9900 1250
Text GLabel 3450 1650 0    50   Input ~ 0
S_PWR+
Wire Notes Line
	3000 900  4750 900 
Wire Notes Line
	3000 2250 4750 2250
Wire Wire Line
	7150 3000 7000 3000
NoConn ~ 7550 4150
NoConn ~ 7550 4250
NoConn ~ 7550 4350
NoConn ~ 7550 4450
NoConn ~ 7550 4550
Text GLabel 4600 3050 0    50   Input ~ 0
BATT+
Text GLabel 5100 4550 2    50   Input ~ 0
SENSORS_EN
Text GLabel 1550 1550 0    50   Input ~ 0
SENSORS_EN
$Comp
L power:+3.3V #PWR0107
U 1 1 60D037D8
P 4800 3650
F 0 "#PWR0107" H 4800 3500 50  0001 C CNN
F 1 "+3.3V" H 4815 3823 50  0000 C CNN
F 2 "" H 4800 3650 50  0001 C CNN
F 3 "" H 4800 3650 50  0001 C CNN
	1    4800 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 60D040C2
P 1750 1350
F 0 "#PWR0108" H 1750 1200 50  0001 C CNN
F 1 "+3.3V" H 1765 1523 50  0000 C CNN
F 2 "" H 1750 1350 50  0001 C CNN
F 3 "" H 1750 1350 50  0001 C CNN
	1    1750 1350
	1    0    0    -1  
$EndComp
Text GLabel 1750 1900 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	1750 1750 1750 1900
Wire Notes Line
	700  900  2750 900 
Wire Notes Line
	2750 900  2750 2250
Wire Notes Line
	2750 2250 700  2250
Wire Notes Line
	700  2250 700  900 
Wire Wire Line
	4300 4050 4150 4050
Wire Wire Line
	4150 4050 4150 3300
Wire Wire Line
	5600 3300 5600 4050
NoConn ~ 5100 4650
NoConn ~ 5100 4750
NoConn ~ 5100 4850
NoConn ~ 4300 4350
NoConn ~ 4300 4450
$Comp
L power:GND #PWR0109
U 1 1 60D2093D
P 4700 5250
F 0 "#PWR0109" H 4700 5000 50  0001 C CNN
F 1 "GND" H 4705 5077 50  0000 C CNN
F 2 "" H 4700 5250 50  0001 C CNN
F 3 "" H 4700 5250 50  0001 C CNN
	1    4700 5250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60D26EDA
P 5900 1800
F 0 "R2" H 5970 1846 50  0000 L CNN
F 1 "R100K" H 5970 1755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5830 1800 50  0001 C CNN
F 3 "~" H 5900 1800 50  0001 C CNN
	1    5900 1800
	1    0    0    -1  
$EndComp
Connection ~ 5900 1650
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 60D2BE31
P 1700 3500
F 0 "J2" H 1592 3175 50  0000 C CNN
F 1 "Batt" H 1592 3266 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 1700 3500 50  0001 C CNN
F 3 "~" H 1700 3500 50  0001 C CNN
	1    1700 3500
	-1   0    0    1   
$EndComp
Text GLabel 1900 3400 2    50   Input ~ 0
BATT+
$Comp
L power:GND #PWR0110
U 1 1 60D2D4F5
P 2050 3650
F 0 "#PWR0110" H 2050 3400 50  0001 C CNN
F 1 "GND" H 2055 3477 50  0000 C CNN
F 2 "" H 2050 3650 50  0001 C CNN
F 3 "" H 2050 3650 50  0001 C CNN
	1    2050 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3500 2050 3500
Wire Wire Line
	2050 3500 2050 3650
$Comp
L Device:C C1
U 1 1 60D30A94
P 4450 3550
F 0 "C1" V 4702 3550 50  0000 C CNN
F 1 "C" V 4611 3550 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 4488 3400 50  0001 C CNN
F 3 "~" H 4450 3550 50  0001 C CNN
	1    4450 3550
	0    -1   -1   0   
$EndComp
Connection ~ 4600 3550
Wire Wire Line
	4600 3550 4600 3650
Wire Wire Line
	4600 3050 4600 3550
$Comp
L power:GND #PWR0111
U 1 1 60D34C93
P 4300 3550
F 0 "#PWR0111" H 4300 3300 50  0001 C CNN
F 1 "GND" H 4305 3377 50  0000 C CNN
F 2 "" H 4300 3550 50  0001 C CNN
F 3 "" H 4300 3550 50  0001 C CNN
	1    4300 3550
	1    0    0    -1  
$EndComp
Text GLabel 6550 3950 0    50   Input ~ 0
MUX-OUT
Text GLabel 5100 3950 2    50   Input ~ 0
MUX-OUT
Wire Wire Line
	4150 3300 5600 3300
Wire Wire Line
	5100 4050 5600 4050
$EndSCHEMATC
