function coord=pairwiseDistanceToCoord(pwdMatrix)
    numOfElement=length(pwdMatrix);
    Dij2=diag(pwdMatrix*pwdMatrix);
    pwdtotal=sum(Dij2)/2;
    Dio2=(Dij2/numOfElement)-(pwdtotal/numOfElement^2)*ones(numOfElement,1);
    Dij2=pwdMatrix.^2;
    Dio2=Dio2*ones(1,numOfElement);
    G=(Dio2+Dio2'-Dij2)/2;
    [eigv eigd]=eig(G);
    eigd=eigd.^(1/2);
    coord=eigv*eigd;
    coord=coord(:,end-2:end);