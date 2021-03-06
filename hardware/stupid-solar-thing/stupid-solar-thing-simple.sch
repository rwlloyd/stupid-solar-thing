EESchema Schematic File Version 4
LIBS:stupid-solar-thing-simple-cache
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
L SparkFun-DiscreteSemi:TRANS_NPN-2N3904 Q1
U 1 1 60C68CA6
P 7700 1750
F 0 "Q1" H 7844 1845 45  0000 L CNN
F 1 "2N3904" H 7844 1761 45  0000 L CNN
F 2 "TO-92" H 7700 2000 20  0001 C CNN
F 3 "" H 7700 1750 50  0001 C CNN
F 4 "TRANS-08447" H 7844 1666 60  0000 L CNN "Field4"
	1    7700 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60C6A971
P 6200 1700
F 0 "R1" H 6270 1746 50  0000 L CNN
F 1 "R100K" H 6270 1655 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6130 1700 50  0001 C CNN
F 3 "~" H 6200 1700 50  0001 C CNN
	1    6200 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 60C8AB4D
P 6200 2150
F 0 "#PWR0101" H 6200 1900 50  0001 C CNN
F 1 "GND" H 6205 1977 50  0000 C CNN
F 2 "" H 6200 2150 50  0001 C CNN
F 3 "" H 6200 2150 50  0001 C CNN
	1    6200 2150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60D097B4
P 7100 3950
F 0 "#PWR0102" H 7100 3700 50  0001 C CNN
F 1 "GND" H 7105 3777 50  0000 C CNN
F 2 "" H 7100 3950 50  0001 C CNN
F 3 "" H 7100 3950 50  0001 C CNN
	1    7100 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 60D09EF3
P 7700 4800
F 0 "#PWR0103" H 7700 4550 50  0001 C CNN
F 1 "GND" H 7705 4627 50  0000 C CNN
F 2 "" H 7700 4800 50  0001 C CNN
F 3 "" H 7700 4800 50  0001 C CNN
	1    7700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7700 4650 7700 4750
Wire Wire Line
	7800 4650 7800 4750
Wire Wire Line
	7800 4750 7700 4750
Connection ~ 7700 4750
Wire Wire Line
	7700 4750 7700 4800
Wire Wire Line
	7300 3950 7100 3950
Wire Wire Line
	7900 3250 7900 2900
$Comp
L Connector:Conn_01x03_Female J1
U 1 1 60D108B4
P 10100 1750
F 0 "J1" H 10128 1776 50  0000 L CNN
F 1 "A1" H 10128 1685 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10100 1750 50  0001 C CNN
F 3 "~" H 10100 1750 50  0001 C CNN
	1    10100 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 60D175AC
P 9700 1950
F 0 "#PWR0104" H 9700 1700 50  0001 C CNN
F 1 "GND" H 9705 1777 50  0000 C CNN
F 2 "" H 9700 1950 50  0001 C CNN
F 3 "" H 9700 1950 50  0001 C CNN
	1    9700 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 1750 9900 1750
Wire Wire Line
	9900 1850 9700 1850
Wire Wire Line
	9700 1850 9700 1950
Wire Wire Line
	9900 1650 9200 1650
Wire Wire Line
	6200 1850 5650 1850
Wire Wire Line
	6200 1550 6200 1300
Text GLabel 5650 1850 0    50   Input ~ 0
X0
Wire Notes Line
	5300 1150 6650 1150
Wire Notes Line
	6650 1150 6650 2450
Wire Notes Line
	6650 2450 5300 2450
Wire Notes Line
	5300 2450 5300 1150
Text GLabel 9200 1650 0    50   Input ~ 0
X1
Wire Notes Line
	8850 1100 10900 1100
Wire Notes Line
	10900 1100 10900 2350
Wire Notes Line
	10900 2350 8850 2350
Wire Notes Line
	8850 2350 8850 1100
Text GLabel 8300 4050 2    50   Input ~ 0
X0
Text GLabel 8300 3750 2    50   Input ~ 0
X1
Text GLabel 8300 3850 2    50   Input ~ 0
X2
Text GLabel 7300 3450 0    50   Input ~ 0
MUX-S0
Text GLabel 6050 4100 2    50   Input ~ 0
MUX-S0
Text GLabel 7300 3550 0    50   Input ~ 0
MUX-S1
Text GLabel 6050 4000 2    50   Input ~ 0
MUX-S1
Text GLabel 7300 3650 0    50   Input ~ 0
MUX-S2
Text GLabel 6050 3900 2    50   Input ~ 0
MUX-S2
Text GLabel 7750 2900 0    50   Input ~ 0
S_PWR+
Text GLabel 9700 1400 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	9700 1400 9700 1750
Wire Wire Line
	7900 2900 7750 2900
