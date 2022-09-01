%feature selection con metodo della PCA

%% applico PCA normalization
load ('rischio_new.mat');
load('feature_def_n.mat');

clc
[coeff,score_n,latent,tsquared,explained_n]=pca(feature_def_n(:, [1:end-1])); 

 pos=1;
 pos1=1;
for r=1:(size(feature_def_n,1)-1)
    if rischio_new(r,1)==1
        score_n_r(pos,:)=score_n(r,:);
        pos=pos+1;
    else if rischio_new(r,1)==0
        score_n_td(pos1,:)=score_n(r,:);
        pos1=pos1+1;    
        end
    end
end

figure(1)
scatter3(score_n_r(:,1),score_n_r(:,2),score_n_r(:,3), 40, 'r','filled')
hold on
scatter3(score_n_td(:,1),score_n_td(:,2),score_n_td(:,3), 40, 'b')

axis equal
xlabel('1° componente principale')
ylabel('2° componente principale')
zlabel('3° componente principale')
title('3D plot feature normalizzate')

% screeplot
figure(2)
pareto(explained_n)
xlabel('Componente principale');
ylabel('Varianza spiegata(%)');
title('Screeplot feature normalizzate')

%% cumsum
%calcolo la media per ogni componente principale = colonna
for c=1:size(coeff,2)
    media(1,c)=mean(coeff(:,c));
end

%conto quante volte il valore sulla riga (apporto nella feature a creare
%la componente principale)è inferiore alla media di quella colonna
%(componente principale) -> maggiore è il numero minore è l'apporto della
%feature nella PCA in generale
num=0;
for r=1:size(coeff,1)
    for c=1:size(coeff,2)
        if coeff(r,c)<=media(1,c)
            num =num+1;
        end
    end
    cumsum(r,1)=num;
    num=0;
end





%% applico PCA standardization
clc
[coeff,score_s,latent,tsquared,explained_s]=pca(feature_def_s(:, [1:end-1])); 

 pos=1;
 pos1=1;
for r=1:size(feature_def_s,1)
    if rischio_new(r,1)==1
        score_s_r(pos,:)=score_s(r,:);
        pos=pos+1;
    else if rischio_new(r,1)==0
        score_s_td(pos1,:)=score_s(r,:);
        pos1=pos1+1;    
        end
    end
end

figure(3)
scatter3(score_s_r(:,1),score_s_r(:,2),score_s_r(:,3), 30, 'r','filled')
hold on
scatter3(score_s_td(:,1),score_s_td(:,2),score_s_td(:,3), 30, 'b')

axis equal
xlabel('1° componente principale')
ylabel('2° componente principale')
zlabel('3° componente principale')
title('3D plot feature standardizzate')

% screeplot
figure(4)
pareto(explained_s)
xlabel('Componente principale');
ylabel('Varianza spiegata(%)');
title('Screeplot feature standardizzate');

