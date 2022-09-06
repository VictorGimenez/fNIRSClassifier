%
%Script developed by (DA SILVA SOUZA, Dayse et al.) dayse.s.s@hotmail.com as part of the study for separate the generated text data into blocks%
%

%Código para organizar os bloquinhos do experimento 
%ordem dos verbos (linhas): chutar, mexer, olhar, beijar
%colunas são repetições (cada participante tem tres colunas)
%agrupar os verbos para cada sujeito nas três repetições

%Criando a lista com os dados da ts em .txt
scan_file = dir('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/TS.csv');

%Diretório de onde serão salvas as médias por sujeito, por condição, por verbo
dataname_sub_ver_verbo = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/mean_sub/ver_verbo/');
dataname_sub_ver_video = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/mean_sub/ver_video/');
dataname_sub_ver_fazer_verbo = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/mean_sub/ver_fazer_verbo/');
dataname_sub_ver_fazer_video = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/mean_sub/ver_fazer_video/');

%Diretório de onde serão salvas as médias do grupo, por condição, por verbo
dataname_ver_verbo = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/general_mean/ver_verbo/');
dataname_ver_video = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/general_mean/ver_video/');
dataname_ver_fazer_verbo = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/general_mean/ver_fazer_verbo/');
dataname_ver_fazer_video = ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/oxy/general_mean/ver_fazer_video/');

%Carregando os triggers
t_ver_verbo = load ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/triggers/ver_verbo.txt');
t_ver_video = load ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/triggers/ver_video.txt');
t_ver_fazer_verbo = load ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/triggers/ver_fazer_verbo.txt');
t_ver_fazer_video = load ('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/triggers/ver_fazer_video.txt');

%VER VERBO
%Criando variáveis para agrupar os boquinhos de repetição
ver_verbo=[];
ver_verbo.chutar = zeros(3,42,74);
ver_verbo.mexer = zeros(3,42,74);
ver_verbo.olhar = zeros(3,42,74);
ver_verbo.beijar = zeros(3,42,74);
mean_ver_verbo=[];
mean_ver_verbo.chutar = zeros(15,42,74);
mean_ver_verbo.mexer = zeros(15,42,74);
mean_ver_verbo.olhar = zeros(15,42,74);
mean_ver_verbo.beijar = zeros(15,42,74);

participantes = cell(15,1); %linha é o n de sujeitos

