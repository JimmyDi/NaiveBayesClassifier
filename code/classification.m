function label_result=classification(likelihood_positive,likelihood_negative,p_positive,instance_test)
    for j=1:instance_test
        likelihood_positive(j)=likelihood_positive(j)*p_positive;
        likelihood_negative(j)=likelihood_negative(j)*(1-p_positive);
%     result_positive(j)=result_positive(j);
%     result_negative(j)=result_negative(j);
        if likelihood_positive(j)>likelihood_negative(j)
          label_result(j)=1;
        else
          label_result(j)=0;
        end
    end
end