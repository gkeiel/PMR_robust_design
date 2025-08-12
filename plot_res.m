%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PLOTS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
flag_subplot = 1;

if flag_subplot == 0
    % plot reference and output for no load
    figure(1)
    plot(t,r,'--r',t,v_o,'LineWidth',2)
    legend('r(t) [V]','v_o(t) [V]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('No load');

    % plot reference and output for linear load
    figure(2)
    plot(t,r,'--r',t,v_o_l,t,i_o_l,'LineWidth',2)
    grid on
    legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('Linear load');

    % plot reference and output for non-linear load
    figure(3)
    plot(t,r,'--r',t,v_o_nl,t,i_o_nl,'LineWidth',2)
    legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('Non-linear load');

    % PMR controller frequency response
    figure(4)
    opts = bodeoptions('cstprefs');
    opts.PhaseWrapping = 'on';
    opts.Grid = 'on';
    bodeplot(pmr_tf,opts)
    title('C(s)');
    set(findall(gcf,'type','line'),'linewidth',2);

    % closed-loop frequency response
    figure(5)
    bodeplot(cl_tf,opts)
    title('T_r(s)');
    set(findall(gcf,'type','line'),'linewidth',2);

    % disturbance-output frequency response
    figure(6)
    bodeplot(id_tf,opts)
    title('T_{id}(s)');
    set(findall(gcf,'type','line'),'linewidth',2);
    
else
    % plot reference and output for no load
    figure(1)
    subplot(2,2,1);
    plot(t,r,'--k',t,v_o,'LineWidth',2)
    legend('r(t) [V]','v_o(t) [V]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('No load');

    % plot reference and output for linear load
    subplot(2,2,2);
    plot(t,r,'--k',t,v_o_l,t,i_o_l,'LineWidth',2)
    grid on
    legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('Linear load');

    % plot reference and output for non-linear load
    subplot(2,2,3);
    plot(t,r,'--k',t,v_o_nl,t,i_o_nl,'LineWidth',2)
    legend('r(t) [V]','v_o(t) [V]','i_o(t) [A]');
    xlabel('Time (s)'); ylabel('Amplitude'); grid on;
    title('Non-linear load');

    % PMR controller frequency response
    subplot(2,2,4);
    opts = bodeoptions('cstprefs');
    opts.PhaseWrapping = 'on';
    opts.Grid = 'on';
    bodeplot(pmr_tf,opts);
    title('C(s)');
    set(findall(gcf,'type','line'),'linewidth',2);
end