%Oxy
for i=1:15
    %Carregando os dados do participante
    filename=strcat('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/TS/oxy/',scan_file(i).name);
    participantes{i} = filename;
    data_oxy = load (participantes{i});
    l = ((3*i)-2);
            for k=l:l+2
            ver_verbo.chutar(k,:,:) = data_oxy(:,t_ver_verbo(1,k):t_ver_verbo(1,k)+73);
            ver_verbo.mexer(k,:,:) = data_oxy(:,t_ver_verbo(2,k):t_ver_verbo(2,k)+73);
            ver_verbo.olhar(k,:,:) = data_oxy(:,t_ver_verbo(3,k):t_ver_verbo(3,k)+73);
            ver_verbo.beijar(k,:,:) = data_oxy(:,t_ver_verbo(4,k):t_ver_verbo(4,k)+73);   
            end
        
    %Média dos verbos por sujeito
    mean_ver_verbo.chutar(i,:,:) = mean (ver_verbo.chutar,1);
    mean_ver_verbo.mexer(i,:,:) = mean (ver_verbo.mexer,1);
    mean_ver_verbo.olhar(i,:,:) = mean (ver_verbo.olhar,1);
    mean_ver_verbo.beijar(i,:,:) = mean (ver_verbo.beijar,1);
      
    %Salvando em .txt a média dos verbos para todos os sujeitos
    name = string(dataname_sub_ver_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_verbo.chutar.txt');
    dlmwrite(name,mean_ver_verbo.chutar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_verbo.mexer.txt');
    dlmwrite(name,mean_ver_verbo.mexer,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_verbo.olhar.txt');
    dlmwrite(name,mean_ver_verbo.olhar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_verbo.beijar.txt');
    dlmwrite(name,mean_ver_verbo.beijar,'delimiter','\t','newline','pc');

clear ver_verbo.chutar
clear ver_verbo.mexer
clear ver_verbo.olhar
clear ver_verbo.beijar
end

%Média dos verbos para todos os sujeitos
general_mean_ver_verbo.chutar = mean (mean_ver_verbo.chutar,1);
general_mean_ver_verbo.mexer = mean (mean_ver_verbo.mexer,1);
general_mean_ver_verbo.olhar = mean (mean_ver_verbo.olhar,1);
general_mean_ver_verbo.beijar = mean (mean_ver_verbo.beijar,1);

%Salvando em .txt a média dos verbos para todos os sujeitos
name = string(dataname_ver_verbo);
name = strcat(name,'general_mean_ver_verbo.chutar.txt');
dlmwrite(name,general_mean_ver_verbo.chutar,'delimiter','\t','newline','pc');

name = string(dataname_ver_verbo);
name = strcat(name,'general_mean_ver_verbo.mexer.txt');
dlmwrite(name,general_mean_ver_verbo.mexer,'delimiter','\t','newline','pc');

name = string(dataname_ver_verbo);
name = strcat(name,'general_mean_ver_verbo.olhar.txt');
dlmwrite(name,general_mean_ver_verbo.olhar,'delimiter','\t','newline','pc');

name = string(dataname_ver_verbo);
name = strcat(name,'general_mean_ver_verbo.beijar.txt');
dlmwrite(name,general_mean_ver_verbo.beijar,'delimiter','\t','newline','pc');

%VER VIDEO

%Criando variáveis para agrupar os boquinhos de repetição
ver_video=[];
ver_video.chutar = zeros(3,42,74);
ver_video.mexer = zeros(3,42,74);
ver_video.olhar = zeros(3,42,74);
ver_video.beijar = zeros(3,42,74);
mean_ver_video=[];
mean_ver_video.chutar = zeros(15,42,74);
mean_ver_video.mexer = zeros(15,42,74);
mean_ver_video.olhar = zeros(15,42,74);
mean_ver_video.beijar = zeros(15,42,74);

participantes = cell(15,1); %linha é o n de sujeitos

%Oxy
for i=1:15
    %Carregando os dados do participante
    filename=strcat('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/TS/oxy/',scan_file(i).name);
    participantes{i} = filename;
    data_oxy = load (participantes{i});
    l = ((3*i)-2);
            for k=l:l+2
            ver_video.chutar(l,:,:) = data_oxy(:,t_ver_video(1,k):t_ver_video(1,k)+73);
            ver_video.mexer(l,:,:) = data_oxy(:,t_ver_video(2,k):t_ver_video(2,k)+73);
            ver_video.olhar(l,:,:) = data_oxy(:,t_ver_video(3,k):t_ver_video(3,k)+73);
            ver_video.beijar(l,:,:) = data_oxy(:,t_ver_video(4,k):t_ver_video(4,k)+73);
            end
            
    %Média dos verbos por sujeito
    mean_ver_video.chutar(i,:,:) = mean (ver_verbo.chutar,1);
    mean_ver_video.mexer(i,:,:) = mean (ver_verbo.mexer,1);
    mean_ver_video.olhar(i,:,:) = mean (ver_verbo.olhar,1);
    mean_ver_video.beijar(i,:,:) = mean (ver_verbo.beijar,1);
     
    %Salvando em .txt a média dos verbos para todos os sujeitos
    name = string(dataname_sub_ver_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_video.chutar.txt');
    dlmwrite(name,mean_ver_video.chutar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_video.mexer.txt');
    dlmwrite(name,mean_ver_video.mexer,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_video.olhar.txt');
    dlmwrite(name,mean_ver_video.olhar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_video.beijar.txt');
    dlmwrite(name,mean_ver_video.beijar,'delimiter','\t','newline','pc');
    
    clear ver_video.chutar
    clear ver_video.mexer
    clear ver_video.olhar
    clear ver_video.beijar

end

%Média dos verbos para todos os sujeitos
general_mean_ver_video.chutar = mean (mean_ver_verbo.chutar,1);
general_mean_ver_video.mexer = mean (mean_ver_verbo.mexer,1);
general_mean_ver_video.olhar = mean (mean_ver_verbo.olhar,1);
general_mean_ver_video.beijar = mean (mean_ver_verbo.beijar,1);

%Salvando em .txt a média dos verbos para todos os sujeitos
name = string(dataname_ver_video);
name = strcat(name,'general_mean_ver_video.chutar.txt');
dlmwrite(name,general_mean_ver_video.chutar,'delimiter','\t','newline','pc');

name = string(dataname_ver_video);
name = strcat(name,'general_mean_ver_video.mexer.txt');
dlmwrite(name,general_mean_ver_video.mexer,'delimiter','\t','newline','pc');

name = string(dataname_ver_video);
name = strcat(name,'general_mean_ver_video.olhar.txt');
dlmwrite(name,general_mean_ver_video.olhar,'delimiter','\t','newline','pc');

name = string(dataname_ver_video);
name = strcat(name,'general_mean_ver_video.beijar.txt');
dlmwrite(name,general_mean_ver_video.beijar,'delimiter','\t','newline','pc');

%VER FAZER VERBO


%Criando variáveis para agrupar os boquinhos de repetição
ver_fazer_verbo=[];
ver_fazer_verbo.chutar = zeros(3,42,74);
ver_fazer_verbo.mexer = zeros(3,42,74);
ver_fazer_verbo.olhar = zeros(3,42,74);
ver_fazer_verbo.beijar = zeros(3,42,74);
mean_ver_fazer_verbo=[];
mean_ver_fazer_verbo.chutar = zeros(15,42,74);
mean_ver_fazer_verbo.mexer = zeros(15,42,74);
mean_ver_fazer_verbo.olhar = zeros(15,42,74);
mean_ver_fazer_verbo.beijar = zeros(15,42,74);

participantes = cell(15,1); %linha é o n de sujeitos

%Oxy
for i=1:15
    %Carregando os dados do participante
    filename=strcat('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/TS/oxy/',scan_file(i).name);
    participantes{i} = filename;
    data_oxy = load (participantes{i});
    l = ((3*i)-2);
            for k=l:l+2
            ver_fazer_verbo.chutar(l,:,:) = data_oxy(:,t_ver_fazer_verbo(1,k):t_ver_fazer_verbo(1,k)+73);
            ver_fazer_verbo.mexer(l,:,:) = data_oxy(:,t_ver_fazer_verbo(2,k):t_ver_fazer_verbo(2,k)+73);
            ver_fazer_verbo.olhar(l,:,:) = data_oxy(:,t_ver_fazer_verbo(3,k):t_ver_fazer_verbo(3,k)+73);
            ver_fazer_verbo.beijar(l,:,:) = data_oxy(:,t_ver_fazer_verbo(4,k):t_ver_fazer_verbo(4,k)+73); 
            end
        
    %Média dos verbos por sujeito
    mean_ver_fazer_verbo.chutar(i,:,:) = mean (ver_verbo.chutar,1);
    mean_ver_fazer_verbo.mexer(i,:,:) = mean (ver_verbo.mexer,1);
    mean_ver_fazer_verbo.olhar(i,:,:) = mean (ver_verbo.olhar,1);
    mean_ver_fazer_verbo.beijar(i,:,:) = mean (ver_verbo.beijar,1);
     
    %Salvando em .txt a média dos verbos para todos os sujeitos
    name = string(dataname_sub_ver_fazer_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_verbo.chutar.txt');
    dlmwrite(name,mean_ver_fazer_verbo.chutar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_verbo.mexer.txt');
    dlmwrite(name,mean_ver_fazer_verbo.mexer,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_verbo.olhar.txt');
    dlmwrite(name,mean_ver_fazer_verbo.olhar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_verbo);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_verbo.beijar.txt');
    dlmwrite(name,mean_ver_fazer_verbo.beijar,'delimiter','\t','newline','pc');
    
    clear ver_fazer_verbo.chutar
    clear ver_fazer_verbo.mexer
    clear ver_fazer_verbo.olhar
    clear ver_fazer_verbo.beijar
end

%Média dos verbos para todos os sujeitos
general_mean_ver_fazer_verbo.chutar = mean (mean_ver_verbo.chutar,1);
general_mean_ver_fazer_verbo.mexer = mean (mean_ver_verbo.mexer,1);
general_mean_ver_fazer_verbo.olhar = mean (mean_ver_verbo.olhar,1);
general_mean_ver_fazer_verbo.beijar = mean (mean_ver_verbo.beijar,1);

%Salvando em .txt a média dos verbos para todos os sujeitos
name = string(dataname_ver_fazer_verbo);
name = strcat(name,'general_mean_ver_fazer_verbo.chutar.txt');
dlmwrite(name,general_mean_ver_fazer_verbo.chutar,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_verbo);
name = strcat(name,'general_mean_ver_fazer_verbo.mexer.txt');
dlmwrite(name,general_mean_ver_fazer_verbo.mexer,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_verbo);
name = strcat(name,'general_mean_ver_fazer_verbo.olhar.txt');
dlmwrite(name,general_mean_ver_fazer_verbo.olhar,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_verbo);
name = strcat(name,'general_mean_ver_fazer_verbo.beijar.txt');
dlmwrite(name,general_mean_ver_fazer_verbo.beijar,'delimiter','\t','newline','pc');

%VER FAZER VIDEO

%Criando variáveis para agrupar os boquinhos de repetição
ver_fazer_video=[];
ver_fazer_video.chutar = zeros(3,42,74);
ver_fazer_video.mexer = zeros(3,42,74);
ver_fazer_video.olhar = zeros(3,42,74);
ver_fazer_video.beijar = zeros(3,42,74);
mean_ver_fazer_video=[];
mean_ver_fazer_video.chutar = zeros(15,42,74);
mean_ver_fazer_video.mexer = zeros(15,42,74);
mean_ver_fazer_video.olhar = zeros(15,42,74);
mean_ver_fazer_video.beijar = zeros(15,42,74);

participantes = cell(15,1); %linha é o n de sujeitos

%Oxy
for i=1:15
    %Carregando os dados do participante
    filename=strcat('/home/victor/Desktop/coleta_analise_FNIRS/AnaliseR_Victor/TS/oxy/',scan_file(i).name);
    participantes{i} = filename;
    data_oxy = load (participantes{i});
    l = ((3*i)-2);
            for k=l:l+2
            ver_fazer_video.chutar(l,:,:) = data_oxy(:,t_ver_fazer_video(1,k):t_ver_fazer_video(1,k)+73);
            ver_fazer_video.mexer(l,:,:) = data_oxy(:,t_ver_fazer_video(2,k):t_ver_fazer_video(2,k)+73);
            ver_fazer_video.olhar(l,:,:) = data_oxy(:,t_ver_fazer_video(3,k):t_ver_fazer_video(3,k)+73);
            ver_fazer_video.beijar(l,:,:) = data_oxy(:,t_ver_fazer_video(4,k):t_ver_fazer_video(4,k)+73);
            end
        
    %Média dos verbos por sujeito
    mean_ver_fazer_video.chutar(i,:,:) = mean (ver_verbo.chutar,1);
    mean_ver_fazer_video.mexer(i,:,:) = mean (ver_verbo.mexer,1);
    mean_ver_fazer_video.olhar(i,:,:) = mean (ver_verbo.olhar,1);
    mean_ver_fazer_video.beijar(i,:,:) = mean (ver_verbo.beijar,1);
     
    %Salvando em .txt a média dos verbos para todos os sujeitos
    name = string(dataname_sub_ver_fazer_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_video.chutar.txt');
    dlmwrite(name,mean_ver_fazer_video.chutar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_video.mexer.txt');
    dlmwrite(name,mean_ver_fazer_video.mexer,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_video.olhar.txt');
    dlmwrite(name,mean_ver_fazer_video.olhar,'delimiter','\t','newline','pc');

    name = string(dataname_sub_ver_fazer_video);
    num = string(i);
    name = strcat(name,num,'mean_ver_fazer_video.beijar.txt');
    dlmwrite(name,mean_ver_fazer_video.beijar,'delimiter','\t','newline','pc');
    
    clear ver_fazer_video.chutar
    clear ver_fazer_video.mexer
    clear ver_fazer_video.olhar
    clear ver_fazer_video.beijar
end

%Média dos verbos para todos os sujeitos
general_mean_ver_fazer_video.chutar = mean (mean_ver_verbo.chutar,1);
general_mean_ver_fazer_video.mexer = mean (mean_ver_verbo.mexer,1);
general_mean_ver_fazer_video.olhar = mean (mean_ver_verbo.olhar,1);
general_mean_ver_fazer_video.beijar = mean (mean_ver_verbo.beijar,1);

%Salvando em .txt a média dos verbos para todos os sujeitos
name = string(dataname_ver_fazer_video);
name = strcat(name,'general_mean_ver_fazer_video.chutar.txt');
dlmwrite(name,general_mean_ver_fazer_video.chutar,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_video);
name = strcat(name,'general_mean_ver_fazer_video.mexer.txt');
dlmwrite(name,general_mean_ver_fazer_video.mexer,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_video);
name = strcat(name,'general_mean_ver_fazer_video.olhar.txt');
dlmwrite(name,general_mean_ver_fazer_video.olhar,'delimiter','\t','newline','pc');

name = string(dataname_ver_fazer_video);
name = strcat(name,'general_mean_ver_fazer_video.beijar.txt');
dlmwrite(name,general_mean_ver_fazer_video.beijar,'delimiter','\t','newline','pc');


