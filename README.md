# PMR robust design

A code to compute robust proportional-multiple-resonant (PMR) and current feedback controllers to ensure uninterruptible power supply (UPS) stability and performance, whose gains are tuned by means of regional pole placement with LMIs. Although inverter switching effects are not considered, the output plotted without a graphical environment facilitates learning and analysis of the resulting controller.

Consider a closed-loop in the form

<div align="center">
<img width="769" height="236" alt="voltage_regulator_closed_loop" src="https://github.com/user-attachments/assets/23107e33-0cbd-4483-be62-2840eb0f80d0" />
</div>

being PMR a controller with transfer function

$$C(s) = \frac{u_v(s)}{e(s)} = k_{e} +\sum_{i=1,3,\dots}^{h}\frac{k_{{2i-1}} +k_{{2i}}s}{s^{2} +2\xi_{i}\omega_{r_i} s +\omega_{r_i}^{2}}$$

where $k_{e}$, $k_{{2i-1}}$, and $k_{{2i}}$ are gains to be determined and $\xi_{i}$ is the damping factor of the $i$-th resonant mode, for $i = 1,3,\dots,h$.

The control law shown can be rewritten as

$$u(t) = Kx_{a}(t) +k_{e}r(t)$$

where $x_{a}(t) = [x'(t)\ x_{r}'(t)]' \in \mathbb{R}^{2+2h}$ is the augmented state and

$$K = [k_{c}\ -k_{e}\quad k_{1}\quad k_{2}\quad \cdots\quad k_{2h-1}\quad k_{2h}].$$

##

Main file named as 'pmr\_main.m'. Only the following specifications are required:
- Number of resonant structures in the controller (m)
- Damping factor of the resonant modes (xi)
- The desired real part of the smallest pole of the closed-loop system (sig)

Consider an example of a PMR design with m = 3, xi = 0, sig = 100, where the following output voltage response is obtained:

<img width="1920" height="926" alt="robust_PMR_design_m3" src="https://github.com/user-attachments/assets/6f2442d6-dea3-455e-ab15-228feabf83f4" />

Considering a PMR design with m = 5, xi = 0, sig = 100, the following output voltage response is obtained:

<img width="1920" height="926" alt="robust_PMR_design_m5" src="https://github.com/user-attachments/assets/0ccdcde6-f148-4ffa-9003-76ee9af018db" />

Note how the steady-state output voltage perfectly follows the reference for linear load and can reject disturbances caused by the nonlinear load, depending on the number of resonant modes considered. Due to the robustness of the controller, similar performance is ensured over the entire load range, from no-load to nominal load conditions.
