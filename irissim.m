function contrast_text_explanations(index, CI, CU, strCI, strCU, featurename)
strimportance=strCI(index,:);
strutility=strCU(index,:);
cimportance=CI(index,:)*100;
cutility=CU(index,:)*100;
for i = 1:numel(cimportance)
    cprintf ('text','The');
    cprintf ('err',' %s ',featurename(i));
    cprintf ('text',' which is ');
    cprintf ('err','%s (CI=%.2f%%) ', strimportance(i),cimportance(i));
    cprintf ('text', 'feature has ');
    cprintf ('err', '%s (CU=%.2f%%) ', strutility(i),cutility(i));
    cprintf ('text', 'size.\n');
    
end 

end