Text GLabel 5550 2700 0    50   Input ~ 0
BATT+
Text GLabel 6050 4500 2    50   Input ~ 0
SENSORS_EN
Text GLabel 7600 1750 0    50   Input ~ 0
SENSORS_EN
$Comp
L power:+3.3V #PWR0107
U 1 1 60D037D8
P 5750 3300
F 0 "#PWR0107" H 5750 3150 50  0001 C CNN
F 1 "+3.3V" H 5765 3473 50  0000 C CNN
F 2 "" H 5750 3300 50  0001 C CNN
F 3 "" H 5750 3300 50  0001 C CNN
	1    5750 3300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0108
U 1 1 60D040C2
P 7800 1550
F 0 "#PWR0108" H 7800 1400 50  0001 C CNN
F 1 "+3.3V" H 7815 1723 50  0000 C CNN
F 2 "" H 7800 1550 50  0001 C CNN
F 3 "" H 7800 1550 50  0001 C CNN
	1    7800 1550
	1    0    0    -1  
$EndComp
Text GLabel 7800 2100 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	7800 1950 7800 2100
Wire Notes Line
	6750 1100 8800 1100
Wire Notes Line
	8800 1100 8800 2450
Wire Notes Line
	8800 2450 6750 2450
Wire Notes Line
	6750 2450 6750 1100
Wire Wire Line
	5250 3700 5100 3700
Wire Wire Line
	5100 3700 5100 2950
Wire Wire Line
	6550 2950 6550 3700
NoConn ~ 5250 4000
NoConn ~ 5250 4100
$Comp
L power:GND #PWR0109
U 1 1 60D2093D
P 5650 4900
F 0 "#PWR0109" H 5650 4650 50  0001 C CNN
F 1 "GND" H 5655 4727 50  0000 C CNN
F 2 "" H 5650 4900 50  0001 C CNN
F 3 "" H 5650 4900 50  0001 C CNN
	1    5650 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 60D26EDA
P 6200 2000
F 0 "R2" H 6270 2046 50  0000 L CNN
F 1 "R100K" H 6270 1955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6130 2000 50  0001 C CNN
F 3 "~" H 6200 2000 50  0001 C CNN
	1    6200 2000
	1    0    0    -1  
$EndComp
Connection ~ 6200 1850
$Comp
L Connector:Conn_01x02_Female J0
U 1 1 60D2BE31
P 5450 1400
F 0 "J0" H 5342 1075 50  0000 C CNN
F 1 "Batt" H 5342 1166 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 5450 1400 50  0001 C CNN
F 3 "~" H 5450 1400 50  0001 C CNN
	1    5450 1400
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0110
U 1 1 60D2D4F5
P 5800 1550
F 0 "#PWR0110" H 5800 1300 50  0001 C CNN
F 1 "GND" H 5805 1377 50  0000 C CNN
F 2 "" H 5800 1550 50  0001 C CNN
F 3 "" H 5800 1550 50  0001 C CNN
	1    5800 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 1400 5800 1400
Wire Wire Line
	5800 1400 5800 1550
$Comp
L Device:C C1
U 1 1 60D30A94
P 5400 3200
F 0 "C1" V 5652 3200 50  0000 C CNN
F 1 "C" V 5561 3200 50  0000 C CNN
F 2 "Capacitor_THT:CP_Radial_D10.0mm_P5.00mm" H 5438 3050 50  0001 C CNN
F 3 "~" H 5400 3200 50  0001 C CNN
	1    5400 3200
	0    -1   -1   0   
$EndComp
Connection ~ 5550 3200
Wire Wire Line
	5550 3200 5550 3300
Wire Wire Line
	5550 2700 5550 3200
$Comp
L power:GND #PWR0111
U 1 1 60D34C93
P 5250 3200
F 0 "#PWR0111" H 5250 2950 50  0001 C CNN
F 1 "GND" H 5255 3027 50  0000 C CNN
F 2 "" H 5250 3200 50  0001 C CNN
F 3 "" H 5250 3200 50  0001 C CNN
	1    5250 3200
	1    0    0    -1  
$EndComp
Text GLabel 7300 3850 0    50   Input ~ 0
MUX-OUT
Text GLabel 6050 3600 2    50   Input ~ 0
MUX-OUT
Wire Wire Line
	5100 2950 6550 2950
