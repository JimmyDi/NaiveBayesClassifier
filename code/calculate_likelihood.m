function [result_positive,result_negative,instance_test,feature_test]=calculate_likelihood(test_data,norm_dist_positive,norm_dist_negative)
    instance_test=size(test_data,1);
    feature_test=size(test_data,2);
    result_positive=ones(instance_test,1);
    result_negative=ones(instance_test,1);
    for j=1:instance_test
        for i=1:feature_test-1
         result_positive(j)=normpdf(test_data(j,i),norm_dist_positive(i,1),norm_dist_positive(i,2))*result_positive(j);
         result_negative(j)=normpdf(test_data(j,i),norm_dist_negative(i,1),norm_dist_negative(i,2))*result_negative(j);
        end
    end
end