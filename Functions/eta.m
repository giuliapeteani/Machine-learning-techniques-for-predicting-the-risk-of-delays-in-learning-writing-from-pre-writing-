% mese e anno ---> devo settare mese_a=1 poichè Linda ha detto che
% consideriamo mese acquisizione= gennaio

close all
%clearvars -except Excelfattoriconfondenti
clc


mese_a=1;
anno_a=2020;

anno= NaN*ones(size(Excelfattoriconfondenti, 1),1);

for child= 1:247
    if ~isempty(Excelfattoriconfondenti{child,3}) &&  ~isempty(Excelfattoriconfondenti{child,4}) 
        if Excelfattoriconfondenti{child,4} ~= 1
            anno(child,1)= anno_a - Excelfattoriconfondenti{child,3} -1;
            cont= 12 - Excelfattoriconfondenti{child,4};
            cont= cont + 1;
            cont= cont/12;
            anno(child,1)= anno(child,1) + cont;
        else
            anno(child,1)= anno_a - Excelfattoriconfondenti{child,3};
        end
    end
end
  



