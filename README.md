# Visual and Temporal Features Analysis of Online Videos Data

## Definição
Atualmente há facilidade para publicar vídeos na web, principalmente através de redes sociais como YouTube e Facebook. No YouTube são publicadas cerca de 400 horas de vídeos por minuto, acessados por 1,9 bilhões de usuários mensais. Poder prever a popularidade de um vídeo é um problema que empresas como Facebook e Netflix têm investido para resolver.

Com base em dados extraídos de 1820 vídeos publicados no Facebook [1], neste trabalho serão exploradas quais _features_ – entre _features_ visuais e _features_ temporais – mais contribuem para a popularidade de um vídeo, através de análises exploratórias, visualização de dados e regressão utilizando a linguagem R [2].

## Referências
[1] T. Trzcinski and P. Rokita, “Predicting Popularity of Online Videos Using Support Vector Regression,” IEEE Transactions on Multimedia, vol. 19, no. 11, pp. 2561–2570, Nov. 2017.

[2] W. Cho, Y. Lim, H. Lee, M. K. Varma, M. Lee, and E. Choi, “Big Data Analysis with Interactive Visualization using R packages,” in Proceedings of the 2014 International Conference on Big Data Science and Computing - BigDataScience ’14, 2014.

[3] A. Khosla, A. Das Sarma, and R. Hamid, “What makes an image popular?,” in Proceedings of the 23rd international conference on World wide web - WWW ’14, 2014.

## Estrutura do projeto
```
├── README.md          	<- Este arquivo, com a definição e estrutura do projeto.
├── data
│   ├── processed      	<- Arquivos de dados processados de acordo com a necessidade do projeto.
│   └── raw            	<- Arquivo de dados original.
│
├── reports            	<- Arquivos relacionados a geração de análises em formato markdown: .Rmd, .md e .html.
│   └── images         	<- Figuras e gráficos gerados nas análises.
│
└── scripts            	<- Códigos utilizados para processamento e análise dos dados.
    ├── data processing	<- Códigos para leitura e processamento dos dados.
    └── functions		<- Funções utilizadas em outros códigos.
```