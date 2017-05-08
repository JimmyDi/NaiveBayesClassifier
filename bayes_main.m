%%%try naive bayes
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%read in data, all the features follow gaussian distribution
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
% training_data=load('after_oracal_dataset.csv');
% test_data=load('blindTest_feature_50features_after.csv');
 dataset=load('LabelledAll_marked_deleteAbove10_afterinpute_cfsgreedy_withID_withLabel.csv');

% for kkk=1:100

%%%%split the dataset 70% 30%
[training_data,test_data]= percentage_split(dataset);


% training_data=load('norm_last_70.csv');
% test_data=load('norm_last_30.csv');


% Training_Naive_Bayes(training_data);
%%trainng naive bayes
%%get distribution function
[norm_dist_positive,norm_dist_negative,p_positive,active_learning] = Training_Naive_Bayes(training_data);
%%get likehood result for all features, instance_test means number of
%%instance
[likelihood_positive,likelihood_negative,instance_test,feature_test]=calculate_likelihood(test_data,norm_dist_positive,norm_dist_negative);

    prior_positive=p_positive
    ratio=1
        while ratio>p_positive
              prior_positive=prior_positive-0.0001;
            %%classification
              label_result=classification(likelihood_positive,likelihood_negative,prior_positive,instance_test);
            %%confusion matrix
              ratio=confution_matrix(label_result,instance_test);
            %%for blind test
%               ratio=confution_matrix2(label_result,instance_test);

        end
        
    
%   precision_kkk(kkk)=precision;
%   recall_kkk(kkk)=recall;
%   gg=[precision_kkk' recall_kkk']
% end
% 
% norm_precision=mle(gg(:,1));
% norm_recall=mle(gg(:,2))

%%%active learning
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% active_learning=active_learning(:,1)';
% unlabelled_data=load('UnlabelledTrain_marked_afterinput_50features.csv');
% unlabelled_size=size(unlabelled_data,1);
% for i=1:unlabelled_size
%    label(i)=i;
%    distance(i)=norm(unlabelled_data(i,:)-active_learning);
% end
% distance=[label' distance'];
% distance=sortrows(distance,2);
% for i=1:1000
%     oracle(i,:)=distance(i,:);
% end
% 
% string_number=num2str(oracle(:,1));
% fid = fopen('oracle.txt','wt');
% for i=1:1000
%  fprintf(fid,strtrim(string_number(i,:)));
%  fprintf(fid,'\n');
% end
% fclose(fid);




%%%output file
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% label_result=label_result';
% for i=1:23965
%     order(i)=i;
% end
% order=order';
% order=num2str(order(:,1));
% 
% for i=1:23965
%     fenhao(i,:)=':';
%     kongge(i,:)=' ';
% end
% 
% 
% order=[order fenhao kongge ];
% 
% NN=0;
% PP=0;
% for i=1:23965
%     if label_result(i,1)==1
%         string(i,:)='P';
%         PP=PP+1;
%     else
%       label_result(i,1)==0
%        string(i,:)='N'; 
%       NN=NN+1;
%     end
% end
% final_ratio=PP/(PP+NN);
% output=[order string];
% %%write into file
% fid = fopen('upload.txt','wt');
% for i=1:23965
%  fprintf(fid,strtrim(output(i,:)));
%  fprintf(fid,'\n');
% end
% fclose(fid);