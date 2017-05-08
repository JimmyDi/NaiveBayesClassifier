function [precision,recall,ratio]=confution_matrix(label_result,test_data,instance_test,feature_test)  
result_number_positive=0;
result_number_negative=0;
 TN=0;
 TP=0;
 FP=0;
 FN=0;
for j=1:instance_test
    if test_data(j,feature_test)==0
        if label_result(j)==0
            TN=TN+1;
        else 
            FP=FP+1;
        end  
            
    else 
        if label_result(j)==0
            FN=FN+1;
        else
            TP=TP+1;
        end        
    end
    if label_result(j)==1
        result_number_positive=result_number_positive+1;
    else   
        result_number_negative=result_number_negative+1;
    end
    
end

ratio=result_number_positive/(result_number_positive+result_number_negative);
 precision=TP/(TP+FP);
 recall=TP/(TP+FN);
end