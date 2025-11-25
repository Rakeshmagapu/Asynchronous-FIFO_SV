
<img width="1536" height="1024" alt="fifo" src="https://github.com/user-attachments/assets/7319e485-f97f-4b3b-b37d-b0d8c36c5ac5" />


# Asynchronous FIFO – SystemVerilog (Dual-Clock Domain)

This repository contains a complete **Asynchronous FIFO design and verification environment in SystemVerilog**, supporting data transfer across **two independent clock domains**.  
It includes a modular RTL design with Gray-coded pointers and CDC synchronizers, along with a **dual-agent verification environment** that drives and samples each clock domain separately.

---

## Overview

An Asynchronous FIFO enables safe data movement between write and read logic operating on **different clocks**.  
This implementation includes:

- Gray-coded write/read pointers  
- Two-flop synchronizers to prevent metastability  
- Full/Empty flag generation  
- Clean separation of write-domain logic and read-domain logic  
- Independent write and read agents in the testbench  
- Comprehensive checks via a scoreboard, coverage, and assertions  

The verification environment is designed in a UVM-style architecture (without using UVM library), featuring BFMs, drivers, monitors, transactions, generators, and environment integration.

---

## RTL Architecture

### 1. Gray-coded pointers
Used for safe comparison across clock domains.

### 2. Dual synchronizers
Two-flop synchronizers safely translate read pointer into write clock domain and vice-versa.

### 3. Full/Empty logic  
Full/Empty signals are generated through synchronized pointer comparison.

### 4. Memory array  
FIFO stores data using multi-depth memory implemented in SystemVerilog.

---

## Verification Architecture

### Dual-agent Testbench
Because FIFO uses **two unrelated clocks**, the verification environment includes:

- **Write Agent**
  - `wr_tx.sv` – Write transactions  
  - `wr_gen.sv` – Random stimulus generator  
  - `wr_bfm.sv` – BFM driving write operations  
  - `wr_mon.sv` – Monitor sampling write behavior  
  - `wr_cov.sv` – Functional coverage for write side  

- **Read Agent**
  - `rd_tx.sv` – Read transactions  
  - `rd_gen.sv` – Random read generator  
  - `rd_bfm.sv` – BFM for read domain  
  - `rd_mon.sv` – Read monitor  
  - `rd_cov.sv` – Read-side functional coverage  

### Environment & Scoreboard

- `fifo_env.sv` – Integrates write agent, read agent and scoreboard  
- `fifo_sbd.sv` – End-to-end checking (read data must match written data)  
- Assertions built into interface and scoreboard  
- Coverage ensures both domains are exercised adequately  

---

## Project Structure

```text
async_fifo.sv        - Asynchronous FIFO RTL
fifo_comm.sv         - Common parameters and definitions
fifo_intrf.sv        - Interface with signals, assertions
fifo_sbd.sv          - Scoreboard for data checking
fifo_env.sv          - Environment integrating both agents
fifo_tb.sv           - Top-level testbench
list.svh             - File list for compilation

wr_agent.sv          - Write agent
wr_gen.sv            - Write generator
wr_tx.sv             - Write transaction
wr_bfm.sv            - Write BFM
wr_mon.sv            - Write monitor
wr_cov.sv            - Write coverage

rd_agent.sv          - Read agent
rd_gen.sv            - Read generator
rd_tx.sv             - Read transaction
rd_bfm.sv            - Read BFM
rd_mon.sv            - Read monitor
rd_cov.sv            - Read coverage

run.do               - ModelSim/Questa automation script
```
## Inspect Signals

Open the `fifo_intrf` wave group or add your signals manually.

---

## Outputs

- Pass/Fail logs  
- Waveform dump (`.wlf`)  
- Scoreboard comparison results  
- Assertions log  
- Functional coverage  
- Clock-domain stress verification results  

---

## Key Verification Features

- Dual-clock constrained-random traffic  
- Independent write/read domains  
- Coverage for occupancy, pointer transitions, corner cases  
- Assertions on:  
  - Metastability protection  
  - Read without data  
  - Write when FIFO is full  
  - Pointer progression  
- End-to-end data integrity through scoreboard  

---

## Author

**Rakesh Magapu**  
VLSI & Verification Engineer  
Open for roles in Digital Design, Verification, and Frontend VLSI.