Wire Wire Line
	6050 3700 6550 3700
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 60D66E8B
P 10100 3100
F 0 "J2" H 10128 3126 50  0000 L CNN
F 1 "A2" H 10128 3035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10100 3100 50  0001 C CNN
F 3 "~" H 10100 3100 50  0001 C CNN
	1    10100 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0105
U 1 1 60D66E91
P 9700 3300
F 0 "#PWR0105" H 9700 3050 50  0001 C CNN
F 1 "GND" H 9705 3127 50  0000 C CNN
F 2 "" H 9700 3300 50  0001 C CNN
F 3 "" H 9700 3300 50  0001 C CNN
	1    9700 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 3100 9900 3100
Wire Wire Line
	9900 3200 9700 3200
Wire Wire Line
	9700 3200 9700 3300
Wire Wire Line
	9900 3000 9200 3000
Text GLabel 9200 3000 0    50   Input ~ 0
X2
Wire Notes Line
	8850 2450 10900 2450
Wire Notes Line
	10900 2450 10900 3700
Wire Notes Line
	10900 3700 8850 3700
Wire Notes Line
	8850 3700 8850 2450
Text GLabel 9700 2750 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	9700 2750 9700 3100
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 60D67ECD
P 10100 4450
F 0 "J3" H 10128 4476 50  0000 L CNN
F 1 "A3" H 10128 4385 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10100 4450 50  0001 C CNN
F 3 "~" H 10100 4450 50  0001 C CNN
	1    10100 4450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 60D67ED3
P 9700 4650
F 0 "#PWR0106" H 9700 4400 50  0001 C CNN
F 1 "GND" H 9705 4477 50  0000 C CNN
F 2 "" H 9700 4650 50  0001 C CNN
F 3 "" H 9700 4650 50  0001 C CNN
	1    9700 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4450 9900 4450
Wire Wire Line
	9900 4550 9700 4550
Wire Wire Line
	9700 4550 9700 4650
Wire Wire Line
	9900 4350 9200 4350
Text GLabel 9200 4350 0    50   Input ~ 0
X3
Wire Notes Line
	8850 3800 10900 3800
Wire Notes Line
	10900 3800 10900 5050
Wire Notes Line
	10900 5050 8850 5050
Wire Notes Line
	8850 5050 8850 3800
Text GLabel 9700 4100 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	9700 4100 9700 4450
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 60D68F4D
P 10100 5800
F 0 "J4" H 10128 5826 50  0000 L CNN
F 1 "A4" H 10128 5735 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 10100 5800 50  0001 C CNN
F 3 "~" H 10100 5800 50  0001 C CNN
	1    10100 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 60D68F53
P 9700 6000
F 0 "#PWR0112" H 9700 5750 50  0001 C CNN
F 1 "GND" H 9705 5827 50  0000 C CNN
F 2 "" H 9700 6000 50  0001 C CNN
F 3 "" H 9700 6000 50  0001 C CNN
	1    9700 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 5800 9900 5800
Wire Wire Line
	9900 5900 9700 5900
Wire Wire Line
	9700 5900 9700 6000
Wire Wire Line
	9900 5700 9200 5700
Text GLabel 9200 5700 0    50   Input ~ 0
X4
Wire Notes Line
	8850 5150 10900 5150
Wire Notes Line
	10900 5150 10900 6400
Wire Notes Line
	10900 6400 8850 6400
Wire Notes Line
	8850 6400 8850 5150
Text GLabel 9700 5450 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	9700 5450 9700 5800
$Comp
L Connector:Conn_01x03_Female J5
U 1 1 60D6A2B1
P 7950 5800
F 0 "J5" H 7978 5826 50  0000 L CNN
F 1 "A5" H 7978 5735 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 7950 5800 50  0001 C CNN
F 3 "~" H 7950 5800 50  0001 C CNN
	1    7950 5800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 60D6A2B7
P 7550 6000
F 0 "#PWR0113" H 7550 5750 50  0001 C CNN
F 1 "GND" H 7555 5827 50  0000 C CNN
F 2 "" H 7550 6000 50  0001 C CNN
F 3 "" H 7550 6000 50  0001 C CNN
	1    7550 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5800 7750 5800
Wire Wire Line
	7750 5900 7550 5900
Wire Wire Line
	7550 5900 7550 6000
Wire Wire Line
	7750 5700 7050 5700
Text GLabel 7050 5700 0    50   Input ~ 0
X5
Wire Notes Line
	6700 5150 8750 5150
Wire Notes Line
	8750 5150 8750 6400
Wire Notes Line
	8750 6400 6700 6400
Wire Notes Line
	6700 6400 6700 5150
