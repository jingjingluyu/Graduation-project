clear
clc
close			
%% baseline
mat = [146	4	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0;
5	124	0	0	1	0	0	0	0	2	3	0	0	0	3	2	1	7	0	1	0	1;
0	0	140	0	0	0	0	0	0	0	0	0	0	0	2	0	0	0	0	1	0	7;
2	4	0	137	0	0	0	0	3	1	0	0	0	0	0	1	0	2	0	0	0	0;
0	2	0	1	144	0	1	0	0	0	0	0	0	0	0	0	0	0	0	1	1	0;
0	0	0	0	0	148	0	0	0	0	0	0	0	0	1	0	0	0	0	0	0	1;
0	0	0	0	3	0	143	0	1	0	0	0	0	2	0	0	0	1	0	0	0	0;
0	0	0	0	0	0	0	135	0	0	1	0	0	0	0	0	0	1	7	0	3	3;
1	1	0	2	0	0	0	0	125	5	0	1	0	5	1	0	0	0	1	0	0	8;
0	0	0	0	0	2	0	1	1	134	0	0	0	0	1	4	2	2	2	0	0	1;
1	2	0	0	0	0	0	0	1	0	141	0	0	0	0	1	0	4	0	0	0	0;
0	0	0	2	0	0	0	0	0	1	0	136	0	0	0	0	0	0	0	0	0	11;
0	0	3	0	0	0	0	0	0	0	0	0	141	4	1	0	0	0	0	0	0	1;
0	0	1	0	0	0	1	0	2	0	0	0	4	138	3	0	0	0	0	0	0	1;
0	0	0	0	1	1	0	0	2	2	1	0	2	2	133	0	0	0	0	4	1	1;
1	1	0	1	0	0	0	0	1	1	0	0	0	0	1	135	3	3	3	0	0	0;
1	0	0	0	0	0	0	0	0	1	0	0	0	0	1	3	135	3	3	1	1	1;
10	4	0	0	0	0	0	1	0	1	2	0	0	0	0	3	6	117	2	2	2	0;
0	0	0	0	0	0	0	9	0	0	0	0	0	0	0	6	1	2	131	0	1	0;
0	0	1	0	0	0	0	5	0	0	0	0	0	0	0	0	0	1	4	101	38	0;
0	0	0	0	0	0	0	7	0	0	0	0	0	0	0	0	0	2	8	11	121	1;
0	0	7	0	0	1	0	7	4	0	0	14	5	1	2	0	1	0	0	0	0	108;];

draw_cm(mat(:,1:22),{'Asterionellopsis','Dinobryon','Phaeocystis','Thalassiosira','other_lt20','Chaetoceros','Ditylum','Pleurosigma','ciliate','pennate','Cylindrotheca','Euglena','Pseudonitzschia','detritus','DactFragCeratul','Guinardia','Rhizosolenia','dinoflagellate','Dactyliosolen','Licmophora','Skeletonema','nanoflagellate'});
print(gcf,'-dtiff','-r300','ASLO');
