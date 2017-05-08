%%%%%this is for blind test%%%%not for classifier test

function [ratio]=confution_matrix2(label_result,instance_test)  
result_number_positive=0;
result_number_negative=0;
 
for j=1:instance_test
    
    if label_result(j)==1
        result_number_positive=result_number_positive+1;
    else   
        result_number_negative=result_number_negative+1;
    end
    
end

ratio=result_number_positive/(result_number_positive+result_number_negative);
end