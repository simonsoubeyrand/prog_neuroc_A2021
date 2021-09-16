% Devoir : ecrire un script (ou une fonction) qui dessine un grand_damier semblable au petit_damier de 2*N x 2*M cases en utilisant le petit_damier et des boucles.


%  exemple de script du dernier cours 
nn = 50;                        % la largeur d'une case
e = zeros(nn/2, nn/2);          
petit_damier = ones(nn, nn);
petit_damier(1:nn/2, 1:nn/2) = e;
petit_damier(nn/2+1:nn, nn/2+1:nn) = e;
figure, imshow(petit_damier)
% figure, imagesc(petit_damier,[0 1]),colormap(gray),axis('square')

% voir fonctions en bas au complet (functions should be defined at the end
% of a script).
% % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % 

%%
figure, imshow(fabriquer_grand_damier(100, 4, 4))
% figure,imagesc(fabriquer_grand_damier(256/(4*2), 4, 4),[0 1]),colormap(gray),axis('square')



%% % % % % % 



%% autre solution 1 (paresseuse) :
la_moitie = 10;
m_rangees = 10;
n_colonnes = 10;
% grand_damier = repmat(MATRIX, m_rangees, n_colonnes);
grand_damier = repmat(fabriquer_petit_damier(la_moitie), m_rangees, n_colonnes);
%% autre solution 2 (bien mais un peu "overkill") :
la_moitie      = 10;
nb_repetition  = 5;
gradient       = mod(0 : nb_repetition * 2 * la_moitie - 1, 2*la_moitie);
logic_gradient = (gradient < la_moitie);
lignes_x       = repmat(logic_gradient, nb_repetition * 2 * la_moitie, 1);
lignes_y       = lignes_x';
grand_damier   = xor(lignes_x, lignes_y);
%% sauvegarder une image
grand_damier1 = fabriquer_grand_damier(32, 4, 4);
figure, imshow(grand_damier1)

imwrite(grand_damier1, 'damier.png', 'png')
grand_damier2 = imread('damier.png');
figure, imshow(grand_damier2)
%% il existe aussi d'autres alternatives interessantes pour sauvgarder vos *figures*.
figure, imagesc(grand_damier2),colormap(gray),axis('square'),title('mon premier damier')
saveas(gcf, 'output.png')

grand_damier2 = imread('output.png');
figure, imshow(grand_damier2)


%%
% uint8 vs. double entre 0 et 1...
% min(grand_damier1(:)), max(grand_damier1(:))
% min(grand_damier2(:)), max(grand_damier2(:))

num_grade=200;
% rampe de luminance
rampe = repmat(0:1/(num_grade-1):1, num_grade, 1);
figure, imshow(rampe)
imwrite(rampe, 'rampe.tif')
rampe2 = imread('rampe.tif');
figure, imshow(rampe2)
numel(unique(rampe(:)))
numel(unique(rampe2(:)))
figure, plot(rampe(1,1:num_grade), 255*rampe(1,1:num_grade), 'k', rampe(1,1:num_grade), rampe2(1,1:num_grade), 'r')

rampe3 = uint8(255*rampe); % meme tranformation

%% existe donc plusieurs façon de storer des variables, dependament de la precision (ou de l'espace qu'on a..) dont on a besoin.

% double = 8 bytes (64 bits). single = 4 bytes (32 bits). uint8 = 1 byte,
% Il existe aussi beaucoup d'autres variables :

% character : e.g. 'r'
% string    : e.g. 'radis'; ex2 : un
% path.."home/adf/faghelss/Documents/..."
% logical   : i.e. true = 1, false = 0; voir aussi les functions
% "logical", "true", "false"
% structure : e.g. variables.var1 , variables.var2, etc..



%% % % % % % Devoir 2 % % % % :

% Le grand_damier varie presentement entre 0 (case noires) et 1
% (cases blanches);  faire varier les valeures entre p et q (avec p < q).
% Avec le format de votre choix (double, single, uint8). Vous devrez
% sauvegarder l'image resultante.

%% FUNCTIONS (TJRS A LA FIN DU SCRIPT)
function petit_damier = fabriquer_petit_damier(la_moitie)
% petit_damier = fabriquer_petit_damier(la_moitie)
% Fabrique un petit damier de 2 par 2 cases.
% Frederic Gosselin, 16/01/2003

petit_damier = ones(2 * la_moitie, 2 * la_moitie);
petit_damier(1 : la_moitie, 1 : la_moitie) = 0;
petit_damier(la_moitie + 1 : 2 * la_moitie, la_moitie + 1 : 2 * la_moitie) = 0;
end
% % % % % % % % % % % % % % % % % % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % % 


% % % % % % % % % % % % % % % % % % % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % % % 
function grand_damier = fabriquer_grand_damier(la_moitie, m_rangees, n_colonnes)
% grand_damier = fabriquer_grand_damier(la_moitie, nb_repetition)
% Fabrique un damier de 2*m_rangees par 2*n_colonnes cases.
% Utilise la fonction fabriquer_petit_damier.
% Frederic Gosselin, 16/01/2003

% fabrique petit damier, i.e.le "cycle"
petit_damier = fabriquer_petit_damier(la_moitie);

% repete le petit damier
grand_damier = zeros(m_rangees * 2 * la_moitie, n_colonnes * 2 * la_moitie);
for ii = 1:m_rangees
	for jj = 1:n_colonnes
        debut_range = ((ii - 1) * 2 * la_moitie + 1);
        fin_range   = (ii * 2 * la_moitie);
        
        debut_colonne = ((jj - 1) * 2 * la_moitie + 1);
        fin_colonne   = (jj * 2 * la_moitie);
        
		grand_damier(debut_range : fin_range, debut_colonne : fin_colonne) = petit_damier;
	end
end

end

% 0:.01:1;
% vous avez 30 minutes
