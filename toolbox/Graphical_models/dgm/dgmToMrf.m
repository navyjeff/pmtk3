function mrf = dgmToMrf(dgm)
%% Convert a dgm to an undirected model
% PMTKgraphicalModel dgm
%%
G = moralizeGraph(dgm.G); 
if isfield(dgm, dgm.factors)
    factors = dgm.factors; 
else
    factors = cpds2Factors(dgm.CPDs, dgm.G, dgm.CPDpointers);
end
mrf = mrfCreate(G, 'nodePots', factors, 'localCPDs', ...
    dgm.localCPDs, 'localCPDpointers', dgm.localCPDpointers); 

doms = cellfuncell(@(c)c.domain, mrf.jtree.cliques);
mrf.edges = doms(cellfun('length', doms) > 1);




end