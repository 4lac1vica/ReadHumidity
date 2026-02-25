## Reading Humidity and Temperature using Basys 3 and DHT11 Sensor 


## RO 

 **Fisierele sursa sunt [aici](https://github.com/4lac1vica/ReadHumidity/tree/main/HumidityRead/HumidityRead.srcs/sources_1/new).**

  Acest proiect propune citirea unu senzor DHT11 (umiditate + temperatura) si transmiterea datelor la o placuta Basys 3, iar afisarea datelor sa fie pe afisorul 7 segmente. 

  **Features**

  - Automat cu stari finite
  - senzor DHT11 (umiditate + temperatura) 
  - afisor 7 segmente 
  
  **Diagramele de stare**

  **Instructiuni de utilizare**

  Componente necesare : 1 x Placuta Basys 3, 1 x rezistenta intre 4.7K Ohmi - 10K Ohm, 5 x fire mama-tata, 1 x breadboard, 1 x DHT11 sensor;
  Tooluri necesare : Xilinx Vivado 2024.1;
  
  Pentru a utiliza acest sistem trebuie urmati urmatorii pasi : 

  1) Copiaza acest repo.
  2) Realizeaza montajul in felul urmator : plaseaza bradboardul orizontal fata de tine. Apoi plaseaza senzorul cu fata spre tine (partea cu gauri sa fie spre tine). Apoi conecteaza firele la Basys la porturile **PMod JB**. VCC si GND sa fie comune, sa fie de la placuta. Firul de date sa fie conectat la portul JB din dreapta sus (portul JB1). **Atentie, intre VCC si DATA(pinul 1 si pinul 2 de la stanga la dreapta) trebuie pusa rezistenta, deoarece pot aparea probleme la citirea datelor.**
  3) Conecteaza circuitul la calculator.
  4) Genereaza bitstream, deschide *Hardware Manager*, selecteaza *Auto-connect* si apasa pe *Program Device*
  5) Pentru a vedea temperatura, switch-ul sa fie in pozitia **off**. Pentru a vedea umiditatea, switchul sa fie pe pozitia **on**.
  
  

## EN 

 **The source files are [here](https://github.com/4lac1vica/ReadHumidity/tree/main/HumidityRead/HumidityRead.srcs/sources_1/new).**

This project proposes reading a DHT11 sensor (humidity + temperature) and transmitting the data to a Basys 3 board, with the data being displayed on a 7-segment display.

**Features**
  - Finite State Machines
  - DHT11 sensor (humidity + temperature)
  - seven segment display

**State Diagram**

**How to use**