Text GLabel 7550 5450 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	7550 5450 7550 5800
$Comp
L Connector:Conn_01x03_Female J6
U 1 1 60D6BD30
P 6100 7100
F 0 "J6" H 6128 7126 50  0000 L CNN
F 1 "A6" H 6128 7035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 6100 7100 50  0001 C CNN
F 3 "~" H 6100 7100 50  0001 C CNN
	1    6100 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 60D6BD36
P 5700 7300
F 0 "#PWR0114" H 5700 7050 50  0001 C CNN
F 1 "GND" H 5705 7127 50  0000 C CNN
F 2 "" H 5700 7300 50  0001 C CNN
F 3 "" H 5700 7300 50  0001 C CNN
	1    5700 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 7100 5900 7100
Wire Wire Line
	5900 7200 5700 7200
Wire Wire Line
	5700 7200 5700 7300
Wire Wire Line
	5900 7000 5200 7000
Text GLabel 5200 7000 0    50   Input ~ 0
X6
Wire Notes Line
	4850 6450 6900 6450
Wire Notes Line
	6900 6450 6900 7700
Wire Notes Line
	6900 7700 4850 7700
Wire Notes Line
	4850 7700 4850 6450
Text GLabel 5700 6750 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	5700 6750 5700 7100
$Comp
L Connector:Conn_01x03_Female J7
U 1 1 60D6D7D5
P 3950 7100
F 0 "J7" H 3978 7126 50  0000 L CNN
F 1 "A7" H 3978 7035 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 3950 7100 50  0001 C CNN
F 3 "~" H 3950 7100 50  0001 C CNN
	1    3950 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 60D6D7DB
P 3550 7300
F 0 "#PWR0115" H 3550 7050 50  0001 C CNN
F 1 "GND" H 3555 7127 50  0000 C CNN
F 2 "" H 3550 7300 50  0001 C CNN
F 3 "" H 3550 7300 50  0001 C CNN
	1    3550 7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 7100 3750 7100
Wire Wire Line
	3750 7200 3550 7200
Wire Wire Line
	3550 7200 3550 7300
Wire Wire Line
	3750 7000 3050 7000
Text GLabel 3050 7000 0    50   Input ~ 0
X7
Wire Notes Line
	2700 6450 4750 6450
Wire Notes Line
	4750 6450 4750 7700
Wire Notes Line
	4750 7700 2700 7700
Wire Notes Line
	2700 7700 2700 6450
Text GLabel 3550 6750 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	3550 6750 3550 7100
Wire Wire Line
	5650 1300 6200 1300
$Comp
L Analog_Switch:CD4051B U2
U 1 1 60CF08B7
P 7800 3950
F 0 "U2" H 7800 4831 50  0000 R CNN
F 1 "CD4051B" H 7800 4740 50  0000 R CNN
F 2 "Package_DIP:DIP-16_W7.62mm_Socket" H 7950 3200 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/cd4052b.pdf" H 7780 4050 50  0001 C CNN
	1    7800 3950
	1    0    0    -1  
$EndComp
Text GLabel 8300 3950 2    50   Input ~ 0
X3
Text GLabel 8300 4150 2    50   Input ~ 0
X4
Text GLabel 8300 4350 2    50   Input ~ 0
X5
Text GLabel 8300 4450 2    50   Input ~ 0
X6
Text GLabel 8300 4250 2    50   Input ~ 0
X7
$Comp
L MCU_Module:WeMos_D1_mini U1
U 1 1 60C605BE
P 5650 4100
F 0 "U1" H 5650 3015 50  0000 R CNN
F 1 "WeMos_D1_mini" H 5650 2883 50  0000 C CNN
F 2 "Module:WEMOS_D1_mini_light" H 5650 2950 50  0001 C CNN
F 3 "https://wiki.wemos.cc/products:d1:d1_mini#documentation" H 3800 2950 50  0001 C CNN
	1    5650 4100
	1    0    0    -1  
$EndComp
Text GLabel 6050 3800 2    50   Input ~ 0
DO-1
Text GLabel 6050 4200 2    50   Input ~ 0
DO-2
Text GLabel 6050 4300 2    50   Input ~ 0
DO-3
Text GLabel 6050 4400 2    50   Input ~ 0
DO-4
$Comp
L Connector:Conn_01x03_Female J8
U 1 1 60DA517C
P 4000 1500
F 0 "J8" H 4028 1526 50  0000 L CNN
F 1 "D1" H 4028 1435 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 1500 50  0001 C CNN
F 3 "~" H 4000 1500 50  0001 C CNN
	1    4000 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 60DA5182
