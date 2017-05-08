function [norm_dist_positive,norm_dist_negative,p_positive,active_learning] = Training_Naive_Bayes(training_data)
    number_instance=size(training_data,1);
    number_feature=size(training_data,2);
    nn=1;
    mm=1;
%%seperate positive data and negative data into 2 datasets
    for i=1:number_instance
     if training_data(i,number_feature)==1
            data_positive(nn,:)=training_data(i,:);
            nn=nn+1;
     else
            data_negative(mm,:)=training_data(i,:);
          mm=mm+1;
     end
    end
    number_positive=size(data_positive,1);
    number_negative=size(data_negative,1);
%%calculate the ratio of positive data and negative data
    p_positive=number_positive/number_instance;
    p_negative=1-p_positive;
    %%%%get mle value
% x=-40:0.1:40;
%    x = linspace(30,120,1000);
%    figure(1);
    for i=1:number_feature-1
    norm_dist_positive(i,:)=mle(data_positive(:,i));
    norm_dist_negative(i,:)=mle(data_negative(:,i));
    y = @(x) normpdf(x,norm_dist_positive(i,1),norm_dist_positive(i,2))-normpdf(x,norm_dist_negative(i,1),norm_dist_negative(i,2));
    active_learning(i,:)=double(solve(y));
%         pdf_norm_positive(i,:)=normpdf(x,norm_dist_positive(i,1),norm_dist_positive(i,2));
% %    result_positive=pdf_norm_positive(i,:).*result_positive;
%     pdf_norm_negative(i,:)=normpdf(x,norm_dist_negative(i,1),norm_dist_negative(i,2));
%  result_negative=pdf_norm_negative(i,:).*result_negative;
%     figure(i)
%      plot(x,pdf_norm_positive(i,:),'LineWidth',2,'color','r');
%      hold on;
%    plot(x,pdf_norm_negative(i,:),'LineWidth',2,'color','k');
%    hold off;
%    caption2=num2str(i);
%    caption1='distribution for feature ';
%    caption=[caption1 caption2];
%    title(caption);
%    legend('positive data','negative data');
%     plot(x,pdf_norm_negative(i,:),'k-');
%     hold off;
% %    plot(x,pdf_norm_negative(i,:),'k-');
% % %     plot(x,log(pdf_norm_negative(i,:)*(6/7)),'k-');
% %     hold off;
    end
    


   
% figure(1)
% plot(x,pdf1);
% hold on;
% plot(x,pdf2);
% hold off;

end