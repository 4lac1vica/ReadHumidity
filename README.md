
## Reading Humidity and Temperature using Basys 3 and DHT11 Sensor 

## RO 

 **Fisierele sursa sunt [aici](https://github.com/4lac1vica/ReadHumidity/tree/main/HumidityRead/HumidityRead.srcs/sources_1/new).**

  Acest proiect propune citirea unu senzor DHT11 (umiditate + temperatura) si transmiterea datelor la o placuta Basys 3, iar afisarea datelor sa fie pe afisorul 7 segmente. 

  **Features**

  - Automat cu stari finite
  - senzor DHT11 (umiditate + temperatura) 
  - afisor 7 segmente
  - logica de debounce pentru switch-uri
  - reset (TBI)
  
**Diagramele de stare**

  1) Diagrama de stare pentru senzor 
    

  2) Diagrama de stare a sistemului 

  
  **Instructiuni de utilizare**

  Componente necesare : 1 x Placuta Basys 3, 1 x rezistenta intre 4.7K Ohmi - 10K Ohmi, 5 x fire mama-tata, 1 x breadboard, 1 x DHT11 sensor;
  
  Tooluri necesare : Xilinx Vivado 2024.1;
  
  Pentru a utiliza acest sistem trebuie urmati urmatorii pasi : 

  1) Copiaza acest repo.
  2) Realizeaza montajul in felul urmator : plaseaza bradboardul orizontal fata de tine. Apoi plaseaza senzorul cu fata spre tine (partea cu gauri sa fie spre tine). Apoi conecteaza firele la Basys la porturile **PMod JB**. VCC si GND sa fie comune, sa fie de la placuta. Firul de date sa fie conectat la portul JB din dreapta sus (portul JB1). **Atentie, intre VCC si DATA(pinul 1 si pinul 2 de la stanga la dreapta pe senzor) trebuie pusa rezistenta, deoarece pot aparea probleme la citirea datelor.**
  3) Conecteaza circuitul la calculator.
  4) Genereaza bitstream, deschide *Hardware Manager*, selecteaza *Auto-connect* si apasa pe *Program Device*
  5) Pentru a vedea temperatura, switch-ul sa fie in pozitia **off**. Pentru a vedea umiditatea, switchul sa fie pe pozitia **on**.
  
  
  <img width="1536" height="2048" alt="image" src="https://github.com/user-attachments/assets/933f5e9f-19f7-4065-9bdd-ed8f71c608be" />


## EN 

 **The source files are [here](https://github.com/4lac1vica/ReadHumidity/tree/main/HumidityRead/HumidityRead.srcs/sources_1/new).**

This project proposes reading a DHT11 sensor (humidity + temperature) and transmitting the data to a Basys 3 board, with the data being displayed on a 7-segment display.

**Features**
  - Finite State Machines
  - DHT11 sensor (humidity + temperature)
  - seven segment display
  - debounce logic for switches 
  - reset (TBI)

**State Diagrams**

  1) State diagram for the sensor FSM


  2) State diagram for the whole system


**How to use**

Components : 1 x Basys 3 , 1 x 4.7K - 10K Ohm resistor, 5 x jumper wires, 1 x breadboard, 1 x DHT11 sensor;

Tools : Xilinx Vivado 2024.1;

To use this system follow the next steps : 

1) Copy this repo
2) Assemble it in the following way: place the breadboard horizontally in front of you. Then place the sensor facing you (the side with holes should be towards you). Then connect the wires to the Basys at the **PMod JB** ports. VCC and GND should be shared, coming from the board. The data wire should be connected to the top right JB port (JB1 port). **Attention, a resistor must be placed between VCC and DATA (pin 1 and pin 2 from left to right on the sensor), because problems may occur when reading the data.**
3) Connect the circuit to the PC
4) Generate bistream, open *Hardware manager*, select *Auto-connect* option and press the *Program Device* button.
5) To see the temperature, the switch must be in **off** position. If you want to see the humidity, the switch must be in the **on** position.

<img width="1536" height="2048" alt="image" src="https://github.com/user-attachments/assets/933f5e9f-19f7-4065-9bdd-ed8f71c608be" />