P 3600 1700
F 0 "#PWR0116" H 3600 1450 50  0001 C CNN
F 1 "GND" H 3605 1527 50  0000 C CNN
F 2 "" H 3600 1700 50  0001 C CNN
F 3 "" H 3600 1700 50  0001 C CNN
	1    3600 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1500 3800 1500
Wire Wire Line
	3800 1600 3600 1600
Wire Wire Line
	3600 1600 3600 1700
Wire Wire Line
	3800 1400 3100 1400
Text GLabel 3100 1400 0    50   Input ~ 0
DO-1
Wire Notes Line
	2750 850  4800 850 
Wire Notes Line
	4800 850  4800 2100
Wire Notes Line
	4800 2100 2750 2100
Wire Notes Line
	2750 2100 2750 850 
Text GLabel 3600 1150 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	3600 1150 3600 1500
$Comp
L Connector:Conn_01x03_Female J9
U 1 1 60DA8AA8
P 4000 2850
F 0 "J9" H 4028 2876 50  0000 L CNN
F 1 "D2" H 4028 2785 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 2850 50  0001 C CNN
F 3 "~" H 4000 2850 50  0001 C CNN
	1    4000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 60DA8AAE
P 3600 3050
F 0 "#PWR0117" H 3600 2800 50  0001 C CNN
F 1 "GND" H 3605 2877 50  0000 C CNN
F 2 "" H 3600 3050 50  0001 C CNN
F 3 "" H 3600 3050 50  0001 C CNN
	1    3600 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2850 3800 2850
Wire Wire Line
	3800 2950 3600 2950
Wire Wire Line
	3600 2950 3600 3050
Wire Wire Line
	3800 2750 3100 2750
Text GLabel 3100 2750 0    50   Input ~ 0
DO-2
Wire Notes Line
	2750 2200 4800 2200
Wire Notes Line
	4800 2200 4800 3450
Wire Notes Line
	4800 3450 2750 3450
Wire Notes Line
	2750 3450 2750 2200
Text GLabel 3600 2500 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	3600 2500 3600 2850
$Comp
L Connector:Conn_01x03_Female J10
U 1 1 60DAB570
P 4000 4250
F 0 "J10" H 4028 4276 50  0000 L CNN
F 1 "D3" H 4028 4185 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 4250 50  0001 C CNN
F 3 "~" H 4000 4250 50  0001 C CNN
	1    4000 4250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 60DAB576
P 3600 4450
F 0 "#PWR0118" H 3600 4200 50  0001 C CNN
F 1 "GND" H 3605 4277 50  0000 C CNN
F 2 "" H 3600 4450 50  0001 C CNN
F 3 "" H 3600 4450 50  0001 C CNN
	1    3600 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4250 3800 4250
Wire Wire Line
	3800 4350 3600 4350
Wire Wire Line
	3600 4350 3600 4450
Wire Wire Line
	3800 4150 3100 4150
Text GLabel 3100 4150 0    50   Input ~ 0
DO-3
Wire Notes Line
	2750 3600 4800 3600
Wire Notes Line
	4800 3600 4800 4850
Wire Notes Line
	4800 4850 2750 4850
Wire Notes Line
	2750 4850 2750 3600
Text GLabel 3600 3900 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	3600 3900 3600 4250
$Comp
L Connector:Conn_01x03_Female J11
U 1 1 60DAE982
P 4000 5650
F 0 "J11" H 4028 5676 50  0000 L CNN
F 1 "D4" H 4028 5585 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 4000 5650 50  0001 C CNN
F 3 "~" H 4000 5650 50  0001 C CNN
	1    4000 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 60DAE988
P 3600 5850
F 0 "#PWR0119" H 3600 5600 50  0001 C CNN
F 1 "GND" H 3605 5677 50  0000 C CNN
F 2 "" H 3600 5850 50  0001 C CNN
F 3 "" H 3600 5850 50  0001 C CNN
	1    3600 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5650 3800 5650
Wire Wire Line
	3800 5750 3600 5750
Wire Wire Line
	3600 5750 3600 5850
Wire Wire Line
	3800 5550 3100 5550
Text GLabel 3100 5550 0    50   Input ~ 0
DO-4
Wire Notes Line
	2750 5000 4800 5000
Wire Notes Line
	4800 5000 4800 6250
Wire Notes Line
	4800 6250 2750 6250
Wire Notes Line
	2750 6250 2750 5000
Text GLabel 3600 5300 0    50   Input ~ 0
S_PWR+
Wire Wire Line
	3600 5300 3600 5650
$EndSCHEMATC
