load Test-CM-HOG-SVM-RBF.txt 
for i = 1:200
	rate(i) = Test_CM_HOG_SVM_RBF(i,i)/sum(Test_CM_HOG_SVM_RBF(i,:))
end
result = mean(rate)