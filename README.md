# PMR robust design

A code to compute robust proportional-multiple-resonant (PMR) and current feedback controller to ensure uninterruptible power supply (UPS) stability and performance. PMR and current gain tuned by means of regional pole placement with LMI. Although inverter switching effects are not considered, output plotted without graphical environment facilitates learning and brief analysis of the resulting controller.

Main file named as 'pmr\_main.m'. Only the following specifications are required:
- Number of resonant structures in the controller (m)
- Damping factor of the resonant modes (xi)
- The desired real part of the smallest pole of the closed-loop system (sig)

Consider an example of a PMR design with m = 3, xi = 0, sig = 100 where the following output voltage response is obtained:

<img width="1920" height="926" alt="robust_PMR_design_m3" src="https://github.com/user-attachments/assets/6f2442d6-dea3-455e-ab15-228feabf83f4" />

Considering a PMR design with m = 5, xi = 0, sig = 100, the following output voltage response is obtained:

<img width="1920" height="926" alt="robust_PMR_design_m5" src="https://github.com/user-attachments/assets/0ccdcde6-f148-4ffa-9003-76ee9af018db" />

Note how the steady-state output voltage perfectly follows the reference for linear load and can reject disturbances caused by the nonlinear load, depending on the number of resonant modes considered. Due to the robustness of the controller, similar performance is ensured over the entire load range, from no-load to nominal load conditions.
