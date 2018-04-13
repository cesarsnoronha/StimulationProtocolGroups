
%Codigo para ativação de dois canais para estimulação via PLEXSTIM. para os canais estimulares é necessário um input TTL. Os canais que estão definidos nesse código para estimular sao os canais 2 e 10. os estímulos que serao carregados estao em uma pasta junto desse codigo, e o caminho para esse código buscar esses arquivostera que ser refeito
res = PS_InitAllStim; %Inicializa todos os estimuladores
NStim = PS_GetNStim; %Obtem o numero de estimuladores dispon?veis
NChan = PS_GetNChannels(1); %Obtem o numero maximo de canais para o estimulador NStim
ChN = NChan;

TriggerMode = 2;
PS_SetTriggerMode (NStim, TriggerMode) %Define o TriggerMode para um estimulador
%NStim para o estimulador e Mode para risin or level
%       mode = 0 - sets stimulator StimN to start stimulation from software;
%       mode = 1 - stimulation begins when the digital input for the channel transitions from low (~0V) to high (~5V);
%       mode = 2 -  stimulation begins when the digital input transitions from low (~0V) to high (~5V), 
%       but if the digital input is still high when the stimulation protocol completes then 
%       the stimulation protocol will begin again.


res = PS_SetMonitorChannel(NStim, 2); %Seleciona o canal do monitor
%NStim para o estimulador e ChN para o Canal (O canal 1 esta queimado)
PS_SetRepetitions(NStim, 10, 100) %Define a quantidade de vezes que a waveform ou pulso eh repetido
%NStim para o estimulador, ChN para o canal e NRep para numero de repeticoes (0 = inf)
PS_SetRepetitions(NStim, 2, 100) %Define a quantidade de vezes que a waveform ou pulso eh repetido
%NStim para o estimulador, ChN para o canal e NRep para numero de repeticoes

PS_SetPatternType(NStim, 10, 1)
PS_SetPatternType(NStim, 2, 1)
res = PS_LoadArbPattern(NStim, 10, 'C:\Documents and Settings\Alunos\Desktop\pares_estimulos\grupo_2\gr2est1.pat'); %Esse caminho tem que ser redefinido para o caminho em que estiver o arquivo gr2est1.pat
res = PS_LoadArbPattern(NStim, 2, 'C:\Documents and Settings\Alunos\Desktop\pares_estimulos\grupo_2\gr2est2.pat'); %Esse caminho tem que ser redefinido para o caminho em que estiver o arquivo gr2est2.pat

res = PS_LoadAllChannels(NStim); %Carrega os parametros do canal ChN para o estimulador NStim
res = PS_StartStimChannel(NStim,10); %Inicia estimula??o no estimulador NStim e no canal ChN
res = PS_StartStimChannel(NStim,2); %Inicia estimula??o no estimulador NStim e no canal ChN

input('Press Return to Stop'); 
err = PS_StopStimAllChannels(NStim); %Para ao receber qualquer coisa 
res = PS_CloseStim(1); %fecha
