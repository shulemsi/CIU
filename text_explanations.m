function text_explanations(index, CI, CU, strCI, strCU, featurename)
strimportance=strCI(index,:);
strutility=strCU(index,:);
%round((net(samples)),2)
cimportance=CI(index,:)*100;
cutility=CU(index,:)*100;
for i = 1:numel(cimportance)
    cprintf ('text','The');
    cprintf ('*Comments',' %s ',featurename(i));
    cprintf ('text',' which is ');
    cprintf ('*Comments','%s (CI=%.2f%%) ', strimportance(i),cimportance(i));
    cprintf ('text', 'feature has ');
    cprintf ('*Comments', '%s (CU=%.2f%%) ', strutility(i),cutility(i));
    cprintf ('text', 'size.\n');
    
end 
 
end