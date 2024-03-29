%% get_link
% gets links to web-pages for AmP entries

%%
function links = get_link(taxon, open)
% created 2017/06/14 by Bas Kooijman, modified 2017/07/11, 2018/01/30

%% Syntax
% links = <get_link *get_link*>(taxon, open)

%% Description
% Gets cell strings with links and descriptions for an entry and open the webpages.
%
% Input:
%
% * taxon: character string with name of an entry
% * open: optional boolean for opening the web pages (default 0: not open)
%
% Output:
%
% * links: (n,2)-cell array with links and names for links

%% Remarks
% empty ID links are removed from output; ID links are all empty if entry  is not listed, but warning is given.
%
% Potential general web sites:
%
% * EoL: also used in get_id_EoL; is most complete 
% * CoL: also used in get_id_CoL
% * AWD: strong American bias, wierd common names
% * Taxonomicon: also used in get_id_Taxo; Sheila.Brands@utxs.com; Sheila.Brands@multiweb.nl
% * Wikipedia: if it has not the entry name, a higher taxon is selected
% * WoRMS only has marine species, such as the polar bear, but no other bears; inconsistent presence for freshwater plankton
%
% Potential taxon-specific web sites:
%
% * molluscabase only has molluscs
% * fishbase only has fish
% * amphibiaseweb only has amphibians
% * ReptileDB only has reptiles (no dino's)
% * Avibase only has birds
% * Birdlife only has birds
% * MSW3 only has mammals
% * AnAge only works well for tetrapods; ulread for AnAge is always successful, but <20000 long if entry does not exist

%% Example of use
% links = get_link('Daphnia_magna')

  % texts to supplement taxon for various websites
  taxon_fish = [strrep(taxon,'_','-'), '.html'];         % used in fishbase
  taxon_amph = strrep(taxon,'_','+');                    % used in amphibiaweb
  taxon_rep = ['genus=', strrep(taxon,'_','&species=')]; % used in reptileDB

  % default identifiers
  id_Wiki = taxon;  id_ADW = taxon; id_CoL = ''; id_EoL = ''; id_Taxo = ''; id_WoRMS = ''; % general sites
  id_molluscabase = ''; id_fishbase = ''; id_amphweb = ''; id_ReptileDB = ''; id_avibase = ''; id_birdlife = ''; id_MSW3 = ''; id_AnAge = ''; % taxon-specific sites

  switch taxon % overwrite id's if necessary, assign empty to delete (at bottom)
    case 'Haliclona_oculata'
      id_CoL = '91f72133c6f354d688695e8755c95e32';
      id_WoRMS = '289593';
      id_Taxo = '11495';
      id_EoL = '45316178';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Ptilosarcus_gurneyi'
      id_CoL = '19dd87c4059f3e0d7b8ee05643419b23';
      id_WoRMS = '290947';
      id_Taxo = '114546';
      id_EoL = '199466';
      
    case 'Chironex_fleckeri'
      id_CoL = 'acb0b861a8a833094a28eb241f5d6668';
      id_WoRMS = '23632';
      id_Taxo = '11821';
      id_EoL = '200766';      
      
    case 'Hydra_viridissima'
      id_CoL = '19190e1a47af46b36c952ecf9b80588d';
      id_WoRMS = '290156';
      id_Taxo = '11604';
      id_EoL = '1006246';
      
    case 'Pelagia_noctiluca'
      id_CoL = '8f7ed35020d936d5a101ba43281c223f';
      id_WoRMS = '135305';
      id_Taxo = '11851';
      id_EoL = '203481';
      
    case 'Cyanea_capillata'
      id_CoL = '08804dad0ba263ccf88e072523cd00d9';
      id_WoRMS = '135301';
      id_Taxo = '11855';
      id_EoL = '1005690';
      
    case 'Rhizostoma_octopus'
      id_CoL = 'c73258a81408309516936f312686772a';
      id_WoRMS = '152203';
      id_Taxo = '11875';
      id_EoL = '2552541';
      id_Wiki = 'Rhizostoma';
      
    case 'Mastigias_papua'
      id_CoL = 'dbf8c27746d6ab5b080fe529c023a253';
      id_WoRMS = '220485';
      id_Taxo = '458143';
      id_EoL = '203445';
      
    case 'Mnemiopsis_leidyi'
      id_CoL = '1c0c292c0300677f3bce686e31495b3e';
      id_WoRMS = '106401';
      id_Taxo = '12339';
      id_EoL = '393337';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Bolinopsis_mikado'
      id_CoL = '266955574f36a9262c06633951a8c034';
      id_WoRMS = '265201';
      id_Taxo = '86084';
      id_Wiki = 'Bolinopsis_infundibulum';
      id_EoL = '393328';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Callianira_antarctica'
      id_CoL = '303f7a8417f250f9b9d1cbc77fc060cf';
      id_WoRMS = '265170';
      id_Taxo = '290691';
      id_Wiki = 'Callianira_(ctenophore)';
      id_EoL = '45502494';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Pleurobrachia_pileus'
      id_CoL = '3ddfb02d1f60caec8189823cc007b893';
      id_WoRMS = '106386';
      id_Taxo = '12311';
      id_EoL = '393310';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Pleurobrachia_bachei'
      id_CoL = 'ea157b9c6d94ac452e22b094c2d3c211';
      id_WoRMS = '265191';
      id_Taxo = '12310';
      id_EoL = '393303';
      
    case 'Beroe_gracilis'
      id_CoL = 'd2a147385e1eacebb447e4f9e1558f1e';
      id_WoRMS = '106361';
      id_Taxo = '167446';
      id_Wiki = 'Beroe_(ctenophore)';
      id_EoL = '509862';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Beroe_ovata'
      id_CoL = 'c70014071bb5de21dca3ec0d826bb274';
      id_WoRMS = '106362';
      id_Taxo = '167447';        
      id_EoL = '45502754';
      id_ADW = ''; % not present at 2017/08/09

    case 'Symsagittifera_roscoffensis'
      id_CoL = '4115a356141cdb139611c3b87899630c';
      id_WoRMS = '484585'; 
      id_Taxo = '201059';  
      id_ADW = ''; % not present at 2017/09/24
      id_EoL = '5012595'; 

    case 'Moniliformis_dubius'
      id_CoL = '2db31682f5ec69386b23ea4212b709b1';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '14700';
      id_Wiki = 'Moniliformis_moniliformis';
      id_EoL = '481468';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Asplanchna_girodi'
      id_CoL = '7ef4175c71766debbf941dc6e2476c02';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '114748';  
      id_Wiki = 'Rotifera';
      id_EoL = '1062479';
      
    case 'Brachionus_plicatilis'
      id_CoL = 'c1847141382c50836d8cf6c9cea31e71';
      id_WoRMS = '134982';
      id_Taxo = '91556'; 
      id_EoL = '1062516';
      
    case 'Lepidochitona_cinerea'
      id_CoL = '75dec12407157ff88b7093da4cd037b8';
      id_WoRMS = '152774';
      id_Taxo = '114600';  
      id_EoL = '451167';
      id_molluscabase = '152774';
      
    case 'Panopea_abbreviata'
      id_CoL = '312cd47922d448cf8a1c72fd83a01ad7';
      id_WoRMS = '505404';
      id_Taxo = '39968';        
      id_EoL = '46473283';      
      id_molluscabase = '505404';
      id_Wiki = 'Panopea (bivalve)';
      id_ADW = ''; % not present 2018/12/28
      
    case 'Ensis_directus'
      id_CoL = '9535725bdbecb2f76d4461dc8a747406';
      id_WoRMS = '140732';
      id_Taxo = '39468';        
      id_EoL = '448700';     
      id_molluscabase = '933783';
      
    case 'Cerastoderma_edule'
      id_CoL = '2af65e2b505c0c8b54696e3d1a6ae6cc';
      id_WoRMS = '138998';
      id_Taxo = '39793';        
      id_EoL = '395985';      
      id_molluscabase = '138998';
      
    case 'Cerastoderma_glaucum'
      id_CoL = '8388202a26e5db4db1e1b11e113dd6a7';
      id_WoRMS = '138999';
      id_Taxo = '84902';        
      id_EoL = '590197';      
      id_molluscabase = '138999';
      
    case 'Tridacna_gigas'
      id_CoL = '4eb8d942654a006b5458b02e3a2c137b';
      id_WoRMS = '207670';
      id_Taxo = '39920';        
      id_EoL = '2926830';      
      id_molluscabase = '207670';
      
    case 'Donax_trunculus'
      id_CoL = 'af623992e61fc9ab63a2248b744325a7';
      id_WoRMS = '139602'; 
      id_Taxo = '39569';        
      id_EoL = '46474538';      
      id_molluscabase = '139602';
      id_ADW = ''; % not present at 2018/12/19
      
    case 'Abra_segmentum'
      id_CoL = '2e10b6e3daf1c051312d0874f801e77e';
      id_WoRMS = '141438'; 
      id_Taxo = '39550'; % present at genus level only 2019/05/01      
      id_EoL = '46474989';      
      id_molluscabase = '141438';
      id_ADW = ''; % not present at 2019/05/01
      
    case 'Tagelus_plebeius'
      id_CoL = 'd9706ccea583450ad0dbdca3565dcd73';
      id_WoRMS = '157001'; 
      id_Taxo = '195314'; 
      id_EoL = '157001';      
      id_molluscabase = '141438';
      
    case 'Macoma_balthica'
      id_CoL = '7752e8e469ee3f69471f23a73bb94786';
      id_WoRMS = '141579'; % unaccepeted, to Limecola balthica (Linnaeus, 1758)
      id_Taxo = '39503';        
      id_EoL = '590151';      
      id_molluscabase = '141579';
      
    case 'Thyasira_cf_gouldi'
      id_CoL = 'dc19c27b17c4dea50708c165254d9c2c';
      id_WoRMS = '861611';
      id_Taxo = '113636'; % only present at genus level 2017/11/22       
      id_EoL = '3028005';
      id_ADW = ''; % not present at 2017/11/22
      id_molluscabase = '141663';
     
    case 'Parathyasira_sp'
      id_CoL = 'bdff2d9e399937a2ecb4d5c92c92b596';
      id_WoRMS = '861611';
      id_Taxo = '113636';       
      id_EoL = '3028005';
      id_molluscabase = '141663';
      id_Wiki = '';
      id_ADW = 'Parathyasira';
     
    case 'Mytilopsis_sallei'
      id_CoL = '5e451e2ac36ade42130a9909b0979122';
      id_WoRMS = '397147';
      id_Taxo = '135649'; % only genus level 2017/07/21       
      id_EoL = '493167';      
      id_molluscabase = '397147';
      
    case 'Mya_arenaria'
      id_CoL = 'b8018df2338b52a3f82bb35f20327198';
      id_WoRMS = '140430';
      id_Taxo = '39960';        
      id_EoL = '492903';      
      id_molluscabase = '140430';
      
    case 'Sphaerium_corneum'
      id_CoL = 'd6cc7df13f1f1d9a37cbd8ff86c9a824';
      id_WoRMS = ''; % not present at 2017/10/04
      id_Taxo = '39602';        
      id_EoL = '493224'; % unaccpeted, to Sphaerium asiaticum     
      id_molluscabase = '181564';
      
    case 'Arctica_islandica'
      id_CoL = '5c0583f70d0785993185a7411b8a4cae';
      id_WoRMS = '138802';
      id_Taxo = '39737';        
      id_EoL = '493164';     
      id_molluscabase = '138802';
      
    case 'Spisula_subtruncata'
      id_CoL = '645d5bc0059ac916901c819a2e8ac614';
      id_WoRMS = '140302'; 
      id_Taxo = '39755';        
      id_EoL = '448797';
      id_Wiki = 'Spisula';     
      id_molluscabase = '140302';
      
    case 'Spisula_solidissima'
      id_CoL = '103350a1dd4dc352ac58a7c6ee59492a';
      id_WoRMS = '156996'; 
      id_Taxo = '39754';        
      id_EoL = '448794';
      id_molluscabase = '156996';
      
    case 'Amarilladesma_mactroides'
      id_CoL = 'a0d68e0bfec2bf8f152dd538955363fe';
      id_WoRMS = '505790';  
      id_Taxo = '39565'; % present as  Mesodesma 2019/05/05        
      id_EoL = '46472135';
      id_molluscabase = '505790';
      id_Wiki = 'Mesodesma';
      id_ADW = ''; % not present 2019/05/05     
      
    case 'Ruditapes_philippinarum'
      id_CoL = '020b3f1b4179f488782e4d69d7dc071f';
      id_WoRMS = '231750';
      id_Taxo = '39617';        
      id_EoL = '395921';
      id_ADW = ''; % not present at 2017/08/09      
      id_molluscabase = '231750';
      
    case 'Ruditapes_decussatus'
      id_CoL = 'd288b9f0f3748a3f1555be799829a11f';
      id_WoRMS = '231749';
      id_Taxo = '139552';        
      id_EoL = '3060328';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '231749';
      
    case 'Dosinia_exoleta'
      id_CoL = '98038a896a55c991e0cc4262dcca1c32';
      id_WoRMS = '141911';
      id_Taxo = '39650';        
      id_EoL = '395922';      
      id_molluscabase = '141911';
      
    case 'Mercenaria_mercenaria'
      id_CoL = '02d4e8872e4092cee6d6af417cf86d53';
      id_WoRMS = '141919';
      id_Taxo = '39696';        
      id_EoL = '492162';      
      id_molluscabase = '141919';
      
    case 'Callista_chione'
      id_CoL = '2d5caed4cc6a83c4a004babd7553dbfd';
      id_WoRMS = '141906';
      id_Taxo = '39609';        
      id_EoL = '46469308';      
      id_molluscabase = '141906';
      
    case 'Echyridella_menziesii'
      id_CoL = '1467382d3ab24e1ca4e76417fc858224';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '';  % not present 2017/06/15
      id_EoL = '4752438';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '819815';
      
    case 'Anodonta_cygnea'
      id_CoL = '932770a8167ab3658dfb0e0c4e98278b';  
      id_WoRMS = '234103'; % unaccepted, to Anadonta_anatina
      id_Taxo = '39445';   
      id_EoL = '4749280';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '234103';
      
    case 'Actinonaias_ligamentina'
      id_CoL = 'b62686da9bf81fbac2c1c28a28e7c658';  
      id_WoRMS = ''; % not present 2019/04/18
      id_Taxo = '235338';   
      id_EoL = '449465';
      id_Wiki = 'Actinonaias'; 
      id_molluscabase = '861809';
      
    case 'Westralunio_carteri'
      id_CoL = '';   % not present 2017/06/15 
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '';  % not present 2017/06/15
      id_EoL = '7262151';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '818635'; % only at genus level
      
    case 'Argopecten_purpuratus'
      id_CoL = 'be54afd1d214780315c063fa0def0756';
      id_WoRMS = '394269';
      id_Taxo = ''; % not present 2017/06/15             
      id_EoL = '4739393';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '394269';
      
    case 'Pecten_maximus'
      id_CoL = 'cfba025bc7568aa8054058b764da5484';
      id_WoRMS = '140712';
      id_Taxo = '39421';        
      id_EoL = '449733';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140712';
      
    case 'Zygochlamys_patagonica'
      id_CoL = 'f1ee5ce84fa89ac778dd0da85ed9f3ac';
      id_WoRMS = '236717';
      id_Taxo = ''; % not present at 2019/01/04        
      id_EoL = '46467774';
      id_ADW = ''; % not present at 2019/01/04
      id_molluscabase = '236717';
      id_Wiki = 'Pectinidae';
      
    case 'Placopecten_magellanicus'
      id_CoL = '60267b9440fb093260b9eec16c18c54f';
      id_WoRMS = '156972';
      id_Taxo = '39370';        
      id_EoL = '448745';
      id_ADW = ''; % not present at 2018/01/23
      id_molluscabase = '156972';
      
    case 'Chlamys_islandica'
      id_CoL = '03df3956fb490ebd6d6e757b5ac9377d';
      id_WoRMS = '140692';
      id_Taxo = '39391';        
      id_EoL = '449763';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140692';
      
    case 'Adamussium_colbecki'
      id_CoL = '3624ded39fa2b5cf02886ca4ab870ec6';
      id_WoRMS = '197021';
      id_Taxo = '135375'; % present at genus level only   2019/08/20     
      id_EoL = '46467864';
      id_ADW = ''; % not present at 2019/08/20
      id_molluscabase = '197021';
      
    case 'Magallana_gigas'
      id_CoL = '93190b1650de88982e0161577b8b6a7e'; 
      id_WoRMS = '836033'; 
      id_Taxo = '39283'; % present as Crassostrea gigas      
      id_EoL = '451579'; % present as Crassostrea gigas
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140656'; 
      
    case 'Crassostrea_virginica'
      id_CoL = '5e156cdb8840e74e41c7f31d8749cacc'; 
      id_WoRMS = '140657'; 
      id_Taxo = '39285';  
      id_EoL = '449554'; % present as Crassostrea brasiliana
      id_molluscabase = '140657'; 
      
    case 'Ostrea_edulis'
      id_CoL = '3063d7e4904e854f23e2d5ac9861a140';
      id_WoRMS = '140658';
      id_Taxo = '39291';        
      id_EoL = '449502';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140658';
      
    case 'Perna_viridis'
      id_CoL = '6ef2899719ea0ddf2c7310cb868c9927';
      id_WoRMS = '367822';
      id_Taxo = '39229';        
      id_EoL = '3110205';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '367822';
      
    case 'Perna_perna'
      id_CoL = '550e68bd80ea1046404db3659e71ffee';
      id_WoRMS = '140483';
      id_Taxo = ''; % not present at 2018/10/03       
      id_EoL = '468743';
      id_molluscabase = '541374';
      
    case 'Perna_canaliculus'
      id_CoL = '3d69fa2bde15669f202d0e77b251ab67';
      id_WoRMS = '397169';
      id_Taxo = ''; % not present at 2018/12/11       
      id_EoL = '46466851';
      id_molluscabase = '397169';
      id_ADW = ''; % not present at 2018/12/11    
      
    case 'Mytilus_edulis'
      id_CoL = 'fd90faaa60b00c787b864db5935122a0';
      id_WoRMS = '140480';
      id_Taxo = '39226';        
      id_EoL = '449959';      
      id_molluscabase = '140480';
      
    case 'Mytilus_californianus'
      id_CoL = '073e0f457f10e18f5ea034cfe0c48c20';
      id_WoRMS = '140481';
      id_Taxo = '39225';        
      id_EoL = '449960';       
      id_molluscabase = '367837';
      
    case 'Mytilus_galloprovincialis'
      id_CoL = '04790e322405f377d0e822187e2d7404';
      id_WoRMS = '140481';
      id_Taxo = '39227';
      id_EoL = '449961';       
      id_molluscabase = '140481';
      
    case 'Mytilus_trossulus'
      id_CoL = 'b22222da5f4fd8e0e68afc05d8705c9b';
      id_WoRMS = '140482';
      id_Taxo = '81556';        
      id_EoL = '578868';       
      id_molluscabase = '140482';
      
    case 'Brachidontes_pharaonis'
      id_CoL = '7e58b93994497ead236dd02370e5c733';
      id_WoRMS = '140437';
      id_Taxo = ''; % not present 2017/06/15        
      id_EoL = '2972795';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140437';
      
    case 'Mytilaster_minimus'
      id_CoL = 'bf5b0501c3db505732b751a445a2396d';
      id_WoRMS = '140478';
      id_Taxo = ''; % not present 2017/06/15          
      id_EoL = '2972843';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '140478';
      
    case 'Septifer_virgatus'
      id_CoL = '755768b01e8324c1c8e620dd1153a5ed'; % unaccepted, to Mytilisepta virgata (Wiegmann, 1837)
      id_WoRMS = '367774'; % unaccepted, to Mytilisepta virgata (Wiegmann, 1837)
      id_Taxo = ''; % not present 2017/06/15
      id_Wiki = 'Mytilidae';
      id_EoL = '3110167';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '367774';
      
    case 'Lithophaga_lithophaga'
      id_CoL = '630ea1eb4432e53fd0d4b4b281de900d'; 
      id_WoRMS = '140459'; 
      id_Taxo = '39205'; 
      id_EoL = '46467081';
      id_molluscabase = '140459';
      id_ADW = ''; % not present 2019/05/06

    case 'Pinctada_margaritifera'
      id_CoL = '4c8d85c6f008d3ce9c479af1a0f99e4f'; 
      id_WoRMS = '207899'; 
      id_Taxo = '39257';
      id_EoL = '468594';       
      id_molluscabase = '207899';
      
    case 'Pinctada_imbricata'
      id_CoL = '84ec11414833568c6250ced62ea180c2'; 
      id_WoRMS = '564659'; 
      id_Taxo = '39256'; % present at genus level only 2019/04/27
      id_EoL = '46467329';       
      id_molluscabase = '207901';
      
    case 'Pteria_sterna'
      id_CoL = '5fbe1e63094147d3eda28d2c20e59ef3'; 
      id_WoRMS = '464505'; 
      id_Taxo = '39260'; % present at genus level only 2019/04/27
      id_EoL = '46467351';       
      id_molluscabase = '464505';
      
     case 'Pinna_nobilis'
      id_CoL = '32002f1b8cce671983b5436a0731f307'; 
      id_WoRMS = '140780'; 
      id_Taxo = '39322';
      id_EoL = '46467273';       
      id_molluscabase = '140780';
      
   case 'Patella_vulgata'
      id_CoL = 'b6d47c01f8b1aac2e8d612029dec8807';
      id_WoRMS = '140685';
      id_Taxo = '34642';        
      id_EoL = '401252';       
      id_molluscabase = '140685';
      
    case 'Nacella_concinna'
      id_CoL = '087b8be1bb64593eaa01268fe0488e87';
      id_WoRMS = '197296';
      id_Taxo = '132813'; % present at genus level only 2019/05/21    
      id_EoL = '46464988';       
      id_molluscabase = '197296';
      
    case 'Gibbula_umbilicalis'
      id_CoL = 'e5837ae66f8b757e82aa6181db535ab8';
      id_WoRMS = '141801';
      id_Taxo = '34750';        
      id_EoL = '619551';       
      id_molluscabase = '141801';
      
    case 'Phorcus_lineatus'
      id_CoL = '5d915d529f45e7c60979e383f2ef5333';
      id_WoRMS = '689176';
      id_Taxo = ''; % not present 2017/06/15       
      id_EoL = '619858';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '689176';
      
    case 'Haliotis_rubra'
      id_CoL = 'c22996fd304bf07d34e1702ffa16ff17';
      id_WoRMS = '445354';
      id_Taxo = '34615'; % present at genus level only 2019/01/09        
      id_EoL = '4792496';       
      id_molluscabase = '445354';
      id_ADW = 'Haliotus';
      
    case 'Haliotis_mariae'
      id_CoL = '7decb5b611cb75f535b7e6e4aaa54f02';
      id_WoRMS = '207664';
      id_Taxo = '34615'; % present at genus level only 2019/01/09        
      id_EoL = '3049002';       
      id_molluscabase = '207664';
      id_ADW = 'Haliotus';
      
    case 'Buccinum_undatum'
      id_CoL = '1e9490fd92636d74588b2fc5f0870e54';
      id_WoRMS = '138878';
      id_Taxo = '36715';        
      id_EoL = '595071';       
      id_molluscabase = '138878';
      
    case 'Buccinanops_deformis'
      id_CoL = '293b32d0eb4cf49787a11217ed558f61';
      id_WoRMS = '532464';
      id_Taxo = '133946'; % present at genus level only 2018/12/31       
      id_EoL = '46461832';       
      id_molluscabase = '532464';
      id_ADW = ''; % not present 2018/12/31 
      
    case 'Urosalpinx_cinerea'
      id_CoL = '854e3a6612913ce60ea981e0048635e4';
      id_WoRMS = '140429';
      id_Taxo = '36285';        
      id_EoL = '503335';       
      id_molluscabase = '140429';
      
    case 'Adelomelon_brasiliana'
      id_CoL = 'db2a0271d654038c6f5c9c5108c38d23';
      id_WoRMS = '759016';
      id_Taxo = ''; % not present 2017/06/15            
      id_EoL = '4845771';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '759016';
      
    case 'Lobatus_gigas'
      id_CoL = 'e9cd75257b06d72b4c56c8d5c7070010';
      id_WoRMS = '564730';
      id_Taxo = '35586'; % present as Strombus gigas 2018/12/14      
      id_EoL = '455238';       
      id_molluscabase = '564730';
      id_ADW = 'Strombus_gigas'; % present as Strombus gigas 2018/12/14  
      
    case 'Littorina_littorea'
      id_CoL = '8937d1f10190ce22541aa498ba4773c6';
      id_WoRMS = '140262';
      id_Taxo = '35203';        
      id_EoL = '619396';       
      id_molluscabase = '140262';
      
    case 'Heleobia_australis'
      id_CoL = 'e304fd883226e4245a26453d85771abf';
      id_WoRMS = '532899';
      id_Taxo = '145878'; % present at genus level only 2019/04/28        
      id_EoL = '4860343';       
      id_molluscabase = '532899';
      id_ADW = ''; % not presetn 2019/04/28
      
    case 'Euspira_nitida'
      id_CoL = '79649390454e2a5fc41c8ea2ed2faaaf';
      id_WoRMS = '151894';
      id_Taxo = ''; % not present 2017/06/15        
      id_EoL = '6990612'; 
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '151894';
      
    case 'Crepidula_fornicata'
      id_CoL = 'cb8d13d370be3253d988a29585db934d';
      id_WoRMS = '138963';
      id_Taxo = '35525';        
      id_EoL = '593855';       
      id_molluscabase = '138963';
      
    case 'Potamopyrgus_antipodarum'
      id_CoL = 'a25261f237f8c34efe70e335ed0fe1fc';
      id_WoRMS = '147123';
      id_Taxo = '155529';        
      id_EoL = '586334';       
      id_molluscabase = '147123';
      
    case 'Aplysia_californica'
      id_CoL = '79cd7dad3cdb7a458fa58a0a77eb939c';
      id_WoRMS = '240765';
      id_Taxo = ''; % not present 2017/06/15         
      id_EoL = '451984';       
      id_molluscabase = '240765';
      
    case 'Clione_limacina'
      id_CoL = 'ccdf4eb106a21eed81a0df1e7d2ca725';
      id_WoRMS = '139178';
      id_Taxo = '38184';        
      id_EoL = '451920';       
      id_molluscabase = '139178';
      
    case 'Cuthona_nana'
      id_CoL = '49690556f98ee422c43965e6f9691394';
      id_WoRMS = '141627';
      id_Taxo = ''; % not present 2017/06/15          
      id_EoL = '451572';      
      id_molluscabase = '141627';
      
    case 'Lymnaea_stagnalis'
      id_CoL = 'ea77dedfde3d3bd9b1d45805c6cde119';
      id_WoRMS = ''; % not present 2017/06/15  
      id_Taxo = '38499';      
      id_EoL = '453306';       
      id_molluscabase = '181582';
      
    case 'Stagnicola_palustris'
      id_CoL = 'aa6c1e75fc6f19f056a2c6ca08a23218';
      id_WoRMS = ''; % not present 2017/06/15    
      id_Taxo = '';  % not present 2017/06/15 
      id_EoL = '3013056';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '594993';
      
    case 'Biomphalaria_glabrata'
      id_CoL = 'dda69fe8d4ca69ea96e9656a8f4ad747';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '125350';    
      id_EoL = '452452';       
      id_molluscabase = '848622';
      
    case 'Planorbis_planorbis'
      id_CoL = '18d8f8532b36c262662e2410d1847bd4';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '38526';    
      id_EoL = '2979529';
      id_ADW = 'Planorbis'; % only present at genus level
      id_molluscabase = '182693';
      
    case 'Achatina_achatina'
      id_CoL = '8dbb31a2c43f4fdceea9d8c5d3fcacce';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '38688'; 
      id_EoL = '4891973';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '820077';
      
    case 'Ambigolimax_valentianus'
      id_CoL = '48ae5a4fa1b68bfac1581bf9a1914065';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15
      id_EoL = '40043389';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '819990';
      
    case 'Cornu_aspersum'
      id_CoL = 'be1016122f1c597b37092a9c8b64aa6c';
      id_WoRMS = ''; % not present 2017/06/15  
      id_Taxo = '38975'; % present as  Helix aspersa M�ller, 1774           
      id_EoL = '449907'; % present as  Helix aspersa M�ller, 1774    
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '820000';
      
    case 'Helix_pomatia'
      id_CoL = 'efd15b11323656a01f781d934219f5fb';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '168261'; 
      id_EoL = '46373408';      
      id_molluscabase = '1000986';
      
    case 'Helix_lucorum'
      id_CoL = '6fe34a0bb192109281912b5ee38f2b86';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '1014609'; 
      id_EoL = '4900516';      
      id_molluscabase = '1050278';
      
    case 'Cernuella_virgata'
      id_CoL = 'd41e57b1f4e04a94f51b47b212c3d36b';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '308419';  
      id_EoL = '592444';       
      id_molluscabase = '426375';
      
    case 'Nautilus_pompilius'
      id_CoL = '9623f8e059399835d352956174dc024b';
      id_WoRMS = '216384';
      id_Taxo = '40101';        
      id_EoL = '590944';       
      id_molluscabase = '216384';
      
    case 'Sepia_officinalis'
      id_CoL = '22353d7f2941918fea5661dde05d0321';
      id_WoRMS = '141444';
      id_Taxo = '169813';        
      id_EoL = '448836';       
      id_molluscabase = '141444';
      
    case 'Sepiola_atlantica'
      id_CoL = '44669098315cfbb641688d3fc48a8506';
      id_WoRMS = '141454';
      id_Taxo = '40221';        
      id_EoL = '448833';       
      id_molluscabase = '141454';
      
    case 'Sepietta_obscura'
      id_CoL = 'ff971eddd33e29318b793c02a46fe304';
      id_WoRMS = '141451';
      id_Taxo = ''; % not present 2017/06/15 
      id_Wiki = 'Sepietta_petersi'; % unaccepted, to Sepiola petersi Steenstrup, 1887
      id_EoL = '591176';
      id_ADW = ''; % not present at 2017/08/09
      id_molluscabase = '141451';
      
    case 'Euprymna_hyllebergi'
      id_CoL = '3fb01720b80e6677d2c8ff92d9908d60';
      id_WoRMS = '410361';
      id_Taxo = '157825';        
      id_EoL = '489601';       
      id_molluscabase = '410361';
      
    case 'Rossia_macrosoma'
      id_CoL = '774da2001a667bf11ede3e1cf197b0ce';
      id_WoRMS = '141449';
      id_Taxo = '40216';        
      id_EoL = '450463';       
      id_molluscabase = '141449';
      
    case 'Doryteuthis_pealeii'
      id_CoL = '71883eecc1e2f28199a9a79d82085fbf';
      id_WoRMS = '410354';
      id_Taxo = '157870'; % present as Loligo pealeii   
      id_EoL = '448839';
      id_ADW = 'Loligo_pealeii'; 
      id_molluscabase = '574541';
      
    case 'Doryteuthis_gahi'
      id_CoL = '49222604ed9848e4e149c623ff16c2c9';
      id_WoRMS = '410351';
      id_Taxo = '157868'; % present as Loligo gahi 
      id_EoL = '592758';
      id_ADW = 'Loligo_gahi'; 
      id_molluscabase = '341880';
      
    case 'Dosidicus_gigas'
      id_CoL = 'f8d0240ab22bfbd59daabaf513d2c90f';
      id_WoRMS = '342291';
      id_Taxo = '158112';  
      id_EoL = '403181';
      id_molluscabase = '342291';
      
    case 'Illex_argentinus'
      id_CoL = '0dc9984fa55cf3bd35381122b0023d8a';
      id_WoRMS = '342064';
      id_Taxo = '158097';  
      id_EoL = '591440';
      id_molluscabase = '342064';
      
    case 'Ommastrephes_bartramii'
      id_CoL = '81be79f1d783888289906282cbedd81d';
      id_WoRMS = '181382';
      id_Taxo = '158110';  
      id_EoL = '453373';
      id_molluscabase = '181382';
      
    case 'Thysanoteuthis_rhombus'
      id_CoL = '6bc5c5000ac2a2e7eadc64341ccdbdd3';
      id_WoRMS = '141680';
      id_Taxo = '136624';  
      id_EoL = '453261';
      id_molluscabase = '141680';
      
   case 'Octopus_cyanea'
      id_CoL = '8e622e1b7f9777d3f33c42f52836d21a';
      id_WoRMS = '210788';
      id_Taxo = '158218';        
      id_EoL = '593207';       
      id_molluscabase = '210788';
      
    case 'Octopus_maya'
      id_CoL = '01fe079c62706c970beb455711158713';
      id_WoRMS = '341996';
      id_Taxo = '158249';
      id_Wiki = 'Octopus';
      id_EoL = '492848';       
      id_molluscabase = '341996';
      
    case 'Octopus_vulgaris'
      id_CoL = '68dbab9ebc28639002befc34e2ffe516';
      id_WoRMS = '140605';
      id_Taxo = '40350';        
      id_EoL = '492280';       
      id_molluscabase = '140605';
      
    case 'Octopus_mimus'
      id_CoL = '1b66339c2aa57d497ce240b3401d2b30';
      id_WoRMS = '342001';
      id_Taxo = '158255';        
      id_EoL = '593211';       
      id_molluscabase = '342001';
      
    case 'Octopus_joubini'
      id_CoL = '69e4ddfd7aa58ed6a3f5138fd3ba5a61';
      id_WoRMS = '341985';
      id_Taxo = '158240';        
      id_EoL = '492283';       
      id_molluscabase = '341985';
      
    case 'Octopus_tetricus'
      id_CoL = 'df879d469e52800adaad62997cb7c25c';
      id_WoRMS = '342036';
      id_Taxo = '158299';        
      id_EoL = '491760';       
      id_molluscabase = '342036';
      
    case 'Octopus_tehuelchus'
      id_CoL = '6950c54b4521049766040f891a73f5b6';
      id_WoRMS = '342032';
      id_Taxo = '158297';        
      id_EoL = '399285';       
      id_molluscabase = '342032';
      
    case 'Aspidiophorus_polystictos'
      id_CoL = '88edfcced5860e504db0c2d25d801715';
      id_WoRMS = '114471';
      id_Taxo = '';  % not present 2017/06/15 
      id_Wiki = 'Gastrotricha';
      id_EoL = '510013';
      
    case 'Magellania_fragilis'
      id_CoL = '397256b281a713c08dd827ce925a4418';
      id_WoRMS = '235668';
      id_Taxo = '991609'; % unaccepeted, to Aerothyris fragilis
      id_Wiki = 'Brachiopoda';
      id_EoL = '7011791';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Phoronis_pallida'
      id_CoL = '3d20b39a5cdcd6ae450a423e58efe977';
      id_WoRMS = '128551';
      id_Taxo = '40609'; 
      id_Wiki = 'Phoronidea';
      id_EoL = '512282';
      
    case 'Phoronis_psammophila'
      id_CoL = 'e14d12c2ea2adcca4e8ab7e86155231f';
      id_WoRMS = '128552';
      id_Taxo = '40610'; 
      id_EoL = '46555625';
      
    case 'Flustra_foliacea'
      id_CoL = 'fd374d545f72678ced74b5f86d54deba';
      id_WoRMS = '111367';
      id_Taxo = '40579';        
      id_EoL = '600545';
      
    case 'Myzostoma_cirriferum'
      id_CoL = ''; % not present 2017/09/16
      id_WoRMS = '130336';
      id_Taxo = '114628'; % not accepted, to Myzostomum cirriferum Leuckart, 1827 
      id_EoL = '2967081';
      id_ADW = 'Myzostomum_cirriferum';

    case 'Ophryotrocha_labronica'
      id_CoL = '14b58611f7c0fd55a042f1699bc36ebe'; 
      id_WoRMS = '130027';
      id_Taxo = '498641'; 
      id_EoL = '467939';
      id_ADW = ''; % not present 2019/04/29

    case 'Hediste_diversicolor'
      id_CoL = '5329cd04e4ce262f3118e37339ce8871';
      id_WoRMS = '152302';
      id_Taxo = '15136'; 
      id_EoL = '406336';
      
    case 'Neanthes_arenaceodentata'
      id_CoL = '36d20e9543e6c676d401c4a73d140d5e';
      id_WoRMS = '334084';
      id_Taxo = '480714'; 
      id_EoL = '458741';
      id_Wiki = 'Nereididae';
      
    case 'Capitella_teleta'
      id_CoL = 'fd9aa8aa73aaf17bae632c52a561664d';
      id_WoRMS = '592089';
      id_Taxo = ''; % not present 2017/06/15        
      id_EoL = '44282278';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Arenicola_marina'
      id_CoL = '8981bb1d5f3ba68ed39eec35e0104438';
      id_WoRMS = '129868';
      id_Taxo = '15271';        
      id_EoL = '486136';
      
    case 'Urechis_caupo'
      id_CoL = '6588e0703aeed419f42bfe94280334ac';
      id_WoRMS = '266874';
      id_Taxo = '15653'; 
      id_EoL = '512273';
      id_Wiki = 'Echiura';
      
    case 'Dendrobaena_octaedra'
      id_CoL = 'd9f299fc5388e61d8ebe58f55ee7dfcd'; 
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '2907467';   
      id_Wiki = 'Annelida';
      id_EoL = '3126867';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Lumbricus_terrestris'
      id_CoL = '7d5b92e98b0d25fc021e22ccea749717'; 
      id_WoRMS = ''; % not present at 2017/08/09
      id_Taxo = '15563';  
      id_EoL = '3126801';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Octolasion_cyaneum'
      id_CoL = 'c39d48b8d317b85403b3500a610f0be7';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '140609';        
      id_Wiki = 'Annelida';
      id_EoL = '3140066';
      
    case 'Aporrectodea_longa'
      id_CoL = '6ba7cb1f971e29fa5b0489de565d4109';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '';  % not present 2017/06/15        
      id_Wiki = 'Annelida';
      id_EoL = '3126993';
      
    case 'Eisenia_fetida'
      id_CoL = '';   % not present 2017/06/15 
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '15557'; % Eisenia_foetida  preferred    
      id_EoL = '3126934';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Barbronia_weberi'
      id_CoL = '6deb30d583228d87219b6ddb697b8192';
      id_WoRMS = ''; % not present 2017/09/18 
      id_Taxo = '103702';  
      id_EoL = '3139989';
      id_Wiki = 'Erpobdelliformes'; 
      
    case 'Theromyzon_tessulatum'
      id_CoL = '6653171c859df5760ed35a208ca58b28';
      id_WoRMS = ''; % not present 2018/11/01 
      id_Taxo = '15602'; 
      id_EoL = '401356';
      
    case 'Schmidtea_polychroa'
      id_CoL = '032a02867df5f7a953bd3c02edd02523';
      id_WoRMS = ''; % not present 2017/06/15 
      id_Taxo = '';  % not present 2017/06/15
      id_EoL = '595706'; % present as Dugesia polychroa
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Baikaiobia_guttata'
      id_CoL = ''; % not present 2017/09/17
      id_WoRMS = ''; % not present 2017/09/17 
      id_Taxo = '';  % not present 2017/09/17
      id_EoL = ''; % not present 2017/09/17
      id_ADW = ''; % not present 2017/09/17
      id_Wiki = 'Tricladia';

    case 'Branchotenthes_octohamatus'
      id_CoL = '02a31521f1c305dfb2439e649587bd9b'; 
      id_WoRMS = '396288';
      id_Taxo = '117415';  % present at family level 2019/03/21
      id_EoL = '46484942'; 
      id_ADW = ''; % not present 2019/03/21
      id_Wiki = 'Hexabothriidae';

    case 'Lineus_viridis'
      id_CoL = '6855b93aab0f8ca308099b55523c6755'; 
      id_WoRMS = '122543';
      id_Taxo = '114569'; 
      id_EoL = '49880478'; 

    case 'Ferosagitta_hispida'
      id_CoL = '5fa5c1982af0297dfe25875928c2570c';
      id_WoRMS = '105454'; 
      id_Taxo = '40644';  
      id_Wiki = 'Chaetognatha';
      id_EoL = '512014'; 
      
    case 'Caenorhabditis_elegans'
      id_CoL = '64710e67cd5e7ae09722a643ba747af2';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '13102';   
      id_EoL = '403869';
       
    case 'Macrobiotus_hufelandii'
      id_CoL = 'cdf5e8f2aaf144fd5170f295c272c445'; % unaccepted, to Macrobiotus_hufelandi
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '15789'; % unaccepted, to Macrobiotus_hufelandi       
      id_Wiki = 'Tardigrada'; 
      id_EoL = '998986'; % present as Macrobiotus hufelandi C.A.S. Schultze, 1834 
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Hypsibius_convergens'
      id_CoL = '779e48ba14edf4787cd08b7e7401e63b';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '421894';        
      id_Wiki = 'Tardigrada';
      id_EoL = '12089749';
       
    case 'Ramazzottius_oberhaeuseri'
      id_CoL = '1bd832ac6d7bb295abbd24520dbf0798';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '104402'; %    
      id_Wiki = 'Tardigrada'; 
      id_EoL = '1023979';      
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Milnesium_tardigradum'
      id_CoL = '063fd91ca8ab9f5dd77628fc62aa3df3';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '104409';    
      id_EoL = '1053491';
       
    case 'Pycnogonum_litorale'
      id_CoL = '14c3dd8cde8bf89b963bc7436dc0ec59'; % present as Pycnogonum_littorale
      id_WoRMS = '239867';
      id_Taxo = '17077'; % present as Pycnogonum_littorale
      id_Wiki = 'Pycnogonum';
      id_EoL = '511865';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Smeringurus_mesaensis'
      id_CoL = '5ac22e6a79875de9dd358275269bf959';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '87088';  % only as genus 2017/06/15      
      id_Wiki = 'Vaejovidae';
      id_EoL = '3195557';
       
    case 'Grosphus_hirtus'
      id_CoL = '6417071edd0036318656314ef1da6e34';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '87030';  % only as genus 2019/06/17      
      id_Wiki = 'Buthidae';
      id_EoL = '3195162';
      id_ADW = ''; % not present 2017/06/15
       
    case 'Rhizoglyphus_robini'
      id_CoL = 'a08d34f3fc91edcfd634888b64706f28';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '143153'; 
      id_Wiki = 'Rhizoglyphus';
      id_EoL = '10409051';
       
    case 'Alaskozetes_antarcticus'
      id_CoL = '582d8ac86ecd0503e83606fce33a4689';
      id_WoRMS = '508284'; 
      id_Taxo = '1394187'; 
      id_EoL = '588540';
       
    case 'Aglaoctenus_lagotis'
      id_CoL = '4f7f7da06de383e86a5bfe76f10bb859';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '727868';   
      id_Wiki = 'Aglaoctenus';
      id_EoL = '1196373';
       
    case 'Tetragnatha_versicolor'
      id_CoL = '808c85d1f5cdea0a28d4e20a8db931ac';
      id_WoRMS = ''; % not present 2017/09/19
      id_Taxo = '958783';   
      id_Wiki = 'Tetragnatha';
      id_EoL = '1193770';
       
    case 'Cyprideis_torosa'
      id_CoL = 'fd7d758262a28756831f7f8614655d73';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '33329';  
      id_Wiki = 'Podocopida';
      id_EoL = '339177';
       
    case 'Pollicipes_polymerus'
      id_CoL = 'a42970103ec89cd036510f82fe968d29';
      id_WoRMS = '535329';
      id_Taxo = '76206'; 
      id_EoL = '335092';
       
    case 'Notobalanus_flosculus'
      id_CoL = ''; % not present 2019/05/09
      id_WoRMS = '733530';
      id_Taxo = '1330572';  % only present atgenus level and indicated as extinct 2019/05/09    
      id_EoL = ''; % not present 2019/05/09
      id_ADW = 'Notobalanus';
      id_Wiki = 'Archaeobalanidae';
       
    case 'Amphibalanus_amphitrite'
      id_CoL = '4d32e73ac272ffb524ab0186a71a2cdc';
      id_WoRMS = '421137';
      id_Taxo = '1383615';  % only present at subfamily level 2018/03/10    
      id_EoL = '1039496';
      id_ADW = 'Balanus_amphitrite';
       
    case 'Austrominius_modestus'
      id_CoL = 'ec26be8376438e2f496a60d2976f7354'; % present as Elminius modestus 2019/05/05
      id_WoRMS = '712167';
      id_Taxo = '84935';   % present as Elminius modestus 2019/05/05 
      id_EoL = '46768952'; % present as Elminius modestus 2019/05/05 
      id_ADW = 'Elminius modestus';
       
    case 'Argulus_coregoni'
      id_CoL = 'd632ab75e743ee0dd2ed9f25a08dd0ca';
      id_WoRMS = ''; % not present at 2018/03/12
      id_Taxo = '33658';     
      id_EoL = '335530';
      id_Wiki = 'Argulus';

    case 'Nitokra_spinipes'
      id_CoL = '0747856e47615f0c02503a3612915bd8';
      id_WoRMS = '745852';
      id_Taxo = '203273';  % only present at genus level 2017/07/10    
      id_EoL = '1020994';
      id_Wiki = 'Harpacticoida';
       
    case 'Acanthocyclops_robustus'
      id_CoL = 'd63a685097756b1c2cf45229db57cac0';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '107247';  % only present at genus level 2017/09/26   
      id_Wiki = 'Acanthocyclops';
      id_EoL = '1025087';
       
    case 'Cyclops_vicinus'
      id_CoL = '3665f193e29e67b5f91a61c8f72b79e8';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '125392';        
      id_Wiki = 'Cyclops_(genus)';
      id_EoL = '339864';
       
    case 'Mesocyclops_leukarti'
      id_CoL = 'eb76a8aa998d1b3614cbeef939cbe8a5';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '124982';        
      id_Wiki = 'Mesocyclops';
      id_EoL = '339717';
       
    case 'Calanus_sinicus'
      id_CoL = '522187c194196c1a2931e0e054be2ebe';
      id_WoRMS = '346214';
      id_Taxo = '33568'; % only present at genus level 2017/09/26      
      id_Wiki = 'Calanus';
      id_EoL = '1039703';
       
   case 'Eurytemora_affinis'
      id_CoL = 'b3cd8223fe63cbb356fab69438d3a23d';
      id_WoRMS = '104872';
      id_Taxo = '143915'; % only present at genus level 2017/09/26                   
      id_Wiki = 'Temoridae';
      id_EoL = '1020941';
       
   case 'Temora_longicornis'
      id_CoL = '14a364abe865cd072d80625e0f366108';
      id_WoRMS = '104878';
      id_Taxo = '71029';             
      id_EoL = '46534191';
       
   case 'Lepeophtheirus_salmonis'
      id_CoL = '6df2ffbaf945346ec014bded8680bb67';
      id_WoRMS = '135782';
      id_Taxo = '206162'; % only present at genus level 2017/09/26          
      id_EoL = '1020941';
       
    case 'Gastrosaccus_roscoffensis'
      id_CoL = '4540d0daf178a034243dcbb63840bd62';
      id_WoRMS = '120018';
      id_Taxo = '144240';  % only present at genus level 2019/04/27              
      id_EoL = '1018151';
      id_Wiki = 'Mysidae';
       
    case 'Leptomysis_lingvura'
      id_CoL = 'd9266defb43c8336539b6b24151e1ee1';
      id_WoRMS = '120054';
      id_Taxo = '33032';  % only present at genus level 2017/09/28              
      id_EoL = '342717';
      id_Wiki = 'Mysidae';
      id_ADW = ''; % not present 2019/04/27
       
    case 'Americamysis_bahia'
      id_CoL = '0b592a7d53255a98c000aa7588064b40';
      id_WoRMS = '226286';
      id_Taxo = '3464443';         
      id_EoL = '1040545';
       
    case 'Hemimysis_speluncola'
      id_CoL = 'db7ac8c44d87726097820b9eac516128';
      id_WoRMS = '120030';
      id_Taxo = '34090'; % only present at genus level 2017/09/28             
      id_EoL = '128022';
      id_Wiki = 'Mysidae';
       
    case 'Mysis_mixta'
      id_CoL = '75d47759bf7d4d79eaa4107c2c0423c0';
      id_WoRMS = '120113';
      id_Taxo = '34093';  % only present at genus level 2017/09/27            
      id_Wiki = 'Mysis';
      id_EoL = '318325';
       
    case 'Neomysis_integer'
      id_CoL = 'a266c337bd34e09b4734d6562dfc5cdc';
      id_WoRMS = '120136';
      id_Taxo = '34098';              
      id_EoL = '344079';
       
    case 'Praunus_flexuosus'
      id_CoL = '1071b4a0c4807ba65c09222da0ee64e5';
      id_WoRMS = '120177';
      id_Taxo = '34100';  % only present at genus level 2017/09/27            
      id_EoL = '318599';
       
    case 'Asellus_aquaticus'
      id_CoL = '4acab09868db831471b70493b88c5cc0';
      id_WoRMS = '148667';
      id_Taxo = '34250';        
      id_EoL = '343656';
       
    case 'Dynamene_bidentata'
      id_CoL = '29d27fd635617b428baa6b121b44fb88';
      id_WoRMS = '256988';
      id_Taxo = '226773';  % present at genus level only 2018/10/29      
      id_EoL = '1022158';
      id_ADW = ''; % not present 2018/10/29
      id_Wiki = 'Sphaeromatidae';
       
    case 'Porcellio_scaber'
      id_CoL = 'f7f2e3aa63418de280d2441a2f50a353';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '34215';
      id_EoL = '128536';
       
    case 'Corophium_volutator'
      id_CoL = '3f0dd1ef46052e07709a147e7e701ed6';
      id_WoRMS = '102101';
      id_Taxo = '34324';        
      id_EoL = '343480';
       
    case 'Monocorophium_insidiosum'
      id_CoL = 'c2e5634f369f4e09d83aedc9b056c5c2';
      id_WoRMS = '148592';
      id_Taxo = '1371349'; % present at gens level only 2019/05/08            
      id_EoL = '46528510';
       
    case 'Jassa_falcata'
      id_CoL = 'e31b5852d20bd937c78d0702c44f6cf5';
      id_WoRMS = '102431';
      id_Taxo = '215404'; % present at gens level only 2019/05/08      
      id_EoL = '46529514';
       
    case 'Gammarus_fossarum'
      id_CoL = '';   % not present 2017/06/15
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15
      id_Wiki = 'Gammarus';
      id_EoL = '4248761';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Gammarus_pseudolimnaeus'
      id_CoL = '46665c47e08b50e65aa372a80c3e2436';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15    
      id_Wiki = 'Gammarus';
      id_EoL = '344046';
       
    case 'Gammarus_pulex'
      id_CoL = '7b6908ae7563c0d764397d8f1cbe6e04';
      id_WoRMS = '819836';
      id_Taxo = '34297';        
      id_EoL = '344717';
       
    case 'Gammarus_roeselii' 
      id_CoL = '';   % not present 2017/06/15
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15 
      id_EoL = '4248762';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Dikerogammarus_villosus' 
      id_CoL = '';   % not present 2017/10/27
      id_WoRMS = '148586'; 
      id_Taxo = '';  % not present 2017/06/15 
      id_EoL = '3033511';
      id_ADW = ''; % not present at 2017/10/27 
      
    case 'Arcitalitrus_dorrieni' 
      id_CoL = '935bbd7e8fe0924e95d16e3e24016736';
      id_WoRMS = ''; % not present 2018/10/30 
      id_Taxo = '1383682';  % present at genus level only 2018/10/30 
      id_EoL = '2946886';
      id_ADW = ''; % not present at 2018/10/30
      id_Wiki = 'Arcitalitrus';
      
    case 'Hyalella_azteca' 
      id_CoL = '5a122dd8635d37d33e5612143276ffb1';
      id_WoRMS = ''; % not present 2019/03/07 
      id_Taxo = '132618';   
      id_EoL = '342551';
      
    case 'Hyperia_galba' 
      id_CoL = 'c9c5aa67008b4bc665f447fe04091b21';
      id_WoRMS = '103251';
      id_Taxo = '34341';   
      id_EoL = '46521640';
      
    case 'Hyperoche_medusarum' 
      id_CoL = '402a6d6ffc298fd05da2d03221a5ce5d';
      id_WoRMS = '103256';
      id_Taxo = '215096'; % at genus level only 2019/05/09 
      id_EoL = '46521650';
      
    case 'Euphausia_superba'
      id_CoL = '9b5816e13fe1783d6d65f7075aba514f';
      id_WoRMS = '236217';
      id_Taxo = '33778';        
      id_EoL = '509426';
       
    case 'Meganyctiphanes_norvegica'
      id_CoL = '5f895dc8e3d3fb0271a3c2069716b463';
      id_WoRMS = '110690';
      id_Taxo = '33780';        
      id_EoL = '509431';
       
    case 'Nyctiphanes_australis'
      id_CoL = '9854c46c1e62f43827f210d65373a6ec';
      id_WoRMS = '237863';
      id_Taxo = '33773'; % only present at genus level at 2019/04/14        
      id_EoL = '509443';
       
    case 'Aristeus_antennatus'
      id_CoL = 'd8b8be09331d3ea62c0d6c1d2a9024e0';
      id_WoRMS = '107083';
      id_Taxo = '204281'; % only present at genus level at 2018/12/15       
      id_EoL = '46501823';
      id_Wiki = 'Aristeidae'; % only present at family level at 2018/12/15  

    case 'Xiphopenaeus_kroyeri'
      id_CoL = 'ea0aa1fa454c3722239daaeffa927af1';
      id_WoRMS = '377690';
      id_Taxo = '222495'; % only present at genus level at 2018/12/19       
      id_EoL = '46502158';

    case 'Litopenaeus_stylirostris'
      id_CoL = 'b3ac8546dc90caf61f668ce287a4f8fd';
      id_WoRMS = '377458';
      id_Taxo = '222495'; % only present at genus level at 2018/12/19       
      id_EoL = '1021452';
      id_Wiki = 'Litopenaeus';

    case 'Penaeus_semisulcatus'
      id_CoL = '6c59fdf9bc7efddbb1987f39e28229ca';
      id_WoRMS = '107112';
      id_Taxo = '33814'; % only present at genus level at 2019/01/21       
      id_EoL = '46502055';

    case 'Fenneropenaeus_chinensis'
      id_CoL = '3caa876f05331c18daffb180ffc4957f';
      id_WoRMS = '246390';
      id_Taxo = '222476'; % only present at genus level at 2019/01/21       
      id_EoL = '344332';

    case 'Haliporoides_sibogae'
      id_CoL = '9a6257efddb14f2617b7237d54e5eba0';
      id_WoRMS = '220285';
      id_Taxo = '222478'; % present at geneus level only 2018/12/28    
      id_EoL = '1040006';
      id_Wiki = 'Penaeoidea'; % only present at superfamily level at 2018/12/19  

    case 'Chorismus_antarcticus'
      id_CoL = '55a06e6ea2678476bb19440fe7007ace';
      id_WoRMS = '369214';
      id_Taxo = '33859'; % only present at family level at 2018/07/22       
      id_EoL = '330267';
      id_Wiki = 'Hippolytidae'; % only present at family level at 2018/07/22  

    case 'Pandalus_borealis'
      id_CoL = 'c5bbc49e17aa816caab84f54cfc001bc';
      id_WoRMS = '158370';
      id_Taxo = '33850';        
      id_EoL = '318602';
       
    case 'Dichelopandalus_bonnieri'
      id_CoL = '7befad821c474e8935f3f3f71bc4a865';
      id_WoRMS = '107643';
      id_Taxo = ''; % not present at 2017/09/01        
      id_EoL = '342557';
      id_Wiki = 'Pandalidae';
       
    case 'Heterocarpus_reedi'
      id_CoL = 'a652722cd68079afb453f3f7ae5d7854';
      id_WoRMS = '241283';
      id_Taxo = '222216'; % present at genus level only 2017/09/19        
      id_EoL = '46516047';
       
    case 'Palaemonetes_pugio'
      id_CoL = '56cf1eeaf3d2f8441b8c41906c4c1ab1';
      id_WoRMS = '158370';
      id_Taxo = '125153';
      id_EoL = '343938';
       
    case 'Palaemonetes_varians'
      id_CoL = 'a45817ffd94cf8158afac51a11b0b84e';
      id_WoRMS = '587704';
      id_Taxo = '33867'; % present only at genus level 2017/08/25
      id_EoL = '344117';
       
    case 'Palaemon_elegans'
      id_CoL = 'a86a4f3617fc9fe9b73cc7bde3f3df6a';
      id_WoRMS = '107614';
      id_Taxo = '33864';
      id_EoL = '1021076';
      id_ADW = ''; % not present at 2017/08/25
       
    case 'Macrobrachium_vollenhoveni'
      id_CoL = '91198384937e708f4cc1dbb08a6efd20'; % present as Macrobrachium vollenhovenii 20190208
      id_WoRMS = '240834';
      id_Taxo = '33830'; % present at genus level only 2019/02/08
      id_EoL = '46515424';
      id_ADW = ''; % not present at 2019/02/08
       
    case 'Crangon_crangon'
      id_CoL = '58d00d89008c1ec63431fabcc112c6bb';
      id_WoRMS = '107552';
      id_Taxo = '33878';        
      id_EoL = '1039673';
      id_ADW = 'Crangon'; % present as genus 2017/08/09
      
    case 'Astacus_astacus'
      id_CoL = '526387756aa5574c4879c6cc114248fd';
      id_WoRMS = ''; % not present at 2017/08/27
      id_Taxo = '33912';        
      id_EoL = '1021866';
      id_ADW = ''; % not present at 2017/08/27

    case 'Pacifastacus_leniusculus'
      id_CoL = '0246f355d08dd93b520e831bea02b11c';
      id_WoRMS = ''; % not present at 2017/08/27
      id_Taxo = '33799';        
      id_EoL = '1021882';

    case 'Homarus_gammarus'
      id_CoL = '53b26b75de1c86582f4b62a79890101b';
      id_WoRMS = '107253';
      id_Taxo = '33906';        
      id_EoL = '1039672';
      id_ADW = ''; % present as genus 2017/08/25

    case 'Homarus_americanus'
      id_CoL = '76584b6df172a0732db03a1a48747248';
      id_WoRMS = '156134';
      id_Taxo = '33905';
      id_EoL = '318853';

    case 'Panulirus_versicolor'
      id_CoL = '7da46e363e4260dc412e62e38c935747';
      id_WoRMS = '127061';
      id_Taxo = '507331';      
      id_EoL = '46516747';

    case 'Jasus_lalandii'
      id_CoL = '072be6fcdf8bd143c80925e0d0bef638';
      id_WoRMS = '246322';
      id_Taxo = '427795';      
      id_EoL = '46516788';

    case 'Pleuroncodes_monodon'
      id_CoL = '3c06e91277c704e367dfca04b98b860c'; % present at genus level only 2019/01/19
      id_WoRMS = '127061';
      id_Taxo = '33945';  % present at genus level only 2019/01/19    
      id_EoL = '46503748';
      id_ADW = 'Pleuroncodes';

    case 'Cervimunida_johni'
      id_CoL = '6241cdc386e0a836bb3ef9d179cdbeb0'; % present at genus level only 2019/01/19
      id_WoRMS = '392199';
      id_Taxo = '1165187';  % present at genus level only 2019/01/19    
      id_EoL = '46503677';
      id_ADW = ''; % not present at 2019/01/19 

    case 'Paralithodes_camtschaticus'
      id_CoL = '4fe446d0accc8a50d042976741fae83e';
      id_WoRMS = '233889';
      id_Taxo = '33964';      
      id_EoL = '342038';

    case 'Pagurus_bernhardus'
      id_CoL = 'd502331f00b985acb856267f87a56af0';
      id_WoRMS = '107232';
      id_Taxo = '33949'; % unaccepted, to Eupagurus bernhardus       
      id_EoL = '1040177';

    case 'Birgus_latro'
      id_CoL = 'd773311cc66949c0a4c2afbcdc728d4c';
      id_WoRMS = '208668';
      id_Taxo = '33958';
      id_EoL = '2982586';

    case 'Cancer_pagurus'
      id_CoL = 'f3183ce46e4cc2b2d00c3b4c026b9481';
      id_WoRMS = '107276';
      id_Taxo = '34019';        
      id_EoL = '1022230';

    case 'Macrocheira_kaempferi'
      id_CoL = '4d138f5a5efbda0727be8e513e08d460';
      id_WoRMS = '346131';
      id_Taxo = '34004'; 
      id_EoL = '2924326';
       
    case 'Hyas_coarctatus'
      id_CoL = 'a24ed7fc517569923cb827f0d60a01c5';
      id_WoRMS = '107323';
      id_Taxo = '34000';  % present only at genus level
      id_EoL = '981592';

    case 'Chionoecetes_opilio'
      id_CoL = 'e3de78753186013ed59ab3ac697413ea';
      id_WoRMS = '107315';
      id_Taxo = '75839'; % present only at genus level
      id_EoL = '1025204';

    case 'Carcinus_maenas'
      id_CoL = '182ab1e14f8181b51f406b97feedd219';
      id_WoRMS = '107381';
      id_Taxo = '34023';        
      id_EoL = '128502';
       
    case 'Charybdis_bimaculata'
      id_CoL = '6c1210383c25336b3951f1dec88beeb5';
      id_WoRMS = '442874';
      id_Taxo = '125153';
      id_Wiki = 'Charybdis_(genus)';
      id_EoL = '4267035';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Eriphia_verrucosa'
      id_CoL = '528fd84a4773fb98b14863274a229cd7';
      id_WoRMS = '107409';
      id_Taxo = '228769'; % present as genus only 2017/07/18      
      id_EoL = '344746';
       
    case 'Dissodactylus_primitivus'
      id_CoL = 'c65c93082d671b96cf11dc1f4313c98c';
      id_WoRMS = '422153';
      id_Taxo = ''; % not present at 2017/08/23      
      id_EoL = '342578';
      id_Wiki = 'Dissodactylus';
      
    case 'Neohelice_granulata'
      id_CoL = 'a6546d01482b97934ac06e477936fa80';
      id_WoRMS = '444742';
      id_Taxo = ''; % not present at 2019/05/08      
      id_EoL = '46511701';
      id_ADW = '';  % not present at 2019/05/08   
      
    case 'Triops_longicaudatus'
      id_CoL = 'cd00dfd705355d80c95c024877f73428';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '33078';  % present at genus level
      id_EoL = '338945';
       
    case 'Diaphanosoma_brachyurum'
      id_CoL = 'dd213856b4a492a6f01afd65e70991d4';
      id_WoRMS = '234063';
      id_Taxo = '33086';        
      id_Wiki = 'Cladocera';
      id_EoL = '338857';
       
    case 'Bosmina_longirostris'
      id_CoL = '869bccad902dfe087fefb3d7f87982d8';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '33116';    
      id_EoL = '340964';
       
    case 'Eubosmina_coregoni'
      id_CoL = 'dfa6a62de551465c295c3a3279b152b6'; % present as Bosmina_coregoni
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '33115'; % present as Bosmina_coregoni       
      id_Wiki = 'Bosmina';
      id_EoL = '1020250';
       
    case 'Chydorus_sphaericus'
      id_CoL = 'bf9a53b5d704a17c593c845f6e8d08cb';
      id_WoRMS = '148406';
      id_Taxo = '33122'; 
      id_Wiki = 'Cladocera';
      id_EoL = '1020238';
       
    case 'Pleuroxus_aduncus'
      id_CoL = '4ab9e9fd2808c0e605b8e794b9199627';
      id_WoRMS = '148397';
      id_Taxo = '156250';        
      id_Wiki = 'Cladocera';
      id_EoL = '338841';
       
    case 'Pleuroxus_striatus'
      id_CoL = '871ff4ce4fa9b1d8376330527902db45'; % present as Pleuroxus_striatoides, but the same?
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15
      id_Wiki = 'Cladocera';
      id_EoL = '1041337'; % unaccepted, to Picripleuroxus striatus
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Ceriodaphnia_pulchella'
      id_CoL = '8c950c5099d7368e2c5d026dc079a5e9';
      id_WoRMS = '148395';
      id_Taxo = '156175';        
      id_Wiki = 'Cladocera';
      id_EoL = '338938';
       
    case 'Ceriodaphnia_dubia'
      id_CoL = 'b7129a03be4a413d639f0bf4ade8d684';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '156172';        
      id_EoL = '338927';
       
    case 'Daphnia_cucullata'
      id_CoL = '3eb62cdbb1d096da9cfcabc1b19e18aa';
      id_WoRMS = '148371';
      id_Taxo = '33101';        
      id_Wiki = 'Daphnia_(subgenus)';
      id_EoL = '1020230'; 
       
    case 'Daphnia_longispina'
      id_CoL = '44a6d655825ccabe0b380c15cc884bc4';
      id_WoRMS = '148373';
      id_Taxo = '33104';        
      id_Wiki = 'Daphnia_(subgenus)';
      id_EoL = '338543'; 
      id_ADW = ''; % not present at 2017/08/23

    case 'Daphnia_hyalina'
      id_CoL = '29d9d22b0b26cf7307af8c0faaa8cf06';
      id_WoRMS = '148374';
      id_Taxo = '33101';        
      id_Wiki = 'Daphnia_(subgenus)';
      id_EoL = '1039288';
       
    case 'Daphnia_magna'
      id_CoL = 'e44e0a35c2cdb085859074a9fe73abdf';
      id_WoRMS = '148372';
      id_Taxo = '33105';        
      id_EoL = '1020231';
       
    case 'Daphnia_pulex'
      id_CoL = '1274b0b445ebb1c66cc1c92f024359f4';
      id_WoRMS = '148375';
      id_Taxo = '33106';        
      id_EoL = '338871';
       
    case 'Scapholeberis_mucronata'
      id_CoL = '986bcd982c77ba4c25548ad2906f3f49';
      id_WoRMS = '148398';
      id_Taxo = '33110';        
      id_Wiki = 'Daphniidae';
      id_EoL = '128488';
       
    case 'Simocephalus_serrulatus'
      id_CoL = 'c80b9c7571c8f66720bdd1978b6df130';
      id_WoRMS = '412852';
      id_Taxo = '156184';        
      id_Wiki = 'Daphniidae';
      id_EoL = '327098';
       
    case 'Moina_macrocopa'
      id_CoL = '64f7d7cf39f36560a5224e6faa2ecca8'; % present as Leptodora_kindti
      id_WoRMS = ''; % not present at 2017/09/18
      id_Taxo = '156186';        
      id_EoL = '1020228';
      id_Wiki = 'Moina';
       
    case 'Leptodora_kindtii'
      id_CoL = 'd8f23f51d85cb363bede2f3632517e87'; % present as Leptodora_kindti
      id_WoRMS = '247980';
      id_Taxo = '33097';        
      id_EoL = '327210';
      id_Wiki = 'Leptodora';
       
    case 'Isotoma_viridis'
      id_CoL = 'b8137b5e5d97114a5a4b331b9142f963';
      id_WoRMS = ''; % not present 2017/08/29
      id_Taxo = '17266';
      id_EoL = '203778';
      id_ADW = ''; % not present 2017/08/29
      id_Wiki = 'Isotoma_(springtail)';
       
    case 'Folsomia_candida'
      id_CoL = 'bec653e78eb0e5dd43f92cc01e7cbd73';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '1045058';
      id_EoL = '1025638';
       
    case 'Tomocerus_minor'
      id_CoL = 'dd9372bc363da71422ce5d9e7c1f793b';
      id_WoRMS = ''; % not present 2017/08/29
      id_Taxo = '102816';
      id_EoL = '1175608';
       
    case 'Entomobrya_nivalis'
      id_CoL = 'b1175f7c7a603611eac3c00d9cc7ec9a';
      id_WoRMS = ''; % not present 2017/08/29
      id_Taxo = '17270';
      id_EoL = '1022843';
      id_Wiki = 'Entomobryidae';
       
    case 'Orchesella_cincta'
      id_CoL = '4442b746517ac6f609b10c50dc13708a';
      id_WoRMS = ''; % not present 2017/08/29
      id_Taxo = '17272';
      id_EoL = '346716';
       
    case 'Lepidocyrtus_cyaneus'
      id_CoL = 'f386759431721ac00fb630b5b2d5dfdf';
      id_WoRMS = ''; % not present 2017/08/29
      id_Taxo = '102688';
      id_EoL = '346861';
       
    case 'Lepisma_saccharina'
      id_CoL = 'a5b311bccb146809dd1359c610f67f41';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '17302';   
      id_EoL = '1022755';
       
    case 'Ecdyonurus_dispar'
      id_CoL = 'fd78ae082fb4e998ad66790ed51fc2b2';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '17355'; 
      id_Wiki = 'Heptageniidae';
      id_EoL = '3684138';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Rhithrogena_semicolorata'
      id_CoL = '64430dafc52e724cf544be3fdd703f5a';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '17355';        
      id_Wiki = 'Heptageniidae';
      id_EoL = '3684255';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Epeorus_assimilis'
      id_CoL = '43e4d8fe5d2f20a2aed705d41889c1e4';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = ''; % not present 2017/09/02      
      id_Wiki = 'Heptageniidae';
      id_EoL = '3684227';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Oligoneuriella_rhenana'
      id_CoL = '98265cc9272cbad448432d8f8db5f757';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '17334';        
      id_Wiki = 'Ephemeroptera';
      id_EoL = '3684447';
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Baetis_rhodani'
      id_CoL = '27a250f72d86b0edd3d3ea324a9130f4';
      id_WoRMS = ''; % not present 2017/07/20
      id_Taxo = '17370';   
      id_EoL = '3683090';
      id_Wiki = 'Baetis';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Cloeon_dipterum'
      id_CoL = 'cb3fd2c1a361461205d2d68285a00177';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '17374';   
      id_EoL = '2762484';
       
    case 'Habrophlebia_lauta'
      id_CoL = 'f2103bd7655a5018b3e09c7a4e5197fa';
      id_WoRMS = ''; % not present 2017/08/03
      id_Taxo = '17377';  % only at genus level
      id_EoL = '3683937';
      id_Wiki = 'Habrophlebia';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Locusta_migratoria'
      id_CoL = '9e147038cfb1f0aa33bcd94248a2d984';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '18150';
      id_EoL = '494417';
       
    case 'Chortoicetes_terminifera'
      id_CoL = '20dafda7cdde3b842a35f7e700c1ec94';
      id_WoRMS = ''; % not present 2019/07/01
      id_Taxo = '769000';
      id_EoL = '494057';
       
    case 'Extatosoma_tiaratum'
      id_CoL = '65ef43e152fec002f9559d6f7074c43f';
      id_WoRMS = ''; % not present 2019/04/17
      id_Taxo = '18284';
      id_EoL = '1078018';
       
    case 'Acyrthosiphon_pisum'
      id_CoL = '56d87c2d5ce3acb4f039fbc181b69355';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '19482';   
      id_EoL = '588004';
       
    case 'Notonecta_maculata'
      id_CoL = 'bb4bd9d149acf9689ea1e0d64622d566';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '18437'; 
      id_EoL = '612774';
       
    case 'Aedes_aegypti'
      id_CoL = '659d82334ce06794ac14a699fe41bb4d';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '28492'; 
      id_EoL = '41592971';
       
    case 'Chironomus_riparius'
      id_CoL = '714831352ad94741e4321eccdeb29f58';
      id_WoRMS = ''; % not present 2017/09/27
      id_Taxo = '28529';  % only present at genus level 2017/09/27
      id_EoL = '44498235';
       
    case 'Chaoborus_americanus'
      id_CoL = '5dbeb214237206446fda16aaf06120cb';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '';  % not present 2017/06/15
      id_Wiki = 'Chaoborus';
      id_EoL = '741193';
       
    case 'Chaoborus_crystallinus'
      id_CoL = 'a8f2630a5f47ba1deca45e8d986dbcf7';
      id_WoRMS = ''; % not present 2017/07/11
      id_Taxo = '28524';
      id_Wiki = 'Chaoborus';
      id_EoL = '746432';
       
    case 'Sericostoma_personatum'
      id_CoL = 'ab91d88ffd9c3e76ed3fb8c63f61fe74';
      id_WoRMS = ''; % not present 2018/10/20
      id_Taxo = '29326';
      id_EoL = '593127';
       
    case 'Plodia_interpunctella'
      id_CoL = '6b0d3d4ddb2f7b52424f8da510c91e10';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '29835';
      id_EoL = '952934';
       
    case 'Bombyx_mori'
      id_CoL = '672e63f0b0571acb1c4299a65a1d256a';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '30426'; 
      id_EoL = '391618';
       
    case 'Manduca_sexta'
      id_CoL = 'ed22ff1ba0332e482333ac955e210c42';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '114444';
      id_EoL = '506145';
       
    case 'Heteronympha_merope'
      id_CoL = '4fe3275b4d430f4ff9424e4b72845ff2';
      id_WoRMS = ''; % not present 2019/07/01
      id_Taxo = '1109256'; % present at genus level only 2019/07/01
      id_EoL = '138167';
       
    case 'Venturia_canescens'
      id_CoL = '25a05f2c5c8f5146d4b515c36d06e089';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '27808';
      id_Wiki = 'Ichneumonoidea';
      id_EoL = '3780488';
       
    case 'Onthophagus_taurus'
      id_CoL = 'a315e9096c5de1872377824cee709d24';
      id_WoRMS = ''; % not present 2017/06/21
      id_Taxo = '26390';
      id_EoL = '46325834';
       
    case 'Onthophagus_binodis'
      id_CoL = 'c62b93112a8af8559efafa56a33cd008';
      id_WoRMS = ''; % not present 2019/04/18
      id_Taxo = '495382';
      id_EoL = '142738';
       
    case 'Ophiura_ophiura'
      id_CoL = '51533cab6a045e41ca2485a45486d0f5';
      id_WoRMS = '124929';
      id_Taxo = '41021'; % present as Ophiura texturata 2017/09/23    
      id_EoL = '585896';
       
    case 'Ophiura_albida'
      id_CoL = 'eb0018e354a88294d9dc6f516edd801e';
      id_WoRMS = '124913';
      id_Taxo = '41020';        
      id_EoL = '24082075';
       
    case 'Amphiura_filiformis'
      id_CoL = '03fbc60f382ddfd275761a2c906123c5';
      id_WoRMS = '125080';
      id_Taxo = '40989';        
      id_EoL = '607601';
       
    case 'Asterias_rubens'
      id_CoL = '6d91fa5c1a435bc2c9e5394e5b2478e1';
      id_WoRMS = '123776';
      id_Taxo = '40936'; 
      id_EoL = '598481';
       
    case 'Pisaster_ochraceus'
      id_CoL = '55af8fcb16861cd1292551807b9040ed';
      id_WoRMS = '123867';
      id_Taxo = '40954';        
      id_EoL = '598626';
       
    case 'Astropecten_aranciacus'
      id_CoL = '';
      id_WoRMS = '123856';
      id_Taxo = '40828';        
      id_EoL = '45327530';
      id_ADW = ''; % not present at 2017/09/29
 
    case 'Astropecten_irregularis'
      id_CoL = 'f71b9bd4f4e08ea1d32dcdc33f66a9fa';
      id_WoRMS = '240755';
      id_Taxo = '40829';        
      id_EoL = '598469';
      id_ADW = ''; % not present at 2017/09/25

    case 'Luidia_sarsii'
      id_CoL = 'f49bc17a4e12e74c3dc1095d8fff0654';
      id_WoRMS = '123922';
      id_Taxo = '40808';   % present as Luidia_sarsi       
      id_EoL = '46326605'; % present as Luidia_sarsi
      id_ADW = 'Luidia';   % only present at genus level 2018/05/05

    case 'Archaster_typicus'
      id_CoL = '144f27a0c1868bfa17681085c7e30b41';
      id_WoRMS = '213119';
      id_Taxo = '40840'; 
      id_EoL = '4704992';
      id_ADW = ''; % not present at 2017/10/02
       
    case 'Acanthaster_planci'
      id_CoL = '050716176957e3e3fbdd5a572cf33d1c';
      id_WoRMS = '213289';
      id_Taxo = '40898'; 
      id_EoL = '598484';
       
    case 'Protoreaster_nodosus'
      id_CoL = 'd2d4152c326c838986333c282bfc8473';
      id_WoRMS = '213285';
      id_Taxo = '40858'; % only present at genus level 2017/10/01      
      id_EoL = '4704956';
      id_ADW = ''; % not present at 2017/10/01
       
    case 'Crossaster_papposus'
      id_CoL = '0f28438ad5d2a06cbe0482880c08c2b0';
      id_WoRMS = '124154';
      id_Taxo = '40903';        
      id_EoL = '598562';
       
    case 'Asterina_gibbosa'
      id_CoL = '9bb47cd93065ef4d4f6c5761a3577c47';
      id_WoRMS = '123987';
      id_Taxo = '40883';        
      id_EoL = '45328038';
       
    case 'Odontaster_validus'
      id_CoL = '9da6a4806559abb475558069f7086367';
      id_WoRMS = '172775';
      id_Taxo = '40845';        
      id_EoL = '4704670';
       
    case 'Echinus_esculentus'
      id_CoL = '76f5c7502b7d2106b49714daa8bcb73d'; 
      id_WoRMS = '124287'; 
      id_Taxo = '41134'; 
      id_EoL = '599659';
      id_ADW = ''; % not present at 2017/09/04
       
    case 'Gracilechinus_affinis'
      id_CoL = 'e7cf9012297aa33bdaa907a4e2545d53'; 
      id_WoRMS = '124279'; 
      id_Taxo = ''; % not present at 2017/09/02
      id_Wiki = 'Gracilechinus';
      id_EoL = '599662';
       
    case 'Sterechinus_neumayeri'
      id_CoL = 'd8fb71b73e11d1cdecfac8419e98fb50';
      id_WoRMS = '160831';
      id_Taxo = ''; % not present 2017/06/15       
      id_EoL = '3039430';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Mesocentrotus_franciscanus'
      id_CoL = '9b52c4f8f7d683de6fed25c64eaf63d2';
      id_WoRMS = '591102';
      id_Taxo = ''; % not present 2017/06/15       
      id_EoL = '40044955';
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Strongylocentrotus_purpuratus'
      id_CoL = '7b9f3ba064ef59fc81e6703ba245ce4a'; 
      id_WoRMS = '240747'; 
      id_Taxo = '41153'; 
      id_EoL = '598175';

    case 'Strongylocentrotus_droebachiensis'
      id_CoL = 'f994b037baacad64fd548bfb571f8eb2'; 
      id_WoRMS = '124321'; 
      id_Taxo = '41150'; % present at genus-level only
      id_EoL = '599668';

    case 'Lytechinus_variegatus'
      id_CoL = '59c591cbbdfa738cfe05d045af7cef14'; 
      id_WoRMS = '367850'; 
      id_Taxo = '41124'; 
      id_EoL = '599644';
      id_ADW = ''; % not present at 2017/09/03

    case 'Paracentrotus_lividus'
      id_CoL = 'd258688755c65d9fc78cb8b568dac26a';
      id_WoRMS = '124316';
      id_Taxo = '41136';        
      id_EoL = '599658';
       
    case 'Psammechinus_miliaris'
      id_CoL = '51494e9d786ca1490738fe95476f0561';
      id_WoRMS = '124319';
      id_Taxo = '41139';        
      id_EoL = '599663';
       
    case 'Loxechinus_albus'
      id_CoL = '4a68f09affd45ceac1fab1516c12a35a';
      id_WoRMS = '160809';
      id_Taxo = '152649';        
      id_EoL = '3039402';
      id_ADW = ''; % not present 2019/01/22
       
    case 'Echinocardium_cordatum'
      id_CoL = 'cb42794c2d338d39d5715697f05cbc87'; 
      id_WoRMS = '124392'; 
      id_Taxo = '41169'; 
      id_EoL = '598133';

    case 'Abatus_cordatus'
      id_CoL = '7c234e01691af18d542f0da28618f533'; 
      id_WoRMS = '160763'; 
      id_Taxo = '152711'; % present at genus level only 2019/01/19
      id_EoL = '3039339';
      id_ADW = ''; % not present at 2019/01/19

    case 'Clypeaster_subdepressus'
      id_CoL = 'a5e5fc38367a1168a3e799e37dd3de23'; 
      id_WoRMS = '422499'; 
      id_Taxo = '41172'; % only present at genus level 2017/09/03
      id_EoL = '598170';
      id_Wiki = 'Clypeaster';

    case 'Holothuria_scabra'
      id_CoL = '814d1ea7cec08f5897ebe68e024442f4';
      id_WoRMS = '210813';
      id_Taxo = '41305'; % only present at genus level       
      id_EoL = '587665';
       
    case 'Stichopus_vastus'
      id_CoL = '64d59d7a644c49463a5770c937728801';
      id_WoRMS = '242062';
      id_Taxo = '41313'; % only present at genus level       
      id_EoL = '3067730';
      id_ADW = ''; % not present at 2017/09/21
      id_Wiki = 'Stichopus'; % only present at genus level 2018/05/05 
      
    case 'Aspostichopus_japonicus'
      id_CoL = 'f0b36c16aa005e3018d4b53b4854f4e5';
      id_WoRMS = '241776';
      id_Taxo = ''; % not present 2018/12/07    
      id_EoL = '3067730';
      
    case 'Branchiostoma_floridae'
      id_CoL = '56b084fe5a8af1fb6b065bd2b921487b';
      id_WoRMS = '266208';
      id_Taxo = '114894';        
      id_EoL = '515519';
       
    case 'Oikopleura_dioica'
      id_CoL = 'a0baaf22d884c493e15b87b9e7df0393';
      id_WoRMS = '103407';
      id_Taxo = '114881';        
      id_EoL = '512477';
       
    case 'Oikopleura_longicauda'
      id_CoL = '96345fc075fb3f226692bc86808fced3';
      id_WoRMS = '103414';
      id_Taxo = ''; % not present 2017/06/15 
      id_Wiki = 'Oikopleura';
      id_EoL = '512485';
       
    case 'Thalia_democratica'
      id_CoL = 'f4ca44e873a0b0c5881b0a1645582cda';
      id_WoRMS = '137279';
      id_Taxo = '959814';   
      id_Wiki = 'Salpidae';
      id_EoL = '510612';
       
    case 'Ciona_intestinalis'
      id_CoL = 'eca285a07d80dda8bda2c2e91aa687f8';
      id_WoRMS = '103732';
      id_Taxo = '41508';        
      id_EoL = '46326967';
       
    case 'Polyclinum_aurantium'
      id_CoL = '8fe91bfedc177b77262c4107b3aaa394';
      id_WoRMS = '103674';
      id_Taxo = '223734'; % present at genus level only 2018/11/03       
      id_EoL = '513767';
       
    case 'Myxine_glutinosa'
      id_CoL = '69d2953e9389f6ea17228c0d1331173d';
      id_WoRMS = '101170';
      id_Taxo = '41664';     
      id_EoL = '207930';
      id_fishbase = taxon_fish;
       
    case 'Eptatretus_stoutii'
      id_CoL = '8c8fa2e6d0664f3f877f783a64beb1c6';
      id_WoRMS = '279298';
      id_Taxo = '174002';        
      id_EoL = '994791';
      id_fishbase = taxon_fish;
       
    case 'Lampetra_planeri'
      id_CoL = '7849536da20a2a4d44365ac33b8c8b98';
      id_WoRMS = ''; % not present 2017/06/15
      id_Taxo = '41687';      
      id_EoL = '206412';
      id_fishbase = taxon_fish;
       
    case 'Petromyzon_marinus'
      id_CoL = 'c5009c72fe95cd52a5a18ad82d67bf22';
      id_WoRMS = '101174';
      id_Taxo = '41690';      
      id_EoL = '31414595';
      id_fishbase = taxon_fish;
       
    case 'Callorhinchus_capensis'
      id_CoL = '2b8e437a12e0cc1b19683fd7de7c7206';
      id_WoRMS = '221460';
      id_Taxo = '42191';        
      id_EoL = '225608';
      id_fishbase = taxon_fish;
       
    case 'Raja_brachyura'
      id_CoL = 'f1f36da016e9d4c15ed5f68aa88216ff';
      id_WoRMS = '367297';
      id_Taxo = '108278'; 
      id_Wiki = 'Raja_(genus)';
      id_EoL = '218668';
      id_fishbase = taxon_fish;
       
    case 'Raja_clavata'
      id_CoL = '8b941a6455f0abdb69f393eb6621a74d';
      id_WoRMS = '105883';
      id_Taxo = '108279';        
      id_EoL = '209174';
      id_fishbase = taxon_fish;
       
    case 'Raja_montagui'
      id_CoL = '0090fc80b381e800d07f72514dad1e22';
      id_WoRMS = '105887';
      id_Taxo = '108283';
      id_EoL = '211505';
      id_fishbase = taxon_fish;
      id_AnAge = 'taxon';
       
    case 'Raja_rhina'
      id_CoL = 'faa318af8e345d99ea7b6018126a2d6f';
      id_WoRMS = '271581';
      id_Taxo = '185729';
      id_EoL = '215132';
      id_fishbase = taxon_fish;
      id_AnAge = 'taxon';
      id_Wiki = 'Beringraja_rhina';
       
   case 'Beringraja_binoculata'
      id_CoL = 'acdb21137c63073015d27adcf86953db';
      id_WoRMS = '1021330';
      id_Taxo = '1802408';       
      id_EoL = '46410079';
      id_fishbase = taxon_fish;
      id_AnAge = 'taxon';
      id_ADW = 'Raja_binoculata';
      
    case 'Leucoraja_erinacea'
      id_CoL = '2b6c3cc7234a53cc6229a9883c9075af';
      id_WoRMS = '158551';
      id_Taxo = '178802';        
      id_EoL = '217228';
      id_fishbase = taxon_fish;
       
    case 'Leucoraja_naevus'
      id_CoL = 'a21b9ab9f84a192de65800fdc5964dac';
      id_WoRMS = '105876';
      id_Taxo = '108270';        
      id_EoL = '345058';
      id_fishbase = taxon_fish;
       
    case 'Okamejei_acutispina'
      id_CoL = 'f89e52703c8b764cff73e3d8655c9336';
      id_WoRMS = '279178';
      id_Taxo = '181706';        
      id_EoL = '46560613';
      id_fishbase = taxon_fish;
      id_Wiki = 'Okamejei';
       
    case 'Zearaja_chilensis'
      id_CoL = 'e9289a81b2994b9bb8494b38096fac16';
      id_WoRMS = '315953';
      id_Taxo = '1684069';        
      id_EoL = '46560637';
      id_fishbase = taxon_fish;
      id_Wiki = 'Zearaja';
       
    case 'Bathyraja_interrupta'
      id_CoL = '05d11296b0660c39acaf019a2c718459';
      id_WoRMS = '271515';
      id_Taxo = '163712';        
      id_EoL = '213240';
      id_fishbase = taxon_fish;
      id_Wiki = 'Bathyraja';
      
    case 'Glaucostegus_typus'
      id_CoL = 'c6872529b8670bf23a04117af86c40a5';
      id_WoRMS = '280875';
      id_Taxo = '1684076';        
      id_EoL = '46560704';
      id_fishbase = taxon_fish;
       
    case 'Pristis_pectinata'
      id_CoL = '25c479c1cdb81333995c06b8fdc78d6d';
      id_WoRMS = '105848';
      id_Taxo = '42016';        
      id_EoL = '223612';
      id_fishbase = taxon_fish;
       
    case 'Rhynchobatus_laevis'
      id_CoL = 'af66aec4fb8bcb34fe7ab42c9d8b747e';
      id_WoRMS = '278218';
      id_Taxo = '186095';        
      id_EoL = '46560718';
      id_fishbase = taxon_fish;
       
    case 'Rhinobatos_productus'
      id_CoL = '8691a825ec34f8adcda1539f3d0babc0';
      id_WoRMS = '271608';
      id_Taxo = '42033';        
      id_EoL = '216469';
      id_fishbase = taxon_fish;
       
    case 'Rhinobatos_rhinobatos'
      id_CoL = '8a0bf369e30780f40e5f490c711b20dd';
      id_WoRMS = '105898';
      id_Taxo = '42034';        
      id_EoL = '46560660';
      id_fishbase = taxon_fish;
       
    case 'Trygonoptera_personata'
      id_CoL = '739fdc4060e8c6a65d8025878bac5d8b';
      id_WoRMS = '283062';
      id_Taxo = '189636';        
      id_EoL = '582429';
      id_fishbase = taxon_fish;
       
    case 'Urolophus_halleri'
      id_CoL = '278a6ef0aae88fab7425bba9724bd921';
      id_WoRMS = '315896';
      id_Taxo = '189775';        
      id_EoL = '47364941';
      id_fishbase = taxon_fish;
       
    case 'Manta_birostris'
      id_CoL = 'a8df6db60161ecbce7691570e5ce3b33';
      id_WoRMS = '105857';
      id_Taxo = '42170';        
      id_EoL = '206970';
      id_fishbase = taxon_fish;
       
    case 'Dasyatis_pastinaca'
      id_CoL = 'f8123ec3960f62fa377c1cef36e6b8c9';
      id_WoRMS = '105851';
      id_Taxo = '42133';        
      id_EoL = '994772';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present at 2018/07/21
       
    case 'Torpedo_marmorata'
      id_CoL = '522a408cbb5e8f63207652bb703c9abb';
      id_WoRMS = '271684';
      id_Taxo = '42040';        
      id_EoL = '211731';
      id_fishbase = taxon_fish;
       
    case 'Tetronarce_californica'
      id_CoL = '5c2ebf8114e705ea76804cbe91788937';
      id_WoRMS = '845703';
      id_Taxo = '42038'; % present as Torpedo californica
      id_EoL = '46560374';
      id_fishbase = taxon_fish;
      id_ADW = 'Torpedo_californica';
       
    case 'Squatina_californica'
      id_CoL = '68e9753aed082e09ac4d4b4c348e920b';
      id_WoRMS = '271667';
      id_Taxo = '106304';        
      id_EoL = '206814';
      id_fishbase = taxon_fish;
       
    case 'Squatina_dumeril'
      id_CoL = '9eb8f7e8276d790a7350bdc4101f84f5';
      id_WoRMS = '158510';
      id_Taxo = '106305';        
      id_EoL = '46560324';
      id_fishbase = taxon_fish;
       
    case 'Pristiophorus_cirratus'
      id_CoL = '791c66b1d7d17796ec389eefcf0e7cdb';
      id_WoRMS = '282352';
      id_Taxo = '106297';        
      id_EoL = '204500';
      id_fishbase = taxon_fish;
       
    case 'Deania_calcea'
      id_CoL = '9ef858e0ac1c915964ed8ace94581c68';
      id_WoRMS = '105903';
      id_Taxo = '41817';        
      id_EoL = '46560171';
      id_fishbase = taxon_fish;
       
    case 'Squalus_acanthias'
      id_CoL = 'b141071e3edeab5432a46ce9d8dac40c';
      id_WoRMS = '105923';
      id_Taxo = '41840';        
      id_EoL = '206805';
      id_fishbase = taxon_fish;
       
    case 'Squalus_blainville'
      id_CoL = 'f0c6f96622c4d8d39a36dd0209c54cc6';
      id_WoRMS = '105924';
      id_Taxo = '188005';        
      id_EoL = '46560202';
      id_fishbase = taxon_fish;
       
    case 'Somniosus_microcephalus'
      id_CoL = '31935504b8da5b895f90bcf5c73f221c';
      id_WoRMS = '105919';
      id_Taxo = '41837';        
      id_EoL = '205932';
      id_fishbase = taxon_fish;
       
    case 'Etmopterus_perryi'
      id_CoL = '36a22def38a1931b3c9f9cb244396c01';
      id_WoRMS = '271637';
      id_Taxo = '106487';        
      id_EoL = '1157336';
      id_fishbase = taxon_fish;
       
    case 'Chlamydoselachus_anguineus'
      id_CoL = '3f01614da0c8edb62c6afbb190cfc9d7';
      id_WoRMS = '105831';
      id_Taxo = '106487';        
      id_EoL = '46325197';
      id_fishbase = taxon_fish;
       
    case 'Heptranchias_perlo'
      id_CoL = '5bbba314cd44233980889b7db2091025';
      id_WoRMS = '105832';
      id_Taxo = '41773';        
      id_EoL = '340134';
      id_fishbase = taxon_fish;
       
    case 'Heterodontus_portusjacksoni'
      id_CoL = 'ea78d30dbfede623a294ebd70f2efd83';
      id_WoRMS = '276699';
      id_Taxo = '106314';        
      id_EoL = '212023';
      id_fishbase = taxon_fish;
       
    case 'Hemiscyllium_ocellatum'
      id_CoL = 'ea474af232d5b00da7e03f51f1077519';
      id_WoRMS = '281037';
      id_Taxo = '94275';        
      id_EoL = '208201';
      id_fishbase = taxon_fish;
       
    case 'Chiloscyllium_plagiosum'
      id_CoL = '52239f24c95c370cbca53d5404f355a8';
      id_WoRMS = '277832';
      id_Taxo = '94273';        
      id_EoL = '212039';
      id_fishbase = taxon_fish;
       
    case 'Rhincodon_typus'
      id_CoL = 'b757ec97469df0ee764547b0911c66e6';
      id_WoRMS = '105847';
      id_Taxo = '41872';        
      id_EoL = '28519';
      id_fishbase = taxon_fish;
       
    case 'Orectolobus_ornatus'
      id_CoL = '093cef8ed981470b54bc2171ffcf41e0';
      id_WoRMS = '281932';
      id_Taxo = '94268';        
      id_EoL = '994853';
      id_fishbase = taxon_fish;
       
    case 'Orectolobus_halei'
      id_CoL = '48fce3a2fda71ecc7654a103e57b4944';
      id_WoRMS = '398229';
      id_Taxo = '1683996';        
      id_EoL = '4534269';
      id_fishbase = taxon_fish;
       
    case 'Orectolobus_maculatus'
      id_CoL = '8a233ea95dcfe3f7bb698a60a067f610';
      id_WoRMS = '281931';
      id_Taxo = '41875';        
      id_EoL = '994852';
      id_fishbase = taxon_fish;
       
    case 'Sphyrna_lewini'
      id_CoL = '350243ccc762d3c4ac03d1b35bd6ff9d';
      id_WoRMS = '105816';
      id_Taxo = '42008';        
      id_EoL = '994497';
      id_fishbase = taxon_fish;
       
    case 'Sphyrna_zygaena'
      id_CoL = '64f8277da58352bec7b757ee78d0b76a';
      id_WoRMS = '105819';
      id_Taxo = '42010';        
      id_EoL = '224170';
      id_fishbase = taxon_fish;
       
    case 'Scyliorhinus_canicula'
      id_CoL = '384ae8eb01a30b7118797dd65f7e4915';
      id_WoRMS = '105814';
      id_Taxo = '106399';        
      id_EoL = '994476';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_leucas'
      id_CoL = '08712ee451c6216fdc23bf2ed1b8eb24';
      id_WoRMS = '105792';
      id_Taxo = '41977';        
      id_EoL = '224769';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_plumbeus'
      id_CoL = 'c104e8012c5489acf8d94a5430d34752';
      id_WoRMS = '105797';
      id_Taxo = '41983';        
      id_EoL = '218733';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_falciformis'
      id_CoL = '22b28f018918aca530f5562a2845d321';
      id_WoRMS = '105789';
      id_Taxo = '41976';        
      id_EoL = '46559780';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_obscurus'
      id_CoL = 'ee1204ca613aabacb7a7f5d083afff7b';
      id_WoRMS = '218633';
      id_Taxo = '41982';        
      id_EoL = '46559787';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_acronotus'
      id_CoL = 'e4299ed9d802a3515b530e58cf9c164c';
      id_WoRMS = '158508';
      id_Taxo = '106442';        
      id_EoL = '46559790';
      id_fishbase = taxon_fish;
       
    case 'Carcharhinus_longimanus'
      id_CoL = '30fc3fc26a00209a37d86b22c16f3ad4';
      id_WoRMS = '105794';
      id_Taxo = '41979';        
      id_EoL = '46559785';
      id_fishbase = taxon_fish;
       
    case 'Galeocerdo_cuvier'
      id_CoL = 'a1d45c8bf2076f511f940b6317ddab6c';
      id_WoRMS = '105799';
      id_Taxo = '41989';        
      id_EoL = '206683';
      id_fishbase = taxon_fish;
      id_AnAge = taxon;
       
    case 'Rhizoprionodon_acutus'
      id_CoL = 'd7c076bc204bb11aa7e5d4e49ba7ffe9';
      id_WoRMS = '105802';
      id_Taxo = '41999';        
      id_EoL = '205713';
      id_fishbase = taxon_fish;
       
    case 'Rhizoprionodon_terraenovae'
      id_CoL = 'b1ef1838c1d95c2ff1ec315008742125';
      id_WoRMS = '158510';
      id_Taxo = '106463';        
      id_EoL = '46559819';
      id_fishbase = taxon_fish;
       
    case 'Prionace_glauca'
      id_CoL = '33d52a5325a633260d922de266c0ad0f';
      id_WoRMS = '105801';
      id_Taxo = '41997';        
      id_EoL = '206724';
      id_fishbase = taxon_fish;
       
    case 'Galeorhinus_galeus'
      id_CoL = '8c1dae5e27950351d18cfcea0c60c518';
      id_WoRMS = '105820';
      id_Taxo = '41946';        
      id_EoL = '46559964';
      id_fishbase = taxon_fish;
       
    case 'Carcharias_taurus'
      id_CoL = '2d7e5479972d3735b029784cf7b2347a';
      id_WoRMS = '105843';
      id_Taxo = '41881';    
      id_EoL = '206680';
      id_fishbase = taxon_fish;
      id_AnAge = taxon;
       
    case 'Lamna_nasus'
      id_CoL = '6fbcbefe8c9bc1221a9859c6a240ff9a';
      id_WoRMS = '105841';
      id_Taxo = '41910';
      id_EoL = '205461';
      id_fishbase = taxon_fish;
       
    case 'Isurus_oxyrinchus'
      id_CoL = 'c956e1fa5b7f322689f4ab1de39635f2';
      id_WoRMS = '105839';
      id_Taxo = '41907';        
      id_EoL = '46322648';
      id_fishbase = taxon_fish;
      id_AnAge = taxon;
       
    case 'Carcharodon_carcharias'
      id_CoL = 'c5465928ea46eb759bbbf4d623c56bad';
      id_WoRMS = '105838';
      id_Taxo = '41903';        
      id_EoL = '213726';
      id_fishbase = taxon_fish;
       
    case 'Pseudocarcharias_kamoharai'
      id_CoL = 'c92763d01702b1ace7a064fc55243324';
      id_WoRMS = '217632';
      id_Taxo = '41887';        
      id_EoL = '46559771';
      id_fishbase = taxon_fish;
       
    case 'Erpetoichthys_calabaricus'
      id_CoL = 'c89d648572722980801c621e154ae462';
      id_WoRMS = '280711';
      id_Taxo = '174040';        
      id_EoL = '211502';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_ruthenus'
      id_CoL = '0b96730a682802ff925457b4832bce69';
      id_WoRMS = '233941';
      id_Taxo = '42441';
      id_EoL = '211359';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_sturio'
      id_CoL = '91d2d822ff7160abb9b9e57817711028';
      id_WoRMS = '126279';
      id_Taxo = '42445';        
      id_EoL = '206890';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_gueldenstaedtii'
      id_CoL = 'c981d85630745cd067f75c46a48f89dd';
      id_WoRMS = '126275';
      id_Taxo = '107316';        
      id_EoL = '46561166';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_nudiventris'
      id_CoL = 'a75d8e1e4ebe7a9bcbd8e4b6d62da7ac';
      id_WoRMS = '126277';
      id_Taxo = '42438';        
      id_EoL = '46561168';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_persicus'
      id_CoL = '4c093bd7a7fdc72dae662afc8b55f103';
      id_WoRMS = '238344';
      id_Taxo = '107325';        
      id_EoL = '46561175';
      id_fishbase = taxon_fish;
       
    case 'Acipenser_stellatus'
      id_CoL = 'be02b051667cf7afe63a025d62b8d991';
      id_WoRMS = '126278';
      id_Taxo = '42444';        
      id_EoL = '46561169';
      id_fishbase = taxon_fish;
       
    case 'Huso_huso'
      id_CoL = 'c80d1d52b8ce33862eb3ccd2e8c1effd';
      id_WoRMS = '126280';
      id_Taxo = '42449';        
      id_EoL = '46561184';
      id_fishbase = taxon_fish;
       
    case 'Huso_dauricus'
      id_CoL = '41c05ffd974d32a09836860bea8bfbe5';
      id_WoRMS = '271700';
      id_Taxo = '42448';        
      id_EoL = '46561185';
      id_fishbase = taxon_fish;
       
    case 'Amia_calva'
      id_CoL = 'd526fe4bb2cd5cf0d8edcbee9b0a07c4';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '42482';   
      id_EoL = '223782';
      id_fishbase = taxon_fish;
       
    case 'Atractosteus_spatula'
      id_CoL = 'd3a4b7c1f41f1e5cc48d060d5ec1e28f';
      id_WoRMS = '279822';
      id_Taxo = '42476';        
      id_EoL = '584620';
      id_fishbase = taxon_fish;
       
    case 'Megalops_atlanticus'
      id_CoL = '17dc53c92491078c7b4c95be788a6908';
      id_WoRMS = '126430';
      id_Taxo = '92883';        
      id_EoL = '339927';
      id_fishbase = taxon_fish;
       
    case 'Albula_vulpes'
      id_CoL = '954d4564780d4574570377f3efae7a5f';
      id_WoRMS = '212256';
      id_Taxo = '42516';        
      id_EoL = '2776871';
      id_fishbase = taxon_fish;
       
    case 'Notacanthus_chemnitzii'
      id_CoL = '105a60ea1ee0ae9c444deb9ca6eb6ea6';
      id_WoRMS = '126643';
      id_Taxo = '181370';        
      id_EoL = '207980';
      id_fishbase = taxon_fish;
       
    case 'Anguilla_anguilla'
      id_CoL = 'b81dfd849eb83bca1705a2f0c0e671dd';
      id_WoRMS = '126281';
      id_Taxo = '42526';        
      id_EoL = '356349';
      id_fishbase = taxon_fish;
       
    case 'Anguilla_japonica'
      id_CoL = '82d254fc10ec94f0c028c5e57c433b28';
      id_WoRMS = '271705';
      id_Taxo = '42527';        
      id_EoL = '46561258';
      id_fishbase = taxon_fish;
       
    case 'Conger_conger'
      id_CoL = '2b75a24a28225141eb6db5b4dd2a5ee4';
      id_WoRMS = '126285';
      id_Taxo = '42568';        
      id_EoL = '46561395';
      id_fishbase = taxon_fish;
       
    case 'Hiodon_tergisus'
      id_CoL = '9847fa5ddb60890788abf8bc9ce686a5';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '42725'; 
      id_EoL = '207393';
      id_fishbase = taxon_fish;
       
    case 'Osteoglossum_bicirrhosum'
      id_CoL = '72895daedd532e7e22d3cefc27328304';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '42708';      
      id_EoL = '223395';
      id_fishbase = taxon_fish;
       
    case 'Notopterus_notopterus'
      id_CoL = '4fcb49f6bfd5870b3cfababf5e802016';
      id_WoRMS = '281795';
      id_Taxo = '42730';        
      id_EoL = '222969';
      id_fishbase = taxon_fish;
       
    case 'Chitala_chitala'
      id_CoL = '34a3d65c55f656cb69a4473cbd15d6a9';
      id_WoRMS = ''; % not present 2019/01/05
      id_Taxo = '170881';        
      id_EoL = '1004327';
      id_fishbase = taxon_fish;
       
    case 'Arapaima_gigas'
      id_CoL = 'a8f83fea3aa2f1d343cc2b193eacfdcc';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '42701'; 
      id_EoL = '204868';
      id_fishbase = taxon_fish;
       
    case 'Clupea_harengus'
      id_CoL = '7adc35bdac2019989efa025ca00ccd5c';
      id_WoRMS = '126417';
      id_Taxo = '42634';        
      id_EoL = '847095';
      id_fishbase = taxon_fish;
       
    case 'Clupea_bentincki'
      id_CoL = '845458ad1941d9566e40bcb0d86ada25'; % present as Strangomera bentincki  2019/01/08   
      id_WoRMS = '300368';    
      id_Taxo = '188341'; % present as Strangomera bentincki  2019/01/08      
      id_EoL = '46562391';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present at 2019/01/08
       
    case 'Clupea_pallasii'
      id_CoL = '08d04d87c6f0db50ea181c4bc645a47a'; 
      id_WoRMS = '293568';    
      id_Taxo = '42637'; 
      id_EoL = '1156440';
      id_fishbase = taxon_fish;
       
    case 'Sprattus_sprattus'
      id_CoL = '8b704c8dd27132590681045b7a305644';
      id_WoRMS = '126425';
      id_Taxo = '42676';        
      id_EoL = '607993';
      id_fishbase = taxon_fish;
       
    case 'Clupeonella_cultriventris'
      id_CoL = 'dd1bff1a7ab7aa90f5f5fe192637e018';
      id_WoRMS = '126418';
      id_Taxo = '171479';        
      id_EoL = '224305';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/03/26
       
    case 'Alosa_alosa'
      id_CoL = '85368f18336645854725c8f8210a151f';
      id_WoRMS = '126413';
      id_Taxo = '42627';        
      id_EoL = '225607';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/17
       
    case 'Alosa_sapidissima'
      id_CoL = '540d73069202e6462f72e6981a5d1e4c';
      id_WoRMS = '158670';
      id_Taxo = '42629';        
      id_EoL = '205467';
      id_fishbase = taxon_fish;

    case 'Alosa_saposchnikowii'
      id_CoL = 'a12508021ad2589fddd1a0204e975108';
      id_WoRMS = '272254';
      id_Taxo = '654692';        
      id_EoL = '46562381';
      id_fishbase = taxon_fish;

    case 'Sardina_pilchardus'
      id_CoL = 'Sardina_pilchardus';
      id_WoRMS = '126421';
      id_Taxo = '42663';        
      id_EoL = '213922';
      id_fishbase = taxon_fish;
       
    case 'Sardinops_sagax'
      id_CoL = '50999ef5259ef866261859afc093acbe';
      id_WoRMS = '217452';
      id_Taxo = '42672';        
      id_EoL = '46562463';
      id_fishbase = taxon_fish;
      
    case 'Limnothrissa_miodon'
      id_CoL = '1eb60cae8624307444d95b2f781562e0';
      id_WoRMS = ''; % not present 2019/03/06
      id_Taxo = '188874';        
      id_EoL = '46562485';
      id_fishbase = taxon_fish;

    case 'Stolothrissa_tanganicae'
      id_CoL = '6110311f4596635d7df4a387b5cb4de3';
      id_WoRMS = ''; % not present 2019/03/06
      id_Taxo = '188307';        
      id_EoL = '209699';
      id_fishbase = taxon_fish;

    case 'Tenualosa_ilisha'
      id_CoL = '1eb60cae8624307444d95b2f781562e0';
      id_WoRMS = '278568';
      id_Taxo = '188874';        
      id_EoL = '46562485';
      id_fishbase = taxon_fish;

    case 'Amblygaster_sirm'
      id_CoL = '6dcb657dbcc8a398fd7abb4d11c6ea8c';
      id_WoRMS = '217439';
      id_Taxo = '160578';        
      id_EoL = '46562494';
      id_fishbase = taxon_fish;
       
    case 'Ethmalosa_fimbriata'
      id_CoL = '077a1dad56e2468065240f193d34b596';
      id_WoRMS = '280725';
      id_Taxo = '174176';        
      id_EoL = '46562516';
      id_fishbase = taxon_fish;

    case 'Herklotsichthys_quadrimaculatus'
      id_CoL = 'c9cb38e7404a8d7adfcec3c29f2cc5fb';
      id_WoRMS = '212264';
      id_Taxo = '94362';        
      id_EoL = '46562399';
      id_fishbase = taxon_fish;

    case 'Sardinella_aurita'
      id_CoL = 'dbb523a3a5dd945fa9f9217e754a65db';
      id_WoRMS = '126422';
      id_Taxo = '42665';        
      id_EoL = '1000279';
      id_fishbase = taxon_fish;
       
    case 'Sardinella_albella'
      id_CoL = 'a85cf2e6aba7c9d5e1764d3722c86a28';
      id_WoRMS = '212268';
      id_Taxo = '186537';        
      id_EoL = '46562415';
      id_fishbase = taxon_fish;
       
    case 'Sardinella_gibbosa'
      id_CoL = '48f17fea5c4bac75b64c3f072d06d14c';
      id_WoRMS = '212277';
      id_Taxo = '186543';        
      id_EoL = '46562421';
      id_fishbase = taxon_fish;
       
    case 'Sardinella_longiceps'
      id_CoL = '1adda82292d0cd950fda60c824ec3ab7';
      id_WoRMS = '212269';
      id_Taxo = '186547';        
      id_EoL = '46562416';
      id_fishbase = taxon_fish;
       
    case 'Opisthonema_oglinum'
      id_CoL = '3e1f89166040fdcbc59d0bc82f1eb602';
      id_WoRMS = '158695';
      id_Taxo = '182010';        
      id_EoL = '46562453';
      id_fishbase = taxon_fish;
       
    case 'Opisthonema_libertate'
      id_CoL = 'b243589047c8374850bb9c4f07e86f35';
      id_WoRMS = '275504';
      id_Taxo = '182008';        
      id_EoL = '46562456';
      id_fishbase = taxon_fish;
       
    case 'Hilsa_kelee'
      id_CoL = 'dd507919120885df774ffda7f8c3469d';
      id_WoRMS = '212278';
      id_Taxo = '176640';        
      id_EoL = '46562467';
      id_fishbase = taxon_fish;
       
    case 'Engraulis_encrasicolus'
      id_CoL = '2abe41c8ee39bb550534f328bf4717a3';
      id_WoRMS = '126426';
      id_Taxo = '173703';        
      id_EoL = '223061';
      id_fishbase = taxon_fish;
       
    case 'Engraulis_anchoita'
      id_CoL = '20a04344f8439205370c8ac3c7216857';
      id_WoRMS = '272284';
      id_Taxo = '173701';        
      id_EoL = '46562563';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2018/12/26
       
    case 'Engraulis_japonicus'
      id_CoL = 'c8c10a1c14ab21459eb2f38d4bf851ad';
      id_WoRMS = '219984';
      id_Taxo = '42686';        
      id_EoL = '46562562';
      id_fishbase = taxon_fish;
       
    case 'Spratelloides_delicatulus'
      id_CoL = '6c08e6756da63351badafc922c39244e';
      id_WoRMS = '126424';
      id_Taxo = '94360';        
      id_EoL = '46562434';
      id_fishbase = taxon_fish;
       
    case 'Spratelloides_gracilis'
      id_CoL = 'dca454ca2b6a4047b5ff9292178bb63b';
      id_WoRMS = '212263';
      id_Taxo = '187975';        
      id_EoL = '46562435';
      id_fishbase = taxon_fish;
       
    case 'Spratelloides_lewisi'
      id_CoL = 'fefc299b3497fa2d9ac3ae51f4eaec90';
      id_WoRMS = '272278';
      id_Taxo = '187976';        
      id_EoL = '46562436';
      id_fishbase = taxon_fish;
      id_Wiki = 'Spratelloides';
       
    case 'Chirocentrus_dorab'
      id_CoL = 'e6e028c4da3f6801e1e7b01fa7098bf8';
      id_WoRMS = '212257';
      id_Taxo = '42695';        
      id_EoL = '994538';
      id_fishbase = taxon_fish;
       
    case 'Alepocephalus_bairdii'
      id_CoL = '216578ffdce872d0743b7ec726e4179b';
      id_WoRMS = '126682';
      id_Taxo = '160348';   
      id_Wiki = 'Alepocephalus';     
      id_EoL = '224139';
      id_fishbase = taxon_fish;
       
    case 'Bajacalifornia_burragei'
      id_CoL = '10773fc12eae53a36b1701129c69139b';
      id_WoRMS = '162837';
      id_Taxo = '160348';   
      id_Wiki = 'Bajacalifornia';     
      id_EoL = '46562798';
      id_fishbase = taxon_fish;
       
    case 'Chanos_chanos'
      id_CoL = '4d9c6e7dced48df2f32ab635d64864ea';
      id_WoRMS = '217625';
      id_Taxo = '43032';        
      id_EoL = '224731';
      id_fishbase = taxon_fish;

    case 'Enteromius_liberiensis'
      id_CoL = '8d2f0628b6606e74ec68d0b7266b836c';
      id_WoRMS = ''; % not present 2018/11/04
      id_Taxo = '163116'; % present as Barbus liberiensis 2018/11/04
      id_EoL = '211844'; % present as Barbus liberiensis 2018/11/04
      id_fishbase = taxon_fish;
      id_ADW = 'Barbus_liberiensis';

    case 'Cyprinus_carpio'
      id_CoL = 'c6beac15d18bf1d88bab194fe597f1c7';
      id_WoRMS = '154582'; 
      id_Taxo = '43900';
      id_EoL = '985921';
      id_fishbase = taxon_fish;

    case 'Carassius_carassius'
      id_CoL = 'bee5791af5b67816a4310c3dc98c5397';
      id_WoRMS = '154297'; 
      id_Taxo = '43897';
      id_EoL = '46324948';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/14
      
    case 'Carassius_gibelio'
      id_CoL = '251ca6ec22e7de890c29a8e4ed62e337';
      id_WoRMS = '234033'; 
      id_Taxo = '165448';
      id_EoL = '215509';
      id_fishbase = taxon_fish;
      
    case 'Barbus_barbus'
      id_CoL = '963f554b3482a7f3ea34bc8a5fdf4253';
      id_WoRMS = '154292'; 
      id_Taxo = '43752';
      id_EoL = '211593';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/12

    case 'Capoeta_capoeta'
      id_CoL = 'd5bd75ebf2473d7081dedd4db26cc46c';
      id_WoRMS = ''; % not present 2018/12/22 
      id_Taxo = '43827';
      id_EoL = '1156460';
      id_fishbase = taxon_fish;
      
    case 'Luciobarbus_sclateri'
      id_CoL = '9c12f86d9e0181905f22e2497dc4f741';
      id_WoRMS = '474116'; 
      id_Taxo = '1682769';
      id_EoL = '225284';
      id_fishbase = taxon_fish;

    case 'Schizothorax_richardsonii'
      id_CoL = '963f554b3482a7f3ea34bc8a5fdf4253';
      id_WoRMS = ''; % not present 2018/12/15 
      id_Taxo = '186977';
      id_EoL = '205334';
      id_fishbase = taxon_fish;
      
    case 'Danio_rerio'
      id_CoL = 'ae6d1ad09071086da0498b39630b01f8';
      id_WoRMS = '172875'; 
      id_Taxo = '172875';        
      id_EoL = '204011';
      id_fishbase = taxon_fish;
       
    case 'Hypophthalmichthys_molitrix'
      id_CoL = 'cc64dcf9b5d181fde1235e0607376a1b';
      id_WoRMS = '';  % not present 2019/03/26
      id_Taxo = '43906';        
      id_EoL = '220327';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/03/26
       
    case 'Tinca_tinca'
      id_CoL = 'c503c3c6a48018b9b1f5846f90a3ac4a';
      id_WoRMS = '154343'; 
      id_Taxo = '43684';
      id_EoL = '210300';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/15

    case 'Rhodeus_amarus'
      id_CoL = '383389bc215371c6bf7b0cf460aff92e';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '92917';
      id_EoL = '217578';
      id_fishbase = taxon_fish;
       
    case 'Gobio_gobio'
      id_CoL = '5f26c93dbec8e883890bf3f7e7624f4d';
      id_WoRMS = '293609'; 
      id_Taxo = '43733';
      id_EoL = '207392';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/15

    case 'Romanogobio_albipinnatus'
      id_CoL = '6f7b65b58bfc37b05e428ad77ef2c5ae';
      id_WoRMS = ''; % not present 2019/03/17
      id_Taxo = '567493'; 
      id_EoL = '209781';
      id_fishbase = taxon_fish;

    case 'Phoxinus_phoxinus'
      id_CoL = 'ed3d685f3ab3a03eece392d00a616473';
      id_WoRMS = '154326';
      id_Taxo = '43660';   
      id_EoL = '46581654';
      id_fishbase = taxon_fish;
       
    case 'Alburnoides_bipunctatus'
      id_CoL = '85a8443cf8643e8dc6c1083e0f3b734b';
      id_WoRMS = '154288'; 
      id_Taxo = '43608';
      id_EoL = '204016';
      id_fishbase = taxon_fish;

    case 'Abramis_brama'
      id_CoL = 'a0b8ed2779121cee709ec4b1b05b6a30';
      id_WoRMS = '154281'; 
      id_Taxo = '43605';
      id_EoL = '205715';
      id_fishbase = taxon_fish;

    case 'Mirogrex_terraesanctae'
      id_CoL = '73ebd500d84e0d066c3d603a2d234eaf';
      id_WoRMS = ''; % not present 2019/03/14
      id_Taxo = '469554';
      id_EoL = '49803409';
      id_fishbase = taxon_fish;
      id_Wiki = 'Acanthobrama_terraesanctae';

    case 'Vimba_vimba'
      id_CoL = '89c5b2f126446373f1b5c7116142ba6a';
      id_WoRMS = '283150';
      id_Taxo = '43687'; 
      id_EoL = '994546';
      id_fishbase = taxon_fish;

    case 'Chondrostoma_nasus'
      id_CoL = '603cb21d9946407088321fa22f46ff2a';
      id_WoRMS = '154585'; 
      id_Taxo = '43623';
      id_EoL = '339806';
      id_fishbase = taxon_fish;

    case 'Iberochondrostoma_lemmingii'
      id_CoL = 'ca4a1e9aa6c9e326e89a44192bddd434';
      id_WoRMS = ''; % not present 2019/03/17 
      id_Taxo = '1008271'; 
      id_EoL = '225238';
      id_fishbase = taxon_fish;

    case 'Pseudochondrostoma_polylepis'
      id_CoL = '8812d316d42988c0db7f145d651565a1';
      id_WoRMS = ''; % not present 2019/03/06 
      id_Taxo = '1008263';
      id_EoL = '218477';
      id_fishbase = taxon_fish;

    case 'Rutilus_rutilus'
      id_CoL = '260d8de49c41aebdae8b37501aa3d809';
      id_WoRMS = '154333'; 
      id_Taxo = '43677';
      id_EoL = '205274';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/13

    case 'Scardinius_erythrophthalmus'
      id_CoL = '4bea1a3cb34fe72520eedcad421977f7';
      id_WoRMS = '154165'; 
      id_Taxo = '43682';
      id_EoL = '46581637';
      id_fishbase = taxon_fish;

    case 'Squalius_cii'
      id_CoL = 'd982e963750eac8e55ff1c6c7300597c';
      id_WoRMS = '1021373'; 
      id_Taxo = '1682883';
      id_EoL = '221014';
      id_fishbase = taxon_fish;

    case 'Squalius_pyrenaicus'
      id_CoL = 'e0775548b0f71a49d4ac881fd9793f4a';
      id_WoRMS = ''; % not present 2019-02-25 
      id_Taxo = '2711042';
      id_EoL = '224880';
      id_fishbase = taxon_fish;

    case 'Semotilus_atromaculatus'
      id_CoL = '8bc8e428fba5c0019fad295ef694a4a6';
      id_WoRMS = ''; % not present 2019/03/05 
      id_Taxo = '42292';
      id_EoL = '136002';
      id_fishbase = taxon_fish;
      
    case 'Blicca_bjoerkna'
      id_CoL = '3cb1fad6a7a0daf0c376aba3819a9b33';
      id_WoRMS = '154274'; 
      id_Taxo = '43617';
      id_EoL = '46324661';
      id_fishbase = taxon_fish;

    case 'Pimephales_promelas'
      id_CoL = '63c01b172492dc6862ba657e613edec0';
      id_WoRMS = '';  % not present 2017/06/16
      id_Taxo = '43662';   
      id_EoL = '28754994';
      id_fishbase = taxon_fish;
       
    case 'Rhinichthys_atratulus'
      id_CoL = '31d21ac91f8cabccc7738eb1957e9e8e';
      id_WoRMS = '';  % not present 2019/05/18
      id_Taxo = '43666';
      id_EoL = '212618';
      id_fishbase = taxon_fish;
       
    case 'Rhinichthys_cataractae'
      id_CoL = 'c3d8c26d2ba197d8f1c82b3291a67700';
      id_WoRMS = '';  % not present 2019/05/18
      id_Taxo = '185957'; 
      id_EoL = '216467';
      id_fishbase = taxon_fish;
       
    case 'Catostomus_catostomus'
      id_CoL = '113a0189ae5820370171a199874109ac';
      id_WoRMS = '158706';
      id_Taxo = '43912';
      id_EoL = '211083';
      id_fishbase = taxon_fish;

    case 'Cobitis_taenia'
      id_CoL = 'fabc08e8e5ea108ffa723983765f1eb5';
      id_WoRMS = '154373'; 
      id_Taxo = '43977';
      id_EoL = '212556';
      id_fishbase = taxon_fish;

    case 'Cobitis_paludica'
      id_CoL = '2bcc59bae2bc24208f6ed714d9d355f3';
      id_WoRMS = ''; % not present 2019/03/14
      id_Taxo = '171517';
      id_EoL = '213690';
      id_fishbase = taxon_fish;

    case 'Hydrocynus_vittatus'
      id_CoL = 'ed61d5b61ce91a6d34fbca8211ce5a9c';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '176952';  
      id_EoL = '206410';
      id_fishbase = taxon_fish;
       
    case 'Colossoma_macropomum'
      id_CoL = '819d6a87a748f6d1bf45619ce1dc03ab';
      id_WoRMS = '1020122';
      id_Taxo = '171593';  
      id_EoL = '215393';
      id_fishbase = taxon_fish;

    case 'Hyphessobrycon_pulchripinnis'
      id_CoL = '3c750f030175c17dfbaf9d63a4ee9f4f';
      id_WoRMS = '1015050';
      id_Taxo = '43195';  
      id_EoL = '219060';
      id_fishbase = taxon_fish;

    case 'Brycon_moorei'
      id_CoL = 'af72e1d7561394cf26eab282aed2b077';
      id_WoRMS = ''; % not present 2019/02/10
      id_Taxo = '164721';  
      id_EoL = '211943';
      id_fishbase = taxon_fish;

    case 'Leporinus_friderici'
      id_CoL = 'b620b5993d74fc3c0a94c93ee7bb1584';
      id_WoRMS = ''; % not present 2019/02/11
      id_Taxo = '437085';  
      id_EoL = '205923';
      id_fishbase = taxon_fish;

    case 'Electrophorus_electricus'
      id_CoL = '3cef65beebb836d276014fb79322b074';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '43452';
      id_EoL = '206595';
      id_fishbase = taxon_fish;
       
    case 'Apteronotus_leptorhynchus'
      id_CoL = 'f92cb7c920d7cdb108000b9a29abc64e';
      id_WoRMS = ''; % not present 2019/05/18
      id_Taxo = '161544';
      id_EoL = '223831';
      id_fishbase = taxon_fish;
       
    case 'Silurus_glanis'
      id_CoL = '0fca3a9e29d6704c3a68823c84b98198';
      id_WoRMS = '154677';
      id_Taxo = '44028'; 
      id_EoL = '224550';
      id_fishbase = taxon_fish;
       
    case 'Pangasianodon_hypophthalmus'
      id_CoL = '53d4229bacedae1311051e7cddd073d4';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '182534'; % present as Pangasius_hypophthalmus        
      id_EoL = '570181';
      id_fishbase = taxon_fish;
       
    case 'Clarias_gariepinus'
      id_CoL = '877822d367984db80a636f73c0b57f33';
      id_WoRMS = ''; % not present 2019/03/07
      id_Taxo = '171397';    
      id_EoL = '205045';
      id_fishbase = taxon_fish;
       
    case 'Clarias_gariepinus_x_Heterobranchus_longifilis'
      id_CoL = '877822d367984db80a636f73c0b57f33';
      id_WoRMS = ''; % not present 2019/03/07
      id_Taxo = '171397';    
      id_EoL = '205045';
      id_fishbase = taxon_fish;
       
    case 'Heterobranchus_longifilis'
      id_CoL = 'd4f6dc827e3ed46534f6a6fd5ecbbff3';
      id_WoRMS = ''; % not present 2019/03/07
      id_Taxo = '176567';   
      id_EoL = '207387';
      id_fishbase = taxon_fish;
       
    case 'Heterobranchus_longifilis_x_Clarius_gariepinus'
      id_CoL = 'd4f6dc827e3ed46534f6a6fd5ecbbff3';
      id_WoRMS = ''; % not present 2019/03/07
      id_Taxo = '176567';   
      id_EoL = '207387';
      id_fishbase = taxon_fish;
       
    case 'Ictalurus_punctatus'
      id_CoL = 'ec98ff956d24bbb1b4e243ad7e8abb12';
      id_WoRMS = ''; % not present 2017/07/10
      id_Taxo = '44004'; 
      id_EoL = '204762';
      id_fishbase = taxon_fish;
       
    case 'Noturus_phaeus'
      id_CoL = 'f03752eb51c8e57d880c643bed598382';
      id_WoRMS = ''; % not present 2019/05/18
      id_Taxo = '181581';
      id_EoL = '208077';
      id_fishbase = taxon_fish;
       
    case 'Corydoras_aeneus'
      id_CoL = '905ee3c3036f0147c9e3465986196a49';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '44138';
      id_EoL = '216685';
      id_fishbase = taxon_fish;
       
    case 'Lepidogalaxias_salamandroides'
      id_CoL = 'b975ffe011c7f6ea8044587c5b496b26';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '107055';
      id_EoL = '211145';
      id_fishbase = taxon_fish;
       
    case 'Argentina_silus'
      id_CoL = '3e22bc9aa5c827a1a28e27a30ebbce10';
      id_WoRMS = '126715';
      id_Taxo = '161604';        
      id_EoL = '994700';
      id_fishbase = taxon_fish;
       
    case 'Pseudobathylagus_milleri'
      id_CoL = '77ea7c845d958083cca547111a56ee1d';
      id_WoRMS = '282406';
      id_Taxo = '185054';        
      id_EoL = '46562946';
      id_fishbase = taxon_fish;
       
    case 'Leuroglossus_stilbius'
      id_CoL = 'f09944f516f1136b439e1d1bd11d809a'; % accepted as Leuroglossus schmidti 2019/01/23
      id_WoRMS = '313514';
      id_Taxo = '276286';  % accepted as Bathylagus stilbius 2019/01/23      
      id_EoL = '46562937';
      id_fishbase = taxon_fish;
       
    case 'Galaxias_paucispondylus'
      id_CoL = '97ac829e366aa23775953a31b00ae1e5';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '174652'; 
      id_EoL = '211834';
      id_fishbase = taxon_fish;
       
    case 'Galaxias_prognathus'
      id_CoL = 'da95676ab15b54eb5e4f65b620c80490';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '174655';        
      id_EoL = '224520';
      id_fishbase = taxon_fish;
       
    case 'Galaxias_maculatus'
      id_CoL = 'c2582550dc2965e0747776dea22d1aa4';
      id_WoRMS = '280811';
      id_Taxo = '42879';
      id_EoL = '205052';
      id_fishbase = taxon_fish;
       
    case 'Coregonus_albula'
      id_CoL = 'cb380684d38085d21164d9d0327fb629';
      id_WoRMS = '127178';
      id_Taxo = '42840';        
      id_EoL = '223193';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/19
 
    case 'Coregonus_lavaretus'
      id_CoL = '165deb471da03a7f0547cf80906d35ce';
      id_WoRMS = '127180';
      id_Taxo = '42846';        
      id_EoL = '267571';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/19
 
    case 'Coregonus_autumnalis'
      id_CoL = 'ec73a5fe25d386013c33f44423a83fdb';
      id_WoRMS = '127179';
      id_Taxo = '192548';        
      id_EoL = '46563165';
      id_fishbase = taxon_fish;
 
    case 'Prosopium_cylindraceum'
      id_CoL = '349508979aea0a32463749629ab90387';
      id_WoRMS = '282373';
      id_Taxo = '184830';        
      id_EoL = '46563191';
      id_fishbase = taxon_fish;
 
    case 'Thymallus_thymallus'
      id_CoL = '70711497ab2addf810f979817f82f1e5';
      id_WoRMS = '154375';
      id_Taxo = '42856';        
      id_EoL = '204590';
      id_fishbase = taxon_fish;
       
    case 'Thymallus_tugarinae'
      id_CoL = '0fc108d9335cd3ab23a22a723673eca8';
      id_WoRMS = ''; % not present 2019/03/28
      id_Taxo = '42854'; % present at genus level only 2019/03/28       
      id_EoL = '993657';
      id_fishbase = taxon_fish;
       
    case 'Oncorhynchus_tshawytscha'
      id_CoL = '566c1a149d7757a7b5ba252a5186fbbf';
      id_WoRMS = '158075';
      id_Taxo = '125253';        
      id_EoL = '205252';
      id_fishbase = taxon_fish;
       
    case 'Oncorhynchus_mykiss'
      id_CoL = 'd11b35db644cc45d76ccd8ad31452045';
      id_WoRMS = '127185';
      id_Taxo = '42808'; 
      id_EoL = '205250';
      id_fishbase = taxon_fish;
                 
    case 'Oncorhynchus_clarkii_stomias'
      id_CoL = 'f921d676328601571e8e89817cc11abe';
      id_WoRMS = '274347';
      id_Taxo = ''; 
      id_EoL = '2777842';
      id_fishbase = 'Oncorhynchus-clarkii';
       
    case 'Oncorhynchus_keta'
      id_CoL = 'cdd2d1e0c5119c3d5350542356db8ca6';
      id_WoRMS = '127183';
      id_Taxo = '42805'; 
      id_EoL = '205247';
      id_fishbase = taxon_fish;
       
    case 'Salmo_trutta'
      id_CoL = '0909d84d2750016742284669abf8341f';
      id_WoRMS = '223866';
      id_Taxo = '42823';        
      id_EoL = '206777';
      id_fishbase = taxon_fish;
       
    case 'Salmo_salar'
      id_CoL = '3266ba091601ba86cd408decf2706b85';
      id_WoRMS = '127186';
      id_Taxo = '42821';        
      id_EoL = '46563143';
      id_fishbase = taxon_fish;
       
    case 'Salvelinus_alpinus'
      id_CoL = '2b256e111056ab998c15402950cf0b1b';
      id_WoRMS = '293724';
      id_Taxo = '42831';        
      id_EoL = '1156463';
      id_fishbase = taxon_fish;
       
    case 'Salvelinus_willoughbii'
      id_CoL = 'e326b80964929e91f5c4a6e408b55f2c';
      id_WoRMS = ''; % not present 2019/02/26
      id_Taxo = '186489';        
      id_EoL = '1156861';
      id_fishbase = taxon_fish;
      id_Wiki = 'Salvelinus_willughbii';
       
    case 'Salvelinus_namaycush'
      id_CoL = '670d4affc27383225df22b517c1eb654';
      id_WoRMS = ''; % not present 2019/03/13
      id_Taxo = '42837';        
      id_EoL = '205277';
      id_fishbase = taxon_fish;
       
    case 'Salvelinus_leucomaenis'
      id_CoL = '1be092952a2556df7e0cfa92fbaa99f2';
      id_WoRMS = '274353';
      id_Taxo = '569902';        
      id_EoL = '204578';
      id_fishbase = taxon_fish;
       
    case 'Salvelinus_malma'
      id_CoL = '131fdba59c6574c07d330888f09380e3';
      id_WoRMS = '254570';
      id_Taxo = '42836';        
      id_EoL = '1287453';
      id_fishbase = taxon_fish;
       
    case 'Salvelinus_curilus'
      id_CoL = '835c48922fa18cf793b7339ea20dc6a0';
      id_WoRMS = '1026965';
      id_Taxo = '42830'; % present at genus level only 2019/03/27     
      id_EoL = '212741';
      id_fishbase = taxon_fish;
       
    case 'Esox_lucius'
      id_CoL = 'c828ed0d18644bc9e3cfe4b9507f3247';
      id_WoRMS = '154210';
      id_Taxo = '42891'; 
      id_EoL = '206652';
      id_fishbase = taxon_fish;
       
    case 'Osmerus_mordax'
      id_CoL = 'a3b21f18440ced89a25d39ddfedd990a';
      id_WoRMS = '293649';
      id_Taxo = '502213';        
      id_EoL = '357054';
      id_fishbase = taxon_fish;
       
    case 'Osmerus_eperlanus'
      id_CoL = '95fa89971011ddfa679022c91f42b7e0';
      id_WoRMS = '126736';
      id_Taxo = '42865';
      id_EoL = '46563008';
      id_fishbase = taxon_fish;
       
    case 'Mallotus_villosus'
      id_CoL = '6de343f6ed58029def4a6735f32b7771';
      id_WoRMS = '126735';
      id_Taxo = '42863';        
      id_EoL = '205084';
      id_fishbase = taxon_fish;
       
    case 'Maurolicus_muelleri'
      id_CoL = '287f6d8d5cad38947c4747789ae7694d';
      id_WoRMS = '127312';
      id_Taxo = '42941';        
      id_EoL = '994979';
      id_fishbase = taxon_fish;
       
    case 'Maurolicus_imperatorius'
      id_CoL = 'ff1b4ebe577d7501e7dc18b3253d31a0';
      id_WoRMS = '274970';
      id_Taxo = '179646';        
      id_EoL = '46563282';
      id_fishbase = taxon_fish;
      id_Wiki = 'Maurolicus';
       
    case 'Vinciguerria_nimbaria'
      id_CoL = 'c7cd0d6dc1b280950efadc37c9752996';
      id_WoRMS = '127303';
      id_Taxo = '190017';        
      id_EoL = '46563253';
      id_fishbase = taxon_fish;
       
    case 'Borostomias_panamensis'
      id_CoL = '96803edd66dd7a56cd8638dbcbfa0d22';
      id_WoRMS = '275052';
      id_Taxo = '164396';        
      id_EoL = '46563430';
      id_fishbase = taxon_fish;
      id_Wiki = 'Borostomias';
       
    case 'Harpadon_nehereus'
      id_CoL = '20bdc080c3d6f6e9ec19d35a7a538828';
      id_WoRMS = '217661';
      id_Taxo = '42986';        
      id_EoL = '220324';
      id_fishbase = taxon_fish;
       
    case 'Saurida_undosquamis'
      id_CoL = '4325632d3f0d7f509ff89ff24c0995c4';
      id_WoRMS = '126371';
      id_Taxo = '154128';        
      id_EoL = '993261';
      id_fishbase = taxon_fish;
       
    case 'Bathypterois_dubius'
      id_CoL = 'aa5e45d496db393d9beb53277513a2b7';
      id_WoRMS = '126342';
      id_Taxo = '163684';        
      id_EoL = '46563762';
      id_fishbase = taxon_fish;
       
    case 'Benthosema_suborbitale'
      id_CoL = '83a3118c7789277b7c66112ed9aac497';
      id_WoRMS = '126581';
      id_Taxo = '164102';        
      id_EoL = '46564029';
      id_fishbase = taxon_fish;
      id_Wiki = 'Benthosema';
       
    case 'Benthosema_pterotum'
      id_CoL = 'dfddfcaa38675799d8db7a2c1d99b9f9';
      id_WoRMS = '217680';
      id_Taxo = '164101';        
      id_EoL = '46564030';
      id_fishbase = taxon_fish;
      id_Wiki = 'Benthosema';
       
    case 'Benthosema_glaciale'
      id_CoL = 'dbea00b771faa63d968cbf8583fc32b1';
      id_WoRMS = '126580';
      id_Taxo = '164099';        
      id_EoL = '46564028';
      id_fishbase = taxon_fish;
       
    case 'Electrona_antarctica'
      id_CoL = '2fee3958598d311c279fec4fe48aefa8';
      id_WoRMS = '217697';
      id_Taxo = '173594';        
      id_EoL = '46564135';
      id_fishbase = taxon_fish;
       
    case 'Myctophum_asperum'
      id_CoL = '11e943c751c7c4000faa442fe0996377';
      id_WoRMS = '158903';
      id_Taxo = '180517';        
      id_EoL = '46564198';
      id_fishbase = taxon_fish;
       
    case 'Symbolophorus_californiensis'
      id_CoL = '3c60c8824c575eaeaac52a01bea9cde3';
      id_WoRMS = '272733';
      id_Taxo = '188427';        
      id_EoL = '46564248';
      id_fishbase = taxon_fish;
       
    case 'Tarletonbeania_crenularis'
      id_CoL = '99d14cbcd866d3ffa93b429ef0b5dcaf';
      id_WoRMS = '282927';
      id_Taxo = '188818';        
      id_EoL = '46564312';
      id_fishbase = taxon_fish;
       
    case 'Ceratoscopelus_warmingii'
      id_CoL = '8e0eb741ef0128590832cc90b3aa325a';
      id_WoRMS = '126586';
      id_Taxo = '166830';        
      id_EoL = '46564048';
      id_fishbase = taxon_fish;
       
    case 'Diaphus_dumerilii'
      id_CoL = '659d65eb252a97ffd1519ec979356327';
      id_WoRMS = '126590';
      id_Taxo = '173054';        
      id_EoL = '46564054';
      id_fishbase = taxon_fish;
      id_Wiki = 'Diaphus';
       
    case 'Diaphus_theta'
      id_CoL = '713bc4987d994398ec522f2203d3880d';
      id_WoRMS = '272694';
      id_Taxo = '173098';        
      id_EoL = '46564122';
      id_fishbase = taxon_fish;
      id_Wiki = 'Diaphus';
       
    case 'Nannobrachium_ritteri'
      id_CoL = '9fe8d04d62241d5082e6283bedd29b02';
      id_WoRMS = '275870';
      id_Taxo = '180708';        
      id_EoL = '46564274';
      id_fishbase = taxon_fish;
      id_Wiki = 'Nannobrachium';
       
    case 'Nannobrachium_regale'
      id_CoL = 'd22e2c059eb800c814b3bdb94d04fbe1';
      id_WoRMS = '275869';
      id_Taxo = '691373';        
      id_EoL = '46564273';
      id_fishbase = taxon_fish;
      id_Wiki = 'Nannobrachium';
       
    case 'Stenobrachius_leucopsarus'
      id_CoL = '55b77982249dac51e586c8e04e1e52e4';
      id_WoRMS = '254363';
      id_Taxo = '188162';        
      id_EoL = '46564306';
      id_fishbase = taxon_fish;
       
    case 'Triphoturus_mexicanus'
      id_CoL = 'c28de56d0789aa4d3bbacd7c06bbe6f8';
      id_WoRMS = '278566';
      id_Taxo = '189516';        
      id_EoL = '46564295';
      id_fishbase = taxon_fish;
      id_Wiki = 'Triphoturus';
       
    case 'Lampanyctodes_hectoris'
      id_CoL = '1663743e8aa7e56da885a90acae52c58';
      id_WoRMS = '217704';
      id_Taxo = '153098';        
      id_EoL = '204765';
      id_fishbase = taxon_fish;
       
    case 'Notoscopelus_resplendens'
      id_CoL = 'f9fff8aa5f58ba5b1fec8d363735154e';
      id_WoRMS = '158916';
      id_Taxo = '181459';        
      id_EoL = '46564221';
      id_fishbase = taxon_fish;
       
    case 'Notoscopelus_elongatus'
      id_CoL = 'e39202980f3982e62476093803ca1f25';
      id_WoRMS = '158915';
      id_Taxo = '181456';        
      id_EoL = '46564219';
      id_fishbase = taxon_fish;
       
    case 'Lepidophanes_guentheri'
      id_CoL = '698339a45a5663922c02fd7e569877af';
      id_WoRMS = '126621';
      id_Taxo = '178393';        
      id_EoL = '46564188';
      id_fishbase = taxon_fish;
       
    case 'Lampris_guttatus'
      id_CoL = '7bd6bfb1cf1351534d9a2117cb913e97';
      id_WoRMS = '126522';
      id_Taxo = '153323';        
      id_EoL = '46564331';
      id_fishbase = taxon_fish;
       
    case 'Percopsis_omiscomaycus'
      id_CoL = '9fb8728f4e0fc8a9cf1ddbfc6fd232d5';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '44208';     
      id_EoL = '212344';
      id_fishbase = taxon_fish;
       
    case 'Zeus_faber'
      id_CoL = 'bf90fcde968c06d7a7f8cfca8d697a6f';
      id_WoRMS = '127427';
      id_Taxo = '44763';        
      id_EoL = '210208';
      id_fishbase = taxon_fish;
       
    case 'Trisopterus_luscus'
      id_CoL = 'cd5e7b2693846a253c3422d6fe98ae1a';
      id_WoRMS = '126445';
      id_Taxo = '44358';        
      id_EoL = '206051';
      id_fishbase = taxon_fish;
       
    case 'Trisopterus_minutus'
      id_CoL = '98b19a0e8841f79eb026a4ffb91a2bc5';
      id_WoRMS = '126446'; 
      id_Taxo = '44359';        
      id_EoL = '225598';
      id_fishbase = taxon_fish;
       
    case 'Gadiculus_argenteus'
      id_CoL = 'a78ad69172f3ea581adb41e10070cc7c';
      id_WoRMS = '126435';
      id_Taxo = '44309';        
      id_EoL = '224213';
      id_fishbase = taxon_fish;
       
    case 'Micromesistius_poutassou'
      id_CoL = 'ba1a5fff001217fb7146d999d35734f3';
      id_WoRMS = '126439';
      id_Taxo = '44338';        
      id_EoL = '211404';
      id_fishbase = taxon_fish;
       
    case 'Micromesistius_australis'
      id_CoL = 'dad111de92ea50e1caa8b3d1a1661b0f';
      id_WoRMS = '234781';
      id_Taxo = '44337';
      id_EoL = '46564425';
      id_fishbase = taxon_fish;
       
    case 'Pollachius_virens'
      id_CoL = '60c99285fb5a4e824031a17adb22b495';
      id_WoRMS = '126441';
      id_Taxo = '92961';        
      id_EoL = '994633';
      id_fishbase = taxon_fish;
       
    case 'Melanogrammus_aeglefinus'
      id_CoL = '69087f937e2e4b18916f8bd300a4ca41';
      id_WoRMS = '126437';
      id_Taxo = '92958';        
      id_EoL = '212899';
      id_fishbase = taxon_fish;
       
    case 'Merlangius_merlangus'
      id_CoL = 'ab575c19c518950c34e2773154585474';
      id_WoRMS = '126438';
      id_Taxo = '92959';        
      id_EoL = '216882';
      id_fishbase = taxon_fish;
       
    case 'Gadus_morhua'
      id_CoL = '472b9bc88fb647e974a0f06caed3dd44';
      id_WoRMS = '126436';
      id_Taxo = '92960';        
      id_EoL = '206692';
      id_fishbase = taxon_fish;
       
    case 'Gadus_chalcogrammus'
      id_CoL = '0cc6ba2f7301e1a9e54c106af796cd96';
      id_WoRMS = '300735';
      id_Taxo = '44355';  % present as Theragra chalcogramma 2018/12/14      
      id_EoL = '216657';
      id_fishbase = taxon_fish;
      id_ADW = 'Theragra_chalcogramma'; % present as Theragra chalcogramma 2018/12/14 
       
    case 'Boreogadus_saida'
      id_CoL = '74b88f2be1326b10f683981eb180ba11';
      id_WoRMS = '126433';
      id_Taxo = '44297';
      id_EoL = '203867';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/09/02
       
    case 'Eleginus_gracilis'
      id_CoL = 'fbc33683b3466651574e87b326a3a21e';
      id_WoRMS = '254537';
      id_Taxo = '44304';
      id_EoL = '46564409';
      id_fishbase = taxon_fish;
       
    case 'Merluccius_merluccius'
      id_CoL = '39aec9c7ac734cd01b88dc2b5b09c28c';
      id_WoRMS = '126484';
      id_Taxo = '44371';        
      id_EoL = '208465';
      id_fishbase = taxon_fish;
       
    case 'Merluccius_hubbsi'
      id_CoL = 'b9edf9dcaee819bc4cd02db91f5c71e3';
      id_WoRMS = '272455';
      id_Taxo = '44370';        
      id_EoL = '589820';
      id_fishbase = taxon_fish;
       
    case 'Merluccius_polli'
      id_CoL = '065efdf9d8bf765a7f21b7add1214eab';
      id_WoRMS = '272457';
      id_Taxo = '179870';        
      id_EoL = '46564950';
      id_fishbase = taxon_fish;
       
    case 'Merluccius_senegalensis'
      id_CoL = '80246b064b2df8821a037538614e1f4c';
      id_WoRMS = '126485';
      id_Taxo = '179871';        
      id_EoL = '46564940';
      id_fishbase = taxon_fish;
       
    case 'Merluccius_capensis'
      id_CoL = '5fb0455cfce6257a7d76804a61037ad1';
      id_WoRMS = '217746';
      id_Taxo = '44368';        
      id_EoL = '46564944';
      id_fishbase = taxon_fish;
       
    case 'Macruronus_novaezelandiae'
      id_CoL = '0c9ebd10671215be47b201d4a8070db6';
      id_WoRMS = '272450';
      id_Taxo = '179492';        
      id_EoL = '46564933';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2018/12/18
       
    case 'Coryphaenoides_rupestris'
      id_CoL = '5c129aaf328e6c2c681bbdd241f31865';
      id_WoRMS = '158960';
      id_Taxo = '44412';        
      id_EoL = '224289';
      id_fishbase = taxon_fish;
       
    case 'Coryphaenoides_acrolepis'
      id_CoL = '6016bf6098518f7e8e1948a86bf68866';
      id_WoRMS = '272313';
      id_Taxo = '171920';  
      id_Wiki = 'Coryphaenoides';
      id_EoL = '218274';
      id_fishbase = taxon_fish;
       
    case 'Coelorinchus_caelorhincus'
      id_CoL = 'e34f6ba8afda162d8af55de36af104b4';
      id_WoRMS = '398381';
      id_Taxo = '115044'; % present at genus level only 2018/12/21
      id_Wiki = 'Coelorinchus'; % present at genus level only 2018/12/21
      id_EoL = '46564880';
      id_fishbase = taxon_fish;
       
    case 'Nezumia_sclerorhynchus'
      id_CoL = '42e5104f31d6fcab75804fab5467a010';
      id_WoRMS = '126475';
      id_Taxo = '181312';  
      id_Wiki = 'Nezumia';
      id_EoL = '46564628';
      id_fishbase = taxon_fish;
       
    case 'Hymenocephalus_italicus'
      id_CoL = 'a0c3ceea351a35da398000d52d35399e';
      id_WoRMS = '158961';
      id_Taxo = '176992';  
      id_Wiki = 'Hymenocephalus';
      id_EoL = '46564583';
      id_fishbase = taxon_fish;
       
    case 'Macrourus_berglax'
      id_CoL = '5c129aaf328e6c2c681bbdd241f31865';
      id_WoRMS = '126472';
      id_Taxo = '44414';  
      id_EoL = '46564611';
      id_fishbase = taxon_fish;
       
    case 'Trachyrincus_scabrus'
      id_CoL = 'd00f2ecf91149861613bf860026db2f5';
      id_WoRMS = '126482';
      id_Taxo = '189278';        
      id_Wiki = 'Trachyrincus';
      id_EoL = '203950';
      id_fishbase = taxon_fish;
       
    case 'Raniceps_raninus'
      id_CoL = 'bde2dc26759b5a5d568a3b000a7d0ed6';
      id_WoRMS = '126442';
      id_Taxo = '44353';        
      id_EoL = '223615';
      id_fishbase = taxon_fish;
       
    case 'Phycis_phycis'
      id_CoL = 'afcf3eaa4aff382202f7bea658903ca3';
      id_WoRMS = '126502';
      id_Taxo = '44348';        
      id_EoL = '994629';
      id_fishbase = taxon_fish;
       
    case 'Phycis_blennoides'
      id_CoL = 'f898d7e1d04d01621a5fccb488d55932';
      id_WoRMS = '126501';
      id_Taxo = '44347';        
      id_EoL = '46565095';
      id_fishbase = taxon_fish;
      id_Wiki = 'Phycis'; % prsent at genus level only 2018/12/19
       
    case 'Gaidropsarus_guttatus'
      id_CoL = 'ee90fb4c4e49bf9664559762da7b707e';
      id_WoRMS = '126455';
      id_Taxo = '174631';        
      id_Wiki = 'Gaidropsarus';
      id_EoL = '43651741';
      id_fishbase = taxon_fish;
       
    case 'Lota_lota'
      id_CoL = 'f2994eaf34e74ea6bd789bfdb4684b89';
      id_WoRMS = '154388';
      id_Taxo = '44325';        
      id_EoL = '204768';
      id_fishbase = taxon_fish;
       
    case 'Brosme_brosme'
      id_CoL = '10373959a98b1e40a905b724dad4a42c';
      id_WoRMS = '126447';
      id_Taxo = '44299';        
      id_EoL = '205187';
      id_fishbase = taxon_fish;
       
    case 'Molva_molva'
      id_CoL = '3fee41097816c75ec9b5a5ef34cb99dd';
      id_WoRMS = '126461';
      id_Taxo = '44342';        
      id_EoL = '211405';
      id_fishbase = taxon_fish;
       
    case 'Molva_dypterygia'
      id_CoL = '269c0de4e92dcc0e57972a40b5e4e002';
      id_WoRMS = '154806';
      id_Taxo = '180273';        
      id_EoL = '215832';
      id_fishbase = taxon_fish;
       
    case 'Pseudophycis_bachus'
      id_CoL = '3577c698756ee7e78651de2bb67c6499';
      id_WoRMS = '282468';
      id_Taxo = '185269';        
      id_EoL = '213429';
      id_fishbase = taxon_fish;
       
    case 'Antimora_rostrata'
      id_CoL = 'f9abd37e1945acfed8ee84f8046b3739';
      id_WoRMS = '126486';
      id_Taxo = '44283';        
      id_EoL = '46564965';
      id_fishbase = taxon_fish;
       
    case 'Polymixia_nobilis'
      id_CoL = '70e2266b2d2a3c0706512274d0d36766';
      id_WoRMS = '127163';
      id_Taxo = '184375';        
      id_EoL = '213443';
      id_fishbase = taxon_fish;
       
    case 'Hoplostethus_atlanticus'
      id_CoL = '1e050a7b0ef409254f1412f5eda0c21f';
      id_WoRMS = '126402';
      id_Taxo = '153363';        
      id_EoL = '206716';
      id_fishbase = taxon_fish;
       
    case 'Beryx_splendens'
      id_CoL = '8953e6e3718493eae59680ca376ef244';
      id_WoRMS = '126395';
      id_Taxo = '44739';        
      id_EoL = '46567186';
      id_fishbase = taxon_fish;
       
    case 'Poromitra_crassiceps'
      id_CoL = '91a14196d435b3dc5509afd62b58ad00';
      id_WoRMS = '127273';
      id_Taxo = '184588';        
      id_EoL = '46567130';
      id_fishbase = taxon_fish;
       
    case 'Holocentrus_adscensionis'
      id_CoL = '09be05d2d25f1e7254c0380f441b7fa3';
      id_WoRMS = '159378';
      id_Taxo = '176795';        
      id_EoL = '203800';
      id_fishbase = taxon_fish;
       
    case 'Carapus_bermudensis'
      id_CoL = '2dd6e3f10c0d08bcb17089579df4c5d0';
      id_WoRMS = '158995';
      id_Taxo = '165436';
      id_Wiki = 'Carapus';
      id_EoL = '205819';
      id_fishbase = taxon_fish;
       
    case 'Genypterus_blacodes'
      id_CoL = '660b829aafcd7d46e774e3638a8d7a29';
      id_WoRMS = '278702';
      id_Taxo = '174838';        
      id_EoL = '218108';
      id_fishbase = taxon_fish;
       
    case 'Opsanus_tau'
      id_CoL = 'eabf208a108044b4e9b995e267e3cbed';
      id_WoRMS = '158782';
      id_Taxo = '44212';        
      id_EoL = '225201';
      id_fishbase = taxon_fish;
       
    case 'Opsanus_beta'
      id_CoL = '5c3aa151f6a0423669238d96cc55ba8c';
      id_WoRMS = '275645';
      id_Taxo = '182070';        
      id_EoL = '46565873';
      id_fishbase = taxon_fish;
       
    case 'Halobatrachus_didactylus'
      id_CoL = '179d2ac7f27322ede597a170364b80a9';
      id_WoRMS = '126374';
      id_Taxo = '175875';        
      id_EoL = '204343';
      id_fishbase = taxon_fish;
       
    case 'Kurtus_gulliveri'
      id_CoL = '38cb814c35df32492fc8a30488ce5b03';
      id_WoRMS = '281236';
      id_Taxo = '46650';        
      id_EoL = '356410';
      id_fishbase = taxon_fish;
       
    case 'Ostorhinchus_doederleini'
      id_CoL = 'd42f623436e438e19c54392b9dca8193';
      id_WoRMS = '273008'; % accepted as Apogon doederleini at 2018/01/31
      id_Taxo = '106041';  % accepted as Apogon doederleini at 2018/01/31     
      id_EoL = '987899';   % accepted as Apogon doederleini at 2018/01/31
      id_fishbase = taxon_fish;
      id_ADW = 'Apogon_doederleini';
       
    case 'Siphamia_tubifer'
      id_CoL = 'c690cd565103e7c3d9ddbaa8ef830be6';
      id_WoRMS = '277708'; 
      id_Taxo = '187807';    
      id_EoL = '213953'; 
      id_fishbase = taxon_fish;
       
    case 'Pomatoschistus_minutus'
      id_CoL = '04913a0b4d8937a43ce71ec46207ba90';
      id_WoRMS = '126928';
      id_Taxo = '46609';        
      id_EoL = '994642';
      id_fishbase = taxon_fish;
       
    case 'Rhinogobius_brunneus'
      id_CoL = '9e30ea601609951de533ce0666402007';
      id_WoRMS = '282581';
      id_Taxo = '43740';  % present at genus level 2017/12/23      
      id_EoL = '225347';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present at 2017/12/23
      id_Wiki = 'Rhinogobius';
       
    case 'Gobius_niger'
      id_CoL = '82314e73a3d4a82de533d65b06f040f7';
      id_WoRMS = '126892';
      id_Taxo = '46584';    
      id_EoL = '206703';
      id_fishbase = taxon_fish;
      
    case 'Gobius_paganellus'
      id_CoL = '24b68175826ee426b900b75da82c1229';
      id_WoRMS = '126893';
      id_Taxo = '46587';      
      id_EoL = '2802153';
      id_fishbase = taxon_fish;
      
    case 'Ponticola_iranicus'
      id_CoL = '22daf4ffdd98b1ad8375df24c8d80e22';
      id_WoRMS = ''; % not present 2019/03/20
      id_Taxo = '46610'; % present at genus level only 2019/03/20     
      id_EoL = '47063022';
      id_fishbase = taxon_fish;
      id_Wiki = 'Ponticola';
      id_ADW = ''; % not present 2019/03/20
      
    case 'Neogobius_melanostomus'
      id_CoL = '177d4e4157da3f0fc812bbfad62354e6';
      id_WoRMS = '126916'; 
      id_Taxo = '181098';     
      id_EoL = '46575276';
      id_fishbase = taxon_fish;
      
    case 'Knipowitschia_caucasica'
      id_CoL = '4c9479ebf54429020a6942a1e91436ab';
      id_WoRMS = '126899'; 
      id_Taxo = '177762';     
      id_EoL = '46576381';
      id_fishbase = taxon_fish;
      
    case 'Boleophthalmus_pectinirostris'
      id_CoL = '9ce392a55b69c4e9421f8c2b99628ff5';
      id_WoRMS = '279926';
      id_Taxo = '46564';      
      id_EoL = '46576719';
      id_fishbase = taxon_fish;
      
    case 'Gymnogobius_urotaenia'
      id_CoL = '486a1a9995ee8ed5a871f940d7f6fc9d';
      id_WoRMS = '280967';
      id_Taxo = '175586';      
      id_EoL = '46576579';
      id_fishbase = taxon_fish;
      
    case 'Hippocampus_whitei'
      id_CoL = '34e00e147e87daed81ad04fe6747aa6f';
      id_WoRMS = '212235';
      id_Taxo = '176713';        
      id_EoL = '224695';
      id_fishbase = taxon_fish;
       
    case 'Hippocampus_kuda'
      id_CoL = 'fc051550fcac5676c322340670130c0d';
      id_WoRMS = '212237';
      id_Taxo = '44857';        
      id_EoL = '46567778';
      id_fishbase = taxon_fish;
       
    case 'Hippocampus_guttulatus'
      id_CoL = 'c4df4f5b8128b74be89eeced1d86015e';
      id_WoRMS = '154776';
      id_Taxo = '44855';        
      id_EoL = '46567768';
      id_fishbase = taxon_fish;
       
    case 'Phyllopteryx_taeniolatus'
      id_CoL = '79809fb906f31d0f94b966ad87607bbb';
      id_WoRMS = '282254';
      id_Taxo = '183763';        
      id_EoL = '46567739';
      id_fishbase = taxon_fish;
       
    case 'Macroramphosus_scolopax'
      id_CoL = '770932aafd5b74016b79ed7295764b9b';
      id_WoRMS = '127378';
      id_Taxo = '179479';        
      id_EoL = '205113';
      id_fishbase = taxon_fish;
       
    case 'Macroramphosus_gracilis'
      id_CoL = '437607dcae3e3f6957d73c4d031e8d38';
      id_WoRMS = '275181';
      id_Taxo = '179478';        
      id_EoL = '995152';
      id_fishbase = taxon_fish;
       
    case 'Upeneus_moluccensis'
      id_CoL = 'c6c8920562bbaca3a734f38d5d361a4a';
      id_WoRMS = '126989';
      id_Taxo = '189739';        
      id_EoL = '46578741';
      id_fishbase = taxon_fish;
       
    case 'Upeneus_tragula'
      id_CoL = 'a34c6e8969ed09c8e191745a921c36a9';
      id_WoRMS = '218689';
      id_Taxo = '189747';        
      id_EoL = '46578745';
      id_fishbase = taxon_fish;
       
    case 'Parupeneus_multifasciatus'
      id_CoL = 'e27ce7d6ff6fa6ef789a4a4dfd28016e';
      id_WoRMS = '277820';
      id_Taxo = '183301';        
      id_EoL = '46578793';
      id_fishbase = taxon_fish;
       
    case 'Thunnus_orientalis'
      id_CoL = '243ba5718af1ebd2306782107e21e150';
      id_WoRMS = '273823';
      id_Taxo = '189037';   
      id_EoL = '214754';
      id_fishbase = taxon_fish;
       
    case 'Thunnus_thynnus'
      id_CoL = 'cd171d7f8b99d3cfddfe023e5f82480c';
      id_WoRMS = '127029';
      id_Taxo = '46703';        
      id_EoL = '223943';
      id_fishbase = taxon_fish;
       
    case 'Thunnus_maccoyii'
      id_CoL = '5a70f397f1d6c11fea7d7cb69a82a165';
      id_WoRMS = '219720';
      id_Taxo = '189036';        
      id_EoL = '46577338';
      id_fishbase = taxon_fish;
       
    case 'Thunnus_obesus'
      id_CoL = '18f3951d92c9d9afa06f9d5785306b06';
      id_WoRMS = '127028';
      id_Taxo = '46702';        
      id_EoL = '46577335';
      id_fishbase = taxon_fish;
       
    case 'Thunnus_albacares'
      id_CoL = '3014fa864f503e9b61ac1b523c577ae5';
      id_WoRMS = '127027';
      id_Taxo = '189034';        
      id_EoL = '205934';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2018/12/17
       
    case 'Thunnus_alalunga'
      id_CoL = '54eb9f8647f6f0945d5c74e453de4d68';
      id_WoRMS = '127026';
      id_Taxo = '46700';        
      id_EoL = '46577333';
      id_fishbase = taxon_fish;
       
    case 'Katsuwonus_pelamis'
      id_CoL = '74a1965ab1023269280bedebb9a09a51';
      id_WoRMS = '127018';
      id_Taxo = '46680';        
      id_EoL = '46577294';
      id_fishbase = taxon_fish;
       
    case 'Scomber_scombrus'
      id_CoL = 'f656631fc42068100e2330c40c8fda18';
      id_WoRMS = '127022';
      id_Taxo = '46695';        
      id_EoL = '46324676';
      id_fishbase = taxon_fish;
      
    case 'Scomber_japonicus'
      id_CoL = '87614b9e925273642b31a38676716a83';
      id_WoRMS = '127023';
      id_Taxo = '187060';        
      id_EoL = '46577306';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/03/09
      
    case 'Scomberomorus_commerson'
      id_CoL = '4770697536915029b1d865a3d67def03';
      id_WoRMS = '127024';
      id_Taxo = '187066';        
      id_EoL = '46577312';
      id_fishbase = taxon_fish;
      
    case 'Scomberomorus_plurilineatus'
      id_CoL = 'd5e9fb57d2eb8f3f80252de4f40d9912';
      id_WoRMS = '219719';
      id_Taxo = '187075';        
      id_EoL = '46577319';
      id_fishbase = taxon_fish;
      
    case 'Scomberomorus_sierra'
      id_CoL = '7b5318cdf1ee212aee0aedb96c621053';
      id_WoRMS = '273821';
      id_Taxo = '187079';        
      id_EoL = '46577330';
      id_fishbase = taxon_fish;
      
    case 'Trichiurus_nanhaiensis'
      id_CoL = '555222cee2c6984ba598f0c688c28475';
      id_WoRMS = '274024';
      id_Taxo = '189326';  
      id_Wiki = 'Trichiurus';
      id_EoL = '221078';
      id_fishbase = taxon_fish;
       
    case 'Trichiurus_lepturus'
      id_CoL = '4a36bde2ebd4e4e7ec0deaad650f648b';
      id_WoRMS = '127089';
      id_Taxo = '46670';  
      id_EoL = '46577378';
      id_fishbase = taxon_fish;
       
    case 'Aphanopus_carbo'
      id_CoL = '0a49e7c45d77cb0727a237885297be00';
      id_WoRMS = '127085';
      id_Taxo = '161103';  
      id_EoL = '46577356';
      id_fishbase = taxon_fish;
       
    case 'Brama_brama'
      id_CoL = 'd2de41551c8f3bf33a85cf1fd8481c2a';
      id_WoRMS = '126783';
      id_Taxo = '45040';  
      id_EoL = '46577908';
      id_fishbase = taxon_fish;
       
    case 'Pomatomus_saltatrix'
      id_CoL = 'd9ac988f149a3d2822d71c673be09317';
      id_WoRMS = '151482';
      id_Taxo = '45220';  
      id_EoL = '46578890';
      id_fishbase = taxon_fish;
       
    case 'Promethichthys_prometheus'
      id_CoL = 'ed6a7d09e327349c91ca7e3da41fdb4c';
      id_WoRMS = '126866';
      id_Taxo = '184821';  
      id_EoL = '46577254';
      id_fishbase = taxon_fish;
       
    case 'Mastacembelus_erythrotaenia'
      id_CoL = '9f4397e88523d3980ca643eb8822e6fc';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '46876';   
      id_EoL = '224257';
      id_fishbase = taxon_fish;
       
    case 'Channa_punctata'
      id_CoL = '19bb192b10caf3ea97ac557fd3b99edb';
      id_WoRMS = '280129';
      id_Taxo = '189326';        
      id_EoL = '204174';
      id_fishbase = taxon_fish;
       
    case 'Channa_argus'
      id_CoL = 'a36128d046eddeb8a877c33efce307e5';
      id_WoRMS = ''; % not present 2019/03/09
      id_Taxo = '192521';        
      id_EoL = '204003';
      id_fishbase = taxon_fish;
       
    case 'Leptomelanosoma_indicum'
      id_CoL = '004a64a588dad591b93043d7e1ba587e';
      id_WoRMS = '281323';
      id_Taxo = '691213';        
      id_EoL = '208264';
      id_fishbase = taxon_fish;
       
    case 'Filimanus_heptadactyla'
      id_CoL = '514571dabdd17409220988c855b486cd';
      id_WoRMS = '280780';
      id_Taxo = '383108';        
      id_EoL = '46578868';
      id_fishbase = taxon_fish;
      id_Wiki = 'Threadfin';
       
    case 'Eleutheronema_tetradactylum'
      id_CoL = '0ad1766b62e5241fed1605a65edc14a5'; % accepted as Eleutheronema rhadinum 2019/01/10
      id_WoRMS = '280639';
      id_Taxo = '153679';        
      id_EoL = '220322';
      id_fishbase = taxon_fish;
       
    case 'Polydactylus_macrochir'
      id_CoL = '4db3622f52191896564bee31eb873b5a';
      id_WoRMS = '276590';
      id_Taxo = '184318';        
      id_EoL = '207636';
      id_fishbase = taxon_fish;
      id_Wiki = 'Polydactylus';
       
    case 'Coryphaena_hippurus'
      id_CoL = 'c1a7f3fb0a8ad67293953bcc7595b9b1';
      id_WoRMS = '126846';
      id_Taxo = '45259';        
      id_EoL = '356300';
      id_fishbase = taxon_fish;
       
    case 'Trachurus_trachurus'
      id_CoL = '02ba3ac0351955e01ae15aada30ecaf3';
      id_WoRMS = '126822';
      id_Taxo = '45255';        
      id_EoL = '206048';
      id_fishbase = taxon_fish;
       
    case 'Trachurus_mediterraneus'
      id_CoL = '80408e449ad327b7d6cda3878f5d59d2';
      id_WoRMS = '126820';
      id_Taxo = '189253';        
      id_EoL = '46578052';
      id_fishbase = taxon_fish;
       
    case 'Seriola_dumerili'
      id_CoL = 'c41257061380fbac21c3ece5c9f31c25';
      id_WoRMS = '126816';
      id_Taxo = '45249';        
      id_EoL = '993271';
      id_fishbase = taxon_fish;
       
    case 'Echeneis_naucrates'
      id_CoL = '1ffeaa71f93f2edeb5d6bfb080b8de8b';
      id_WoRMS = '126848';
      id_Taxo = '45226';        
      id_EoL = '46578345';
      id_fishbase = taxon_fish;
       
    case 'Sphyraena_barracuda'
      id_CoL = '15ca7deef951e4af6ad43248c2ba9525';
      id_WoRMS = '345843';
      id_Taxo = '46311';        
      id_EoL = '205286';
      id_fishbase = taxon_fish;
       
    case 'Xiphias_gladius'
      id_CoL = '099117b58af9f608aac8375fee1b49f9';
      id_WoRMS = '127094';
      id_Taxo = '46706';        
      id_EoL = '206878';
      id_fishbase = taxon_fish;
       
    case 'Makaira_nigricans'
      id_CoL = '088c42e166682f624c0dcf29b3eb37b1';
      id_WoRMS = '126950';
      id_Taxo = '179502';        
      id_EoL = '338211';
      id_fishbase = taxon_fish;
       
    case 'Istiompax_indica'
      id_CoL = '987fdff3014deca15f3bcf4493d2774d';
      id_WoRMS = '712905';
      id_Taxo = '46711'; % present as Istiompax, unacceped, 2019/01/16       
      id_EoL = '46581454';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/01/16
       
    case 'Istiophorus_platypterus'
      id_CoL = '225af87531350c3fd28cd8902ccde41b'; % present at Istiophorus albicans 2019/01/01
      id_WoRMS = '158812';
      id_Taxo = '46717';        
      id_EoL = '46581444';
      id_fishbase = taxon_fish;
       
    case 'Centropomus_undecimalis'
      id_CoL = '3301ce508f4609a51e8f9e149960e264';
      id_WoRMS = '280068';
      id_Taxo = '45046';        
      id_EoL = '205157';
      id_fishbase = taxon_fish;
       
    case 'Solea_solea'
      id_CoL = 'deff55d108d1dce0aa4a4f4b9838e198';
      id_WoRMS = '127160';
      id_Taxo = '46991';        
      id_EoL = '994496';
      id_fishbase = taxon_fish;
       
    case 'Dicologlossa_cuneata'
      id_CoL = '46405cfbe7ee513e110a4e0ae142818b';
      id_WoRMS = '127154';
      id_Taxo = '173137';        
      id_EoL = '620340';
      id_fishbase = taxon_fish;
       
    case 'Microchirus_azevia'
      id_CoL = 'fb2dd4397942c6a317d6b334ca8a87d4';
      id_WoRMS = '274299';
      id_Taxo = '465748';        
      id_EoL = '221509';
      id_fishbase = taxon_fish;
       
    case 'Microchirus_variegatus'
      id_CoL = 'f5932898eb9a8a2c2b493a9aa4f15fa9';
      id_WoRMS = '274304';
      id_Taxo = '179970';        
      id_EoL = '46570271';
      id_fishbase = taxon_fish;
       
    case 'Pegusa_lascaris'
      id_CoL = '0cf7bb5a26a2c568aadf954ee9ae680f';
      id_WoRMS = '127156';
      id_Taxo = '513562';        
      id_EoL = '46570277';
      id_fishbase = taxon_fish;
       
    case 'Pegusa_impar'
      id_CoL = 'ee54e66055d52dab828b53485f987471';
      id_WoRMS = '236490';
      id_Taxo = '513559';        
      id_EoL = '46570279';
      id_fishbase = taxon_fish;
      id_Wiki = 'Pegusa'; % not present at species level 2019/02/14
       
    case 'Buglossidium_luteum'
      id_CoL = 'ed32a73a852661be0064fdcbcb0df544';
      id_WoRMS = '127153';
      id_Taxo = '46988';        
      id_EoL = '46570259';
      id_fishbase = taxon_fish;
       
    case 'Psetta_maxima'
      id_CoL = '614b30fcca5c61b82a3d7b6cbad26210';
      id_WoRMS = '154473'; % unaccepted, to Scophthalmus maximus (Linnaeus, 1758)
      id_Taxo = '549389';        
      id_EoL = '46324769';
      id_fishbase = taxon_fish;
       
    case 'Lepidorhombus_whiffiagonis'
      id_CoL = 'e28a9f4258cb2ab66c286b56500b1b65';
      id_WoRMS = '127146'; 
      id_Taxo = '178404';        
      id_EoL = '46570241';
      id_fishbase = taxon_fish;
       
    case 'Lepidorhombus_boscii'
      id_CoL = '45a09c532181c7d4f3447e73d03d0c11';
      id_WoRMS = '127145'; 
      id_Taxo = '178403';        
      id_EoL = '46570240';
      id_fishbase = taxon_fish;
       
    case 'Bothus_podas'
      id_CoL = 'bdfad96d05a57e67153ca800c8dcbbb2';
      id_WoRMS = '127129';
      id_Taxo = '46911';        
      id_EoL = '46410277';
      id_fishbase = taxon_fish;
       
    case 'Arnoglossus_laterna'
      id_CoL = '51d6d7169fa6c8452a674c217df73fed';
      id_WoRMS = '127126';
      id_Taxo = '46908';        
      id_EoL = '212566';
      id_fishbase = taxon_fish;
       
    case 'Arnoglossus_thori'
      id_CoL = '2ffa2a9621811ca8ce68410db51f058e';
      id_WoRMS = '127128';
      id_Taxo = '161791';        
      id_EoL = '46569750';
      id_fishbase = taxon_fish;
       
    case 'Paralichthys_californicus'
      id_CoL = '792306f69c45f40c290b03b5508d0145';
      id_WoRMS = '275809';
      id_Taxo = '46919';        
      id_EoL = '217375';
      id_fishbase = taxon_fish;
       
    case 'Syacium_gunteri'
      id_CoL = '012b304670962bfa32c37f92e1b5662f';
      id_WoRMS = '275839';
      id_Taxo = '188418';        
      id_EoL = '46570531';
      id_fishbase = taxon_fish;
       
    case 'Hippoglossus_hippoglossus'
      id_CoL = 'dc36286e5ce7fb2b3f8ea20980cf01a7';
      id_WoRMS = '127138';
      id_Taxo = '46945';        
      id_EoL = '206587';
      id_fishbase = taxon_fish;
       
    case 'Hippoglossus_stenolepis'
      id_CoL = '91569817d395ea9dfbc24b5cb9c1ea2d';
      id_WoRMS = '274290';
      id_Taxo = '46948';        
      id_EoL = '206715';
      id_fishbase = taxon_fish;
       
    case 'Reinhardtius_hippoglossoides'
      id_CoL = 'c4292d462182240f592370e0ef60a08f';
      id_WoRMS = '127144';
      id_Taxo = '46967';        
      id_EoL = '223542';
      id_fishbase = taxon_fish;
       
    case 'Hippoglossoides_elassodon'
      id_CoL = '9c358cae75ba9dbe90de2174e63fc164';
      id_WoRMS = '274289';
      id_Taxo = '46940';
      id_EoL = '46570098';
      id_fishbase = taxon_fish;
       
    case 'Glyptocephalus_cynoglossus'
      id_CoL = 'bdb069c61c221a0f307446fb7b95af91';
      id_WoRMS = '127136';
      id_Taxo = '46938';        
      id_EoL = '216879';
      id_fishbase = taxon_fish;
       
    case 'Microstomus_kitt'
      id_CoL = '7203eb81dc39b374d6e2833224b87bab';
      id_WoRMS = '127140';
      id_Taxo = '46954';        
      id_EoL = '208740';
      id_fishbase = taxon_fish;
       
    case 'Hypsopsetta_guttulata'
      id_CoL = '00ca06e298143557d74785c5ebe41ca5';
      id_WoRMS = '281128';
      id_Taxo = '421966';        
      id_EoL = '995096';
      id_fishbase = taxon_fish;
              
    case 'Lepidopsetta_polyxystra'
      id_CoL = 'bf120c77afc6ed8b3cc3d9cc0356cd91';
      id_WoRMS = '281307';
      id_Taxo = '178396'; 
      id_EoL = '46570162';
      id_fishbase = taxon_fish;
              
    case 'Lepidopsetta_bilineata'
      id_CoL = 'c0ce843618e932cdfeeab45274ff655b';
      id_WoRMS = '281305';
      id_Taxo = '178394'; 
      id_EoL = '46570160';
      id_fishbase = taxon_fish;
              
    case 'Pleuronectes_platessa'
      id_CoL = '27a6782add287c044111388cc4996f04';
      id_WoRMS = '127143';
      id_Taxo = '46963';        
      id_EoL = '208483';
      id_fishbase = taxon_fish;
       
    case 'Limanda_limanda'
      id_CoL = '56f0252000b66dd5b8afb1db11ea325e';
      id_WoRMS = '127139';
      id_Taxo = '46950';        
      id_EoL = '993992';
      id_fishbase = taxon_fish;
       
    case 'Limanda_ferruginea'
      id_CoL = '04db571e4e47c5e9caa0a788e21cb419';
      id_WoRMS = '158879';
      id_Taxo = '178824';        
      id_EoL = '205418';
      id_fishbase = taxon_fish;
       
    case 'Platichthys_stellatus'
      id_CoL = '053a76755a17dcb950ac3c94f3b8ea0c';
      id_WoRMS = '154781';
      id_Taxo = '46959';        
      id_EoL = '214641';
      id_fishbase = taxon_fish;
       
    case 'Liopsetta_pinnifasciata'
      id_CoL = 'c063a57c9a418e9e4b799b4a63d54986';
      id_WoRMS = '275845';
      id_Taxo = '178922';        
      id_EoL = '46570131';
      id_fishbase = taxon_fish;
       
    case 'Eopsetta_jordani'
      id_CoL = '32b003f6327e031ba2d9ee633b9eac55';
      id_WoRMS = '280690';
      id_Taxo = '173833';        
      id_EoL = '46570151';
      id_fishbase = taxon_fish;
       
    case 'Oreochromis_niloticus'
      id_CoL = '9ddda31044c5b5e86eca800592b8473f';
      id_WoRMS = '293639';
      id_Taxo = '46085';        
      id_EoL = '356343';
      id_fishbase = taxon_fish;
       
    case 'Amphilophus_citrinellus'
      id_CoL = '754eb93ce03aba02ea96e71c02abfca5';
      id_WoRMS = ''; % not present 2019/05/25
      id_Taxo = '160723';        
      id_EoL = '608445';
      id_fishbase = taxon_fish;
       
    case 'Oryzias_latipes'
      id_CoL = '481dc2e4f470b63f53970ca5815f9c4e';
      id_WoRMS = '281941';
      id_Taxo = '44560';   
      id_EoL = '211215';
      id_ADW = ''; % not present 2017/09/22
      id_fishbase = taxon_fish;
       
    case 'Belone_belone'
      id_CoL = '6b4ff497ef77437ec9fad307c08c99a6';
      id_WoRMS = '126375';
      id_Taxo = '44420';        
      id_EoL = '212567';
      id_fishbase = taxon_fish;
       
    case 'Scomberesox_saurus'
      id_CoL = '04e30099e2a918306db15251f0d23554';
      id_WoRMS = '236461';
      id_Taxo = '44428';        
      id_EoL = '2457297';
      id_fishbase = taxon_fish;
       
    case 'Hirundichthys_affinis'
      id_CoL = 'dcc59c1ff44e5086c007ead8f39618f7';
      id_WoRMS = '159265';
      id_Taxo = '176743';   
      id_EoL = '205173';
      id_Wiki = 'Hirundichthys';
      id_fishbase = taxon_fish;
       
    case 'Hyporhamphus_picarti'
      id_CoL = '99f59f1b71c2a9e91d3ab227b0275748';
      id_WoRMS = '126390';
      id_Taxo = '177191';   
      id_EoL = '46566999';
      id_Wiki = 'Hyporhamphus';
      id_fishbase = taxon_fish;
       
    case 'Hyporhamphus_australis'
      id_CoL = '690bde96c719bd6e35e3c981b31b0196';
      id_WoRMS = '272179';
      id_Taxo = '177171'; 
      id_EoL = '46567009';
      id_Wiki = 'Hyporhamphus';
      id_fishbase = taxon_fish;
       
    case 'Hyporhamphus_regularis'
      id_CoL = '7b791ec9b61e99213a93f4ed928bd23b';
      id_WoRMS = '293615';
      id_Taxo = '192875';
      id_EoL = '46567030';
      id_Wiki = 'Hyporhamphus';
      id_fishbase = taxon_fish;
       
    case 'Arrhamphus_sclerolepis'
      id_CoL = '47d002b2a5a8318dc2d9d79e98e53b22';
      id_WoRMS = '293547';
      id_Taxo = '161810'; 
      id_EoL = '356954';
      id_fishbase = taxon_fish;
       
    case 'Kryptolebias_marmoratus'
      id_CoL = '8c24a2a18bf61d804420086edc99c306';
      id_WoRMS = '314719';
      id_EoL = '209382';
      id_Taxo = '691145';        
      id_fishbase = taxon_fish;
       
    case 'Poecilia_reticulata'
      id_CoL = '1a2112979142994cc7c0ac7710256715';
      id_WoRMS = '154400';
      id_EoL = '208520';
      id_Taxo = '44613';        
      id_fishbase = taxon_fish;
       
    case 'Quintana_atrizona'
      id_CoL = '8b3fdbc91b147cc8e1d38ce76c14c0c9';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '218128';
      id_Taxo = '185682';        
      id_fishbase = taxon_fish;
       
    case 'Limia_vittata'
      id_CoL = 'f6eb84b770aec1fd4a795954d12d0109';
      id_WoRMS = '281357'; 
      id_EoL = '46377016';
      id_Taxo = '178848';        
      id_fishbase = taxon_fish;
 
    case 'Gambusia_puncticulata'
      id_CoL = '117756501c778f52fc164e987e7268dc';
      id_WoRMS = '276140'; 
      id_EoL = '222492';
      id_Taxo = '192857';        
      id_fishbase = taxon_fish;
      id_Wiki = 'Gambusia';
 
    case 'Gambusia_punctata'
      id_CoL = '633eec83b8d07c3d5409cbd191baec73';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '604097';
      id_Taxo = '174700';        
      id_fishbase = taxon_fish;
 
    case 'Gambusia_holbrooki'
      id_CoL = 'aba63b0655fd06bdbeb4ff233f307ce0';
      id_WoRMS = '276134';
      id_EoL = '46566800';
      id_Taxo = '174687';        
      id_fishbase = taxon_fish;
 
    case 'Girardinus_metallicus'
      id_CoL = '2be6eac6f0550837097a82c9c89c211e';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '1012105';
      id_Taxo = '174976';        
      id_fishbase = taxon_fish;
 
    case 'Girardinus_uninotatus'
      id_CoL = 'e5beadb04ff9ab7f95e76dbe5e85caa9';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '605235';
      id_Taxo = '174978';        
      id_fishbase = taxon_fish;
      id_Wiki = 'Girardinus';
 
    case 'Girardinus_creolus'
      id_CoL = 'cbd5015bfb141aaa03fd3c1a1655856c';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '604695';
      id_Taxo = '174972';        
      id_fishbase = taxon_fish;
      id_Wiki = 'Girardinus';
 
    case 'Girardinus_denticulatus'
      id_CoL = '23bdd1b442cf1404155914fc772fcd90';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '620749';
      id_Taxo = '174974';        
      id_fishbase = taxon_fish;
      id_Wiki = 'Girardinus';
 
    case 'Girardinus_microdactylus'
      id_CoL = 'd5e3fe981e4a00bc9abd3c5b72a4b074';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '219365';
      id_Taxo = '174977';        
      id_fishbase = taxon_fish;
      id_Wiki = 'Girardinus';
 
    case 'Girardinus_falcatus'
      id_CoL = '23450aa78b79ca6952f504379e74d2ed';
      id_WoRMS = ''; % not present 2018/08/02
      id_EoL = '604928';
      id_Taxo = '174975';        
      id_fishbase = taxon_fish;
 
    case 'Fundulus_parvipinnis'
      id_CoL = '82819be2c39fe801b954e6db2c2102bf';
      id_WoRMS = '276032';
      id_Taxo = '44519';        
      id_EoL = '46566780';
      id_fishbase = taxon_fish;
              
    case 'Aphanius_fasciatus'
      id_CoL = 'ca3b317c12ad025398bec05b234d8a98';
      id_WoRMS = '126428';
      id_Taxo = '44467';        
      id_EoL = '223483';
      id_fishbase = taxon_fish;
              
    case 'Cyprinodon_variegatus'
      id_CoL = '9455eb6733d792fa7da1732b9fe90df4';
      id_WoRMS = '159285';
      id_Taxo = '44509';        
      id_EoL = '47062390';
      id_fishbase = taxon_fish;
              
    case 'Nothobranchius_furzeri'
      id_CoL = '122b5c294fd8d0d77e50831f6c089e15';
      id_WoRMS = '1013134'; 
      id_Taxo = '181385';        
      id_EoL = '218173';
      id_fishbase = taxon_fish;
       
    case 'Nothobranchius_kadleci'
      id_CoL = '3badcb4c79813f005161513d913413a5';
      id_WoRMS = '1008133'; 
      id_Taxo = '44522'; % only present at genus level 2017/10/13      
      id_EoL = '23931';  % only present at genus level 2017/10/13
      id_fishbase = taxon_fish;
      id_Wiki = 'Nothobranchius';
      id_ADW = ''; % not present at 2017/10/13
       
    case 'Fundulopanchax_gardneri'
      id_CoL = '9a7a5e7cb389be07278cf6ebc8e3bcb5';
      id_WoRMS = '1013634';
      id_Taxo = ''; % not working at 2017/10/19      
      id_EoL = '216582';  
      id_fishbase = taxon_fish;
       
    case 'Atherina_presbyter'
      id_CoL = '8aa69a96e25e63f574382883df9016f5';
      id_WoRMS = '272030';
      id_Taxo = '44697';        
      id_EoL = '46324757';
      id_fishbase = taxon_fish;
       
    case 'Atherina_boyeri'
      id_CoL = '34b3983742d71490711145acab03c685';
      id_WoRMS = '272027';
      id_Taxo = '44694';        
      id_EoL = '46566595';
      id_fishbase = taxon_fish;
       
    case 'Menidia_beryllina'
      id_CoL = '8343a66e0b2f4b2a580dbda16dd0670e';
      id_WoRMS = '159227';
      id_Taxo = '44708';        
      id_EoL = '46566700';
      id_fishbase = taxon_fish;
       
    case 'Odontesthes_argentinensis'
      id_CoL = '0db3b2961f497af320f9c0e715bba7c6';
      id_WoRMS = '281824';
      id_Taxo = '181637';        
      id_EoL = '46566583';
      id_fishbase = taxon_fish;
      id_Wiki = 'Odontesthes';
       
    case 'Chromis_chromis'
      id_CoL = '3ea36d06fa4400de11f0f6fbaf5c7bde';
      id_WoRMS = '127000';
      id_Taxo = '46264';        
      id_EoL = '1012133';
      id_fishbase = taxon_fish;
       
    case 'Pomacentrus_amboinensis'
      id_CoL = '6cfb8cc5f6926f969c43509aec117a87';
      id_WoRMS = '277132';
      id_Taxo = '184427';        
      id_EoL = '219498';
      id_fishbase = taxon_fish;
       
    case 'Pomacentrus_coelestis'
      id_CoL = '1a3fe094fb5ff6e1065a36c41e392fc0';
      id_WoRMS = '277145';
      id_Taxo = '184439';        
      id_EoL = '212891';
      id_fishbase = taxon_fish;
       
    case 'Chelon_labrosus'
      id_CoL = '78be26413dd8d85e73278dd3188eab9f';
      id_WoRMS = '126977';
      id_Taxo = '46293';        
      id_EoL = '994736';
      id_fishbase = taxon_fish;
      
    case 'Mugil_liza'
      id_CoL = 'c2ffb086cc717f96d1e9052b93ccf03d';
      id_WoRMS = '273655';
      id_Taxo = '180429'; 
      id_EoL = '46571524';
      id_fishbase = taxon_fish;
     
    case 'Hyperprosopon_argenteum'
      id_CoL = 'f07fca381a2786399b3a5462dded3e09';
      id_WoRMS = '281098';
      id_Taxo = '177026';        
      id_EoL = '177026';
      id_fishbase = taxon_fish;
       
    case 'Pseudochromis_flavivertex'
      id_CoL = 'b697a0538b3401dbaae2a64b561eb983';
      id_WoRMS = '218331';
      id_Taxo = '105954';        
      id_EoL = '210814';
      id_fishbase = taxon_fish;
       
    case 'Lepadogaster_lepadogaster'
      id_CoL = 'e51f4ae6bb47355df4b30132303ea92b';
      id_WoRMS = '126518';
      id_Taxo = '435688';        
      id_EoL = '219610';
      id_fishbase = taxon_fish;
       
    case 'Parablennius_ruber'
      id_CoL = '9386eb92555dee139dce61caa84022e8';
      id_WoRMS = '126774';
      id_Taxo = '182612';        
      id_EoL = '988226';
      id_fishbase = taxon_fish;
       
    case 'Lipophrys_pholis'
      id_CoL = '12a70aeb24ecc66da3b1f69ab0ee6002';
      id_WoRMS = '126768';
      id_Taxo = '178995';        
      id_EoL = '222239';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present at 2017/12/20
 
    case 'Gerres_equulus'
      id_CoL = '23cd92cc305ff9a3bf3649785c8e464b';
      id_WoRMS = '276956';
      id_Taxo = '174882';        
      id_EoL = '215866';
      id_fishbase = taxon_fish;
       
    case 'Ammodytes_marinus'
      id_CoL = '758e987be94f3dece0f59cbfc8de1256';
      id_WoRMS = '126751';
      id_Taxo = '160649';        
      id_EoL = '46573103';
      id_fishbase = taxon_fish;
       
    case 'Pseudopercis_semifasciata'
      id_CoL = 'd3a78f0f1b21a55c1c5bde9cfd340746';
      id_WoRMS = '282463';
      id_Taxo = '185249';        
      id_EoL = '46573471';
      id_fishbase = taxon_fish;
       
    case 'Uranoscopus_scaber'
      id_CoL = '441e78c3a3b763923fda47d897dae3f2';
      id_WoRMS = '127093';
      id_Taxo = '46399';        
      id_EoL = '210202';
      id_fishbase = taxon_fish;
       
    case 'Achoerodus_viridis'
      id_CoL = '1004ac3c0d8d6bd825bbe8058bc5c012';
      id_WoRMS = '279498';
      id_Taxo = '160085';        
      id_EoL = '208164';
      id_fishbase = taxon_fish;
       
    case 'Semicossyphus_pulcher'
      id_CoL = '69686c930aaba39a3bdb90083af535ad';
      id_WoRMS = '282753';
      id_Taxo = '187392';        
      id_EoL = '218416';
      id_fishbase = taxon_fish;
       
    case 'Symphodus_tinca'
      id_CoL = '8c6c24b74dfd8de31c404d04113a3a34';
      id_WoRMS = '273575';
      id_Taxo = '188440';        
      id_EoL = '46571686';
      id_fishbase = taxon_fish;
      
    case 'Symphodus_roissali'
      id_CoL = '24c14aee206f924ba341e886ffa64c6e';
      id_WoRMS = '273573';
      id_Taxo = '188438';        
      id_EoL = '46571684';
      id_fishbase = taxon_fish;
       
    case 'Symphodus_melops'
      id_CoL = '4cf7b67b3929f7ae74e7ea0cd5276a0b';
      id_WoRMS = '273571';
      id_Taxo = '169984';        
      id_EoL = '46571682';
      id_fishbase = taxon_fish;
      
    case 'Coris_julis'
      id_CoL = '11766e5b02992c2d10fd9790d91f1b25';
      id_WoRMS = '126963';
      id_Taxo = '46338';        
      id_EoL = '46571633';
      id_fishbase = taxon_fish;
       
    case 'Labrus_merula'
      id_CoL = 'dfb19f6cf2b4978be3673a8e893e08a7';
      id_WoRMS = '126967';
      id_Taxo = '178026';        
      id_EoL = '46571664';
      id_fishbase = taxon_fish;
       
    case 'Bodianus_frenchii'
      id_CoL = 'b70550ceac79f927e53216c5c8d9fc63';
      id_WoRMS = '273531';
      id_Taxo = '164322';        
      id_EoL = '46571603';
      id_fishbase = taxon_fish;
       
    case 'Centrolabrus_exoletus'
      id_CoL = '4769e547b6100cd1a0eb0e4d77b330a2';
      id_WoRMS = '126961';
      id_Taxo = '166711';        
      id_EoL = '46571630';
      id_fishbase = taxon_fish;
      id_Wiki = 'Centrolabrus';
       
    case 'Ctenolabrus_rupestris'
      id_CoL = '7b6b584b7972c33302b71be19e24f5f3';
      id_WoRMS = '126964';
      id_Taxo = '46343';        
      id_EoL = '46571661';
      id_fishbase = taxon_fish;
       
    case 'Scarus_rivulatus'
      id_CoL = 'a24e12b8849c60c6bae0e11830e8933d';
      id_WoRMS = '127045';
      id_Taxo = '186707';        
      id_EoL = '46572675';
      id_fishbase = taxon_fish;
       
    case 'Sillago_robusta'
      id_CoL = 'ccf1319f9ed562822d9c53a2a2655dec';
      id_WoRMS = '273952';
      id_Taxo = '187658';        
      id_EoL = '46579909';
      id_fishbase = taxon_fish;
       
    case 'Sillago_bassensis'
      id_CoL = 'c3372da51069d6728e93a5ec6c453cae';
      id_WoRMS = '273936';
      id_Taxo = '187642';        
      id_EoL = '46579893';
      id_fishbase = taxon_fish;
       
    case 'Dicentrarchus_labrax'
      id_CoL = '9d082a4d12bd05ee5b2050d56a4d052d';
      id_WoRMS = '126975';
      id_Taxo = '173131';        
      id_EoL = '224729';
      id_fishbase = taxon_fish;
       
    case 'Morone_americana'
      id_CoL = '05e97f693d6eaadb217bc3cf095d0a01';
      id_WoRMS = '151177';
      id_Taxo = '180398';        
      id_EoL = '46578727';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/04/29
       
    case 'Platax_orbicularis'
      id_CoL = 'f28ff72a2191ac0ee807ce87547e057b';
      id_WoRMS = '218711';
      id_Taxo = '45379';        
      id_EoL = '204387';
      id_fishbase = taxon_fish;
       
    case 'Chaetodon_larvatus'
      id_CoL = '6f795a109a33b29662c4c42498b46600';
      id_WoRMS = '218716';
      id_Taxo = '45422';        
      id_EoL = '222088';
      id_fishbase = taxon_fish;
       
    case 'Sciaena_umbra'
      id_CoL = '27622ae481976a389f0364896073477f';
      id_WoRMS = '127010';
      id_Taxo = '187003';        
      id_EoL = '1000297';
      id_fishbase = taxon_fish;
       
    case 'Argyrosomus_regius'
      id_CoL = '27622ae481976a389f0364896073477f';
      id_WoRMS = '127007';
      id_Taxo = '161639';        
      id_EoL = '203937';
      id_fishbase = taxon_fish;
       
    case 'Argyrosomus_japonicus'
      id_CoL = 'a378907f00e22aede10dc131fc61b387';
      id_WoRMS = '218633';
      id_Taxo = '161638';        
      id_EoL = '46578924';
      id_fishbase = taxon_fish;
       
    case 'Umbrina_canariensis'
      id_CoL = 'cb0b0011f11279685bf5052380e12c70';
      id_WoRMS = '127011';
      id_Taxo = '189713';        
      id_EoL = '46578942';
      id_fishbase = taxon_fish;
       
    case 'Macrodon_atricauda'
      id_CoL = '8425b4f144f715084e4c2bf8816adeb1';
      id_WoRMS = '159312';
      id_Taxo = '191221'; % present at genus level 2019/01/09       
      id_EoL = '46579152';
      id_fishbase = taxon_fish;
      id_Wiki = 'Sciaenidae';
      id_ADW = 'Macrodon';
       
    case 'Cynoscion_nebulosus'
      id_CoL = '9fe808c1240cff056a1743bbf74b1cd1';
      id_WoRMS = '712737';
      id_Taxo = '172632';    
      id_EoL = '46578976';
      id_fishbase = taxon_fish;
       
    case 'Cynoscion_othonopterus'
      id_CoL = '6a9bd783302b8ff4ea514a73ca80d923';
      id_WoRMS = '276084';
      id_Taxo = '690720';    
      id_EoL = '46578988';
      id_fishbase = taxon_fish;
       
    case 'Atractoscion_nobilis'
      id_CoL = '0fb458c98184e0325f005638b22fe2c3';
      id_WoRMS = '234781';
      id_Taxo = '162587';      
      id_EoL = '46579091';
      id_fishbase = taxon_fish;
       
    case 'Pogonias_cromis'
      id_CoL = 'bd7875015156e33be949008a8c4c1afa';
      id_WoRMS = '159333';
      id_Taxo = '184254';      
      id_EoL = '46579058';
      id_fishbase = taxon_fish;
       
    case 'Stellifer_lanceolatus'
      id_CoL = '83b0f55aa983c2e1d2fdc880eba6e7ba';
      id_WoRMS = '159337';
      id_Taxo = '188137';      
      id_EoL = '46579062';
      id_fishbase = taxon_fish;
       
    case 'Larimichthys_polyactis'
      id_CoL = 'ad2cefbece6db85c4debc88b4b497808';
      id_WoRMS = '281273';
      id_Taxo = '178199';      
      id_EoL = '46579145';
      id_fishbase = taxon_fish;
       
    case 'Acanthurus_lineatus'
      id_CoL = '72076057c0ddd13f26566ef47ca0f806';
      id_WoRMS = '159582';
      id_Taxo = '159956';        
      id_EoL = '208629';
      id_fishbase = taxon_fish;
       
    case 'Acanthurus_olivaceus'
      id_CoL = '184220753935633dfd76a44124f9eb9f';
      id_WoRMS = '219625';
      id_Taxo = '159966';        
      id_EoL = '211479';
      id_fishbase = taxon_fish;
       
    case 'Ctenochaetus_striatus'
      id_CoL = 'd0a5c174287d9a41401d44fd76ea47a9';
      id_WoRMS = '219659';
      id_Taxo = '172382';        
      id_EoL = '208556';
      id_fishbase = taxon_fish;
       
    case 'Ctenochaetus_binotatus'
      id_CoL = '60fcbde4e9f5e42c8ea170aa94d7c03a';
      id_WoRMS = '219655';
      id_Taxo = '172377';        
      id_EoL = '46577093';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2019/03/09

    case 'Zebrasoma_scopas'
      id_CoL = '4120d1be7736b044565798994f885c30';
      id_WoRMS = '219679';
      id_Taxo = '190229';        
      id_EoL = '204517';
      id_fishbase = taxon_fish;
       
    case 'Naso_brevirostris'
      id_CoL = '14f067280f37ccc47cfca4d4c77d78e9';
      id_WoRMS = '219671';
      id_Taxo = '180806';        
      id_EoL = '213852';
      id_fishbase = taxon_fish;
       
    case 'Naso_hexacanthus'
      id_CoL = '0c44bef6df412078dc9d79bf4aea957c';
      id_WoRMS = '219667';
      id_Taxo = '180811';        
      id_EoL = '213496';
      id_fishbase = taxon_fish;
       
    case 'Naso_tuberosus'
      id_CoL = 'f9f4b124898fab8fa2a035aa2c88606c';
      id_WoRMS = '219675';
      id_Taxo = '180820';        
      id_EoL = '212381';
      id_fishbase = taxon_fish;
       
    case 'Naso_unicornis'
      id_CoL = 'b0550abec0ef9ad62702f1b462928cf3';
      id_WoRMS = '219668';
      id_Taxo = '46736';        
      id_EoL = '213498';
      id_fishbase = taxon_fish;
       
    case 'Naso_vlamingii'
      id_CoL = '93cc53b4d96f8af60aaaf9b672c98b6f';
      id_WoRMS = '219672';
      id_Taxo = '180821';        
      id_EoL = '213847';
      id_fishbase = taxon_fish;
       
    case 'Prionurus_maculatus'
      id_CoL = '8e93ea02a76329aafcf142608f63878c';
      id_WoRMS = '282347';
      id_Taxo = '184744';        
      id_EoL = '209570';
      id_fishbase = taxon_fish;
       
    case 'Pomacanthus_imperator'
      id_CoL = 'a6e16382a753b4b86e9662ada4e78f14';
      id_WoRMS = '220001';
      id_Taxo = '45410';        
      id_EoL = '205824';
      id_fishbase = taxon_fish;
       
    case 'Pomadasys_kaakan'
      id_CoL = 'e6586b781394752bbe31e3b18d3f1625';
      id_WoRMS = '218566';
      id_Taxo = '184494';        
      id_EoL = '46578439';
      id_fishbase = taxon_fish;
       
    case 'Conodon_nobilis'
      id_CoL = '18a3c8551b90518c351eb1bc4577f562';
      id_WoRMS = '280386';
      id_Taxo = '171646';        
      id_EoL = '46578514';
      id_fishbase = taxon_fish;
       
    case 'Rhomboplites_aurorubens'
      id_CoL = 'b9d5b0f6c64a46e37447d7931d5ff0b0';
      id_WoRMS = '159807';
      id_Taxo = '186083';        
      id_EoL = '46580805';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_analis'
      id_CoL = 'b908bf992e3582b57d6916c6535cb463';
      id_WoRMS = '159792';
      id_Taxo = '179207';        
      id_EoL = '46580720';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_fulviflamma'
      id_CoL = '4014e54315e91f4329bbdd5601dd1b9f';
      id_WoRMS = '218490';
      id_Taxo = '106193';        
      id_EoL = '211149';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_guttatus'
      id_CoL = '6d5cc9613dc89d594af6927ac562202c';
      id_WoRMS = '276539';
      id_Taxo = '179225'; 
      id_Wiki = 'Lutjanus';
      id_EoL = '212586';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_erythropterus'
      id_CoL = '716ae6a1a5da632263a3c0d53c2235a7';
      id_WoRMS = '276534';
      id_Taxo = '179219'; 
      id_EoL = '46580769';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_malabaricus'
      id_CoL = '422bf7d1572b34f7446104ceb12e6ab6';
      id_WoRMS = '218481';
      id_Taxo = '106184'; 
      id_EoL = '46580738';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_sebae'
      id_CoL = '3cbd773f6585ec11cab26d0006e098e0';
      id_WoRMS = '218499';
      id_Taxo = '106182'; 
      id_EoL = '46580753';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_carponotatus'
      id_CoL = '2f9ca6ea7842044ea7876e43966fe886';
      id_WoRMS = '276528';
      id_Taxo = '179212'; 
      id_EoL = '46580763';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_vitta'
      id_CoL = '6296559cca2244e0abed0807f1eb0a73';
      id_WoRMS = '218483';
      id_Taxo = '106211'; 
      id_EoL = '46580740';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_synagris'
      id_CoL = '0d52f277956a6c7dbfdd4e57c4d83a1c';
      id_WoRMS = '159800';
      id_Taxo = '106201'; 
      id_EoL = '46580728';
      id_fishbase = taxon_fish;
       
    case 'Lutjanus_kasmira'
      id_CoL = '9217dc7aa96a036421ad10e2add9cada';
      id_WoRMS = '218482';
      id_Taxo = '106186'; 
      id_EoL = '46580739';
      id_fishbase = taxon_fish;
       
    case 'Caulolatilus_affinis'
      id_CoL = 'eeccbebf9cae12227abbaef27701fa0a';
      id_WoRMS = '367211';
      id_Taxo = '166655'; 
      id_EoL = '46580671';
      id_fishbase = taxon_fish;
       
    case 'Lobotes_surinamensis'
      id_CoL = '4d5106709e150cd3aa658259a8fd12b6';
      id_WoRMS = '126973';
      id_Taxo = '45277';        
      id_EoL = '210336';
      id_fishbase = taxon_fish;
       
    case 'Dentex_dentex'
      id_CoL = '470a9807241f414f99aaed0d85d65ec6';
      id_WoRMS = '273962';
      id_Taxo = '172982';        
      id_EoL = '205454';
      id_fishbase = taxon_fish;
       
    case 'Pagellus_erythrinus'
      id_CoL = 'cf65e6afffa559b72e5b5b8afebdae91';
      id_WoRMS = '127060';
      id_Taxo = '45317';        
      id_EoL = '223570';
      id_fishbase = taxon_fish;
       
    case 'Pagellus_acarne'
      id_CoL = '25a72fc08aff62715178570d51b0a750';
      id_WoRMS = '127057';
      id_Taxo = '182483';        
      id_EoL = '223565';
      id_fishbase = taxon_fish;
       
    case 'Sparus_aurata'
      id_CoL = '0ef59679adc50c75a369c2b291f7e32f';
      id_WoRMS = '151523';
      id_Taxo = '159658';        
      id_EoL = '587825';
      id_fishbase = taxon_fish;
       
    case 'Rhabdosargus_sarba'
      id_CoL = '45f97694d4d683203a2672eba321d406';
      id_WoRMS = '218621';
      id_Taxo = '185878';        
      id_EoL = '46580010';
      id_fishbase = taxon_fish;
       
    case 'Argyrozona_argyrozona'
      id_CoL = '45f97694d4d683203a2672eba321d406';
      id_WoRMS = '218621';
      id_Taxo = '185878';        
      id_EoL = '46580010';
      id_fishbase = taxon_fish;
      id_Wiki = 'Sparidae';
       
    case 'Diplodus_puntazzo'
      id_CoL = '7be95da2081d27bd05a0d13a5a9ba2f2';
      id_WoRMS = '127052';
      id_Taxo = '173233';  
      id_EoL = '205144';
      id_Wiki = 'Diplodus';
      id_fishbase = taxon_fish;
       
    case 'Diplodus_sargus'
      id_CoL = 'd7c82b110a4ddb3f3ec6a7876662f354';
      id_WoRMS = '127053';
      id_Taxo = '192585';  
      id_EoL = '205145';
      id_fishbase = taxon_fish;
       
    case 'Diplodus_annularis'
      id_CoL = 'adc5fcec221232e4c03fb415e027699d';
      id_WoRMS = '127049';
      id_Taxo = '173221';  
      id_EoL = '46579944';
      id_Wiki = 'Diplodus';
      id_fishbase = taxon_fish;
       
    case 'Diplodus_vulgaris'
      id_CoL = '67692e777d71e07afdf2b4974392c989';
      id_WoRMS = '127054';
      id_Taxo = '173241';  
      id_EoL = '46579947';
      id_fishbase = taxon_fish;
       
    case 'Diplodus_cervinus'
      id_CoL = '9ead387265ac34179f4c9a11225fe7d9';
      id_WoRMS = '127051';
      id_Taxo = '192584';  
      id_EoL = '994779';
      id_fishbase = taxon_fish;
       
    case 'Pagrus_auriga'
      id_CoL = '54bfa9f0864bd23c264ea70785be1d0a';
      id_WoRMS = '127061';
      id_Taxo = '182494';  
      id_EoL = '46579970';
      id_fishbase = taxon_fish;
      id_Wiki = 'Pagrus';
       
    case 'Lithognathus_mormyrus'
      id_CoL = '047182f721da243ddbd80be9f0ecba41';
      id_WoRMS = '127055';
      id_Taxo = '179018';        
      id_EoL = '204487';
      id_fishbase = taxon_fish;
       
    case 'Boops_boops'
      id_CoL = 'fb99b92f46db65d7f8a22d33ee501f04';
      id_WoRMS = '127047';
      id_Taxo = '164378';        
      id_EoL = '203866';
      id_fishbase = taxon_fish;
       
    case 'Acanthopagrus_berda'
      id_CoL = '743fc93b06d76f028c95835e6bd733e0';
      id_WoRMS = '218588';
      id_Taxo = '159910';        
      id_EoL = '220571';
      id_fishbase = taxon_fish;
       
    case 'Acanthopagrus_schlegelii'
      id_CoL = 'db8d678d939a38c8c3679e190f73ee97';
      id_WoRMS = '293535';
      id_Taxo = '654657';      
      id_EoL = '1156465';
      id_fishbase = taxon_fish;
       
    case 'Spicara_smaris'
      id_CoL = '53c2f9408b4c34eda0a739e9a9430f93';
      id_WoRMS = '126830';
      id_Taxo = '187957';        
      id_EoL = '46578160';
      id_fishbase = taxon_fish;
       
    case 'Sarpa_salpa'
      id_CoL = '05b554ca1fa7f7b2f64aff585f3dcfa2';
      id_WoRMS = '127064';
      id_Taxo = '186591';        
      id_EoL = '46579976';
      id_fishbase = taxon_fish;
       
    case 'Siganus_sutor'
      id_CoL = 'b95005208d28f9fbdc4c90a74e502fae';
      id_WoRMS = '219688';
      id_Taxo = '187610';   
      id_EoL = '214690';
      id_fishbase = taxon_fish;
       
    case 'Siganus_rivulatus'
      id_CoL = 'fea6b49867b16f780abfbee94b4c55a2';
      id_WoRMS = '219688';
      id_Taxo = '46750';   
      id_EoL = '46577144';
      id_fishbase = taxon_fish;
       
    case 'Scatophagus_argus'
      id_CoL = 'ff1b84d7b315c0069609d5e1b7d2b37c';
      id_WoRMS = '127045';
      id_Taxo = '45387';        
      id_EoL = '206741';
      id_fishbase = taxon_fish;
       
    case 'Priacanthus_macracanthus'
      id_CoL = '464de607d945097ad6b06e525e70a826';
      id_WoRMS = '273765';
      id_Taxo = '45154'; 
      id_Wiki = 'Priacanthus';
      id_EoL = '223361';
      id_fishbase = taxon_fish;
       
    case 'Cepola_macrophthalma'
      id_CoL = '4003b910e51d1b2a457cf9411ecb6f06';
      id_WoRMS = '126835';
      id_Taxo = '166809';
      id_EoL = '46578168';
      id_fishbase = taxon_fish;
       
    case 'Capros_aper'
      id_CoL = '2b3383c0bc271b4255f444abc942ded1';
      id_WoRMS = '127419';
      id_Taxo = '44767';        
      id_EoL = '205190';
      id_fishbase = taxon_fish;
       
    case 'Lophius_piscatorius'
      id_CoL = 'df7f154bea778d0e8d2947f93d849f53';
      id_WoRMS = '126555';
      id_Taxo = '44235';        
      id_EoL = '206728';
      id_fishbase = taxon_fish;
       
    case 'Lophius_budegassa'
      id_CoL = 'df7f154bea778d0e8d2947f93d849f53';
      id_WoRMS = '126554';
      id_Taxo = '125346';        
      id_EoL = '46566105';
      id_fishbase = taxon_fish;
       
    case 'Lophius_vomerinus'
      id_CoL = '501a33b1435989e22d3c947e932c045e';
      id_WoRMS = '217839';
      id_Taxo = '179106';        
      id_EoL = '46566109';
      id_fishbase = taxon_fish;
       
    case 'Balistes_vetula'
      id_CoL = '1887ebe145aef2774c5d77da4fd412ee';
      id_WoRMS = '127397';
      id_Taxo = '47004';        
      id_EoL = '217410';
      id_fishbase = taxon_fish;
       
    case 'Stephanolepis_hispidus'
      id_CoL = '4c58e5ea46c3be50d6fb9248acad9887';
      id_WoRMS = '127409';
      id_Taxo = '188197';        
      id_EoL = '46570755';
      id_fishbase = taxon_fish;
       
    case 'Mola_mola'
      id_CoL = 'ad52cc37a5ce66e98b9ba0195b9d8cb7';
      id_WoRMS = '127405';
      id_Taxo = '47097';        
      id_EoL = '213810';
      id_fishbase = taxon_fish;
       
    case 'Masturus_lanceolatus'
      id_CoL = 'db579e2a600935651d7dcab3fbdca00d';
      id_WoRMS = '127404';
      id_Taxo = '47095';        
      id_EoL = '46570740';
      id_fishbase = taxon_fish;
       
    case 'Epigonus_crassicaudus'
      id_CoL = '4ddc755e19a25cf6599609bdba72b6c5'; % unaccepted, to Epigonus chilensis 2019/01/12
      id_WoRMS = '273404';
      id_Taxo = '173853';
      id_Wiki = 'Epigonus';
      id_EoL = '223710';
      id_fishbase = taxon_fish;
       
    case 'Pempheris_adusta'
      id_CoL = 'c50e0567968f7bba0e705a8a7b5a6cc5'; % unaccepted, to Pempheris malabarica
      id_WoRMS = '218704';
      id_Taxo = '183399';
      id_Wiki = 'Pempheris';
      id_EoL = '992582';
      id_fishbase = taxon_fish;
       
    case 'Pempheris_schwenkii'
      id_CoL = 'c0a9eb122361f992e57b9d586d79a8f7';
      id_WoRMS = '218699';
      id_Taxo = '183415';        
      id_Wiki = 'Pempheris';
      id_EoL = '213029';
      id_fishbase = taxon_fish;
       
    case 'Polyprion_americanus'
      id_CoL = 'ea1a9f20125ee6e71171e5704fd0ddef';
      id_WoRMS = '126998';
      id_Taxo = '184389';        
      id_EoL = '46578882';
      id_fishbase = taxon_fish;
       
    case 'Stereolepis_gigas'
      id_CoL = 'fbb7e220478f25a9da089c6b9ff862c1';
      id_WoRMS = '282884';
      id_Taxo = '45099';        
      id_EoL = '209697';
      id_fishbase = taxon_fish;
 
    case 'Scorpis_aequipinnis'
      id_CoL = '669e2d4a2ee936eceae367af494af269';
      id_WoRMS = '282728';
      id_Taxo = '187227';   
      id_EoL = '212881';
      id_fishbase = taxon_fish;
      id_Wiki = 'Scorpis';
       
    case 'Lepomis_cyanellus'
      id_CoL = 'cc83144368365e74204374b9f7db5de9';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '45132';   
      id_EoL = '207660';
      id_fishbase = taxon_fish;
       
    case 'Micropterus_dolomieu'
      id_CoL = '34217446a5151e238d438354bfac2a2a';
      id_WoRMS = ''; % not present 2018/11/06
      id_Taxo = '45141';   
      id_EoL = '207898';
      id_fishbase = taxon_fish;

    case 'Siniperca_chuatsi'
      id_CoL = 'a36128d046eddeb8a877c33efce307e5';
      id_WoRMS = ''; % not present 2019/03/09
      id_Taxo = '187742';   
      id_EoL = '613258';
      id_fishbase = taxon_fish;
       
    case 'Amniataba_caudavittata'
      id_CoL = 'cb63a7cfb1e1534bc235e6780ada2967';
      id_WoRMS = '279585'; 
      id_Taxo = '160683';   
      id_EoL = '46580106';
      id_fishbase = taxon_fish;
       
    case 'Epinephelus_marginatus'
      id_CoL = 'b19367bf6c4b12ca0ea001ea9953c9c9';
      id_WoRMS = '127036';
      id_Taxo = '173912';        
      id_EoL = '206618';
      id_fishbase = taxon_fish;
       
    case 'Epinephelus_morio'
      id_CoL = '677a265846eeb172848cc85fe790d17b';
      id_WoRMS = '159354';
      id_Taxo = '45076';        
      id_EoL = '46579618';
      id_fishbase = taxon_fish;
       
    case 'Epinephelides_armatus'
      id_CoL = '28ffae40f24d18b32842754d8ded2954';
      id_WoRMS = '280694';
      id_Taxo = '173875';        
      id_EoL = '46579558';
      id_fishbase = taxon_fish;
       
    case 'Hyporthodus_octofasciatus'
      id_CoL = 'e80400b0745ddabd6857eb3c44292c05';
      id_WoRMS = '475079';
      id_Taxo = '173917'; % present as Epinephelus octofasciatus 2019/01/20       
      id_EoL = '46579820';
      id_fishbase = taxon_fish;
      id_ADW = 'Epinephelus_octofasciatus';
       
    case 'Serranus_scriba'
      id_CoL = '477173bdd7c8e27ad4631a347f8fd45b';
      id_WoRMS = '127043';
      id_Taxo = '187467';        
      id_EoL = '215470';
      id_fishbase = taxon_fish;
       
    case 'Serranus_cabrilla'
      id_CoL = '45132b4ce679695b0f33e093c4611d44';
      id_WoRMS = '127041';
      id_Taxo = '187452';        
      id_EoL = '46579257';
      id_fishbase = taxon_fish;
       
    case 'Mycteroperca_microlepis'
      id_CoL = '81eab4fd4863aa66aec5d1c51502e361';
      id_WoRMS = '273880';
      id_Taxo = '180508';        
      id_EoL = '46579706';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2018/12/26
       
    case 'Etheostoma_rubrum'
      id_CoL = 'cd940413d451f1edd315917a336613ac';
      id_WoRMS = ''; % not present 2019/05/19
      id_Taxo = '174143';       
      id_EoL = '207266';
      id_fishbase = taxon_fish;

    case 'Etheostoma_cragini'
      id_CoL = 'babfcc28335eaed4e5b556437d7b272c';
      id_WoRMS = ''; % not present 2019/05/19
      id_Taxo = '174086';     
      id_EoL = '207236';
      id_fishbase = taxon_fish;

    case 'Sander_lucioperca'
      id_CoL = '04b433fe83af06d454d86967fc42368f';
      id_WoRMS = '151308';
      id_Taxo = '186511';        
      id_EoL = '222787';
      id_fishbase = taxon_fish;

    case 'Sander_vitreus'
      id_CoL = 'ebc6c3686e0e1e26d0d48746d2e2310c'; 
      id_WoRMS = '275311';
      id_Taxo = '691816';  
      id_EoL = '46580136';
      id_fishbase = taxon_fish;

    case 'Sander_volgensis'
      id_CoL = '27de0409812b65f921b8d2c999d9b9d1'; 
      id_WoRMS = '275312';
      id_Taxo = '186512';  
      id_EoL = '46580137';
      id_fishbase = taxon_fish;

    case 'Zingel_asper'
      id_CoL = '928237a536b61521db1f60ac7b151e4b';
      id_WoRMS = ''; % not present 2019/02/11
      id_Taxo = '45187';        
      id_EoL = '994525';
      id_fishbase = taxon_fish;

    case 'Gymnocephalus_cernuus'
      id_CoL = '349c65df03755f01c50de8bc74868fd5';
      id_WoRMS = '151302';
      id_Taxo = '45187';        
      id_EoL = '46328762';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2017/08/17

    case 'Perca_fluviatilis'
      id_CoL = '593aaa7c79677b093fe94582a14d3f94';
      id_WoRMS = '151353';
      id_Taxo = '45191';        
      id_EoL = '223357';
      id_fishbase = taxon_fish;
       
    case 'Lethrinus_lentjan'
      id_CoL = '3203631074908d9a527ba77431fa9ccb';
      id_WoRMS = '212061';
      id_Taxo = '45205';        
      id_EoL = '46580938';
      id_fishbase = taxon_fish;

    case 'Lethrinus_mahsena'
      id_CoL = '7c78a6683a8f0d94551a65ffaf318f4a';
      id_WoRMS = '212075';
      id_Taxo = '178743';        
      id_EoL = '46580948';
      id_fishbase = taxon_fish;

    case 'Notothenia_coriiceps'
      id_CoL = '0d2d14ff0bfeed9cef3cd477df4e2afd';
      id_WoRMS = '234679';
      id_Taxo = '181460'; 
      id_Wiki = 'Notothenia';
      id_EoL = '204661';
      id_fishbase = taxon_fish;
       
    case 'Patagonotothen_guntheri'
      id_CoL = '2a472a069a11ae0ba30b73b09426ec28';
      id_WoRMS = '234738';
      id_Taxo = '183319'; 
      id_Wiki = 'Patagonotothen';
      id_EoL = '46572959';
      id_fishbase = taxon_fish;
       
    case 'Pleuragramma_antarcticum'
      id_CoL = 'af99906bac4bceb2fcf502c7da342560';
      id_WoRMS = '234721';
      id_Taxo = '184146'; 
      id_EoL = '223358';
      id_fishbase = taxon_fish;
       
    case 'Dissostichus_eleginoides'
      id_CoL = '154e66881d80370ccd181ec51687a41d';
      id_WoRMS = '234700';
      id_Taxo = '146673'; 
      id_EoL = '46573002';
      id_fishbase = taxon_fish;
       
    case 'Dissostichus_mawsoni'
      id_CoL = 'b73b22f988b3ff66f4913cd2de44784a';
      id_WoRMS = '234836';
      id_Taxo = '173319'; 
      id_EoL = '46573003';
      id_fishbase = taxon_fish;
       
    case 'Chaenocephalus_aceratus'
      id_CoL = '3fec63b8bf6a49d4f179180b00a183bc';
      id_WoRMS = '234725';
      id_Taxo = '170312';        
      id_EoL = '205520';
      id_fishbase = taxon_fish;
       
    case 'Platycephalus_fuscus'
      id_CoL = '4c534963503ef6fcc744f3b7e012ee86';
      id_WoRMS = '274658';
      id_Taxo = '183991';        
      id_EoL = '1157162';
      id_fishbase = taxon_fish;
       
    case 'Platycephalus_indicus'
      id_CoL = '2574f36364423658842f266629b2fd69';
      id_WoRMS = '127234';
      id_Taxo = '44962';        
      id_EoL = '46568548';
      id_fishbase = taxon_fish;
       
    case 'Chelidonichthys_lucerna'
      id_CoL = '092eeb046b250e0e6525afb90ea84c57';
      id_WoRMS = '127262';
      id_Taxo = '170737'; % unaccepted, to Chelidonichthys lucernus (C. Linnaeus, 1758)       
      id_EoL = '221983';
      id_fishbase = taxon_fish;
       
    case 'Eutrigla_gurnardus'
      id_CoL = 'b5170e5381219be1eddc144a73d3ac91';
      id_WoRMS = '150637';
      id_Taxo = '380822';        
      id_EoL = '204772';
      id_fishbase = taxon_fish;
       
    case 'Helicolenus_dactylopterus'
      id_CoL = '803335b098e8e3e44e3878928804ab16';
      id_WoRMS = '127251';
      id_Taxo = '192869';        
      id_EoL = '581139';
      id_fishbase = taxon_fish;
       
    case 'Helicolenus_percoides'
      id_CoL = 'bff7063ab0df8e6d3a4a3a075b3081bc';
      id_WoRMS = '274770';
      id_Taxo = '176199';        
      id_EoL = '46568108';
      id_fishbase = taxon_fish;
       
    case 'Sebastes_capensis'
      id_CoL = 'b19afca12efc5ecb316c666067b38a08';
      id_WoRMS = '221446';
      id_Taxo = '187257';        
      id_EoL = '994487';
      id_fishbase = taxon_fish;
       
    case 'Sebastes_rufus'
      id_CoL = '7ed046b51a65f4788cbf76ac78bcf10a';
      id_WoRMS = '274847';
      id_Taxo = '187329';        
      id_EoL = '46568190';
      id_fishbase = taxon_fish;
      id_Wiki = 'Sebastes';
       
    case 'Sebastes_mentella'
      id_CoL = '098ed2020be5cb4129b22933a6acfaad';
      id_WoRMS = '127254';
      id_Taxo = '187298';        
      id_EoL = '46568111';
      id_fishbase = taxon_fish;
       
    case 'Sebastes_minor'
      id_CoL = 'ef96471f05febff80bc2a43d148dfdff';
      id_WoRMS = '274821';
      id_Taxo = '187300';        
      id_EoL = '225643';
      id_fishbase = taxon_fish;
       
    case 'Sebastes_taczanowskii'
      id_CoL = 'b25fc6807f7b532f94877a365a34f317';
      id_WoRMS = '274859';
      id_Taxo = '187341';        
      id_EoL = '46568202';
      id_fishbase = taxon_fish;
       
    case 'Scorpaena_maderensis'
      id_CoL = 'c99cbc6eeb4411b9abf2e5919660975a';
      id_WoRMS = '274721';
      id_Taxo = '187153';        
      id_EoL = '46567904';
      id_fishbase = taxon_fish;
       
    case 'Pontinus_clemensi'
      id_CoL = '45b63d1ed7bfeaab185efc73fc7ba0f9';
      id_WoRMS = '274683';
      id_Taxo = '184525';       
      id_EoL = '46567852';
      id_fishbase = taxon_fish;
       
    case 'Anoplopoma_fimbria'
      id_CoL = '3de38185591bbc2b5e02b8477dcd55ff';
      id_WoRMS = '159463';
      id_Taxo = '44957';        
      id_EoL = '46569739';
      id_fishbase = taxon_fish;
      id_ADW = ''; % not present 2018/12/17
       
    case 'Anarhichas_denticulatus'
      id_CoL = '82231bb18c0352f531625d3a170c6d25';
      id_WoRMS = '126757';
      id_Taxo = '160816';        
      id_EoL = '224968';
      id_fishbase = taxon_fish;
       
    case 'Anarhichas_lupus'
      id_CoL = '1b5a06078230b478e2aac29ce38c6cea';
      id_WoRMS = '126758';
      id_Taxo = '46468';        
      id_EoL = '222376';
      id_fishbase = taxon_fish;
       
    case 'Anarhichas_minor'
      id_CoL = '60f6e3c76d764ab2021b16fbdcb9a6cc';
      id_WoRMS = '126759';
      id_Taxo = '46469';        
      id_EoL = '46574578';
      id_fishbase = taxon_fish;
       
    case 'Zoarces_viviparus'
      id_CoL = 'b17c8f2af4a90b649ca031af1d8ae0fa';
      id_WoRMS = '127123';
      id_Taxo = '44406';        
      id_EoL = '220012';
      id_fishbase = taxon_fish;
       
    case 'Zoarces_elongatus'
      id_CoL = '684b1f9f3f50bdbd8d75a07392857553';
      id_WoRMS = '274153';
      id_Taxo = '190281';        
      id_EoL = '46575085';
      id_fishbase = taxon_fish;
       
    case 'Lycodes_raridens'
      id_CoL = 'e0f10ae7edd9fc53094fa31660d37660';
      id_WoRMS = '254598';
      id_Taxo = '179366';        
      id_EoL = '46574882';
      id_fishbase = taxon_fish;
      id_Wiki = 'Lycodes';
       
    case 'Gymnelus_viridis'
      id_CoL = '4be9fb48a258c87731457b893248656d';
      id_WoRMS = '127096';
      id_Taxo = '175531';        
      id_EoL = '46574735';
      id_fishbase = taxon_fish;
      id_Wiki = 'Gymnelus';
       
    case 'Hadropareia_middendorffii'
      id_CoL = '9ad64b260fd0798daf4620922e3c2b02';
      id_WoRMS = '280970';
      id_Taxo = '691029';        
      id_EoL = '46574781';
      id_fishbase = taxon_fish;
      id_Wiki = 'Zoarcidae';
       
    case 'Stichaeus_punctatus'
      id_CoL = '24ad4f5e0192ab7a0d43614b10a92a59';
      id_WoRMS = '293745';
      id_Taxo = '596144';        
      id_EoL = '217553';
      id_fishbase = taxon_fish;
      id_Wiki = 'Stichaeidae';
       
    case 'Alectrias_alectrolophus'
      id_CoL = 'b480c435ee157258370aa225765b5049';
      id_WoRMS = '279547';
      id_Taxo = '160326';        
      id_EoL = '46574626';
      id_fishbase = taxon_fish;
      id_Wiki = 'Stichaeidae';
       
    case 'Pholis_fangi'
      id_CoL = 'dfd5e2854d9a5d659ade52be070e5a23';
      id_WoRMS = '273688';
      id_Taxo = '691582';        
      id_EoL = '46574589';
      id_fishbase = taxon_fish;
      id_Wiki = 'Pholidae';
       
    case 'Pholis_gunnellus'
      id_CoL = 'ec7a73e2544f27d592aadd1e7c5898dd';
      id_WoRMS = '126996';
      id_Taxo = '46516';        
      id_EoL = '46574584';
      id_fishbase = taxon_fish;
       
    case 'Gasterosteus_aculeatus'
      id_CoL = 'fd99ac97713444a54871ba5ae6555109';
      id_WoRMS = '126505';
      id_Taxo = '44801';        
      id_EoL = '223856';
      id_fishbase = taxon_fish;
       
    case 'Pungitius_pungitius'
      id_CoL = '43d5e58d4d2708e8963ec274963f607d';
      id_WoRMS = '126507';
      id_Taxo = '44805';        
      id_EoL = '206423';
      id_fishbase = taxon_fish;
       
    case 'Hexagrammos_stelleri'
      id_CoL = 'a271bef107ca1c7469adf20324568753';
      id_WoRMS = '254545';
      id_Taxo = '176624';        
      id_EoL = '46568828';
      id_fishbase = taxon_fish;
       
    case 'Hexagrammos_octogrammus'
      id_CoL = '201646c709a2f9096e752b201820818c';
      id_WoRMS = '254544';
      id_Taxo = '176622';        
      id_EoL = '46568827';
      id_fishbase = taxon_fish;
       
    case 'Cyclopterus_lumpus'
      id_CoL = '4445e08822e2ce4fad71ae776c543830';
      id_WoRMS = '127214';
      id_Taxo = '45013';        
      id_EoL = '1011820';
      id_fishbase = taxon_fish;
       
    case 'Scorpaenichthys_marmoratus'
      id_CoL = '397958a0d9074889461f137e4f7e7afc';
      id_WoRMS = '282726';
      id_Taxo = '153452';        
      id_EoL = '212214';
      id_fishbase = taxon_fish;
       
   case 'Myoxocephalus_scorpius'
      id_CoL = 'ea0a01317e2536d0439b2698488001d6';
      id_WoRMS = '127203';
      id_Taxo = '44979';        
      id_EoL = '207351';
      id_fishbase = taxon_fish;
       
     case 'Batrachocottus_baicalensis'
      id_CoL = '488ab9e6f9c58699ca5ba9a4c18d6e7b';
      id_WoRMS = ''; % not present 2019/04/24
      id_Taxo = '163953';    
      id_EoL = '222893';
      id_fishbase = taxon_fish;
       
   case 'Paracottus_knerii'
      id_CoL = '41a6208e1d243598c85991a432ab6b90';
      id_WoRMS = ''; % not present 2019/04/25
      id_Taxo = '182732';    
      id_EoL = '216614';
      id_fishbase = taxon_fish;
       
   case 'Cottus_volki'
      id_CoL = 'df0a6a717e914ac6a9646a8d4b0b7be9';
      id_WoRMS = ''; % not present 2019/03/27
      id_Taxo = '44970'; % present at genus level only      
      id_EoL = '212111';
      id_fishbase = taxon_fish;
       
   case 'Cottus_leiopomus'
      id_CoL = '503ea72fcb271d11bc3092df6a3289a6';
      id_WoRMS = ''; % not present 2019/05/24
      id_Taxo = '172073';      
      id_EoL = '210365';
      id_fishbase = taxon_fish;
       
    case 'Gymnocanthus_herzensteini'
      id_CoL = 'be3425fe9e3cc17c29aeda000b0ac5bd';
      id_WoRMS = '274373';
      id_Taxo = '175537'; 
      id_EoL = '46568959';
      id_fishbase = taxon_fish;
       
    case 'Gymnocanthus_detrisus'
      id_CoL = 'ef70c972f601fd0047c9aecc7f4c748c';
      id_WoRMS = '274372';
      id_Taxo = '175535'; 
      id_EoL = '46568958';
      id_fishbase = taxon_fish;
       
    case 'Gymnocanthus_pistilliger'
      id_CoL = 'd257d550de04b67291c5539117b3ea78';
      id_WoRMS = '254519';
      id_Taxo = '175539'; 
      id_EoL = '46568957';
      id_fishbase = taxon_fish;
       
    case 'Gymnocanthus_intermedius'
      id_CoL = 'be3425fe9e3cc17c29aeda000b0ac5bd';
      id_WoRMS = '274373';
      id_Taxo = '175537'; 
      id_EoL = '46568959';
      id_fishbase = taxon_fish;
       
    case 'Taurocottus_bergii'
      id_CoL = 'b883345f926e07e4eaf52b2e3111415b';
      id_WoRMS = '282937';
      id_Taxo = '605506'; 
      id_EoL = '46569170';
      id_fishbase = taxon_fish;
       
    case 'Latimeria_chalumnae'
      id_CoL = '46ffe2e071c4d553d33e36794a179846';
      id_WoRMS = '217438';
      id_Taxo = '42378';        
      id_EoL = '225251';
      id_fishbase = taxon_fish;
       
    case 'Neoceratodus_forsteri'
      id_CoL = 'f3f583180b1b6979f36e97c7c6a5a23c';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '42340';    
      id_EoL = '339109';
      id_fishbase = taxon_fish;
       
    case 'Protopterus_aethiopicus'
      id_CoL = '4c7d11064f11d04a7f95ebe1f9464276';
      id_WoRMS = ''; % not present 2019/02/16
      id_Taxo = '42346';    
      id_EoL = '214853';
      id_fishbase = taxon_fish;
       
    case 'Ichthyophis_kohtaoensis'
      id_CoL = '897f721335748e93117c84bae4a39427';
      id_Taxo = '48023';        
      id_EoL = '320007';
      id_AnAge = ''; % not present 2019/06/20
      id_amphweb = taxon_amph;
       
    case 'Boulengerula_taitana'
      id_CoL = '1c5198aa3319023ca5af35dd04909553';
      id_Taxo = '137482';        
      id_EoL = '1019807';
      id_AnAge = ''; % not present 2019/06/21
      id_amphweb = taxon_amph;
       
    case 'Typhlonectes_compressicauda'
      id_CoL = 'c41ea3564094b0902ea72c062951c02c';
      id_Taxo = '48026';        
      id_EoL = '1019672';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Dermophis_mexicanus'
      id_CoL = '5c34f1ac45fe68bdd710d9f77ac837ff';
      id_Taxo = '137530';        
      id_EoL = '49916416';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Siphonops_annulatus'
      id_CoL = '1bef31e75d0b919c46c97d965d902a60';
      id_Taxo = '48031';        
      id_EoL = '330408';
      id_AnAge = ''; % not present 2019/06/21
      id_amphweb = taxon_amph;
       
    case 'Andrias_japonicus'
      id_CoL = '41349267f4b608eff2affa9111ed15de';
      id_Taxo = '47271';        
      id_EoL = '319982';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Andrias_davidianus'
      id_CoL = '46a0bab951d059c947c0c5bebddcf0df';
      id_Taxo = '47246';        
      id_EoL = '1018725';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Cryptobranchus_alleganiensis'
      id_CoL = '0b437ecc1a60d46a1627791f64c9b9db';
      id_Taxo = '47250';        
      id_EoL = '331124';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Onychodactylus_japonicus'
      id_CoL = '279f59ed123931657ef0d6b8d92f429d';
      id_Taxo = '47239';        
      id_EoL = '330495';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;

    case 'Pachyhynobius_shangchengensis'
      id_CoL = '277204ffdd0123413fa3ab22fc6a2b5c';
      id_Taxo = '138795';        
      id_EoL = '332108';
      id_AnAge = ''; % not present 2019/06/18
      id_amphweb = taxon_amph;

    case 'Salamandrella_keyserlingii'
      id_CoL = '20c31718eaa8ce5adbaede0094426319';
      id_Taxo = '47231'; 
      id_EoL = '332597';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Hynobius_nebulosus'
      id_CoL = '574b291971ce90bf962848d15095707e';
      id_Taxo = '47235'; 
      id_EoL = '1048033';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Hynobius_kimurae'
      id_CoL = '94f3c37abf7d4e3971df953bcef738b3';
      id_Taxo = '159234'; 
      id_EoL = '1019482';
      id_AnAge = ''; % not present 2019/06/29
      id_amphweb = taxon_amph;
       
    case 'Bolitoglossa_mexicana'
      id_CoL = 'd6bcd481031d4eac6e92a8612745b001';
      id_Taxo = '47462';
      id_EoL = '130100';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Bolitoglossa_subpalmata'
      id_CoL = 'Bolitoglossa_subpalmata';
      id_Taxo = '47463';
      id_EoL = '331315';
      id_AnAge = ''; % not present 2019/06/01
      id_amphweb = taxon_amph;
       
    case 'Plethodon_cinereus'
      id_CoL = 'a2743c12f96b3492a8352ada6b54703d';
      id_Taxo = '47446';
      id_EoL = '333692';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Plethodon_kentucki'
      id_CoL = 'e865046b8f400eba0d7032dd4c9f4e98';
      id_Taxo = '143013';
      id_EoL = '331206';
      id_AnAge = ''; % not present 2019/05/23
      id_amphweb = taxon_amph;
       
    case 'Desmognathus_ocoee'
      id_CoL = 'b0dee13497a122df21712095fe3dc835';
      id_Taxo = '142920';
      id_EoL = '1018737';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Desmognathus_monticola'
      id_CoL = 'c9724bb632bb29b70eec15d805b34662';
      id_Taxo = '47398';
      id_EoL = '1019222';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Desmognathus_quadramaculatus'
      id_CoL = '5e9b1e4aefab8f6f8641ae6afd819587';
      id_Taxo = '47401';
      id_EoL = '330497';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Aneides_flavipunctatus'
      id_CoL = '849b9f75d2d1db060adbf6446f0415a4';
      id_Taxo = '47440';
      id_EoL = '1048232';
      id_AnAge = ''; % not present 2019/05/27
      id_amphweb = taxon_amph;
       
    case 'Speleomantes_ambrosii'
      id_CoL = '48af6f0e4df733720ba0b31e6fee1e96';
      id_Taxo = '696042';
      id_EoL = '330914'; % Hydromantes ambrosii
      id_AnAge = ''; % not present 2019/05/30
      id_amphweb = 'Hydromantes+ambrosii';
       
    case 'Speleomantes_imperialis'
      id_CoL = '7f5f9c2fd9c1f9384e861fd765d72e50';
      id_Taxo = '696045';
      id_EoL = '330915'; % Hydromantes imperialis
      id_AnAge = ''; % not present 2019/06/28
      id_amphweb = 'Hydromantes+imperialis';
       
    case 'Eurycea_lucifuga'
      id_CoL = '4687b49e0ad37a3c112e978112a34df2';
      id_Taxo = '47414';
      id_EoL = '1019113';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Gyrinophilus_palleucus'
      id_CoL = 'cc1cb05c2adf4e16d24b5cb2cd2c3090';
      id_Taxo = '47420';
      id_EoL = '1038942';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Amphiuma_means'
      id_CoL = '0d414109bff9293787d947877ee0de85';
      id_Taxo = '47352';        
      id_EoL = '332599';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
      id_ADW = ''; % not present at 2017/10/15

    case 'Rhyacotriton_olympicus'
      id_CoL = 'd9dd7cc82382b49509dd444cee24311e';
      id_Taxo = '47363';
      id_EoL = '1018900';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Ambystoma_mexicanum'
      id_CoL = 'bf23a5a83215eb7cd6a5eaae8c5f587b';
      id_Taxo = '93027';        
      id_EoL = '1019571';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Ambystoma_macrodactylum'
      id_CoL = 'cdaf1c4c6ff8b21c10d3c8c6a85d6e36';
      id_Taxo = '47374';        
      id_EoL = '1019449';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Dicamptodon_tenebrosus'
      id_CoL = '22616372b9bc8beb8bd6fe5bb4940fcc';
      id_Taxo = '137953';
      id_EoL = '330494';
      id_AnAge = 'Dicamptodon_ensatus';
      id_amphweb = taxon_amph;
      
    case 'Salamandrina_perspicillata'
      id_CoL = '921ec47169be828f6aae91778a9029dd';
      id_Taxo = '985982';        
      id_EoL = '2920481';
      id_AnAge = ''; % not present 2019/06/28
      id_amphweb = taxon_amph;
       
    case 'Mertensiella_caucasica'
      id_CoL = '0e6d218324beb6520457ab59d48234aa';
      id_Taxo = '47288';        
      id_EoL = '1039216';
      id_AnAge = ''; % not present 2019/06/27
      id_amphweb = taxon_amph;
       
    case 'Chioglossa_lusitanica'
      id_CoL = '82b93837811d845bbde92ddc6aa4a08c';
      id_Taxo = '47274';        
      id_EoL = '289670';
      id_AnAge = ''; % not present 2019/06/27
      id_amphweb = taxon_amph;
       
    case 'Salamandra_salamandra'
      id_CoL = '2da5d094f1f3b4d8bd13a461c5054291';
      id_Taxo = '47311';        
      id_EoL = '333311';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Salamandra_lanzai'
      id_CoL = 'f9f9ebdeed31ebf8acabb85230936380';
      id_Taxo = '151422';        
      id_EoL = '331870';
      id_AnAge = ''; % not present at 2017/10/17
      id_amphweb = taxon_amph;
       
    case 'Lyciasalamandra_atifi'
      id_CoL = 'e77caa1e597285c4f06419a0f230a6bb';
      id_Taxo = '985987';        
      id_EoL = '4359457';
      id_AnAge = ''; % not present at 2019/06/15
      id_amphweb = taxon_amph;
       
    case 'Lyciasalamandra_billae'
      id_CoL = '3c3dffb2e401705c92e667b36c6c4fc1';
      id_Taxo = '985988';        
      id_EoL = '4359456';
      id_AnAge = ''; % not present at 2019/06/15
      id_amphweb = taxon_amph;
       
    case 'Lyciasalamandra_luschani'
      id_CoL = '4ee384c3cffa08dc254c6fc22af4d110';
      id_Taxo = '985992';        
      id_EoL = '2919410';
      id_AnAge = ''; % not present at 2019/196/15
      id_amphweb = taxon_amph;
       
    case 'Pleurodeles_waltl'
      id_CoL = 'ce96f223cfa0574d5f877f36cd6a1bfd';
      id_Taxo = '47306';        
      id_EoL = '330419';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Echinotriton_andersoni'
      id_CoL = '6b250f2f9a15c5b7b0e13d7d0ad0be37';
      id_Taxo = '47348';        
      id_EoL = '1048286';
      id_AnAge = ''; % not present 2019/06/30
      id_amphweb = taxon_amph;
       
    case 'Tylototriton_verrucosus'
      id_CoL = '7778d0604e42bbc667d4a8de942eb2cb';
      id_Taxo = '47349';        
      id_EoL = '332461';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Notophthalmus_viridescens'
      id_CoL = '7ae8731b79f69dd359e43bca9f6442f0';
      id_Taxo = '47298';        
      id_EoL = '1025186';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Lissotriton_vulgaris'
      id_CoL = '8eb8ecd651629c0276ce18bb308d38e8';
      id_Taxo = '985978';        
      id_EoL = '10194926';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Neurergus_microspilotus'
      id_CoL = 'e9de7f687d86242d1a2e0561609ae934';
      id_Taxo = '149411';        
      id_EoL = '331870';
      id_AnAge = ''; % not present at 2018/08/15
      id_amphweb = taxon_amph;
       
    case 'Neurergus_kaiseri'
      id_CoL = 'e0a58004255069949b8e42543afff44b';
      id_Taxo = '149407';        
      id_EoL = '330971';
      id_AnAge = ''; % not present at 2018/10/03
      id_amphweb = taxon_amph;
       
    case 'Ommatotriton_vittatus'
      id_CoL = 'da17328157a12c7ab81def1b5556e919';
      id_Taxo = '985981';        
      id_EoL = '1019471';
      id_AnAge = ''; % not present 2019/06/12
      id_amphweb = taxon_amph;
       
    case 'Calotriton_arnoldi'
      id_CoL = '4f624361df787538e27c36ab14951599';
      id_Taxo = '985972';        
      id_EoL = '4358097';
      id_AnAge = ''; % not present 2019/06/28
      id_amphweb = taxon_amph;
       
    case 'Triturus_cristatus'
      id_CoL = '740625d0e1bea07c7b133aca1fb4f8e7';
      id_Taxo = '47327';        
      id_EoL = '1018157';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Triturus_karelinii'
      id_CoL = 'e30ac814729c9a517be1a4a1a957a3b6';
      id_Taxo = '151425';        
      id_EoL = '1048229';
      id_AnAge = ''; % not present 2019/06/28
      id_amphweb = taxon_amph;
       
    case 'Ichthyosaura_alpestris'
      id_CoL = 'e1e18083b0a78d9c97af5abad41d0cee';
      id_Taxo = '1397948';        
      id_EoL = '330758';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Paramesotriton_hongkongensis'
      id_CoL = 'cce19de8bb6c9d8ebb931024e031cee0';
      id_Taxo = '151417';        
      id_EoL = '4357897';
      id_AnAge = ''; % not present 2019/06/30
      id_amphweb = taxon_amph;
       
    case 'Proteus_anguinus'
      id_CoL = '902f579a3013675de3ac2a27821e4433';
      id_Taxo = '985978';        
      id_EoL = '331216';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Siren_lacertina'
      id_CoL = '585fee795ef444b7901ead9c4f560f9d';
      id_Taxo = '985994';        
      id_EoL = '331129';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Hoplobatrachus_tigerinus'
      id_CoL = 'f271d6261ffd34918ddec16dd1ec4078';
      id_Taxo = '143092';        
      id_EoL = '331125';
      id_AnAge = 'Hoplobatrachus_occipitalis'; % species not present 2017/10/24
      id_amphweb = taxon_amph;
      id_ADW = ''; % species not present 2017/10/24
       
    case 'Bombina_bombina'
      id_CoL = 'a1fdfb7bbd135e748b7570d4c0a9f6f6';
      id_Taxo = '47532';        
      id_EoL = '333308';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
      id_ADW = ''; % species not present 2017/10/30
       
    case 'Alytes_muletensis'
      id_CoL = 'fd3165ed5e32b8049775bb31500ea9e8';
      id_Taxo = '107488';        
      id_EoL = '1039071';
      id_amphweb = taxon_amph;
      id_AnAge = ''; % species not present 2017/10/24
      id_ADW = '';   % species not present 2017/10/27
       
    case 'Xenopus_laevis'
      id_CoL = '42c96d87bc825c54d3d4ad99dabc5985';
      id_Taxo = '47520'; 
      id_EoL = '1038993';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Pelobates_fuscus'
      id_CoL = 'c497f2612f8241eb783e9e1c3296b0d8';
      id_Taxo = '47555'; 
      id_EoL = '330757';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
      id_ADW = ''; % not present 2017/10/29
       
    case 'Pelobates_syriacus'
      id_CoL = 'b9d61eae367e75d567ede17c15f9d0c8';
      id_Taxo = '47558'; 
      id_EoL = '1048335';
      id_AnAge = ''; % not present 2017/10/29
      id_amphweb = taxon_amph;
      id_ADW = ''; % not present 2017/10/29
       
    case 'Bufo_bufo'
      id_CoL = 'e53ae9ac85ef2c141a509f6405bc98f7';
      id_Taxo = '47784';        
      id_EoL = '333310';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Rhinella_arenarum'
      id_CoL = 'f5b5c2f753e8519b3245bd8c671584c6';
      id_Taxo = '1395841';        
      id_EoL = '1019163';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Peltophryne_lemur'
      id_CoL = 'e53ae9ac85ef2c141a509f6405bc98f7';
      id_Taxo = '137440';        
      id_EoL = '331265';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Anaxyrus_baxteri'
      id_CoL = 'c24915f7e2759cc72b4c9fb15d2d52a8';
      id_Taxo = '988886';        
      id_EoL = '311046';
      id_AnAge = ''; % not present at 2018/07/31
      id_amphweb = taxon_amph;
      
    case 'Anaxyrus_americanus'
      id_CoL = 'e3417c75fb210b94e7f62a7fff77a4df';
      id_Taxo = '988885';        
      id_EoL = '1298789';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
      
    case 'Rhaebo_blombergi'
      id_CoL = '60781d72757fa86f6e4933a66bb69223';
      id_Taxo = '989058';        
      id_EoL = '331046';
      id_AnAge = ''; % not present at 2018/07/31
      id_amphweb = taxon_amph;
       
    case 'Crinia_nimbus'
      id_CoL = '7653067dbfb18458578b1e698667cacc';
      id_Taxo = '781013';        
      id_EoL = '332826';
      id_AnAge = ''; % not present 2017/06/18
      id_amphweb = taxon_amph;
       
    case 'Crinia_georgiana'
      id_CoL = '66b8883b16bfdf95aad4fa2a2d29f8d8';
      id_Taxo = '79098';        
      id_EoL = '330825';
      id_AnAge = ''; % not present 2017/06/18
      id_amphweb = taxon_amph;
       
    case 'Geocrinia_vitellina'
      id_CoL = '12f5c1d4ba0f3475b80be1a3f53d8269';
      id_Taxo = '78940';        
      id_EoL = '1019811';
      id_AnAge = ''; % not present 2017/06/18
      id_amphweb = taxon_amph;
       
    case 'Geocrinia_rosea'
      id_CoL = 'aaded8bde8cf5b7ec805fc99a19b72b9';
      id_Taxo = '79112';        
      id_EoL = '333364';
      id_AnAge = ''; % not present 2017/06/18
      id_amphweb = taxon_amph;
      
     case 'Pseudophryne_bibronii'
      id_CoL = '30e9b7c92c5bc6dc80518b2c9ec2d126';
      id_Taxo = '88189';        
      id_EoL = '1025125';
      id_AnAge = ''; % not present 2017/06/18
      id_amphweb = taxon_amph;
       
     case 'Limnodynastes_peronii'
      id_CoL = 'a1aa4f559690fcdb724e85e1e978d4bf';
      id_Taxo = '87775';        
      id_EoL = '1048150';
      id_AnAge = ''; % not present 2019/06/26
      id_amphweb = taxon_amph;
       
    case 'Mannophryne_trinitatis'
      id_CoL = '17f6a51cc259aa34b6ee2d10b990f444';
      id_Taxo = '47985';        
      id_EoL = '311650';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Hyla_arborea'
      id_CoL = '74e4ee9fad1d658f40e22a5d856e6a11';
      id_Taxo = '47847';        
      id_EoL = '332925';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
      id_ADW = ''; % not present at 2017/10/31
       
    case 'Hyla_eximia'
      id_CoL = 'e369d27b638b682f40cab5c7449d8830';
      id_Taxo = '138153';        
      id_EoL = '1019447';
      id_AnAge = ''; % not present
      id_amphweb = taxon_amph;
       
    case 'Hyla_annectans'
      id_CoL = '6417071edd0036318656314ef1da6e34';
      id_Taxo = '47846';        
      id_EoL = '320005';
      id_AnAge = ''; % not present
      id_amphweb = taxon_amph;
       
    case 'Pseudis_paradoxa'
      id_CoL = '121bc6c8a2c7fbbc331a678cfbc950f5';
      id_Taxo = '93041';        
      id_EoL = '1039263';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Pleurodema_thaul'
      id_CoL = '157ebae14b5943fb2d932a1ab3fcf708';
      id_Taxo = '141057';
      id_EoL = '319983';
      id_AnAge = ''; % not present 2019/05/19
      id_amphweb = taxon_amph;
       
    case 'Engystomops_pustulosus'
      id_CoL = '6754a55502e1da57950630a7f8fbb402';
      id_Taxo = '994912';
      id_EoL = '331284';
      id_AnAge = ''; % not present 2019/05/28
      id_amphweb = taxon_amph;
       
    case 'Leptodactylus_fuscus'
      id_CoL = 'a94dda88b75934df1f2bf8b6ef302fd0';
      id_Taxo = '140887';
      id_EoL = '1025412';
      id_AnAge = ''; % not present 2019/05/28
      id_amphweb = taxon_amph;
       
    case 'Ceratophrys_stolzmanni'
      id_CoL = 'a81657ccabd0bc4e7c9c3f294273fe56';
      id_Taxo = '139184';
      id_EoL = '1018971';
      id_AnAge = ''; % not present 2019/06/19
      id_amphweb = taxon_amph;
       
    case 'Ceratophrys_cranwelli'
      id_CoL = '8d3927487228051a6d232c2ff3449be4';
      id_Taxo = '139182';
      id_EoL = '337390';
      id_AnAge = ''; % not present 2019/06/19
      id_amphweb = taxon_amph;
       
    case 'Eleutherodactylus_coqui'
      id_CoL = '3eed98d62f7aa64451501dac4485a81e';
      id_Taxo = '88107';
      id_EoL = '330433';
      id_AnAge = ''; % not present 2019/05/13
      id_amphweb = taxon_amph;
       
    case 'Dyscophus_antongilii'
      id_CoL = '3fb7697427f6e4ed2189167a5433dd67';
      id_Taxo = '142310';        
      id_EoL = '333037';
      id_AnAge = ''; % not present 2019/06/10
      id_amphweb = taxon_amph;
       
    case 'Dyscophus_guineti'
      id_CoL = '6cdbf22b03a6a68eb85128c190016d8f';
      id_Taxo = '142311';        
      id_EoL = '333039';
      id_AnAge = ''; % not present 2019/06/26
      id_amphweb = taxon_amph;
       
    case 'Dermatonotus_muelleri'
      id_CoL = 'd470f50e74f07a1c800462560715d5de';
      id_Taxo = '142308';        
      id_EoL = '1018796';
      id_AnAge = ''; % not present 2019/06/14
      id_amphweb = taxon_amph;
       
    case 'Rana_temporaria'
      id_CoL = '2722b8314c6250b8a73cbe019f621cd2';
      id_Taxo = '47660';        
      id_EoL = '331133';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Rana_arvalis'
      id_CoL = 'a887de6c09178f428a46e18dbb9fe0aa';
      id_Taxo = '47623';        
      id_EoL = '333000';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Rana_sierrae'
      id_CoL = '8524496f3c4cc3723c35970dfaa1f4da';
      id_Taxo = '1396956';        
      id_EoL = '2920193';
      id_AnAge = ''; % not present 2019/05/11
      id_amphweb = taxon_amph;
       
    case 'Rana_muscosa'
      id_CoL = 'e865046b8f400eba0d7032dd4c9f4e98';
      id_Taxo = '145954';        
      id_EoL = '331206';
      id_AnAge = ''; % not present 2019/05/23
      id_amphweb = taxon_amph;
       
    case 'Rana_macrocnemis'
      id_CoL = '09f79266a8b883fa4eaf183552955c6d';
      id_Taxo = '89710';        
      id_EoL = '329317';
      id_AnAge = ''; % not present 2019/05/23
      id_amphweb = taxon_amph;
       
    case 'Rana_iberica'
      id_CoL = '777a66cf4bf9a780e497fed033e67eb0';
      id_Taxo = '47641';        
      id_EoL = '1019689';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Rana_amurensis'
      id_CoL = 'fa53e6f51d14fbb216d086b8694de482';
      id_Taxo = '145403';        
      id_EoL = '313551';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Rana_tagoi'
      id_CoL = '119401cafe52faed60564be31627fcb5';
      id_Taxo = '146014';        
      id_EoL = '332961';
      id_AnAge = ''; % not present 2019/06/13
      id_amphweb = taxon_amph;
       
    case 'Hylarana_guentheri'
      id_CoL = 'af370d54a5da7a33fb0bcc3fb9de4a56';
      id_Taxo = '996541';        
      id_EoL = '46396216';
      id_AnAge = ''; % not present 2019/06/10
      id_amphweb = 'Sylvirana+guentheri';
       
    case 'Hylarana_erythraea'
      id_CoL = 'c6276c186849ade329b13c51c444c65a';
      id_Taxo = '996540';        
      id_EoL = '313505';
      id_AnAge = ''; % not present 2019/06/26
      id_amphweb = taxon_amph;
       
    case 'Lithobates_sphenocephalus'
      id_CoL = '678105f67ea91e5968fc7d5191ed7fc0';
      id_Taxo = '996583';        
      id_EoL = '51613152';
      id_AnAge = ''; % not present 2019/05/26
      id_amphweb = 'Rana+sphenocephalus';
       
    case 'Lithobates_clamitans'
      id_CoL = 'b6fe7e3004bb7660fe96f0a8c1d633db';
      id_Taxo = '996554';        
      id_EoL = '51380118';
      id_AnAge = taxon;
      id_amphweb = 'Rana_clamitans';
       
    case 'Pelophylax_ridibundus'
      id_CoL = '48ee82c4a8e4451d6efa47ab666fcc33';
      id_Taxo = '996613';        
      id_EoL = '320013';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Pelophylax_lessonae'
      id_CoL = 'c1c8455fa1dc78c3bdc5df2de48cc696';
      id_Taxo = '996607';        
      id_EoL = '332998';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Pelophylax_esculentus' % hybrid
      id_CoL = ''; % not present 2017/10/29
      id_Taxo = '1000640';        
      id_EoL = '46326676';
      id_AnAge = ''; % not present 2017/10/29
      id_amphweb = taxon_amph;
       
    case 'Pelophylax_saharicus'
      id_CoL = '1ee10acffa9154c7c73b04752953183c';
      id_Taxo = '996614';        
      id_EoL = '1019680';
      id_AnAge = ''; % not present 2019/05/29
      id_amphweb = taxon_amph;
       
    case 'Pelophylax_nigromaculatus'
      id_CoL = '935e432a5f111d2c32e2fce0f6a1f161';
      id_Taxo = '996609';        
      id_EoL = '331357';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Pelophylax_bedriagae'
      id_CoL = 'f3c887c1df1fa8286d0df019ca2f98bd';
      id_Taxo = '996595';        
      id_EoL = '1019741';
      id_AnAge = ''; % not present 2019/06/12
      id_amphweb = taxon_amph;
       
    case 'Conraua_goliath'
      id_CoL = '5ee508a8bc9753c62ed591a3df2be091';
      id_Taxo = '93036';        
      id_EoL = '332046';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Euphlyctis_cyanophlyctis'
      id_CoL = '28348dbf60e9cbbb1e63380a23c31a35';
      id_Taxo = '143433';        
      id_EoL = '1025205';
      id_AnAge = ''; % not present 2019/06/14
      id_amphweb = taxon_amph;
       
    case 'Nanorana_taihangnica'
      id_CoL = '0a54925486f414a99c73ea91e4e45c1f';
      id_Taxo = '989266';        
      id_EoL = '1039355';
      id_AnAge = ''; % not present 2019/06/15
      id_amphweb = taxon_amph;
       
    case 'Pyxicephalus_adspersus'
      id_CoL = '82c1ed4b7da83deee8b6617f3b4b05c3';
      id_Taxo = '47618';        
      id_EoL = '330829';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Mantidactylus_grandidieri'
      id_CoL = '1bef31e75d0b919c46c97d965d902a60';
      id_Taxo = '141253';        
      id_EoL = '331205';
      id_AnAge = ''; % not present 2019/06/20
      id_amphweb = taxon_amph;
       
    case 'Rhacophorus_moltrechti'
      id_CoL = '293c3047a79c3bc81a1ca7f75d5b3585';
      id_Taxo = '149358';        
      id_EoL = '1019266';
      id_AnAge = ''; % not present 2018/10/31
      id_amphweb = taxon_amph;
       
    case 'Kurixalus_eiffingeri'
      id_CoL = '91f526f75e9d7db43e0326e3fe002ed3';
      id_Taxo = '844079'; 
      id_EoL = '1020154';
      id_AnAge = ''; % not present 2018/11/02
      id_amphweb = taxon_amph;
       
    case 'Kurixalus_idiootocus'
      id_CoL = '29430c068b9f847013d40e786432b000';
      id_Taxo = '844080';
      id_EoL = '332267';
      id_AnAge = ''; % not present 2018/11/02
      id_amphweb = taxon_amph;
       
    case 'Hyperolius_viridiflavus'
      id_CoL = 'daf7eb17c19199b157dd5dd8c6f4d26b';
      id_Taxo = '138972';        
      id_EoL = '130067';
      id_AnAge = taxon;
      id_amphweb = taxon_amph;
       
    case 'Sphenodon_punctatus'
      id_CoL = '25b1757fa601bfa9d01e3e9460c93b06';
      id_Taxo = '48794';        
      id_EoL = '460890';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Eublepharis_macularius'
      id_CoL = '3914e73d5db7e7f90f3494b48f93ac36';
      id_Taxo = '48868';
      id_EoL = '790141';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Sphaerodactylus_vincenti'
      id_CoL = 'd592ddca71bcac494b16c4f4eab5f9e6';
      id_Taxo = '641973';
      id_EoL = '790589';
      id_AnAge = ''; % not present 2019/05/22
      id_ReptileDB = taxon_rep;
      
    case 'Homonota_williamsii'
      id_CoL = 'b9c119f957eb1f13b66692d13de14b2e';
      id_Taxo = '4683719';
      id_Wiki = 'Homonota';
      id_EoL = '51380185';
      id_AnAge = ''; % not present 2019/05/16
      id_ReptileDB = taxon_rep;
      id_ADW = 'Homonota_darwinii'; 
      
    case 'Heteronotia_binoei'
      id_CoL = '9d3714402a1d195c7d861c0b1f840bd8';
      id_Taxo = '90870';
      id_Wiki = 'Heteronotia_binoei';
      id_EoL = '456690';
      id_AnAge = 'Heteronotia_binoei';
      id_ReptileDB = 'genus=Heteronotia&species=binoei';
      id_ADW = 'Heteronotia_binoei'; 
      
    case 'Heteronotia_binoei_3N1A'
      id_CoL = '9d3714402a1d195c7d861c0b1f840bd8';
      id_Taxo = '90870';
      id_Wiki = 'Heteronotia_binoei';
      id_EoL = '456690';
      id_AnAge = 'Heteronotia_binoei';
      id_ReptileDB = 'genus=Heteronotia&species=binoei';
      id_ADW = 'Heteronotia_binoei'; 
      
    case 'Heteronotia_binoei_3N1B'
      id_CoL = '9d3714402a1d195c7d861c0b1f840bd8';
      id_Taxo = '90870';
      id_Wiki = 'Heteronotia_binoei';
      id_EoL = '456690';
      id_AnAge = 'Heteronotia_binoei';
      id_ReptileDB = 'genus=Heteronotia&species=binoei';
      id_ADW = 'Heteronotia_binoei'; 
      
    case 'Heteronotia_binoei_EA6'
      id_CoL = '9d3714402a1d195c7d861c0b1f840bd8';
      id_Taxo = '90870';
      id_Wiki = 'Heteronotia_binoei';
      id_EoL = '456690';
      id_AnAge = 'Heteronotia_binoei';
      id_ReptileDB = 'genus=Heteronotia&species=binoei';
      id_ADW = 'Heteronotia_binoei'; 
      
    case 'Heteronotia_binoei_SM6'
      id_CoL = '9d3714402a1d195c7d861c0b1f840bd8';
      id_Taxo = '90870';
      id_Wiki = 'Heteronotia_binoei';
      id_EoL = '456690';
      id_AnAge = 'Heteronotia_binoei';
      id_ReptileDB = 'genus=Heteronotia&species=binoei';
      id_ADW = 'Heteronotia_binoei'; 
      
    case 'Christinus_marmoratus'
      id_CoL = '8b3d51c90de07f208d0245ff92cdf65a';
      id_Taxo = '90809';
      id_EoL = '795383';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Cyrtopodion_scabrum'
      id_CoL = '0fffa0c4fbd68ebe8ea49b2f34e46afa';
      id_Taxo = '344782';
      id_EoL = '795121';
      id_AnAge = ''; % not present 2019/06/02
      id_ReptileDB = taxon_rep;
      
    case 'Gekko_hokouensis'
      id_CoL = '84f9ff0a4f2bd7bd31aeabb42207af9c';
      id_Taxo = '641486';
      id_EoL = '794400';
      id_AnAge = ''; % not present 2019/061/02
      id_ReptileDB = taxon_rep;
      
    case 'Eulamprus_quoyii'
      id_CoL = 'b7368b27759d92dfd69b19ba70fe7f0e';
      id_Taxo = '91157';        
      id_EoL = '794708';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Tiliqua_rugosa'
      id_CoL = '03bd821efb1cfb6c36d9b5037df77a69';
      id_Taxo = '49387';        
      id_EoL = '790460';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Egernia_cunninghami'
      id_CoL = '91fe397b8044dd1066106e58c5e37c52';
      id_Taxo = '91117';        
      id_EoL = '794968';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Egernia_striolata'
      id_CoL = 'db22a3ef5da7fd52f483b3ee884a0351';
      id_Taxo = '91138';
      id_Wiki = 'Egernia';
      id_EoL = '794945';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Liopholis_striata'
      id_CoL = '3b1f6e151cff0f8f6971c525f21a1c11';
      id_Taxo = '1685441';
      id_Wiki = 'Liopholis';
      id_EoL = '794944'; % unaccepted, to Egernia striata
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Liopholis_inornata'
      id_CoL = '080dc164b56f544895192ee52cb97f02';
      id_Taxo = '1685439';        
      id_Wiki = 'Liopholis';
      id_EoL = '794963'; % unaccepted, to Egernia inornata
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Chalcides_chalcides'
      id_CoL = '1c6c93425711910eb388ad9c63256c82';
      id_Taxo = '49398';        
      id_EoL = '47364720';
      id_AnAge = ''; % not present 2019/05/16
      id_ReptileDB = taxon_rep;
      
    case 'Oligosoma_suteri'
      id_CoL = '8a2079b7190adea07d2a5e09ffcf5add';
      id_Taxo = '643424';       
      id_EoL = '791270';
      id_AnAge = ''; % not present 2019/05/18
      id_ReptileDB = taxon_rep;
      
    case 'Plestiodon_chinensis'
      id_CoL = '8a2079b7190adea07d2a5e09ffcf5add';
      id_Taxo = '643424';       
      id_EoL = '791270';
      id_AnAge = ''; % not present 2019/05/18
      id_ReptileDB = taxon_rep;
      
    case 'Gerrhosaurus_validus'
      id_CoL = 'c6267e1153a0d527e3fed7d610596e82'; % accepted as Matobosaurus validus 2019/06/25
      id_Taxo = '4684060'; % accepted as Matobosaurus validus 2019/06/25
      id_EoL = '794201';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Anadia_bogotensis'
      id_CoL = 'bbbbe16debfda36c8c9b81228d15e7ab';
      id_Taxo = '642314';        
      id_EoL = '453204';
      id_AnAge = ''; % not present 2019/05/16
      id_ReptileDB = taxon_rep;
      
    case 'Aspidoscelis_exsanguis'
      id_CoL = 'abce2ef9695f102f94d8f67ca7eea1e7';
      id_Taxo = '744767';        
      id_EoL = '1056817';
      id_AnAge = ''; % not present 2019/05/17
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17
      
    case 'Aspidoscelis_neomexicana'
      id_CoL = '9cb9a81e9d8b38c1abb2439f134135ce';
      id_Taxo = '744774';    
      id_EoL = '1056798';
      id_AnAge = ''; % not present 2019/05/17
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17
      
    case 'Aspidoscelis_uniparens'
      id_CoL = 'ab7cd2628ce406642ea14143face44a6';
      id_Taxo = '744782';     
      id_EoL = '454775';
      id_AnAge = ''; % not present 2019/05/17
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17
      
    case 'Aspidoscelis_marmorata'
      id_CoL = 'd18bdb33d22823c499b9ac011e5dacf5';
      id_Taxo = '4682770';     
      id_EoL = '1056803';
      id_Wiki = 'Aspidoscelis_marmoratus';
      id_AnAge = ''; % not present 2019/05/17
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17
      
    case 'Amphisbaena_alba'
      id_CoL = 'e9c5fca6f18472b4bdb1059cc9b179d0';
      id_Taxo = '50424';        
      id_EoL = '1055991';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Lacerta_agilis'
      id_CoL = '7e1a059719ca73323daa52f23a19a64d';
      id_Taxo = '642580';        
      id_EoL = '791768';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Lacerta_strigata'
      id_CoL = '13b6f7649bd9cb39390aa38518fca717';
      id_Taxo = '49578';    
      id_Wiki = 'Lacerta_(genus)';
      id_EoL = '792774';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Darevskia_valentini'
      id_CoL = '05fc8d8cafdaf600e6a9dad70eecfbe8';
      id_Taxo = '642542';    
      id_EoL = '47045622';
      id_AnAge = ''; % not present 2019/06/11
      id_ReptileDB = taxon_rep;
       
    case 'Acanthodactylus_erythrurus'
      id_CoL = 'cde6ef445001d596c2349c9861c421f9';
      id_Taxo = '49547';    
      id_EoL = '1057273';
      id_AnAge = ''; % not present 2019/05/10
      id_ReptileDB = taxon_rep;
       
    case 'Takydromus_hsuehshanensis'
      id_CoL = '0a29f929f99e543ced935005d9f39302';
      id_Taxo = '642687';    
      id_Wiki = 'Takydromus';
      id_EoL = '290159';
      id_AnAge = ''; % not present 2017/07/17
      id_ReptileDB = taxon_rep;
       
    case 'Gallotia_galloti'
      id_CoL = '7cc21994a3a81bea79a427e804b57632';
      id_Taxo = '642475';    
      id_EoL = '1056890';
      id_AnAge = ''; % not present 2019/05/30
      id_ReptileDB = taxon_rep;
       
    case 'Varanus_komodoensis'
      id_CoL = '9734ef854130b3011fb9ec9be37afed1';
      id_Taxo = '170215';        
      id_EoL = '790179';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Varanus_bengalensis'
      id_CoL = 'c75f9c3235a0c91d33f4b62c24822edd';
      id_Taxo = '49747';     
      id_EoL = '790199';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Varanus_juxtindicus'
      id_CoL = 'f44637b226902c1150c3035e9b03a307';
      id_Taxo = '644080';     
      id_EoL = '790076';
      id_AnAge = ''; % not present 2019/06/11
      id_ReptileDB = taxon_rep;
      
    case 'Heloderma_suspectum'
      id_CoL = '80df2f600b4582deda7be0756203a9f7';
      id_Taxo = '49723';     
      id_EoL = '456548';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Xenosaurus_grandis'
      id_CoL = '578b899cf3f629dc4d4cfe9c8c96498c';
      id_Taxo = '49712';     
      id_EoL = '790698';
      id_AnAge = ''; % not present 2019/05/17 
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17  
       
    case 'Anguis_fragilis'
      id_CoL = '9d72c2c8f700a5af8c9c3265f68859c7';
      id_Taxo = '49698';        
      id_EoL = '453239';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Furcifer_labordi'
      id_CoL = '2d8fe0c4795645592bb8c62369df1cd0';
      id_Taxo = '641166';        
      id_EoL = '1056897';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Ctenophorus_ornatus'
      id_CoL = '1784a51b08f5dec6219f9eb686c036f8';
      id_Taxo = '90658';        
      id_EoL = '795255';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
      
     case 'Ctenophorus_adelaidensis'
      id_CoL = '25df45b7c28e2d75903c4bd456ac62f6';
      id_Taxo = '3809096';
      id_EoL = '460054';
      id_AnAge = ''; % not present 2018/11/28
      id_ReptileDB = taxon_rep;
       
     case 'Calotes_versicolor'
      id_CoL = '0f771811e8a0e002a11594711981ae4f';
      id_Taxo = '49169';
      id_EoL = '1056997';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Anolis_nebulosus'
      id_CoL = '427d39f0225550e671a564246481827c';
      id_Taxo = '249837';        
      id_EoL = '791314';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2019/05/15
       
    case 'Anolis_gundlachi'
      id_CoL = '348a472d53e9983a278cb58fb416daff';
      id_Taxo = '249822';        
      id_EoL = '13798';
      id_AnAge = ''; % not present at 2019/06/30
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2019/06/30
       
    case 'Basiliscus_basiliscus'
      id_CoL = '66efca89eb233d3add91a36275d257e6';
      id_Taxo = '49095';        
      id_EoL = '795614';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
       
    case 'Cyclura_pinguis'
      id_CoL = 'cd0a0be37487b6c5a21d500eb3b3b8a2';
      id_Taxo = '341615';        
      id_EoL = '31563806';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Iguana_iguana'
      id_CoL = 'd08f3e9e3175d2b1f5068779735d116f';
      id_Taxo = '49090';        
      id_EoL = '793235';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Gambelia_sila'
      id_CoL = '91666ceb65f1abe2016640bbdb7c6968';
      id_Taxo = '389176';        
      id_EoL = '794628';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
       
    case 'Gambelia_wislizenii'
      id_CoL = '7921cbbba74d28eae0cad8ce45ef88a4';
      id_Taxo = '389179';        
      id_EoL = '794585';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
       
    case 'Sceloporus_undulatus'
      id_CoL = '9152ab6db407dca4866fc5bb234b62a6';
      id_Taxo = '49023';        
      id_EoL = '793971';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Sceloporus_occidentalis'
      id_CoL = '489944a4e2afe310ce2b89d8cbd2c580';
      id_Taxo = '49020';        
      id_EoL = '790717';
      id_AnAge = ''; % not present at 2018/07/31
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2018/07/31
       
    case 'Phrynosoma_ditmarsi'
      id_CoL = 'a880dfa6c2b0b6182fd710fc6a361eb3';
      id_Taxo = '524515';        
      id_EoL = '791087';
      id_AnAge = ''; % not present at 2018/07/26
      id_ReptileDB = taxon_rep;  
       
    case 'Phrynosoma_douglasii'
      id_CoL = 'af61ccbcd1d9e60dbafab90c02d88943';
      id_Taxo = '49015';        
      id_EoL = '8829414';
      id_AnAge = ''; % not present at 2018/07/26
      id_ReptileDB = taxon_rep;  
       
    case 'Phymaturus_patagonicus'
      id_CoL = 'eb1d52cf1e7f259701caacf819b3d51b';
      id_Taxo = '643955';        
      id_EoL = '47044867';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
       
    case 'Liolaemus_pictus'
      id_CoL = 'ad0a337f7f74bc3e171f37d289c38214';
      id_Taxo = '643898';        
      id_EoL = '791732';
      id_AnAge = ''; % not present at 2019/06/11
      id_ReptileDB = taxon_rep;
       
    case 'Oplurus_cuvieri'
      id_CoL = '1cf4adeabf42135f439b1deb3cd3dc98';
      id_Taxo = '642705';        
      id_EoL = '791248';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Tropidurus_itambere'
      id_CoL = 'd8269af19888c5d703871dbfe19c4355';
      id_Taxo = '644047';        
      id_EoL = '790368';
      id_AnAge = ''; % not present at 2019/05/15
      id_ReptileDB = taxon_rep;
       
    case 'Python_regius'
      id_CoL = '6d0035229236a4c7583a934a4b310b15';
      id_Taxo = '49851';        
      id_EoL = '1055460';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
 
    case 'Python_sebae'
      id_CoL = '82e45e06aca6d5066eb4bfd034ae17c8';
      id_Taxo = '49853';        
      id_EoL = '1055462';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Python_molurus'
      id_CoL = '82e45e06aca6d5066eb4bfd034ae17c8';
      id_Taxo = '49848';        
      id_EoL = '1055462';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      
    case 'Apodora_papuana'
      id_CoL = 'dc3a391b21ff04ac35bdf3abaded55b8';
      id_Taxo = '644250';        
      id_EoL = '1057117';
      id_AnAge = ''; % not present at 2018/07/67
      id_ReptileDB = 'genus=Liasis&species=papuanus';
      id_Wiki = 'Apodora';
       
    case 'Eunectes_murinus'
      id_CoL = 'a97cd0d051262be8ea1c9b162f28b25f';
      id_Taxo = '49883';        
      id_EoL = '794661';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Eunectes_notaeus'
      id_CoL = '4ee2063f7571ac7a26a80209578b79fa';
      id_Taxo = '49884';        
      id_EoL = '794660';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Boa_constrictor'
      id_CoL = '253bb4ac5026b77a3adf9b78516913b9';
      id_Taxo = '49860';        
      id_EoL = '795595';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Vipera_berus'
      id_CoL = '2c91a42f205ad78e94e75be5dc844684';
      id_Taxo = '50340';        
      id_EoL = '289378';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Vipera_latastei'
      id_CoL = '1a0d21aa5d108032c4c7b22edf648399';
      id_Taxo = '646326';       
      id_EoL = '289374';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/17  
       
    case 'Daboia_russelii'
      id_CoL = '9c471f69c409e3bea6eb2a44e8b8a645';
      id_Taxo = '646304';        
      id_EoL = '795118';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Bitis_gabonica'
      id_CoL = '39e0b014fc85615f45f535de5dc7bc39';
      id_Taxo = '50312';        
      id_EoL = '1057054';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Bitis_arietans'
      id_CoL = '6e3c7d3b39dcf26fbed91a557dcf2eba';
      id_Taxo = '50307';        
      id_EoL = '1057058';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Agkistrodon_piscivorus'
      id_CoL = 'bb251c9b65cb26aefd0003a5124ae1ec';
      id_Taxo = '93130';        
      id_EoL = '46559649';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Gloydius_blomhoffii'
      id_CoL = '85eb97b5f8c7a54dbd8c5b96bfcfb9e4';
      id_Taxo = '4200567';        
      id_EoL = '2818108';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crotalus_horridus'
      id_CoL = 'e9f8350bf5f3e9c9dc286e5c54a9807d';
      id_Taxo = '50384';        
      id_EoL = '963777';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crotalus_oreganus'
      id_CoL = 'd629953c9bd410c357a61740334a4b3e';
      id_Taxo = '337016';        
      id_EoL = '289213';
      id_AnAge = 'Crotalus_viridis';
      id_ReptileDB = taxon_rep;
       
    case 'Crotalus_pricei'
      id_CoL = '15a9763eb61d840d160e8b20edb5286f';
      id_Taxo = '50387';        
      id_EoL = '1056759';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Sistrurus_miliarius'
      id_CoL = '5b3a52ebbed5d680778a364e7513c5a1';
      id_Taxo = '93130';        
      id_EoL = '790628';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Bothrops_insularis'
      id_CoL = '92cc382eadbde7f2bca19b09b2370813';
      id_Taxo = '50371';        
      id_EoL = '48729544';
      id_AnAge = ''; % not present 2019/06/19
      id_ReptileDB = taxon_rep;
       
    case 'Cerberus_rynchops'
      id_CoL = '330e9e1d8c7b336eea71b25ec8c3b401';
      id_Taxo = '307748';        
      id_EoL = '46559514';
      id_AnAge = ''; % not present 2019/06/24
      id_ReptileDB = taxon_rep;
      id_WoRMS = '344028';
       
    case 'Natrix_natrix'
      id_CoL = '27ec70b00734b68213ff0972f7360650';
      id_Taxo = '50029';        
      id_EoL = '791395';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Natrix_maura'
      id_CoL = '3690704eb2079ec7cad2a3dbf23c35f7';
      id_Taxo = '50028';        
      id_EoL = '458673';
      id_AnAge = ''; % not present 2019/05/30
      id_ReptileDB = taxon_rep;
       
    case 'Thamnophis_gigas'
      id_CoL = '67b9b76c276b95d99f4883fad92e690f';
      id_Taxo = '50075';        
      id_EoL = '1055211';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Thamnophis_radix'
      id_CoL = '4ca4eced19df149b20210827ba054f5f';
      id_Taxo = '50080';        
      id_EoL = '1055205';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Coronella_austriaca'
      id_CoL = '7449215b10f0b0e3d3b66b04beff2d3d';
      id_Taxo = '49966';        
      id_EoL = '1287053';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Orthriophis_taeniurus'
      id_CoL = 'fc18d6bba7950e35f1b0d8c551dbcf30';
      id_Taxo = '3815763';        
      id_EoL = '794893';
      id_AnAge = 'Elaphe_taeniura';
      id_ReptileDB = taxon_rep;
       
    case 'Elaphe_climacophora'
      id_CoL = 'f10e014728639ac5439144f156c4180d';
      id_Taxo = '49982';        
      id_EoL = '794923';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Hierophis_viridiflavus'
      id_CoL = '30feb6622966c187ba1f386d3c51f561';
      id_Taxo = '644702';        
      id_EoL = '795303';
      id_AnAge = ''; % not present 2019/06/11
      id_ReptileDB = taxon_rep;
       
    case 'Rhabdophis_tigrinus'
      id_CoL = '191627fe466cd74aeb8fe659077f3ddf';
      id_Taxo = '49950';        
      id_EoL = '1055425';
      id_AnAge = ''; % not present 2019/06/11
      id_ReptileDB = taxon_rep;
       
    case 'Tantilla_melanocephala'
      id_CoL = 'b6fa8010a28f926219efa1fda0bff586';
      id_Taxo = '604878';        
      id_EoL = '2816562';
      id_AnAge = ''; % not present 2019/06/17
      id_ReptileDB = taxon_rep;
       
    case 'Boaedon_fuliginosus'
      id_CoL = '8e73389709e593470a20143ebd05e18a';
      id_Taxo = '50099';        
      id_EoL = '47045966';
      id_AnAge = ''; % not present 2019/06/23
      id_ReptileDB = taxon_rep;
       
    case 'Psammophis_sibilans'
      id_CoL = 'af61a862fe80398f9f0d633095b27284';
      id_Taxo = '644979';        
      id_EoL = '459775';
      id_AnAge = ''; % not present 2019/06/24
      id_ReptileDB = taxon_rep;
       
    case 'Psammophylax_rhombeatus'
      id_CoL = '4f9f19e9de427c60c389f341a807b9a0';
      id_Taxo = '644983';        
      id_EoL = '1055560';
      id_AnAge = ''; % not present 2019/06/26
      id_ReptileDB = taxon_rep;
       
    case 'Naja_kaouthia'
      id_CoL = '5c74e5fc6f03c6049840102ac3b50fd4';
      id_Taxo = '645759';        
      id_EoL = '1055811';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Acanthophis_antarcticus'
      id_CoL = '4997b83bfecf6ccbb3d284460f3f106a';
      id_Taxo = '50195';        
      id_EoL = '452875';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Emydocephalus_ijimae'
      id_CoL = '1b0cc8cdeab4a5b1d52e337003d0dfc5';
      id_Taxo = '645788';        
      id_EoL = '46559567';
      id_AnAge = ''; % not present 2019/06/16
      id_ReptileDB = taxon_rep;
       
    case 'Micrurus_fulvius'
      id_CoL = '2e4d84eb68de25a2209239f9ccc6229f';
      id_Taxo = '50230';        
      id_EoL = '962855';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Micrurus_corallinus'
      id_CoL = '8c4b414eaee1505cdfa36e43f9e49b36';
      id_Taxo = '50227';        
      id_EoL = '962867';
      id_AnAge = ''; % not present 2019/06/17
      id_ReptileDB = taxon_rep;
       
    case 'Pelomedusa_subrufa'
      id_CoL = '70fb9207dac7da2ac75ad41d468fbe12';
      id_WoRMS = ''; % not present 2017/10/06
      id_Taxo = '48191';
      id_EoL = '791177';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
       
    case 'Podocnemis_lewyana'
      id_CoL = '5ee1c610d04b086ffd81ab4b9f581b73';
      id_WoRMS = ''; % not present 2019/05/13
      id_Taxo = '48184';
      id_EoL = '790995';
      id_AnAge = ''; % not present 2019/05/13
      id_ReptileDB = taxon_rep;
       
    case 'Podocnemis_unifilis'
      id_CoL = 'a007f06fbc0c0dbcecd1fd883f03e4bd';
      id_WoRMS = ''; % not present 2017/10/06
      id_Taxo = '48187';
      id_EoL = '790997';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
       
    case 'Pseudemydura_umbrina'
      id_CoL = '02201b34a72c0285ab6719ce051efc2f';
      id_WoRMS = ''; % not present 2017/06/16
      id_Taxo = '48233';
      id_EoL = '793828';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;

     case 'Chelodina_oblonga'
      id_CoL = '49268c6c328437171ef67863c2cb96f2';
      id_WoRMS = ''; % not present 2017/10/09
      id_Taxo = '48245';
      id_EoL = '795413';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;

    case 'Elseya_dentata'
      id_CoL = '4257c55ec5c83ecd201337d03cb3b597';
      id_WoRMS = ''; % not present 2017/10/09
      id_Taxo = '48255';
      id_EoL = '794869';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2017/10/09

    case 'Hydromedusa_maximiliani'
      id_CoL = 'e99db52a9453446ed652e4389cab0a12';
      id_WoRMS = ''; % not present 2017/10/07
      id_Taxo = '48268';
      id_EoL = '2815879';
      id_AnAge = ''; % not present 2017/10/07
      id_ReptileDB = taxon_rep;
       
    case 'Chelus_fimbriata'
      id_CoL = '';   % not present 2017/10/07
      id_WoRMS = ''; % not present 2017/10/07
      id_Taxo = '4196212';
      id_EoL = '795410';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Carettochelys_insculpta'
      id_CoL = 'd9122d373653b2515fe81b26d31f1da9';
      id_WoRMS = ''; % not present 2017/10/06
      id_Taxo = '48380';
      id_EoL = '1056984';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
       
    case 'Apalone_spinifera'
      id_CoL = 'e69205efb61d6d64105a38b2adf5d72a';
      id_WoRMS = ''; % not present 2017/10/05
      id_Taxo = '48407';
      id_EoL = '795751';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;

    case 'Pelodiscus_sinensis'
      id_CoL = '17dc384b0c37a70b562261c8f9f1df1d';
      id_WoRMS = ''; % not present 2018/10/31
      id_Taxo = '48432';
      id_EoL = '791178';
      id_AnAge = '';  % not present 2018/10/31
      id_ReptileDB = taxon_rep;

    case 'Chelydra_serpentina'
      id_CoL = 'be461ad353cdc36aa5c5432f715565c0';
      id_WoRMS = ''; % not present 2017/10/05
      id_Taxo = '48499';
      id_EoL = '795409';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
       
    case 'Dermatemys_mawii'
      id_CoL = 'c3b908ded6324cd2ebd49df19414851b';
      id_WoRMS = ''; % not present 2017/10/07
      id_Taxo = '48377';
      id_EoL = '815713';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
       
    case 'Kinosternon_sonoriense'
      id_CoL = '467195d1b10b59c1605cba463e2a7dd1';
      id_WoRMS = ''; % not present at 2019/05/11
      id_Taxo = '48368';        
      id_EoL = '457729';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present at 2019/05/11
       
    case 'Claudius_angustatus'
      id_CoL = '00d089296bf70b151bc6848f3c21392c';
      id_WoRMS = ''; % not present at 2017/10/07
      id_Taxo = '48323';        
      id_EoL = '795375';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Dermochelys_coriacea'
      id_CoL = 'dd8153b49c7daf4582b11583525bc26c';
      id_WoRMS = '137209';
      id_Taxo = '48459';        
      id_EoL = '815711';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Caretta_caretta'
      id_CoL = '5667c31e110f65b6f24658fa8d7f650f';
      id_WoRMS = '137205';
      id_Taxo = '48469';
      id_EoL = '1275929';
      id_AnAge = 'Caretta_caretta';
      id_ReptileDB = 'genus=Caretta&species=caretta';
      id_ADW = 'Caretta_caretta'; 
      
    case 'Caretta_caretta_MED'
      id_CoL = '5667c31e110f65b6f24658fa8d7f650f';
      id_WoRMS = '137205';
      id_Taxo = '48469';
      id_EoL = '1275929';
      id_AnAge = 'Caretta_caretta';
      id_ReptileDB = 'genus=Caretta&species=caretta';
      id_ADW = 'Caretta_caretta'; 
      
    case 'Lepidochelys_kempii'
      id_CoL = '54e9e281f6d060b3f03a3d1295107826';
      id_WoRMS = '137208';
      id_Taxo = '48486'; 
      id_EoL = '1056176';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Lepidochelys_olivacea'
      id_CoL = '1b11e050adb31e97eb7d46b40b564dec';
      id_WoRMS = '220293';
      id_Taxo = '48487'; 
      id_EoL = '1056177';
      id_AnAge = ''; % not present 2018/08/11
      id_ReptileDB = taxon_rep;
       
    case 'Natator_depressus'
      id_CoL = '912bfcb48046a727508637ce96085aa7';
      id_WoRMS = ''; % not present at 2017/06/14
      id_Taxo = '93064';        
      id_EoL = '791397';
      id_AnAge = ''; % not present at 2017/06/14
      id_ReptileDB = taxon_rep;
       
    case 'Chelonia_mydas'
      id_CoL = 'bd036a3edaf9c6342bc3984210d1ae5f';
      id_WoRMS = '137206';
      id_Taxo = '48475'; 
      id_EoL = '454546';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;       
       
    case 'Emydura_macquarii'
      id_CoL = '3fd3f782ce264d9b03ccae31e613ea25';
      id_WoRMS = ''; % not present 2017/10/09
      id_Taxo = '93062';
      id_EoL = '794804';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Emydura_victoriae'
      id_CoL = '2ed822a666379339541ff00d3bf83269';
      id_WoRMS = ''; % not present 2018/08/01
      id_Taxo = '48266';
      id_EoL = '1056914';
      id_AnAge = '';  % not present 2018/08/01
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2018/08/01
       
    case 'Platysternon_megacephalum'
      id_CoL = '9e3d4546e9f1e79be8b7e03d1ec7752a';
      id_WoRMS = ''; % not present 2017/10/08
      id_Taxo = '48515'; 
      id_EoL = '791024';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Emys_orbicularis'
      id_CoL = 'ba71bd298d244353522becf4be071d6c';
      id_WoRMS = ''; % not present 2017/10/04
      id_Taxo = '48623'; 
      id_EoL = '1056912';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Actinemys_marmorata'
      id_CoL = '78118c44ff624eaf5c9c2834d564cf8e';
      id_WoRMS = ''; % not present 2019/05/11
      id_Taxo = '367865';  % present as Emys marmorata 2019/05/11
      id_EoL = '51380155';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      id_ADW = 'Emys_marmorata';
       
    case 'Glyptemys_insculpta'
      id_CoL = '9e5e9efd10dfb9e61bee4e02be6b1fe3';
      id_WoRMS = ''; % not present 2019/05/22
      id_Taxo = '640663';
      id_EoL = '1056845';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Terrapene_carolina'
      id_CoL = '48b801c4a49497a4fdbe8b9bdb7ec903';
      id_WoRMS = ''; % not present 2019/05/31
      id_Taxo = '48641';
      id_EoL = '1055222';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Gopherus_agassizii'
      id_CoL = 'c5e9526e98a713152334a74e1311d2a1';
      id_WoRMS = ''; % not present 2017/10/10
      id_Taxo = '398391'; 
      id_EoL = '456478';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Gopherus_morafkai'
      id_CoL = '142d882b549f28fa5878d3e358eaa9b2';
      id_WoRMS = ''; % not present 2019/05/10
      id_Taxo = '2740380'; 
      id_EoL = '20740311';
      id_AnAge = ''; % not present 2019/05/10
      id_ReptileDB = taxon_rep;
      id_ADW = ''; % not present 2019/05/10
       
    case 'Gopherus_polyphemus'
      id_CoL = '2c470b11270cf44f3d69dd022e6ac6e9';
      id_WoRMS = ''; % not present 2017/10/10
      id_Taxo = '48663'; 
      id_EoL = '456481';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Testudo_hermanni'
      id_CoL = 'de344232dec0a18f04e689df114abb38';
      id_WoRMS = ''; % not present 2017/10/04
      id_Taxo = '607892'; 
      id_EoL = '1055218';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Testudo_graeca'
      id_CoL = '2fa6a5c48b6ff1ea7b518aa3d37d1503';
      id_WoRMS = ''; % not present 2017/10/04
      id_Taxo = '607890'; 
      id_EoL = '1055221';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Astrochelys_yniphora'
      id_CoL = '2e6d0cb138e5f15803e6e2ebedaecf7a';
      id_WoRMS = ''; % not present 2019/06/25
      id_Taxo = '1685693'; 
      id_EoL = '794291';
      id_AnAge = ''; % not present 2019/0625
      id_ReptileDB = taxon_rep;
       
    case 'Psammobates_geometricus'
      id_CoL = '32994814c158dabc5aedcd72c8f27be3';
      id_WoRMS = ''; % not present 2019/06/25
      id_Taxo = '548956'; 
      id_EoL = '790924';
      id_AnAge = ''; % not present 2019/0625
      id_ReptileDB = taxon_rep;
       
    case 'Aldabrachelys_gigantea'
      id_CoL = 'c7ac6533a2e27e88c22624b9780bf004';
      id_WoRMS = ''; % not present 2017/10/10
      id_Taxo = '3806202'; 
      id_EoL = '795005'; % present as Dipsochelys dussumieri
      id_AnAge = 'Geochelone_gigantea';
      id_ReptileDB = taxon_rep;
      id_ADW = 'Dipsochelys_dussumieri';

    case 'Chelonoidis_niger'
      id_CoL = 'd70e55f5c72310311d5bd52089200292';
      id_WoRMS = ''; % not present 2017/10/11
      id_Taxo = '4682952'; 
      id_EoL = '794300'; % present as Chelonoidis nigra 2017/10/11
      id_AnAge = 'Geochelone_nigra';
      id_ReptileDB = taxon_rep;
      id_ADW = 'Chelonoidis_nigra';
      id_Wiki = 'Chelonoidis';

    case 'Stigmochelys_pardalis'
      id_CoL = 'f4a53caae2df0db7d89765b274570efa';
      id_WoRMS = ''; % not present 2017/10/11
      id_Taxo = '3818344'; 
      id_EoL = '794299'; % present as Psammobates pardalis 2017/10/11
      id_AnAge = 'Geochelone_pardalis';
      id_ReptileDB = taxon_rep;
      id_ADW = 'Psammobates_pardalis';

    case 'Centrochelys_sulcata'
      id_CoL = '5bf08ca8b8249e5b20d910870445c139';
      id_WoRMS = ''; % not present 2019/05/20
      id_Taxo = '3818344'; 
      id_EoL = '52310991';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
      id_ADW = 'Geochelone_sulcata';

    case 'Mauremys_japonica'
      id_CoL = 'ea5748c10a4bfa12e5ecdc6b36c7d993';
      id_WoRMS = ''; % not present 2017/10/05
      id_Taxo = '48581'; 
      id_EoL = '1055873';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Mauremys_sinensis'
      id_CoL = 'e1cfc2c8463ee0f1befcd8d223257b31';
      id_WoRMS = ''; % not present 2017/10/10
      id_Taxo = '1685684'; 
      id_EoL = '458849'; % present as Ocadia sinensis
      id_AnAge = ''; % not present 2017/10/10
      id_ReptileDB = taxon_rep;

    case 'Cuora_flavomarginata'
      id_CoL = 'd96fb3f9f1cba27ef6ee7875c24059ae';
      id_WoRMS = ''; % not present 2017/10/11
      id_Taxo = '48541'; 
      id_EoL = '1056709';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;

    case 'Batagur_baska'
      id_CoL = 'fc24ddcc0425418a0bff73c6a4b5d86f';
      id_WoRMS = ''; % not present 2018/08/03
      id_Taxo = '48530'; 
      id_EoL = '795612';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
      id_ADW = '';  % not present 2018/08/03

    case 'Melanochelys_tricarinata'
      id_CoL = '4156d1ec541a86477a334df31483b9ce';
      id_WoRMS = ''; % not present 2019/05/29
      id_Taxo = '460333'; 
      id_EoL = '1056096';
      id_AnAge = taxon; 
      id_ReptileDB = taxon_rep;
      id_ADW = '';  % not present 2019/05/29

    case 'Deinosuchus_rugosus'
      id_CoL = ''; % not present 2010/06/16
      id_Taxo = '50639'; % present as genus 2010/06/16      
      id_EoL = '4472734';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Alligator_mississippiensis'
      id_CoL = '258a54f64c1a663997eb9cca0549f840';
      id_Taxo = '50616';        
      id_EoL = '796029';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Caiman_crocodilus'
      id_CoL = '2169464fbc24236e32ec1d7b81a59a45';
      id_Taxo = '50619';        
      id_EoL = '46325161';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Paleosuchus_palpebrosus'
      id_CoL = '6a980d65999b7235f339d2da32af1ac5';
      id_Taxo = '50624';        
      id_EoL = '791224';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Gavialis_gangeticus'
      id_CoL = '6bef8e5a76defdae652840a7b3416c9b';
      id_Taxo = '50652';        
      id_EoL = '794627';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crocodylus_johnsoni'
      id_CoL = 'fcfe74af99e90cc51fee08e046d3aef2';
      id_Taxo = '50631'; 
      id_EoL = '795282';
      id_AnAge = ''; % not present 2017/06/18
      id_ReptileDB = taxon_rep;
       
    case 'Crocodylus_niloticus'
      id_CoL = '1a3211cb8764f54db424f9a4646c0075';
      id_Taxo = '50633';        
      id_EoL = '795278';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crocodylus_porosus'
      id_CoL = '77055811fbb2ddebe665dd8d77c394e1';
      id_Taxo = '50636';        
      id_EoL = '46559654';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crocodylus_acutus'
      id_CoL = '3aeef109bdd9c386386ef71795e993b9';
      id_Taxo = '50628';
      id_WoRMS = '422566';
      id_EoL = '1056415';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Crocodylus_moreletii'
      id_CoL = '0144c3ff17ca8872a046ca332981e37d';
      id_Taxo = '50632';
      id_WoRMS = ''; % not present at 2018/07/27
      id_EoL = '795280';
      id_AnAge = taxon;
      id_ReptileDB = taxon_rep;
       
    case 'Pterodaustro_guinazui'
      id_CoL = '7241febd761e916d77b5d64f223534f0';
      id_Taxo = '50713'; % present as genus        
      id_EoL = '4532321';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Plateosaurus_engelhardti'
      id_CoL = 'ae30514b08e4a9102ed0953d4e849809';
      id_Taxo = '50866'; % present as genus         
      id_EoL = '4531220';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Camerasaurus_spec'
      id_CoL = 'f507a35be496f4aa1295ce637ec4d07c'; % C. supremus
      id_Taxo = ''; % not present at 2017/06/16       
      id_Wiki = 'Camerasaurus';
      id_EoL = '4531400';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Rapetosaurus_krausei'
      id_CoL = '2fd163a61171a67edf1bbde17360805a'; 
      id_Taxo = ''; % not present at 2017/12/20       
      id_Wiki = 'Rapetosaurus';
      id_EoL = '4657962';
      id_AnAge = ''; % not present 2017/12/20
      id_ADW = ''; % not present at 2017/12/20 
      
    case 'Apatosaurus_spec'
      id_CoL = '901ec65eb9b9c783b00e6a2b21cde5d3'; % A. ajax
      id_Taxo = '50887'; % present as genus
      id_Wiki = 'Apatosaurus';
      id_EoL = '46370379';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Mamenchisaurus_spec'
      id_CoL = 'e65e3cac15fd4c7da196864957452e52'; % M. anyuensis
      id_Taxo = '50894'; % present as genus
      id_Wiki = 'Mamenchisaurus';
      id_EoL = '46370693';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09
      
    case 'Psittacosaurus_mongoliensis'
      id_CoL = '53bc6644c4a20fc8606d32a8104206c0';
      id_Taxo = '51062'; % present as genus           
      id_EoL = '4532055';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Maiasaura_peeblesorum'
      id_CoL = 'a8a49429384c6e0baa7d523cfa760e16';
      id_Taxo = '50959'; % present as genus              
      id_EoL = '4530718';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Daspletosaurus_torosus'
      id_CoL = 'd220ef2c6ad58b7d730719f5ad838bf8';
      id_Taxo = '50838'; % present as genus       
      id_EoL = '4433652';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Gorgosaurus_libratus'
      id_CoL = '54cd15bf2e0366e56b694ffd4318a821';
      id_Taxo = '1674440';        
      id_EoL = '13386365';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Tyrannosaurus_rex'
      id_CoL = '5b355e6aa28cdfd9bed3c5ed8f4a828d';
      id_Taxo = '50842';        
      id_EoL = '4433638';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      
    case 'Archaeopteryx_lithographica'
      id_CoL = 'b9239f5c1ac241577326804d5d856bf6';
      id_Taxo = '51227';        
      id_EoL = '42332498';
      id_AnAge = ''; % not present 2017/06/18
      id_ADW = ''; % not present at 2017/08/09 
      id_avibase = '76B6FC8B4372AA35';
      
    case 'Struthio_camelus'
      id_CoL = 'e763abecc4e6a356b9764fe1904c045a';
      id_Taxo = '51245';        
      id_EoL = '1178371';
      id_AnAge = taxon;       
      id_avibase = '2247CB050A76CF8E';
      id_birdlife = 'common-ostrich-struthio-camelus';
      
    case 'Rhynchotus_rufescens'
      id_CoL = 'f4c7658ba36fc777a545f8cdc47d11f9';
      id_Taxo = '51378';        
      id_EoL = '1178398';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = 'C141F60AC7A92F11';
      id_birdlife = 'red-winged-tinamou-rhynchotus-rufescens';
      
    case 'Rhea_americana'
      id_CoL = 'e97ede28aa4346a1972c1fd2e7d24740';
      id_Taxo = '51258';        
      id_EoL = '1178370';
      id_AnAge = taxon;      
      id_avibase = '00986B2456382647';
      id_birdlife = 'greater-rhea-rhea-americana';
      
    case 'Apteryx_mantelli'
      id_CoL = 'a2d2e28e381809c970138675ba310656';
      id_Taxo = '51310'; % unaccepted, to  Apteryx australis mantelli Bartlett, 1852      
      id_EoL = '130161';
      id_AnAge = ''; % not present at 2017/06/18 
      id_ADW = 'Apteryx_australis_mantelli';
      id_avibase = 'DB55CB8CC8C20EA5';
      id_birdlife = 'northern-brown-kiwi-apteryx-mantelli';
      
    case 'Dromaius_novaehollandiae'
      id_CoL = 'e211d1636655d7a1b1f48fdb2c584dae';
      id_Taxo = '51279';        
      id_EoL = '1178369';
      id_AnAge = taxon;       
      id_avibase = '2DB5A9703C6D4D91';
      id_birdlife = 'common-emu-dromaius-novaehollandiae';
      
    case 'Casuarius_casuarius'
      id_CoL = 'abe8a3ef7a1530d31bea06c146b41d38';
      id_Taxo = '79005';        
      id_EoL = '1178368';
      id_AnAge = taxon;       
      id_avibase = '8B9D93D84AC854E7';
      id_birdlife = 'southern-cassowary-casuarius-casuarius';
      
    case 'Casuarius_bennetti'
      id_CoL = '51002418147c03aa99cc046a2a36faef';
      id_Taxo = '93147';        
      id_EoL = '1178366';
      id_AnAge = taxon;       
      id_avibase = '7751E0D145194220';
      id_birdlife = 'dwarf-cassowary-casuarius-bennetti';
      
    case 'Alectura_lathami'
      id_CoL = '0af00c8374b5551a726a6d761528a5a8';
      id_Taxo = '52879';        
      id_EoL = '1050123';
      id_AnAge = taxon;       
      id_avibase = '6BD20F58A143D7D0';
      id_birdlife = 'australian-brush-turkey-alectura-lathami';

    case 'Crax_blumenbachii'
      id_CoL = 'cac1341a788f448b3ac8b95258714fae';
      id_Taxo = '69946';        
      id_EoL = '1050105';
      id_AnAge = ''; % not present 2018/08/12      
      id_avibase = 'CB3380D4DC930DC9';
      id_birdlife = 'red-billed-curassow-crax-blumenbachii';

    case 'Oreophasis_derbianus'
      id_CoL = '2ddfe4c486c504be14f2d5585570e21b';
      id_Taxo = '52896';        
      id_EoL = '46375695';
      id_AnAge = ''; % not present 2018/08/04       
      id_avibase = '9584A5CAEB0ECF19';
      id_birdlife = 'horned-guan-oreophasis-derbianus';
      id_ADW = ''; % not present 2018/08/04     

    case 'Numida_meleagris'
      id_CoL = '458ff2b044b064bcb660d802d9210136';
      id_Taxo = '53223';    
      id_EoL = '1049265';
      id_AnAge = taxon;       
      id_avibase = '1044B438EE7556BB';
      id_birdlife = 'helmeted-guineafowl-numida-meleagris';

    case 'Colinus_virginianus'
      id_CoL = '724211a845f6689a43faca49e240b73a';
      id_Taxo = '5';    
      id_EoL = '1049187';
      id_AnAge = taxon;      
      id_avibase = '91CCBC719C97AE19';
      id_birdlife = 'northern-bobwhite-colinus-virginianus';

    case 'Coturnix_japonica'
      id_CoL = 'f3b9c1a1a8e00ce2b6750a8db1424b32';
      id_Taxo = '70044';    
      id_EoL = '1049255';
      id_AnAge = taxon;       
      id_avibase = '110CF4251A857B0D';
      id_birdlife = 'japanese-quail-coturnix-japonica';

    case 'Meleagris_gallopavo'
      id_CoL = '90f32bb8ffc73aa187bb7c2a7d266bbe';
      id_Taxo = '52932';    
      id_EoL = '1049266';
      id_AnAge = taxon;       
      id_avibase = '9C5ED06A51A9FFEE';
      id_birdlife = 'wild-turkey-meleagris-gallopavo';

    case 'Gallus_gallus'
      id_CoL = 'e9bd1de9ad04b90064cf96a24cf98310';
      id_Taxo = '53136';    
      id_Wiki = 'Gallus_gallus';
      id_EoL = '1049263';
      id_AnAge = 'Gallus_gallus';
      id_ADW = 'Gallus_gallus'; 
      id_avibase = '3749777E14C923E9';
      id_birdlife = 'red-junglefowl-gallus-gallus';

    case 'Gallus_gallus_IR'
      id_CoL = 'e9bd1de9ad04b90064cf96a24cf98310';
      id_Taxo = '53136';    
      id_Wiki = 'Gallus_gallus';
      id_EoL = '1049263';
      id_AnAge = 'Gallus_gallus';
      id_ADW = 'Gallus_gallus'; 
      id_avibase = '3749777E14C923E9';
      id_birdlife = 'red-junglefowl-gallus-gallus';

    case 'Gallus_gallus_WL'
      id_CoL = 'e9bd1de9ad04b90064cf96a24cf98310';
      id_Taxo = '53136';    
      id_Wiki = 'Gallus_gallus';
      id_EoL = '1049263';
      id_AnAge = 'Gallus_gallus';
      id_ADW = 'Gallus_gallus'; 
      id_avibase = '3749777E14C923E9';
      id_birdlife = 'red-junglefowl-gallus-gallus';

    case 'Polyplectron_inopinatum'
      id_CoL = '1cd8fd9560f28ff6320c5c2673f248ac';
      id_Taxo = '53201';    
      id_EoL = '915294';
      id_AnAge = taxon;       
      id_avibase = 'B79C272AEE35468A';
      id_birdlife = 'mountain-peacock-pheasant-polyplectron-inopinatum';

    case 'Phasianus_colchicus'
      id_CoL = '0a0fba2155026aed25c91e441dd10e39';
      id_Taxo = '53178';    
      id_EoL = '1049238';
      id_AnAge = taxon;       
      id_avibase = '2FA39DCD42F80BC9';
      id_birdlife = 'common-pheasant-phasianus-colchicus';

    case 'Pavo_cristatus'
      id_CoL = '43ca8de77a0ff6be8503f4c059e08531';
      id_Taxo = '53209';    
      id_EoL = '1049264';
      id_AnAge = taxon;       
      id_avibase = 'A8C34DC9655204ED';
      id_birdlife = 'indian-peafowl-pavo-cristatus';

    case 'Tetrastes_bonasia'
      id_CoL = '48797b9cd84c84166eca6c1bc4a3b01f';
      id_Taxo = '52966';        
      id_EoL = '892334';
      id_AnAge = taxon;       
      id_avibase = 'B8CA2EEB4E7E0CA3';
      id_birdlife = 'hazel-grouse-bonasa-bonasia';

    case 'Lagopus_lagopus'
      id_CoL = 'cc44b7c6ba27a371b4574fd49d093e73';
      id_Taxo = '52946';        
      id_EoL = '1049176';
      id_AnAge = taxon;       
      id_avibase = '6CCEAF5D74B10547';
      id_birdlife = 'willow-grouse-lagopus-lagopus';

    case 'Dendragapus_obscurus'
      id_CoL = 'eb714e41b187b71a43032fcf8e28e830';
      id_Taxo = '52942';        
      id_EoL = '1049186';
      id_AnAge = taxon;       
      id_avibase = 'A55D83A9520AA6DA';
      id_birdlife = 'dusky-grouse-dendragapus-obscurus';

    case 'Tympanuchus_pallidicinctus'
      id_CoL = '3123bfee017d2a744e0f11759e0b2c90';
      id_Taxo = '52978';        
      id_EoL = '1049178';
      id_AnAge = taxon;       
      id_avibase = 'CFFD1491D1F401D8';
      id_birdlife = 'lesser-prairie-chicken-tympanuchus-pallidicinctus';

    case 'Dendrocygna_autumnalis'
      id_CoL = '4e1e8c04381d169a0efa7c2404e62761';
      id_WoRMS = '422567';
      id_Taxo = '51988';
      id_EoL = '914533';
      id_AnAge = taxon;       
      id_avibase = 'C01A22D6C148AC65';
      id_birdlife = 'black-bellied-whistling-duck-dendrocygna-autumnalis';

    case 'Anas_platyrhynchos'
      id_CoL = 'd5d9d6e502eb4c9f10b094dfdd935e65';
      id_WoRMS = '148791';
      id_Taxo = '52161';
      id_EoL = '1047918';
      id_AnAge = taxon;       
      id_avibase = '85625D75F2524457';
      id_birdlife = 'mallard-anas-platyrhynchos';

    case 'Anas_acuta'
      id_CoL = '810f7f477f3a60dda80a1d44fb013d7e';
      id_WoRMS = '158939';
      id_Taxo = '52128';
      id_EoL = '1048943';
      id_AnAge = taxon;       
      id_avibase = '56CCA7179C9FA71D';
      id_birdlife = 'northern-pintail-anas-acuta';

    case 'Anas_sparsa'
      id_CoL = '3cde9bf292c2d4cf3dbebc8aa1018d70';
      id_WoRMS = ''; % not present 2018/10/17
      id_Taxo = '52176';
      id_EoL = '914434';
      id_AnAge = ''; % not present 2018/10/17       
      id_avibase = '1EAFAD9FAED6B99B';
      id_birdlife = 'african-black-duck-anas-sparsa';

    case 'Mareca_strepera'
      id_CoL = '42e48afc8f660b16f95a96fecb2917ea'; % present as Anas strepera 26/09/26
      id_WoRMS = '159171'; % present as Anas strepera 26/09/26
      id_Taxo = '52179'; % present as Anas strepera 26/09/26
      id_EoL = '1048943';
      id_AnAge = 'Anas_strepera';       
      id_avibase = 'C235A4D712BB8855';
      id_birdlife = 'gadwall-mareca-strepera';

    case 'Oxyura_jamaicensis'
      id_CoL = 'b6ae3729b1f8cda01a8038a499269df4';
      id_WoRMS = '159100';
      id_Taxo = '52292';
      id_EoL = '1048999';
      id_AnAge = taxon;       
      id_avibase = 'CD7DC84B28AE24C8';
      id_birdlife = 'ruddy-duck-oxyura-jamaicensis';

    case 'Cygnus_cygnus'
      id_CoL = '048c3604858bbf6d70ab496964f3ba52';
      id_WoRMS = '159089';
      id_Taxo = '52045';        
      id_EoL = '913229';
      id_AnAge = taxon;       
      id_avibase = 'BDDB5670D2D20A55';
      id_birdlife = 'whooper-swan-cygnus-cygnus';
      
    case 'Anser_anser'
      id_CoL = 'f3b71b737f0e8278c008665312f23264';
      id_WoRMS = '416682';
      id_Taxo = '52000';        
      id_EoL = '1047334';
      id_AnAge = taxon;       
      id_avibase = '4AED44E819A43204';
      id_birdlife = 'greylag-goose-anser-anser';
      
     case 'Anser_caerulescens'
      id_CoL = 'a609fa29f56aab8d0ab2dc8f993cebd0';
      id_WoRMS = '1034711';
      id_Taxo = '52004';        
      id_EoL = '1048460'; % present as Chen caerulescens
      id_AnAge = 'Chen_caerulescens';       
      id_avibase = 'D3A260BCA65503C6';
      id_birdlife = 'snow-goose-anser-caerulescens';
      
     case 'Branta_hutchinsii'
      id_CoL = 'd3cd280ccb0c29ebb0fecb847da9fe4a';
      id_WoRMS = '422569';
      id_Taxo = '52023'; % present as Branta canadensis      
      id_EoL = '1065131'; 
      id_AnAge = taxon;       
      id_avibase = '60214D4970BA4158';
      id_birdlife = 'cackling-goose-branta-hutchinsii';
      
     case 'Branta_leucopsis'
      id_CoL = '898775cafe3c7b335815f149525575d0';
      id_WoRMS = '159177';
      id_Taxo = '52028';  
      id_EoL = '1048436'; 
      id_AnAge = taxon;       
      id_avibase = '3163ED86A508BB83';
      id_birdlife = 'barnacle-goose-branta-leucopsis';
      
    case 'Cereopsis_novaehollandiae'
      id_CoL = '6fcfa7cd5faa33888bdd3b5258ed9f23';
      id_WoRMS = '137074';
      id_Taxo = '52255';        
      id_EoL = '1048993';
      id_AnAge = taxon;       
      id_avibase = 'CA875F313CC1FB4B';
      id_birdlife = '22679958';
      
    case 'Mergus_merganser'
      id_CoL = 'dd005d87ee7a39a731b69942401091df';
      id_WoRMS = '159097';
      id_Taxo = '52280';        
      id_EoL = '1049001';
      id_AnAge = taxon;      
      id_avibase = '407E2CA886367DBB';
      id_birdlife = 'goosander-mergus-merganser';

    case 'Mergus_serrator'
      id_CoL = 'cbe66f861f86562456b2d7e1ef5de373';
      id_WoRMS = '159098';
      id_Taxo = '52282';        
      id_EoL = '1049002';
      id_AnAge = taxon;       
      id_avibase = '8DB64266A42FC19B';
      id_birdlife = 'red-breasted-merganser-mergus-serrator';

    case 'Somateria_mollissima'
      id_CoL = 'e999b4ec3f0ee05bcd43a62b67baaf64';
      id_WoRMS = '137074';
      id_Taxo = '52255';        
      id_EoL = '1048993';
      id_AnAge = taxon;       
      id_avibase = 'B77377EEB852D0AF';
      id_birdlife = 'common-eider-somateria-mollissima';

    case 'Melanitta_perspicillata'
      id_CoL = 'f9894443879efbdfd2b1b84dddc7b32a';
      id_WoRMS = '159095';
      id_Taxo = '52275';        
      id_EoL = '1048997';
      id_AnAge = taxon;       
      id_avibase = '624078BAC17F8111';
      id_birdlife = 'surf-scoter-melanitta-perspicillata';

    case 'Melanitta_deglandi'
      id_CoL = '4bfe3bac7b4f31e837b3f8b073371c44'; % present as Melanitta fusca deglandi 2018/09/26
      id_WoRMS = '567404';
      id_Taxo = '107572'; % present as Melanitta fusca deglandi 2018/09/26       
      id_EoL = '1266316'; % present as Melanitta fusca deglandi 2018/09/26
      id_AnAge = 'Melanitta_fusca';       
      id_avibase = '31FB19D46391C346';
      id_birdlife = 'white-winged-scoter-melanitta-deglandi';

    case 'Aythya_fuligula'
      id_CoL = '7d788c57f99de05c3d37b04ee6dd1918';
      id_WoRMS = '159164';
      id_Taxo = '52214';
      id_EoL = '1048974';
      id_AnAge = taxon;       
      id_avibase = '67CEA1C1FC88F1DB';
      id_birdlife = 'tufted-duck-aythya-fuligula';

    case 'Aythya_americana'
      id_CoL = '5dc5a9e15a584ee7a4459f572546bd32';
      id_WoRMS = '159162';
      id_Taxo = '52209';
      id_EoL = '1048964';
      id_AnAge = taxon;       
      id_avibase = '3072CC168280168B';
      id_birdlife = 'redhead-aythya-americana';
     
    case 'Aythya_affinis'
      id_CoL = '5c76f12fd43fda4c5dab84bf806115eb';
      id_WoRMS = '159161';
      id_Taxo = '52208';
      id_EoL = '1048973';
      id_AnAge = taxon;       
      id_avibase = '50566E50C91B8686';
      id_birdlife = 'lesser-scaup-aythya-affinis';
     
    case 'Aythya_valisineria'
      id_CoL = '88d0a25f01d66b0b94793bf03ff433a3';
      id_WoRMS = '159161';
      id_Taxo = '93182';
      id_EoL = '1048967';
      id_AnAge = taxon;       
      id_avibase = '1929E1E16E073570';
      id_birdlife = 'canvasback-aythya-valisineria';
     
    case 'Tadorna_cana'
      id_CoL = 'f819e4dcfa4a80a35f88f5487d637164';
      id_WoRMS = '1037325';
      id_Taxo = '52119';        
      id_EoL = '1047358';
      id_AnAge = ''; % not present 2018/09/26       
      id_avibase = 'D9DEA77E9D637151';
      id_birdlife = 'south-african-shelduck-tadorna-cana';
      
    case 'Aix_galericulata'
      id_CoL = 'f68b161ded0c00096f5557a6c189f3e4';
      id_WoRMS = '416679';
      id_Taxo = '52226';        
      id_EoL = '1048478';
      id_AnAge = taxon;      
      id_avibase = 'E1714A09EA1DFD1D';
      id_birdlife = 'mandarin-duck-aix-galericulata';
      
    case 'Chloephaga_picta'
      id_CoL = 'd8faf6eabe3517ba21021e5551aed9c5';
      id_WoRMS = ''; % not present 2018/10/11
      id_Taxo = '52101';     
      id_EoL = '1048516';
      id_AnAge = '';  % not present 2018/10/11      
      id_avibase = '74FC5DAB02BDF076';
      id_birdlife = 'upland-goose-chloephaga-picta';
      
    case 'Podilymbus_podiceps'
      id_CoL = 'efd1147e3604cc229f2e7dcafb95ca0b';
      id_WoRMS = '';
      id_Taxo = '51980';        
      id_EoL = '1048513';
      id_AnAge = taxon;       
      id_avibase = '9A8E55D00554A088';
      id_birdlife = 'pied-billed-grebe-podilymbus-podiceps';

    case 'Phoeniconaias_minor'
      id_CoL = '8b96caa363071f1641f8a492c77d2cb8';
      id_WoRMS = '212710';
      id_Taxo = '169341';        
      id_EoL = '1049437';
      id_AnAge = taxon;       
      id_avibase = 'B06A9079584A8D53';
      id_birdlife = 'lesser-flamingo-phoeniconaias-minor';

    case 'Phoenicopterus_roseus'
      id_CoL = '3e491be51454f21391b658ef5452593f';
      id_WoRMS = '212708';
      id_Taxo = '51958';  
      id_EoL = '2869804';
      id_AnAge = taxon;       
      id_avibase = '0F9B5174A8ACF737';
      id_birdlife = 'greater-flamingo-phoenicopterus-roseus';

    case 'Zenaida_macroura'
      id_CoL = '87953fddcf786f5bf12dd480a8b0ae12';
      id_Taxo = '54054';   
      id_EoL = '1050134';
      id_AnAge = taxon;       
      id_avibase = '00124D987C95811B';
      id_birdlife = 'mourning-dove-zenaida-macroura';

    case 'Patagioenas_fasciata'
      id_CoL = '0b47943f1e932f8673021f8eb9ac0771';
      id_Taxo = ''; % not present 2018/08/03       
      id_EoL = '1064947';
      id_AnAge = taxon;       
      id_avibase = '31ACA9981952B4C4';
      id_birdlife = 'northern-band-tailed-pigeon-patagioenas-fasciata';

    case 'Streptopelia_decaocto'
      id_CoL = 'be859a5ea349fa8486b88d34163c83d1';
      id_Taxo = '54033';        
      id_EoL = '915275';
      id_AnAge = taxon;       
      id_avibase = '41FACE6330A2F073';
      id_birdlife = 'eurasian-collared-dove-streptopelia-decaocto';

    case 'Columba_oenas'
      id_CoL = 'ed30f61f67a50dfc7efd082e23ec61b9';
      id_Taxo = '53977'; 
      id_EoL = '1049690';
      id_AnAge = taxon;       
      id_avibase = '68E4C0D1404A46D8';
      id_birdlife = 'stock-dove-columba-oenas';

    case 'Columba_livia'
      id_CoL = '625498c7f0f49724cd81aae39db4e1e5';
      id_Taxo = '53973';        
      id_EoL = '1276446';
      id_AnAge = taxon;       
      id_avibase = 'BBA263C235B15B88';
      id_birdlife = 'rock-dove-columba-livia';

    case 'Columba_palumbus'
      id_CoL = '1804a584e2abad22cb877a39f00bb1d6';
      id_Taxo = '53978';        
      id_EoL = '1049693';
      id_AnAge = taxon;       
      id_avibase = '760F307A30689D66';
      id_birdlife = 'common-woodpigeon-columba-palumbus';

    case 'Caloenas_nicobarica'
      id_CoL = 'ea496f20e6c2411aaf5fe84a8389a39c';
      id_Taxo = '53957';        
      id_EoL = '1047263';
      id_AnAge = taxon;       
      id_avibase = '0FFC77EF1BC55357';
      id_birdlife = 'nicobar-pigeon-caloenas-nicobarica';
      id_ADW = ''; % not present at 2018/08/31

    case 'Hemiphaga_novaeseelandiae'
      id_CoL = 'd13a6a3fbb7c93b283b24514d976ebb2';
      id_Taxo = '54075';        
      id_EoL = '1049942';
      id_AnAge = ''; % not present 2018/10/19       
      id_avibase = '0A127E49E9FB6263';
      id_birdlife = 'new-zealand-pigeon-hemiphaga-novaeseelandiae';

    case 'Mesitornis_variegatus'
      id_CoL = 'a990bffed92b9b55d3f6cfb8572597e8';
      id_Taxo = '1122776';        
      id_EoL = '892225';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = 'ABDA1FE517C51198';
      id_birdlife = 'white-breasted-mesite-mesitornis-variegatus';

    case 'Pterocles_alchata'
      id_CoL = '470ed15824f0e16f12532abcfa8feb54';
      id_Taxo = '53935';        
      id_EoL = '1049523';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '493C4CF8D0200AB4';
      id_birdlife = 'pin-tailed-sandgrouse-pterocles-alchata';
      
    case 'Pterocles_orientalis'
      id_CoL = 'c27bb1168b228b5d2613727b79939782';
      id_Taxo = '53945';        
      id_EoL = '1049533';
      id_AnAge = ''; % not present at 2018/10/28       
      id_avibase = '06B41945B9E57EC4';
      id_birdlife = 'black-bellied-sandgrouse-pterocles-orientalis';
      
    case 'Apus_apus'
      id_CoL = '9623ca15e5c36c273a9e571b97ba8107';
      id_Taxo = '54867';        
      id_EoL = '1046068';
      id_AnAge = taxon;      
      id_avibase = '4E6EF3F983079D73';
      id_birdlife = 'common-swift-apus-apus';

    case 'Aerodramus_fuciphagus'
      id_CoL = 'e28105e25649dc3ac43a4ce3ff4dee2b';
      id_Taxo = '72156';        
      id_EoL = '1048602';
      id_AnAge = ''; % not present 2018/10/05      
      id_avibase = '711541ED8D72AB0F';
      id_birdlife = 'edible-nest-swiftlet-aerodramus-fuciphagus';
      id_ADW = ''; % not present 2018/10/11

    case 'Aerodramus_spodiopygius'
      id_CoL = '5a2063684286a3190213fc163ac6ee9d';
      id_Taxo = '72154';        
      id_EoL = '916126';
      id_AnAge = ''; % not present 2018/10/11      
      id_avibase = 'E1989B1D2C76266F';
      id_birdlife = 'white-rumped-swiftlet-aerodramus-spodiopygius';
      id_ADW = ''; % not present 2018/10/11
      
    case 'Archilochus_alexandri'
      id_CoL = '6b01e05030a20cc0e9fb9e44afb24ea0';
      id_Taxo = '72515';        
      id_EoL = '916375';
      id_AnAge = taxon;      
      id_avibase = '4BB4F25726A8B123';
      id_birdlife = 'black-chinned-hummingbird-archilochus-alexandri';

    case 'Sternoclyta_cyanopectus'
      id_CoL = 'f644eb33e84502dbe136f4fcb483edec';
      id_Taxo = '72450';        
      id_EoL = '1048842';
      id_AnAge = ''; % not present 2018/09/30      
      id_avibase = 'B1A4A6A075AAE499';
      id_birdlife = 'violet-chested-hummingbird-sternoclyta-cyanopectus';

    case 'Doricha_eliza'
      id_CoL = 'a7a7d18577ba3cef29b49e505ab55abe';
      id_Taxo = '72511';        
      id_EoL = '914889';
      id_AnAge = ''; % not present 2018/10/01      
      id_avibase = 'B1A4A6A075AAE499';
      id_birdlife = 'mexican-sheartail-doricha-eliza';

    case 'Coeligena_torquata'
      id_CoL = 'f6cb50499f3592012fc425264178c3bd';
      id_Taxo = '54984';        
      id_EoL = '1048861';
      id_AnAge = ''; % not present 2018/10/20      
      id_avibase = 'EEC0213C766906AE';
      id_birdlife = 'collared-inca-coeligena-torquata';

    case 'Lampornis_clemenciae'
      id_CoL = '742d5d06aba6714a9b4283f322c4282f';
      id_Taxo = '55044';        
      id_EoL = '18120';
      id_AnAge = taxon;  
      id_avibase = '97FB2BC90F977D37';
      id_birdlife = 'blue-throated-hummingbird-lampornis-clemenciae';

    case 'Aegotheles_cristatus'
      id_CoL = 'e77dc5c18f2a229366e15a70c599332f';
      id_Taxo = '54805';        
      id_EoL = '1178113';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = 'FAF780DFD2BE5ED7';
      id_birdlife = 'australian-owlet-nightjar-aegotheles-cristatus';

    case 'Chordeiles_minor'
      id_CoL = '48104bea3d3cf8b74f31be21bdb7e297';
      id_Taxo = '54809';        
      id_EoL = '915489';
      id_AnAge = taxon;    
      id_avibase = '24E39ACD5692DA4A';
      id_birdlife = 'common-nighthawk-chordeiles-minor';
      
    case 'Caprimulgus_pectoralis'
      id_CoL = 'f7ff6f0a74d8721acada5cb8893073f0';
      id_Taxo = '72121';        
      id_EoL = '1178156';
      id_AnAge = ''; % not present 2018/10/18    
      id_avibase = '62ED1974CD8DF56F';
      id_birdlife = 'fiery-necked-nightjar-caprimulgus-pectoralis';
      
    case 'Podargus_strigoides'
      id_CoL = '77210dd21b917f4baf425d753ad78f02';
      id_Taxo = '54798';        
      id_EoL = '1178209';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '8500F1302409AD32';
      id_birdlife = 'tawny-frogmouth-podargus-strigoides';
      
    case 'Cuculus_canorus'
      id_CoL = '01a48abb4f3aba76b904ac4c7a32f20a';
      id_Taxo = '54514';        
      id_EoL = '913266';
      id_AnAge = taxon;      
      id_avibase = 'B3D2C3C5B73EC8E8';
      id_birdlife = 'common-cuckoo-cuculus-canorus';
      
    case 'Clamator_glandarius'
      id_CoL = '02135d597ace84d87208d04918b1beba';
      id_Taxo = '54509';        
      id_EoL = '914624';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '3D67C56A490A60AE';
      id_birdlife = 'great-spotted-cuckoo-clamator-glandarius';
      
    case 'Dromococcyx_pavoninus'
      id_CoL = '4c358f03116fb953072cfb94d499aee6';
      id_Taxo = '54591';        
      id_EoL = '913255';
      id_AnAge = ''; % not present at 2018/10/01      
      id_avibase = '489295C7AEBFA666';
      id_birdlife = 'pavonine-cuckoo-dromococcyx-pavoninus';
      id_ADW = ''; % not present at 2018/10/01   
      
    case 'Chalcites_basalis'
      id_CoL = '9f4bb6f75b40fb4c867ba69289f15238'; % present as Chrysococcyx basalis 2018/10/01
      id_Taxo = '54498'; % present as Chrysococcyx basalis 2018/10/01      
      id_EoL = '914664'; % present as Chrysococcyx basalis 2018/10/01
      id_AnAge = ''; % not present at 2018/10/01      
      id_avibase = '91248B47E0E2F515';
      id_birdlife = 'horsfields-bronze-cuckoo-chalcites-basalis';
      id_ADW = ''; % not present at 2018/10/01   
      
    case 'Chalcites_lucidus'
      id_CoL = '0ab9528c1efa108c20d5a91254367de4'; % present as Chrysococcyx lucidus 2018/10/01
      id_Taxo = '54502'; % present as Chrysococcyx lucidus 2018/10/01      
      id_EoL = '914909'; % present as Chrysococcyx lucidus 2018/10/01
      id_AnAge = ''; % not present at 2018/10/01      
      id_avibase = '1926839510D8C228';
      id_birdlife = 'shining-bronze-cuckoo-chalcites-lucidus';
      id_ADW = ''; % not present at 2018/10/01   
      
    case 'Tauraco_erythrolophus'
      id_CoL = '4044ed76e392318b4727c7de43ddb7a5';
      id_Taxo = '54466';        
      id_EoL = '915606';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '91187A5248462828';
      id_birdlife = 'red-crested-turaco-tauraco-erythrolophus';
      
    case 'Ardeotis_kori'
      id_CoL = '185f3057c97c4f10fd7a1c483282d5a1';
      id_Taxo = '53450';        
      id_EoL = '915382';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '4FC41CA0DC1B12AF';
      id_birdlife = 'kori-bustard-ardeotis-kori';
      
    case 'Chlamydotis_undulata'
      id_CoL = 'e1a6f7d9973a2e36b5e93bcd917941c5';
      id_Taxo = '53453';        
      id_EoL = '915384';
      id_AnAge = taxon;     
      id_avibase = '5714C710ACE4DA8B';
      id_birdlife = 'african-houbara-chlamydotis-undulata';
      
    case 'Opisthocomus_hoazin'
      id_CoL = 'ad3bcef887f4c268792c37f0d373faff';
      id_Taxo = '54479';        
      id_EoL = '914698';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '7E83A1B3DC1F8644';
      id_birdlife = 'hoatzin-opisthocomus-hoazin';
      
    case 'Calidris_ferruginea'
      id_CoL = '9b0c2d95deffed6fa89cdb208c187026';
      id_WoRMS = '159049';
      id_Taxo = '53737'; 
      id_EoL = '1049496';
      id_AnAge = taxon;      
      id_avibase = '143A681C9BCE9A20';
      id_birdlife = 'curlew-sandpiper-calidris-ferruginea';
      
    case 'Calidris_alpina'
      id_CoL = '3573e87083ded2fb1ffc96183f7def79';
      id_WoRMS = '159047';
      id_Taxo = '53732';        
      id_EoL = '1049497';
      id_AnAge = taxon;       
      id_avibase = '15369E8EB4CBD064';
      id_birdlife = 'dunlin-calidris-alpina';
      
    case 'Calidris_bairdii'
      id_CoL = 'b332bce93951f2c8b34f237074c8b5bc';
      id_WoRMS = '159048';
      id_Taxo = '53735';        
      id_EoL = '1049483';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = '1F1AD154DAE2E070';
      id_birdlife = 'bairds-sandpiper-calidris-bairdii';
      
    case 'Calidris_minuta'
      id_CoL = '9690a93b47b604e28ac765c2345ba29c';
      id_WoRMS = '212600';
      id_Taxo = '53742';        
      id_EoL = '1049519';
      id_AnAge = taxon;       
      id_avibase = '9936FF4AFB430504';
      id_birdlife = 'little-stint-calidris-minuta';
      
    case 'Calidris_minutilla'
      id_CoL = '81a637f1ff6e3f1fda7a976824ba5adc';
      id_WoRMS = '159054';
      id_Taxo = '53743';        
      id_EoL = '1049484';
      id_AnAge = taxon;      
      id_avibase = 'A47B0BD448AA34E0';
      id_birdlife = 'least-sandpiper-calidris-minutilla';
      
    case 'Calidris_maritima'
      id_CoL = 'a35342e9335b7725fa58bc1da7787203';
      id_WoRMS = '159052';
      id_Taxo = '53739';        
      id_EoL = '1049471';
      id_AnAge = taxon;      
      id_avibase = '0A0B84313ACFFB2F';
      id_birdlife = 'purple-sandpiper-calidris-maritima';
      
    case 'Philomachus_pugnax'
      id_CoL = '7b48212a290510deccad5344b1d61986';
      id_WoRMS = '159046';
      id_Taxo = '53753';        
      id_EoL = '1049551';
      id_AnAge = taxon;      
      id_avibase = '2DABF98FBEEAB7BB'; % present as Calidris pugnax
      id_birdlife = 'ruff-calidris-pugnax';
      
    case 'Tringa_flavipes'
      id_CoL = 'dfc3b9462212b04edcb721a3db10791e';
      id_WoRMS = '159030';
      id_Taxo = '53669';        
      id_EoL = '1049439';
      id_AnAge = taxon;       
      id_avibase = '2C7A2673444BECF0';
      id_birdlife = 'lesser-yellowlegs-tringa-flavipes';
      
    case 'Tringa_totanus'
      id_CoL = '962fa82c8b0d12d96bfcc94a9fe3fe01';
      id_WoRMS = '158970';
      id_Taxo = '53680';        
      id_EoL = '1049441';
      id_AnAge = taxon;       
      id_avibase = 'D6BFC73A3E067711';
      id_birdlife = 'common-redshank-tringa-totanus';
      
    case 'Coenocorypha_huegeli'
      id_CoL = 'b67c28a73b6f183d08de8a576d3432f5';
      id_WoRMS = ''; % not present 2018/10/19
      id_Taxo = '53705'; % present as Coenocorypha aucklandica 2018/10/19     
      id_EoL = '4373934';
      id_AnAge = ''; % not present 2018/10/19       
      id_avibase = '90E8B13BBB299CCD';
      id_birdlife = 'snares-snipe-coenocorypha-huegeli';
      id_ADW = 'Coenocorypha_aucklandica_huegeli';
      
    case 'Coenocorypha_pusilla'
      id_CoL = '81afa953177d6f7ab87b2b67e7de1111';
      id_WoRMS = ''; % not present 2018/10/19
      id_Taxo = '158863';        
      id_EoL = '10634856';
      id_AnAge = ''; % not present 2018/10/19       
      id_avibase = '168E36269B6A854B';
      id_birdlife = 'chatham-snipe-coenocorypha-pusilla';
      
    case 'Limnodromus_griseus'
      id_CoL = 'e45c6cab6f6609688ad3f1f3fcd1ff3f';
      id_WoRMS = '158955';
      id_Taxo = '53721';        
      id_EoL = '1049540';
      id_AnAge = taxon;       
      id_avibase = '4A3B2CFF53868550';
      id_birdlife = 'short-billed-dowitcher-limnodromus-griseus';
      
    case 'Limosa_haemastica'
      id_CoL = '33c1fb3078fbaabe8a5b2112bece7d67';
      id_WoRMS = '159033';
      id_Taxo = '53654';        
      id_EoL = '1049549';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = '930139644308C7B7';
      id_birdlife = 'hudsonian-godwit-limosa-haemastica';
      
    case 'Limosa_limosa'
      id_CoL = '762df0cf6ff275514b2c06b5e5c8bf98';
      id_WoRMS = ''; % not present at 2017/07/16
      id_Taxo = '53656';        
      id_EoL = '1049550';
      id_AnAge = taxon;       
      id_avibase = '454B5CD5F5285B77';
      id_birdlife = 'black-tailed-godwit-limosa-limosa';
      
    case 'Numenius_phaeopus'
      id_CoL = '19bd674744e8fd0eda79a3b09a47568d';
      id_WoRMS = '159040';
      id_Taxo = '53662';        
      id_EoL = '1049394';
      id_AnAge = taxon;       
      id_avibase = '082F3A63A99AEDD4';
      id_birdlife = 'whimbrel-numenius-phaeopus';

    case 'Uria_aalge'
      id_CoL = '1f21d6d69cb8c09be9a27485d68bc4d1';
      id_WoRMS = '137133';
      id_Taxo = '53922';        
      id_EoL = '1049761';
      id_AnAge = taxon;       
      id_avibase = '39F29B55EF9A542F';
      id_birdlife = 'common-murre-uria-aalge';
      
    case 'Uria_lomvia'
      id_CoL = '4a4b216694d920384c31bd8854e0f1d8';
      id_WoRMS = '137134';
      id_Taxo = '53924';        
      id_EoL = '1049762';
      id_AnAge = taxon;       
      id_avibase = 'B70B5840ABCD5CFC';
      id_birdlife = 'thick-billed-murre-uria-lomvia';
      
    case 'Alle_alle'
      id_CoL = 'd04ac5333679e22045b58982006bcc2d';
      id_WoRMS = '137129';
      id_Taxo = '53890';        
      id_EoL = '1049773';
      id_AnAge = taxon;       
      id_avibase = 'B0932D89F1F74318';
      id_birdlife = 'little-auk-alle-alle';
      
    case 'Pinguinus_impennis'
      id_CoL = 'caf3fab41ba54462fe586a8bcdcdb54b';
      id_WoRMS = '137132';
      id_Taxo = '53912';        
      id_EoL = '1050026';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = '57D2F32E062CB366';
      id_birdlife = 'great-auk-pinguinus-impennis';
      
    case 'Alca_torda'
      id_CoL = '7524d7f8f9a7aff80ccb4cbb4d31501b';
      id_WoRMS = '137128';
      id_Taxo = '53888';        
      id_EoL = '1049760';
      id_AnAge = taxon;       
      id_avibase = '64F4DD81371B269F';
      id_birdlife = 'razorbill-alca-torda';
      
    case 'Cepphus_grylle'
      id_CoL = 'f56cecae9c9629f9bcc610161d9b483e';
      id_WoRMS = '137130';
      id_Taxo = '53898';        
      id_EoL = '1049817';
      id_AnAge = taxon;       
      id_avibase = 'B5AA5952E13FE5F3';
      id_birdlife = 'black-guillemot-cepphus-grylle';
      
    case 'Brachyramphus_brevirostris'
      id_CoL = '08870044d34d0b9f903b57b34bc5d058';
      id_WoRMS = '254310';
      id_Taxo = '53892';        
      id_EoL = '1048948';
      id_AnAge = '';       
      id_avibase = '7AD855E2377EBA1E';
      id_birdlife = 'kittlitzs-murrelet-brachyramphus-brevirostris';

    case 'Ptychoramphus_aleuticus'
      id_CoL = '1b8b9f4a86353758c7ff85c17a850ab4';
      id_WoRMS = '344115';
      id_Taxo = '53917';        
      id_EoL = '1049882';
      id_AnAge = taxon;      
      id_avibase = '2CF6D6F60FAD0DE9';
      id_birdlife = 'cassins-auklet-ptychoramphus-aleuticus';
      
    case 'Aethia_pusilla'
      id_CoL = 'eedd1a360668ef531a40b98d4493618e';
      id_WoRMS = '344016';
      id_Taxo = '53928';        
      id_EoL = '1049894';
      id_AnAge = taxon;      
      id_avibase = '044509DAF1E58241';
      id_birdlife = 'least-auklet-aethia-pusilla';
      
    case 'Aethia_cristatella'
      id_CoL = '7048c7929886b0410e3501585b00d8a9';
      id_WoRMS = '344015';
      id_Taxo = '53927';        
      id_EoL = '1049883';
      id_AnAge = taxon;
      id_avibase = '3DC4EBB85AB96A2A';
      id_birdlife = 'crested-auklet-aethia-cristatella';
      
    case 'Aethia_pygmaea'
      id_CoL = '82b9cdc66b37c419cd9c67cca5d41860';
      id_WoRMS = '344017';
      id_Taxo = '53929';        
      id_EoL = '1049905';
      id_AnAge = taxon;
      id_avibase = 'E3893615A5AF83A3';
      id_birdlife = 'whiskered-auklet-aethia-pygmaea';
      id_ADW = ''; % not presetn 2018/09/29
      
    case 'Cerorhinca_monocerata'
      id_CoL = '505164cb8828600e0b0fa29f255fe3e5';
      id_WoRMS = '344029';
      id_Taxo = '53902';        
      id_EoL = '1049927';
      id_AnAge = taxon;       
      id_avibase = '53D94597DFB84ECB';
      id_birdlife = 'rhinoceros-auklet-cerorhinca-monocerata';
      
    case 'Fratercula_arctica'
      id_CoL = '80c12642c3ab7cc036ee3749463ca606';
      id_WoRMS = '137131';
      id_Taxo = '53907';        
      id_EoL = '1049938';
      id_AnAge = taxon;       
      id_avibase = '2771624B64AD7F2C';
      id_birdlife = 'atlantic-puffin-fratercula-arctica';
      
    case 'Fratercula_cirrhata'
      id_CoL = '0f49dcc5798d913825d050e1035cbbce';
      id_WoRMS = '344610';
      id_Taxo = '53910';        
      id_EoL = '1049982';
      id_AnAge = ''; % not present at 2018/04/27      
      id_avibase = 'F79373497BC9C8FD';
      id_birdlife = 'tufted-puffin-fratercula-cirrhata';
      
    case 'Onychoprion_fuscatus'
      id_CoL = '73d5cdfcd88481a314574567a0c7c906';
      id_WoRMS = '567827';
      id_Taxo = '53868'; % present as Sterna fuscata 2018/10/01     
      id_EoL = '1049685';
      id_AnAge = taxon;    
      id_avibase = '3E7F825D03C0DC3E';
      id_birdlife = 'sooty-tern-onychoprion-fuscatus';
      id_ADW = 'Sterna_fuscata';
      
    case 'Onychoprion_anaethetus'
      id_CoL = '6dde5b4302290c1858542ea44d32d609';
      id_WoRMS = '567792';
      id_Taxo = '53860'; % present as Sterna anaethetus 2018/10/17     
      id_EoL = '1049713';
      id_AnAge = taxon;    
      id_avibase = 'E6518B9D5C802F2A';
      id_birdlife = 'bridled-tern-onychoprion-anaethetus';
      id_ADW = 'Sterna_anaethetus';
      
    case 'Sterna_paradisaea'
      id_CoL = 'b20a894252b52f4c191ef168d1a7aaad';
      id_WoRMS = '137165';
      id_Taxo = '53874';        
      id_EoL = '1049640';
      id_AnAge = taxon;       
      id_avibase = 'BDC5CF80BE6CFC21';
      id_birdlife = 'arctic-tern-sterna-paradisaea';
      
    case 'Sterna_hirundo'
      id_CoL = 'c83b9db3064841202e4e59eb103b5847';
      id_WoRMS = '137162';
      id_Taxo = '53869';        
      id_EoL = '1049639';
      id_AnAge = taxon;       
      id_avibase = '4D2FF6F13790ED7E';
      id_birdlife = 'common-tern-sterna-hirundo';
      
    case 'Sterna_dougallii'
      id_CoL = 'e6cd6beff86e385e4d942021abacd2da';
      id_WoRMS = '137160';
      id_Taxo = '53866';        
      id_EoL = '1049641';
      id_AnAge = taxon;       
      id_avibase = '74236837A4AFD042';
      id_birdlife = 'roseate-tern-sterna-dougallii';
      
    case 'Sterna_sumatrana'
      id_CoL = '1cbddd16b4a6b4061b0b9e84723d684c';
      id_WoRMS = '212608';
      id_Taxo = '70339';        
      id_EoL = '1049717';
      id_AnAge = ''; % not present 2018/10/14       
      id_avibase = '9D6704AC5D349A16';
      id_birdlife = 'black-naped-tern-sterna-sumatrana';
      
    case 'Thalasseus_sandvicensis'
      id_CoL = 'fd712ba9ea195d3cc049c283c6ba3caa';
      id_WoRMS = '413044'; % unaccepted, to Sterna sandvicensis Latham, 1787
      id_Taxo = '610055';        
      id_EoL = '45895702';
      id_AnAge = taxon;
      id_ADW = 'Sterna_sandvicensis'; 
      id_avibase = '04B49AE78FFF9B68';
      id_birdlife = 'sandwich-tern-thalasseus-sandvicensis';
      
    case 'Thalasseus_elegans'
      id_CoL = 'd5dd7f97aec2244f6af29b6dfa662466';
      id_WoRMS = '225959'; % present as Sterna elegans 2018/09/29
      id_Taxo = '70333'; % present as Sterna elegans 2018/09/29       
      id_EoL = '1049729';
      id_AnAge = taxon;
      id_ADW = ''; % not present 2018/09/29
      id_avibase = '3F9E1C51FBD48FC1';
      id_birdlife = 'elegant-tern-thalasseus-elegans';
      
    case 'Chlidonias_leucopterus'
      id_CoL = 'a666e4b62baba1a7edf044f52f7eefd5';
      id_WoRMS = '137136';
      id_Taxo = '93234';        
      id_EoL = '1049371';
      id_AnAge = ''; % not present at 2017/06/18       
      id_avibase = '43CAAEE3B0D305D9';
      id_birdlife = 'white-winged-tern-chlidonias-leucopterus';
      
    case 'Chlidonias_hybrida'
      id_CoL = 'd1c6569436ff34e1bdc688405b7ae7e7';
      id_WoRMS = '137135';
      id_Taxo = '53841';        
      id_EoL = '1065007';
      id_AnAge = ''; % not present at 2018/10/13       
      id_avibase = '7AB4E42B260B5954';
      id_birdlife = 'whiskered-tern-chlidonias-hybrida';
      
    case 'Gelochelidon_nilotica'
      id_CoL = '1e05bb72cdb9b5c430dd624998082238';
      id_WoRMS = '148798';
      id_Taxo = '53845';        
      id_EoL = '1049737';
      id_AnAge = taxon;        
      id_avibase = '441918B5AE353C3B';
      id_birdlife = 'common-gull-billed-tern-gelochelidon-nilotica';
      id_ADW = 'Sterna_nilotica'; 
      
    case 'Hydroprogne_caspia'
      id_CoL = '0157981931f48e7789e7a35e9a200f37';
      id_WoRMS = '567825';
      id_Taxo = '53865'; % present as Sterns caspia 2018/10/19      
      id_EoL = '1049728';
      id_AnAge = taxon;        
      id_avibase = 'BC06BC0D1056BC7B';
      id_birdlife = 'caspian-tern-hydroprogne-caspia';
      id_ADW = 'Sterns_caspia'; 
      
    case 'Sternula_albifrons'
      id_CoL = '1ef3bb17c2e53c170fba27107f4075e9';
      id_WoRMS = '567480';
      id_Taxo = '53858'; % present as Sternula albifrons       
      id_EoL = '1049714';
      id_AnAge = taxon;       
      id_avibase = '17310BF0FE9BAC8A';
      id_birdlife = 'little-tern-sternula-albifrons';
      id_ADW = ''; % not present 2018/10/13
      
    case 'Chroicocephalus_ridibundus'
      id_CoL = '619c28ecb10081c76f0926710fdc982a';
      id_WoRMS = '465358';
      id_Taxo = '53823'; % present as Larus ridibundus Linnaeus, 1766       
      id_EoL = '1049595';
      id_AnAge = taxon;
      id_ADW = 'Larus_ridibundus'; 
      id_avibase = 'FB02DD9658CC1EC6';
      id_birdlife = 'black-headed-gull-larus-ridibundus';

    case 'Larus_argentatus'
      id_CoL = '6d0b384ca6c3c1ec2eb97706da11eae8';
      id_WoRMS = '137138';
      id_Taxo = '53781';        
      id_EoL = '1049581';
      id_AnAge = taxon;      
      id_avibase = 'F002188E226DF09C';
      id_birdlife = 'european-herring-gull-larus-argentatus';
      
    case 'Larus_fuscus'
      id_CoL = '4fdb38d6220462049eab9e3f285144e0';
      id_WoRMS = '137142';
      id_Taxo = '53805';        
      id_EoL = '45509305';
      id_AnAge = taxon;      
      id_avibase = '49025D8B171EFAD7';
      id_birdlife = 'lesser-black-backed-gull-larus-fuscus';
      
    case 'Larus_dominicanus'
      id_CoL = '6498deca624b16a592410799f4ebfa66';
      id_WoRMS = '212624';
      id_Taxo = '53803';        
      id_EoL = '1049305';
      id_AnAge = ''; % not present 2018/10/19      
      id_avibase = 'E6536E4E904EF414';
      id_birdlife = 'kelp-gull-larus-dominicanus';
      
    case 'Larus_pacificus'
      id_CoL = '8dbbb1e77ec32ff7e676c6aa878ff4d8';
      id_WoRMS = '343917';
      id_Taxo = '70317';        
      id_EoL = '1049316';
      id_AnAge = ''; % not present 2018/10/22      
      id_avibase = 'C08157E78A294559';
      id_birdlife = 'pacific-gull-larus-pacificus';
      
    case 'Ichthyaetus_audouinii'
      id_CoL = '6501f3bade6037b1e6554528fd12013c';
      id_WoRMS = '137139'; % present as Larus audouinii 2018/10/22
      id_Taxo = '53796'; % present as Larus audouinii 2018/10/22       
      id_EoL = '1049301';
      id_AnAge = taxon; 
      id_avibase = 'F7B9355E42C3F987';
      id_birdlife = 'audouins-gull-larus-audouinii';
      id_ADW = 'Larus_audouinii';
      
    case 'Rissa_tridactyla'
      id_CoL = 'bab5d031b01e7f12e85e1bdcf9726828';
      id_WoRMS = '137156';
      id_Taxo = '53831';        
      id_EoL = '1049628';
      id_AnAge = taxon;      
      id_avibase = 'FB4D08F0837D4683';
      id_birdlife = 'black-legged-kittiwake-rissa-tridactyla';
      
    case 'Rissa_brevirostris'
      id_CoL = 'bab5d031b01e7f12e85e1bdcf9726828';
      id_WoRMS = '343923';
      id_Taxo = '53830';        
      id_EoL = '1049624';
      id_AnAge = taxon;       
      id_avibase = '58B576ED088D10F9';
      id_birdlife = 'red-legged-kittiwake-rissa-brevirostris';
      
    case 'Gygis_alba'
      id_CoL = 'c74b53181940057af1a5435c0c0b8885';
      id_WoRMS = '344045';
      id_Taxo = '53847';        
      id_EoL = '1049751';
      id_AnAge = taxon; 
      id_avibase = '78D0F675ABF2EF48';
      id_birdlife = 'common-white-tern-gygis-alba';
      
    case 'Anous_tenuirostris'
      id_CoL = '4ff17fb60e51a339ce386dc00025b7a8';
      id_WoRMS = '212630';
      id_Taxo = '53839';        
      id_EoL = '1049358';
      id_AnAge = ''; % not present 2018/09/30       
      id_avibase = '03F9EB153E1DD50C';
      id_birdlife = 'lesser-noddy-anous-tenuirostris';
      
    case 'Anous_stolidus'
      id_CoL = '9904109753703f88640b2d1ed9977354';
      id_WoRMS = '212629';
      id_Taxo = '53838';        
      id_EoL = '1049739';
      id_AnAge = ''; % not present 2018/10/02       
      id_avibase = 'A070171E774B95B5';
      id_birdlife = 'brown-noddy-anous-stolidus';
      id_ADW = ''; % not present 2018/10/02       
      
    case 'Stercorarius_longicaudus'
      id_CoL = '7463b0f804c2d9ab6acd1e21194c690a';
      id_WoRMS = '137171';
      id_Taxo = '53772';        
      id_EoL = '1049570';
      id_AnAge = taxon;       
      id_avibase = '1D4464402EC9FD21';
      id_birdlife = 'long-tailed-jaeger-stercorarius-longicaudus';
      
    case 'Stercorarius_skua'
      id_CoL = '0a044c4812738721275215f803d29c25';
      id_WoRMS = '137174';
      id_Taxo = '53775';        
      id_EoL = '1064979';
      id_AnAge = taxon;       
      id_avibase = 'BB041C6E5DB73FC7';
      id_birdlife = 'great-skua-catharacta-skua';
      
    case 'Stercorarius_maccormicki'
      id_CoL = '15e1f2d9818ba3046dff1e228d1587b6';
      id_WoRMS = '422607';
      id_Taxo = '947074';        
      id_EoL = '1064976';
      id_AnAge = taxon;      
      id_avibase = '7D1A9D5CCCDC597C';
      id_birdlife = 'south-polar-skua-catharacta-maccormicki';
      
    case 'Stercorarius_antarcticus'
      id_CoL = 'd423ef9bb2e5afea7a6cb0df78840e8a';
      id_WoRMS = '567471';
      id_Taxo = '947071';        
      id_EoL = '1064977';
      id_AnAge = taxon;      
      id_avibase = 'FF895105AB0ABCE1';
      id_birdlife = 'brown-skua-catharacta-antarctica';
      
    case 'Dromas_ardeola'
      id_CoL = 'f9363934762b33e323d2debe6472575b';
      id_WoRMS = '212718';
      id_Taxo = '53499';        
      id_EoL = '1049245';
      id_AnAge = ''; % not present 2018/10/08     
      id_avibase = 'C3E33FEBDE75219B';
      id_birdlife = 'crab-plover-dromas-ardeola';
      
   case 'Turnix_sylvaticus'
      id_CoL = '8e5d61de7b34711df8fb0d91fabb2b7e';
      id_WoRMS = '';
      id_Taxo = '1122791';        
      id_EoL = '900373';
      id_AnAge = taxon;       
      id_avibase = '0DA8BB90D5401FDB';
      id_birdlife = '22693589';
      
    case 'Burhinus_capensis'
      id_CoL = '2968497db12845a1f4ee51d6d9c81076';
      id_WoRMS = ''; % not present 2018/09/14
      id_Taxo = '53522';        
      id_EoL = '1049041';
      id_AnAge = taxon;       
      id_avibase = '862F6F04186871A8';
      id_birdlife = 'american-golden-plover-pluvialis-dominica';
 
    case 'Chionis_minor'
      id_CoL = 'c6442218f8de3b0fcabeaca58538e1e1';
      id_WoRMS = '225982'; 
      id_Taxo = '53766';        
      id_EoL = '1049137';
      id_AnAge = ''; % not present 2018/09/26       
      id_avibase = '7C15B681DD3E8B4C';
      id_birdlife = 'black-faced-sheathbill-chionis-minor';
 
    case 'Himantopus_mexicanus'
      id_CoL = '1f5847657f78653cd8be6e4f828a1c0d';
      id_WoRMS = '159131';
      id_Taxo = '1122806'; % present as Himantopus himantopus mexicanus (Statius M�ller, 1776)        
      id_EoL = '1049561';
      id_AnAge = taxon;
      id_ADW = 'Himantopus_himantopus_mexicanus'; 
      id_avibase = 'C1D4E1DD9ABDEF3C';
      id_birdlife = ''; % not present at 2018/04/27
      
    case 'Himantopus_novaezelandiae'
      id_CoL = '5e3107251b509cea23ffd1d69197d786';
      id_WoRMS = ''; % not present 2018/08/07
      id_Taxo = '158875'; 
      id_EoL = '1049127';
      id_AnAge = ''; % not present 2018/08/07
      id_ADW = ''; % not present 2018/08/07
      id_avibase = 'C26304D6CC0AA676';
      id_birdlife = 'black-stilt-himantopus-novaezelandiae'; 
      
    case 'Haematopus_moquini'
      id_CoL = '35a448e347c4bb7b28695e9fcb3c744b';
      id_WoRMS = '212720';
      id_Taxo = '70245';        
      id_EoL = '1049058';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = 'C078081EB45D895F';
      id_birdlife = 'african-oystercatcher-haematopus-moquini';
      
    case 'Haematopus_ostralegus'
      id_CoL = 'aa9b32f4498c9918873c902d95302fac';
      id_WoRMS = '147436';
      id_Taxo = '53505';        
      id_EoL = '1049333';
      id_AnAge = taxon; 
      id_avibase = 'ED66316522B99A30';
      id_birdlife = 'eurasian-oystercatcher-haematopus-ostralegus';
      
    case 'Vanellus_vanellus'
      id_CoL = 'a72664542a6c3a33c679530309994536';
      id_WoRMS = '159142'; 
      id_Taxo = '53579';     
      id_EoL = '1049340';
      id_AnAge = taxon;      
      id_avibase = 'F029489ABD9D1334';
      id_birdlife = 'northern-lapwing-vanellus-vanellus';
      
     case 'Vanellus_armatus'
      id_CoL = '6034cc9bf59a797ca53b2e50c0241a25';
      id_WoRMS = ''; % not present 2017/06/17
      id_Taxo = '70262';     
      id_EoL = '1049061';
      id_AnAge = taxon;       
      id_avibase = '2F23EDC6558D31B3';
      id_birdlife = 'blacksmith-lapwing-vanellus-armatus';
      
    case 'Vanellus_coronatus'
      id_CoL = '6b2bf7e07f766050de717c4a411774c2';
      id_WoRMS = '366837';
      id_Taxo = '70269'; 
      id_EoL = '1049064';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = 'D0FA8EBE3808F1D8';
      id_birdlife = 'crowned-lapwing-vanellus-coronatus';
      
    case 'Charadrius_pecuarius'
      id_CoL = '7649077c28e6d6a042e8f6a197b55be5';
      id_WoRMS = '366846';
      id_Taxo = '53603';        
      id_EoL = '1049103';
      id_AnAge = ''; % not present at 2017/06/18        
      id_avibase = '0F0DCC2F28E4E83B';
      id_birdlife = 'kittlitzs-plover-charadrius-pecuarius';
      
    case 'Charadrius_melodus'
      id_CoL = '070053dfb32c30e5ce1cbaf73d64a9f9';
      id_WoRMS = '159125';
      id_Taxo = '53600';        
      id_EoL = '1049343';
      id_AnAge = taxon;   
      id_avibase = '671B69FE824DC9FF';
      id_birdlife = 'piping-plover-charadrius-melodus';
      
    case 'Charadrius_vociferus'
      id_CoL = 'ef3901bc807d4a401db8c8ff26422989';
      id_WoRMS = '159127';
      id_Taxo = '53610';        
      id_EoL = '1049356';
      id_AnAge = taxon;
      id_avibase = 'BCF9A19AFE372627';
      id_birdlife = 'killdeer-charadrius-vociferus';
      
    case 'Charadrius_hiaticula'
      id_CoL = '3fa0912eeaf500c3b405edfce0a336ad';
      id_WoRMS = '212619';
      id_Taxo = '53597';        
      id_EoL = '1049341';
      id_AnAge = taxon;
      id_avibase = 'EDA37B7C5D4A25ED';
      id_birdlife = 'common-ringed-plover-charadrius-hiaticula';
      
    case 'Pluvialis_dominica'
      id_CoL = 'aa24423d09987a0d571d2e28180b1960';
      id_WoRMS = '159136';
      id_Taxo = '53625';        
      id_EoL = '1049365';
      id_AnAge = taxon;       
      id_avibase = '2143A8526CA7C809';
      id_birdlife = 'american-golden-plover-pluvialis-dominica';
      
    case 'Pluvialis_apricaria'
      id_CoL = 'bc2553ab83451495ee121328c8d28762';
      id_WoRMS = '159135';
      id_Taxo = '53622';        
      id_EoL = '1049364';
      id_AnAge = taxon;       
      id_avibase = '25A20BA6F7EA9D9A';
      id_birdlife = 'eurasian-golden-plover-pluvialis-apricaria';
      
    case 'Psophia_crepitans'
      id_CoL = '79cc7ed2868e70fd1a9c47f97f9d2061';
      id_Taxo = '53287';        
      id_EoL = '915407';
      id_AnAge = ''; % not present at 2018/07/26       
      id_avibase = 'BCBFFF6A2798E83E';
      id_birdlife = 'grey-winged-trumpeter-psophia-crepitans';
      id_ADW = ''; % not present at 2018/07/26
      
    case 'Psophia_leucoptera'
      id_CoL = '13ca4973b62b3b7c106c12d5c1a4a710';
      id_Taxo = '53288';        
      id_EoL = '915406';
      id_AnAge = ''; % not present at 2018/07/28       
      id_avibase = '41782204D6C1956E';
      id_birdlife = 'white-winged-trumpeter-psophia-leucoptera';
      id_ADW = ''; % not present at 2018/07/28
      
    case 'Grus_japonensis'
      id_CoL = '6fde6b82ab0ac42b5d8bbd69e9433010';
      id_Taxo = '53270';        
      id_EoL = '915325';
      id_AnAge = taxon;       
      id_avibase = 'E196D6F9AB1DFF7E';
      id_birdlife = 'red-crowned-crane-grus-japonensis';
      
    case 'Grus_monacha'
      id_CoL = '0e419445ddc878e375c38fa9d9515969';
      id_Taxo = '53272';        
      id_EoL = '915329';
      id_AnAge = taxon;      
      id_avibase = '38F36091DBC85095';
      id_birdlife = 'hooded-crane-grus-monacha';
      
    case 'Grus_americana'
      id_CoL = '1a22f8fb4ebe8e382b8685b187aafa18';
      id_Taxo = '53263';        
      id_EoL = '1049271';
      id_AnAge = taxon;       
      id_avibase = 'B87D744DCD48ECC9';
      id_birdlife = 'whooping-crane-grus-americana';

    case 'Grus_virgo'
      id_CoL = '987b70eac098e65fbf96b62c25c06f86';  % unaccepted, to Anthropoides virgo (Linnaeus, 1758)       
      id_Taxo = '167356'; % unaccepted, to Anthropoides virgo (Linnaeus, 1758)       
      id_EoL = '915336';  % unaccepted, to Anthropoides virgo (Linnaeus, 1758)       
      id_AnAge = 'Anthropoides_virgo';
      id_ADW = 'Anthropoides_virgo';
      id_avibase = '64DDD14DF2EB9B39';
      id_birdlife = 'demoiselle-crane-anthropoides-virgo';

    case 'Antigone_antigone'
      id_CoL = '2f827f37dafa3abedcb078144d0cd10f'; % unaccepted, to Grus antigone
      id_Taxo = '53264'; % unaccepted, to Grus antigone       
      id_EoL = '915318'; % unaccepted, to Grus antigone
      id_AnAge = taxon;  % unaccepted, to Grus antigone      
      id_avibase = '8D891DB7520688E0'; 
      id_birdlife = 'sarus-crane-antigone-antigone';
      id_Wiki = 'Grus_antigone';
      id_ADW = 'Grus_antigone';
                  
    case 'Antigone_vipio'
      id_CoL = '28717f30fbb5ef2ba20f85bb587a54d5'; % unaccepted, to Grus vipio
      id_Taxo = '53275';  % unaccepted, to Grus vipio
      id_EoL = '915332';  % unaccepted, to Grus vipio
      id_AnAge = 'Grus_vipio';     
      id_avibase = '1125F89DE2FF4F98'; 
      id_birdlife = 'white-naped-crane-antigone-vipio';
      id_ADW = 'Grus_vipio';
      id_Wiki = 'Grus_vipio';
      
    case 'Antigone_canadensis'
      id_CoL = 'b5fb32b609572d52ede7b7748943dc51'; % unaccepted, to Grus canadensis
      id_Taxo = '53265';   % unaccepted, to Grus canadensis     
      id_EoL = '1049272';  % unaccepted, to Grus canadensis
      id_AnAge = 'Grus_canadensis';       
      id_avibase = 'E196D6F9AB1DFF7E'; 
      id_birdlife = 'sandhill-crane-antigone-canadensis';
      id_Wiki = 'Grus_canadensis';       
      id_ADW = 'Grus_canadensis';             
      
    case 'Antigone_rubicunda'
      id_CoL = '91e043fbcde2082b7347fce518462e0e'; % unaccepted, to Grus rubicunda
      id_Taxo = '83116';   % unaccepted, to Grus rubicunda     
      id_EoL = '915331';   % unaccepted, to Grus rubicunda
      id_AnAge = 'Grus_rubicunda';       
      id_avibase = 'A4480D0279EA1C38';
      id_birdlife = 'brolga-antigone-rubicunda';
      id_Wiki = 'Grus_rubicunda';       
      id_ADW = 'Grus_rubicunda';             
      
    case 'Leucogeranus_leucogeranus'
      id_CoL = '0ae95f5329e0e7fe075c002169e60746'; % unaccepted, to Grus leucogeranus
      id_Taxo = '53271';   % unaccepted, to Grus leucogeranus     
      id_EoL = '915328';   % unaccepted, to Grus leucogeranus
      id_AnAge = 'Grus_leucogeranus';       
      id_avibase = '77845DAD1C49E8F1';
      id_birdlife = 'siberian-crane-leucogeranus-leucogeranus';
      id_Wiki = 'Grus_leucogeranus';
      id_ADW = 'Grus_leucogeranus';
      
     case 'Gallinula_chloropus'
      id_CoL = '8c1a4e2718730f2ad6171f96fb6c6fa3';
      id_Taxo = '53395';
      id_EoL = '1048567';
      id_AnAge = '';       
      id_avibase = '8F82FF8C30667D90';
      id_birdlife = 'common-moorhen-gallinula-chloropus';

     case 'Crex_crex'
      id_CoL = '81f2c86266e0066201e927f7bc2d8265';
      id_Taxo = '53351';
      id_EoL = '1049299';
      id_AnAge = taxon; % not present 2018/10/05       
      id_avibase = '7E2572426E200D08';
      id_birdlife = 'corncrake-crex-crex';

    case 'Phaethon_lepturus'
      id_CoL = '9c0e9cb143508bda222bd0adec5383db';
      id_WoRMS = '212594';
      id_Taxo = '51638';
      id_EoL = '1048567';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '1D07B501FEAF0840';
      id_birdlife = 'white-tailed-tropicbird-phaethon-lepturus';
      
    case 'Phaethon_rubricauda'
      id_CoL = 'a2644bbf86d31681747084a3cf98311e';
      id_WoRMS = '212595';
      id_Taxo = '51639';
      id_EoL = '1048589';
      id_AnAge = taxon;       
      id_avibase = 'C412CD623EDA1B28';
      id_birdlife = 'red-tailed-tropicbird-phaethon-rubricauda';
      
    case 'Phaethon_aethereus'
      id_CoL = '99f324908523a3680168651a1089aeee';
      id_WoRMS = '137177';
      id_Taxo = '51637';
      id_EoL = '1048566';
      id_AnAge = taxon;       
      id_avibase = '7EE005BD2701D129';
      id_birdlife = 'red-billed-tropicbird-phaethon-aethereus';
      
    case 'Rhynochetos_jubatus'
      id_CoL = '7a9792a8c9f4eb22d6d286d64456516c';
      id_Taxo = '53431';        
      id_EoL = '1045974';
      id_AnAge = ''; % not present 2017/06/18      
      id_avibase = '227D77FBFA6E408A';
      id_birdlife = 'kagu-rhynochetos-jubatus';
      
    case 'Gavia_stellata'
      id_CoL = '82657d3390f0a0d5bc1349a48394f8d0';
      id_WoRMS = '137188';
      id_Taxo = '51433'; 
      id_EoL = '1047332';
      id_AnAge = taxon;       
      id_avibase = '6C50988A5445ED76';
      id_birdlife = 'red-throated-loon-gavia-stellata';
      
    case 'Gavia_immer'
      id_CoL = '30f86b5fc760b8d8023db2b2c4e7a20f';
      id_WoRMS = '137187';
      id_Taxo = '51431';        
      id_EoL = '1047329';
      id_AnAge = taxon;       
      id_avibase = '7E02237895784E9A';
      id_birdlife = 'common-loon-gavia-immer';
      
    case 'Pterodroma_phaeopygia'
      id_CoL = '763159bf72fff7b70b75183b4e6cb75b';
      id_WoRMS = '343980';
      id_Taxo = '51552';      
      id_EoL = '1048490';
      id_AnAge = taxon; 
      id_avibase = '0DF68A874B9BB663';
      id_birdlife = 'galapagos-petrel-pterodroma-phaeopygia';
           
   case 'Pterodroma_atrata'
      id_CoL = 'f9a276a851f257f46003a119cb6a19de';
      id_WoRMS = '343973';
      id_Taxo = '1014816';      
      id_EoL = '1064994';
      id_AnAge = ''; % not present 2018/09/25 
      id_avibase = 'A98DB170C4EE4F6C';
      id_birdlife = 'henderson-petrel-pterodroma-atrata';
           
   case 'Pterodroma_incerta'
      id_CoL = 'befc44cc6a715e30b1bfa64f744de3e7';
      id_WoRMS = '212641';
      id_Taxo = '51539';      
      id_EoL = '1049480';
      id_AnAge = ''; % not present 2018/09/25 
      id_avibase = '23865D2512972A80';
      id_birdlife = 'atlantic-petrel-pterodroma-incerta';
           
   case 'Pterodroma_macroptera'
      id_CoL = '26eb887f3c1a3d023c33126d29242153';
      id_WoRMS = '212644';
      id_Taxo = '51546';      
      id_EoL = '1049487';
      id_AnAge = ''; % not present 2018/09/25 
      id_avibase = '508E7E59EF3A45EA';
      id_birdlife = 'great-winged-petrel-pterodroma-macroptera';
           
   case 'Pterodroma_solandri'
      id_CoL = 'bf2bd480952372101f8d4781cea43314';
      id_WoRMS = '343983';
      id_Taxo = '51556';      
      id_EoL = '46323807';
      id_AnAge = ''; % not present 2018/09/25 
      id_avibase = 'F654D59E67F122CD';
      id_birdlife = 'providence-petrel-pterodroma-solandri';
           
   case 'Pterodroma_pycrofti'
      id_CoL = '5342b21a165e1e07ee3dc781daa26d8d';
      id_WoRMS = '343982';
      id_Taxo = '51555';      
      id_EoL = '1049493';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = '3786AD4E1A186AC1';
      id_birdlife = 'pycrofts-petrel-pterodroma-pycrofti';
           
   case 'Pterodroma_nigripennis'
      id_CoL = '36689fb384c76729ac64e2e78767886b';
      id_WoRMS = '225963';
      id_Taxo = '51551';      
      id_EoL = '1048494';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = 'AE186136E0A1282A';
      id_birdlife = 'black-winged-petrel-pterodroma-nigripennis';
           
   case 'Pterodroma_axillaris'
      id_CoL = '9ac7746975398eb08fe942fda1d6ca7a';
      id_WoRMS = '225989';
      id_Taxo = '51527';      
      id_EoL = '1049478';
      id_AnAge = ''; % not present at 2018/09/26      
      id_avibase = 'C398A0EAADB5801E';
      id_birdlife = 'chatham-petrel-pterodroma-axillaris';
           
   case 'Pterodroma_hypoleuca'
      id_CoL = '51574fddedb4d6a93fa5b0c3dd0c1688';
      id_WoRMS = '343976';
      id_Taxo = '51538';      
      id_EoL = '1048493';
      id_AnAge = taxon; 
      id_avibase = 'C69447E20ECD6C61';
      id_birdlife = 'bonin-petrel-pterodroma-hypoleuca';
           
   case 'Pterodroma_leucoptera'
      id_CoL = '08f8fa27a44ffee141c054d9267d1f07';
      id_WoRMS = '225774';
      id_Taxo = '51542';      
      id_EoL = '1049482';
      id_AnAge = taxon; 
      id_avibase = 'A27F9AF63B250F19';
      id_birdlife = 'white-winged-petrel-pterodroma-leucoptera';
           
    case 'Macronectes_giganteus'
      id_CoL = '0a598476ad343f4f93d91c7d3854ff70';
      id_WoRMS = '212636';
      id_Taxo = '51500';        
      id_EoL = '1049498';
      id_AnAge = taxon;       
      id_avibase = 'C1706A8B803AD6EF';
      id_birdlife = 'southern-giant-petrel-macronectes-giganteus';
 
    case 'Macronectes_halli'
      id_CoL = '967320b640d24d8716d757c84b9a9404';
      id_WoRMS = '212637';
      id_Taxo = '51501';        
      id_EoL = '1049499';
      id_AnAge = ''; % not present 2018/09/26       
      id_avibase = 'F504C8DE4D185454';
      id_birdlife = 'northern-giant-petrel-macronectes-halli';
      
    case 'Fulmarus_glacialis'
      id_CoL = 'a6e247adc3755e7607c4862ae639f9c3';
      id_WoRMS = '137195';
      id_Taxo = '51494';        
      id_EoL = '1047350';
      id_AnAge = taxon;       
      id_avibase = '049D9AEA4AFBFDFA';
      id_birdlife = 'northern-fulmar-fulmarus-glacialis';
            
    case 'Fulmarus_glacialoides'
      id_CoL = '0f3e43a89423b1e72248c3e7ed0cc369';
      id_WoRMS = '212638';
      id_Taxo = '51496';        
      id_EoL = '1049463';
      id_AnAge = taxon;       
      id_avibase = '10C2881A1F9704A0';
      id_birdlife = 'southern-fulmar-fulmarus-glacialoides';
      
     case 'Pagodroma_nivea'
      id_CoL = 'c17f172bbc6ce534eae7571e64a8f993';
      id_WoRMS = '225772';
      id_Taxo = '51503';        
      id_EoL = '1049512';
      id_AnAge = taxon;     
      id_avibase = '593BBCFC1CDC0636';
      id_birdlife = 'snow-petrel-pagodroma-nivea';
      
    case 'Thalassoica_antarctica'
      id_CoL = '37161527f6aaef09c824b26af4b00230';
      id_WoRMS = '212639';
      id_Taxo = '51505';      
      id_EoL = '1049507';
      id_AnAge = ''; % not present at 2018/09/18      
      id_avibase = '535186178E86447B';
      id_birdlife = 'antarctic-petrel-thalassoica-antarctica';
                               
    case 'Daption_capense'
      id_CoL = '07bdf667192e261ac62db546e44be6dd';
      id_WoRMS = '212640';
      id_Taxo = '51492';      
      id_EoL = '1049462';
      id_AnAge = taxon;      
      id_avibase = 'AAC2D6136C46A743';
      id_birdlife = 'cape-petrel-daption-capense'; 
                                  
    case 'Procellaria_cinerea'
      id_CoL = '60896a810b53eec7a1a5ac18c877bacd';
      id_WoRMS = '212652';
      id_Taxo = '51566';      
      id_EoL = '1049511';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = '843C1B8689E0935F';
      id_birdlife = 'grey-petrel-procellaria-cinerea';
                
   case 'Procellaria_aequinoctialis'
      id_CoL = '3a52559f7e553fb9bf295ad2927ff9bf';
      id_WoRMS = '212651';
      id_Taxo = '51565';      
      id_EoL = '1049508';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = '35EB45A0494AEE57';
      id_birdlife = 'white-chinned-petrel-procellaria-aequinoctialis';
                
   case 'Pachyptila_belcheri'
      id_CoL = '35839c92e3b162ac26e5e2bfb057ceca';
      id_WoRMS = '212646';
      id_Taxo = '51508';      
      id_EoL = '1049501';
      id_AnAge = ''; % not present 2018/09/26     
      id_avibase = '35EB45A0494AEE57';
      id_birdlife = 'slender-billed-prion-pachyptila-belcheri';
                
   case 'Pachyptila_vittata'
      id_CoL = 'a27728b6cd7a2809765f6b67ad499c7b';
      id_WoRMS = '212647';
      id_Taxo = '51513';      
      id_EoL = '1049504';
      id_AnAge = ''; % not present 2018/09/26     
      id_avibase = '93860B9B0F951405';
      id_birdlife = 'broad-billed-prion-pachyptila-vittata';
                
    case 'Halobaena_caerulea'
      id_CoL = 'c21761425403dc3a5df26a7e1941d2cd';
      id_WoRMS = '212645';
      id_Taxo = '51498';      
      id_EoL = '1049500';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = '68D6A13AE63C762C';
      id_birdlife = 'blue-petrel-halobaena-caerulea';
                                        
    case 'Bulweria_bulwerii'
      id_CoL = '7b4a294b8cfb2c1fbbba83ad4494016f';
      id_WoRMS = '137193';
      id_Taxo = '51516';      
      id_EoL = '1178495';
      id_AnAge = 'taxon';      
      id_avibase = '058773E4925D5D2E';
      id_birdlife = 'bulwers-petrel-bulweria-bulwerii';
      
   case 'Puffinus_assimilis'
      id_CoL = '85611d7fbc5bf240075248bfdcaf6135';
      id_WoRMS = '137200';
      id_Taxo = '51593';      
      id_EoL = '1048473';
      id_AnAge = ''; % not present at 2018/07/19       
      id_avibase = '797B4FA77E74254B';
      id_birdlife = 'little-shearwater-puffinus-assimilis';
      
    case 'Puffinus_baroli'
      id_CoL      = '1297b3c441e1b5d106b62e4f6c8c7b80';
      id_WoRMS    = '514084';
      id_Taxo     = '';      % not present at 2018/09/18  
      id_EoL      = '1265539';      
      id_AnAge    = '';      % not present at 2018/09/18       
      id_avibase  = '5F555FDD48DEAC1C';
      id_birdlife = '';      % not present at 2018/09/18 
      
    case 'Puffinus_lherminieri'
      id_CoL      = '52b8e7e2b40b569321c655709b7f4b98';
      id_WoRMS    = '212633';
      id_Taxo     = '51581';
      id_EoL      = '1048474';      
      id_AnAge    = taxon; 
      id_avibase  = '06C36D41443C29AF';
      id_birdlife = 'audubons-shearwater-puffinus-lherminieri'; 
      
    case 'Puffinus_puffinus'
      id_CoL = '21994168db2427586c692250492bc588';
      id_WoRMS = '225752';
      id_Taxo = '51586';      
      id_EoL = '1048471';
      id_AnAge = taxon;      
      id_avibase = '5AEDC00231A5201C';
      id_birdlife = 'manx-shearwater-puffinus-puffinus';     
            
   case 'Puffinus_gavia'
      id_CoL = 'beb2295f2acb80e73b307e8256ef0fa6';
      id_WoRMS = '137203';
      id_Taxo = '51575';      
      id_EoL = '1049465';
      id_AnAge = ''; % not present 2018/09/25     
      id_avibase = '426C93D3D06A790B';
      id_birdlife = 'fluttering-shearwater-puffinus-gavia';  
      
   case 'Puffinus_opisthomelas'
      id_CoL = '32fcf6bb72064b6a71bd3ec59e478671';
      id_WoRMS = '343988';
      id_Taxo = '51584';      
      id_EoL = '1178551';
      id_AnAge = ''; % not present 2018/09/25     
      id_avibase = '4FC153E18A66F798';
      id_birdlife = 'black-vented-shearwater-puffinus-opisthomelas';  

    case 'Puffinus_huttoni'
      id_CoL = '5bc43cde44b997f5923840c1d737fa3e';
      id_WoRMS = '225901';
      id_Taxo = '51579';      
      id_EoL = '1049466';
      id_AnAge = ''; % not present 2018/09/25     
      id_avibase = '27FAC80709D809B4';
      id_birdlife = 'huttons-shearwater-puffinus-huttoni';  
      
   case 'Calonectris_borealis'
      id_CoL = '87879847b94db8a5155ca79297d8d36b';
      id_WoRMS = '226024';
      id_Taxo = '51562';  % synonym at 2018/09/19 
      id_EoL = '10408853';
      id_AnAge = 'Calonectris_diomedea'; % synonym at 2018/09/19      
      id_avibase = '710BB4E6D1B2E7FF';
      id_birdlife = 'corys-shearwater-calonectris-borealis';
                      
   case 'Calonectris_leucomelas'
      id_CoL = 'ec368c3dae44c7eb9d9f390b23df2cb2';
      id_WoRMS = '343971';
      id_Taxo = '51563';  
      id_EoL = '1178325';
      id_AnAge = ''; % not present 2018/09/25      
      id_avibase = '13B165A3056EF798';
      id_birdlife = 'streaked-shearwater-calonectris-leucomelas';
                      
   case 'Ardenna_tenuirostris'
      id_CoL = '218975a2e27edbac73b0f1f715d1162d';
      id_WoRMS = '225770';
      id_Taxo = '51591';      
      id_EoL = '1047365';
      id_AnAge = 'Puffinus_tenuirostris';      
      id_avibase = '60825BF601060350';
      id_birdlife = 'short-tailed-shearwater-ardenna-tenuirostris';
      id_ADW = ''; % not present at 2018/09/25
           
    case 'Ardenna_gravis'
      id_CoL = '97d7ce52607a8dff51555ec630d34434';
      id_WoRMS = '137201';
      id_Taxo = '51576';      
      id_EoL = '1047353';
      id_AnAge = ''; % not present at 2018/09/17       
      id_avibase = '8B879DFA2AFB1481';
      id_birdlife = 'great-shearwater-ardenna-gravis'; 
      id_ADW = 'Puffinus_gravis'; 
     
    case 'Ardenna_grisea'
      id_CoL = '0c9e75ffc8b47572304fd5c0ad1ae05e';
      id_WoRMS = '137202';
      id_Taxo = '51577';      
      id_EoL = '46350069';
      id_AnAge = 'Puffinus_griseus';      
      id_avibase = '1725B07D51A40D6A';
      id_birdlife = 'sooty-shearwater-ardenna-grisea'; 
      id_ADW = 'Puffinus_griseus';

   case 'Ardenna_carneipes'
      id_CoL = '91fd04d264685b9095f1e9b08c68e876';
      id_WoRMS = '212635';
      id_Taxo = '51572';      
      id_EoL = '1047352';
      id_AnAge = 'Puffinus_carneipes';      
      id_avibase = '60825BF601060350';
      id_birdlife = 'flesh-footed-shearwater-ardenna-carneipes'; 
      id_ADW = 'Puffinus_carneipes';

    case 'Pseudobulweria_rostrata'
      id_CoL = '4126163f68731aec7951da5905f007d1';
      id_WoRMS = '344112';
      id_Taxo = '169634';   
      id_EoL = '1049520';
      id_AnAge = ''; % not present at 2018/09/19     
      id_avibase = '214D92DF8B14CD7B';
      id_birdlife = 'tahiti-petrel-pseudobulweria-rostrata';
      
   case 'Pelecanoides_georgicus'
      id_CoL = '55cf7113fc5892aa31cdefc64fba4cc2';
      id_WoRMS = '225780';
      id_Taxo = '51630';      
      id_EoL = '1049390';
      id_AnAge = ''; % not present at 2018/09/18      
      id_avibase = 'D5FE30FFAB104DF9';
      id_birdlife = 'south-georgia-diving-petrel-pelecanoides-georgicus'; 
                     
    case 'Pelecanoides_urinatrix'
      id_CoL = '46bc176b6af3967651301e24c18e7573';
      id_WoRMS = '344007';
      id_Taxo = '51632';      
      id_EoL = '1049392';
      id_AnAge = ''; % not present at 2018/09/18      
      id_avibase = '5F7E4AD66C0BE9FA';
      id_birdlife = 'common-diving-petrel-pelecanoides-urinatrix';
                          
    case 'Diomedea_exulans'
      id_CoL = '9cf46c5413e6bef61c029d6cef69ff57';
      id_WoRMS = '212583';
      id_Taxo = '167927';        
      id_EoL = '1047348';
      id_AnAge = taxon;       
      id_avibase = '049D9AEA4AFBFDFA';
      id_birdlife = 'wandering-albatross-diomedea-exulans';
      
    case 'Diomedea_epomophora'
      id_CoL = '5533a2a8e66c836cb4e92932923fd0fb';
      id_WoRMS = '344000';
      id_Taxo = '167926';        
      id_EoL = '1049161';
      id_AnAge = taxon;       
      id_avibase = '4D8C9B9731282B9B';
      id_birdlife = 'southern-royal-albatross-diomedea-epomophora';
      
    case 'Thalassarche_melanophrys'
      id_CoL = '9fad68b95fb3aebcce48f0d9fae66787';
      id_WoRMS = '225756'; % unaccepted, to Thalassarche melanophris (Temminck, 1828)
      id_Taxo = '959767';        
      id_EoL = '1178556'; % unaccepted, to Thalassarche melanophris (Temminck, 1828)
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = 'F9CBC9EB6CE43281'; % present as Thalassarche melanophris 
      id_birdlife = 'black-browed-albatross-thalassarche-melanophris';
               
    case 'Thalassarche_cauta'
      id_CoL = 'ef16648fa6380befd9176af1d0265358';
      id_WoRMS = '225902'; 
      id_Taxo = '101910';        
      id_EoL = '1178554'; 
      id_AnAge = ''; % not present 2018/09/19       
      id_avibase = 'CBF213CC23F92569';
      id_birdlife = 'shy-albatross-thalassarche-cauta';
      
    case 'Thalassarche_chrysostoma'
      id_CoL = 'ccb97a60a0a38c50d9e0034493ae6f5a';
      id_WoRMS = '225760'; 
      id_Taxo = '610029';        
      id_EoL = '1049170'; 
      id_AnAge = taxon;    
      id_avibase = '0E4475F65B2A8060';
      id_birdlife = 'grey-headed-albatross-thalassarche-chrysostoma';
      
    case 'Phoebetria_fusca'
      id_CoL = 'ea051bbef49018b4593345dd3f358443';
      id_WoRMS = '212632'; 
      id_Taxo = '51487';        
      id_EoL = '1049162'; 
      id_AnAge = ''; % not present 2018/09/26    
      id_avibase = '4976BF1DECACAB86';
      id_birdlife = 'sooty-albatross-phoebetria-fusca';
      
    case 'Phoebetria_palpebrata'
      id_CoL = '84ee187dbf476e17da9245bca8cbf70d';
      id_WoRMS = '212631'; 
      id_Taxo = '51488';        
      id_EoL = '1047349'; 
      id_AnAge = ''; % not present 2018/09/26    
      id_avibase = '1819ECCEFDD89585';
      id_birdlife = 'light-mantled-albatross-phoebetria-palpebrata';
      
  case 'Hydrobates_pelagicus'
      id_CoL = '0c0cf51c42ff062ed29579d7aa535af7';
      id_WoRMS = '137190'; 
      id_Taxo = '51612';        
      id_EoL = '1048565'; 
      id_AnAge = taxon;       
      id_avibase = 'E1638A370D09095C'; 
      id_birdlife = 'european-storm-petrel-hydrobates-pelagicus';
      
  case 'Oceanodroma_microsoma'
      id_CoL = 'fe0077357bfea993f059921e8cbd686a';
      id_WoRMS = '343968'; 
      id_Taxo = '51610';        
      id_EoL = '1048562'; 
      id_AnAge = '';  % not present at 2018/09/18
      id_avibase = '183CC218DF7221D8'; % present as Hydrobates_microsoma at 2018/09/18
      id_birdlife = 'least-storm-petrel-hydrobates-microsoma'; % present as Hydrobates_microsoma at 2018/09/18
      
  case 'Oceanodroma_leucorhoa'
      id_CoL = 'c32a07dc07b2878aa726c8a72b4d5029';
      id_WoRMS = '137192'; 
      id_Taxo = '51618';        
      id_EoL = '1048500'; 
      id_AnAge = taxon;      
      id_avibase = 'C5FB15C6D112FE91'; % present as Hydrobates_leucorhous at 2018/09/18
      id_birdlife = 'leachs-storm-petrel-hydrobates-leucorhous'; % present as Hydrobates_leucorhous at 2018/09/18
               
  case 'Oceanodroma_castro'
      id_CoL = '9aa8c3af5f6a3728aec4f77405228099';
      id_WoRMS = '137191'; 
      id_Taxo = '51614';        
      id_EoL = '1048509'; 
      id_AnAge = taxon;
      id_avibase = 'D3FAE385D584B014'; % present as Hydrobates_castro 2018/09/26
      id_birdlife = 'band-rumped-storm-petrel-hydrobates-castro'; % present as Hydrobates_castro 2018/09/26
      
  case 'Oceanodroma_furcata'
      id_CoL = '8a573f542cd203486449921bbeea307e';
      id_WoRMS = '343962'; 
      id_Taxo = '51615';        
      id_EoL = '1048499'; 
      id_AnAge = taxon;
      id_avibase = 'DD814006A4A3863F'; % present as Hydrobates_furcatus 2018/09/26
      id_birdlife = 'fork-tailed-storm-petrel-hydrobates-furcatus'; % present as Hydrobates_furcatus 2018/09/26
      
  case 'Oceanodroma_tristrami'
      id_CoL = '8758faf5cbe478a0e2bfa80df4f08c30';
      id_WoRMS = '343970'; 
      id_Taxo = '51625';        
      id_EoL = '1048512'; 
      id_AnAge = taxon;
      id_avibase = 'EDF959347AC3306A'; % present as Hydrobates_tristrami 2018/09/26
      id_birdlife = 'tristrams-storm-petrel-hydrobates-tristrami'; % present as Hydrobates_tristrami 2018/09/26
      
   case 'Pelagodroma_marina'
      id_CoL = 'ca4bb40f2f029595a3b5ad0653b7041b';
      id_WoRMS = '212700'; 
      id_Taxo = '51607';        
      id_EoL = '1048498'; 
      id_AnAge = ''; % not present at 2018/09/18       
      id_avibase = 'E9DF118ED56564A9'; 
      id_birdlife = 'white-faced-storm-petrel-pelagodroma-marina';     
      
  case 'Oceanites_oceanicus'
      id_CoL = 'ccc02ca2816781ee4e0f1bc6f72b532f';
      id_WoRMS = '137189'; 
      id_Taxo = '51605';        
      id_EoL = '1048563'; 
      id_AnAge = taxon;       
      id_avibase = 'D295D249BDB7E046'; 
      id_birdlife = 'wilsons-storm-petrel-oceanites-oceanicus';
      
  case 'Fregetta_tropica'
      id_CoL = '2405895b791e67a388a96604c7cef5ce';
      id_WoRMS = '212696'; 
      id_Taxo = '51598';        
      id_EoL = '1049281'; 
      id_AnAge = taxon;       
      id_avibase = 'ACE8EADE6CE42400'; 
      id_birdlife = 'black-bellied-storm-petrel-fregetta-tropica';
      
    case 'Spheniscus_demersus'
      id_CoL = '087e5c5bb1f385433ef0c42bb996c869';
      id_WoRMS = '212659';
      id_Taxo = '51420';        
      id_EoL = '1049617';
      id_AnAge = taxon;       
      id_avibase = '9B183BDD66511DD8';
      id_birdlife = 'african-penguin-spheniscus-demersus';
      
    case 'Spheniscus_humboldti'
      id_CoL = '73db5c796cbf49d281949616cb2decd7';
      id_WoRMS = '293019';
      id_Taxo = '51421';        
      id_EoL = '1049618';
      id_AnAge = taxon;       
      id_avibase = '37FC130FE446358F';
      id_birdlife = 'humboldt-penguin-spheniscus-humboldti';
      
    case 'Eudyptula_minor'
      id_CoL = 'e838f924c9d3a989c346b7b3b54d9f33';
      id_WoRMS = '225932';
      id_Taxo = '51413';        
      id_EoL = '1049616';
      id_AnAge = taxon;       
      id_avibase = '151738D51BE6DDA4';
      id_birdlife = 'little-penguin-eudyptula-minor';
      
    case 'Eudyptes_pachyrhynchus'
      id_CoL = '19c097d0adcc854ff96b7e0eb6f9ccc9';
      id_WoRMS = '225971';
      id_Taxo = '51400';        
      id_EoL = '1049610';
      id_AnAge = ''; % not present 2018/10/11       
      id_avibase = 'A143FB33F08F1A0B';
      id_birdlife = 'fiordland-penguin-eudyptes-pachyrhynchus';
      
    case 'Eudyptes_chrysocome'
      id_CoL = 'e567cc3f94114f0fb4ae02a59e61fc68';
      id_WoRMS = '212657';
      id_Taxo = '51395';        
      id_EoL = '1049612';
      id_AnAge = ''; % not present 2018/10/22       
      id_avibase = 'ECEE0622D6435B0C';
      id_birdlife = 'southern-rockhopper-penguin-eudyptes-chrysocome';
      
    case 'Pygoscelis_adeliae'
      id_CoL = '1b57a7bf98db087e0a1a8d9757cbf688';
      id_WoRMS = '225757';
      id_Taxo = '51406';        
      id_EoL = '1049602';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '4A947BE7A06E046E';
      id_birdlife = 'adelie-penguin-pygoscelis-adeliae';
      
    case 'Pygoscelis_antarcticus'
      id_CoL = '347ec66a28df5a6e5ed91745e84774ab';
      id_WoRMS = '225783';
      id_Taxo = '1014811';        
      id_EoL = '1064980';
      id_AnAge = ''; % not present 2017/09/03       
      id_avibase = '75B943A302F2CC67';
      id_birdlife = 'chinstrap-penguin-pygoscelis-antarcticus';
     
    case 'Pygoscelis_papua'
      id_CoL = '5c2aa01f0d9ab0f0a4f7f058629039f7';
      id_WoRMS = '225777';
      id_Taxo = '51415';        
      id_EoL = '1049603';
      id_AnAge = taxon;   
      id_avibase = 'F2B3BF2A1B6D05F6';
      id_birdlife = 'gentoo-penguin-pygoscelis-papua';
      
   case 'Ciconia_ciconia'
      id_CoL = '1f8d320bdebfb912da9ef2433da92a85';
      id_Taxo = '51849'; 
      id_EoL = '1228800';
      id_AnAge = taxon;       
      id_avibase = '28825494A08AFE5A';
      id_birdlife = 'white-stork-ciconia-ciconia';
      
    case 'Ciconia_stormi'
      id_CoL = '970406a6973f853028090e12757da4b4';
      id_Taxo = '51864'; 
      id_EoL = '1049150';
      id_AnAge = taxon;       
      id_avibase = '0C6D8B195D83534D';
      id_birdlife = 'storms-stork-ciconia-stormi';
      
    case 'Ciconia_abdimii'
      id_CoL = 'd212f038dcc610f5f91ea7f5d5b6c563';
      id_Taxo = '167708'; 
      id_EoL = '1049143';
      id_AnAge = taxon;       
      id_avibase = '26CD03193C89F18B';
      id_birdlife = 'abdims-stork-ciconia-abdimii';
      
    case 'Mycteria_cinerea'
      id_CoL = '1588cd2799c7bd0e70978127fce8d5bf';
      id_Taxo = '51883'; 
      id_EoL = '1049138';
      id_AnAge = taxon;       
      id_avibase = '44B6A65ABD9348F4';
      id_birdlife = 'milky-stork-mycteria-cinerea';
      id_ADW = ''; % not present 2018/08/09
      
    case 'Leptoptilos_crumeniferus'
      id_CoL = 'a75452d9328a21d27cee78530b249e05';
      id_Taxo = '51878'; 
      id_EoL = '1049153';
      id_AnAge = taxon;       
      id_avibase = '03C0F97C496962D8'; % present as Leptoptilos_crumenifer
      id_birdlife = 'marabou-leptoptilos-crumenifer';
      id_ADW = ''; % not present 2018/08/09
      id_Wiki = 'Leptoptilos_crumenifer';
      
    case 'Phalacrocorax_auritus'
      id_CoL = '0db1d944fd592b2e7d18ed5aec730aca';
      id_WoRMS = '159059';
      id_Taxo = '51681'; 
      id_EoL = '1048642';
      id_AnAge = taxon;      
      id_avibase = '3AC46C54EE4A6251';
      id_birdlife = 'double-crested-cormorant-phalacrocorax-auritus';
      
    case 'Phalacrocorax_aristotelis'
      id_CoL = '1df29fe43a0a63533a572ba503c536ac';
      id_WoRMS = '159059';
      id_Taxo = '51681'; 
      id_EoL = '1049403';
      id_AnAge = taxon;      
      id_avibase = 'CECC7B264A61BD22';
      id_birdlife = 'european-shag-phalacrocorax-aristotelis';
      
    case 'Phalacrocorax_carbo'
      id_CoL = '591cf8f011508b9a31813c25fc9f5304';
      id_WoRMS = '137179';
      id_Taxo = '51686'; 
      id_EoL = '46323495';
      id_AnAge = taxon;      
      id_avibase = 'ACD40E8C3CC720BF';
      id_birdlife = 'great-cormorant-phalacrocorax-carbo';
      
    case 'Phalacrocorax_brasilianus'
      id_CoL = '9e824e68427e1bba1ef60fb148c68e26';
      id_WoRMS = '343939';
      id_Taxo = '149444'; 
      id_EoL = '1065006';
      id_AnAge = taxon;      
      id_avibase = '56036504EDE6F930';
      id_birdlife = 'neotropical-cormorant-phalacrocorax-brasilianus';
      
    case 'Microcarbo_coronatus'
      id_CoL = 'ffdf05e81b2b76e5d58183fae43d1d92';
      id_WoRMS = '344614'; % present as Phalacrocorax coronatus 2018/10/19
      id_Taxo = '51691'; % present as Phalacrocorax coronatus 2018/10/19
      id_EoL = '1049411';
      id_AnAge = ''; % not present 2018/10/19      
      id_avibase = '446E8F9D1E2E281D';
      id_birdlife = 'crowned-cormorant-microcarbo-coronatus';
      
    case 'Fregata_minor'
      id_CoL = '223abd6f6e2a3ffab50991ce0c949026';
      id_WoRMS = '212654';
      id_Taxo = '51730'; 
      id_EoL = '1048654';
      id_AnAge = taxon;      
      id_avibase = '788EBCAB63213E04';
      id_birdlife = 'great-frigatebird-fregata-minor';
      
    case 'Fregata_magnificens'
      id_CoL = '9052c0bf905f0d62c9957700812e4360';
      id_WoRMS = '137178';
      id_Taxo = '51677'; 
      id_EoL = '1048653';
      id_AnAge = taxon;      
      id_avibase = '8AA3B42E976C7B2A';
      id_birdlife = 'magnificent-frigatebird-fregata-magnificens';
      
    case 'Fregata_ariel'
      id_CoL = 'a01ca40f26e4a02c1df62dbd2f058176';
      id_WoRMS = '212655';
      id_Taxo = '51728'; 
      id_EoL = '1048655';
      id_AnAge = taxon;      
      id_avibase = '09ED7E926715445E';
      id_birdlife = 'lesser-frigatebird-fregata-ariel';
      
    case 'Morus_bassanus'
      id_CoL = '4dc3e535a6a6253e4adceb72157431fe'; 
      id_WoRMS = '137180';  
      id_Taxo = '51654';       
      id_EoL = '1048640'; 
      id_AnAge = taxon;
      id_avibase = '534FB490884C6D33';
      id_birdlife = 'northern-gannet-morus-bassanus';
      
    case 'Morus_serrator'
      id_CoL = '662d4c8ba17ec2d907ff0285215b687e'; 
      id_WoRMS = '343991';  
      id_Taxo = '51664';       
      id_EoL = '1049632'; 
      id_AnAge = taxon;
      id_avibase = '136103448480BB9C';
      id_birdlife = 'australasian-gannet-morus-serrator';
      
    case 'Sula_nebouxii'
      id_CoL = 'ea3be33231335317a364427a5bcc38f3';
      id_WoRMS = '343959';
      id_Taxo = '51663';        
      id_EoL = '1048610';
      id_AnAge = taxon;       
      id_avibase = '649F85B5CED953D5';
      id_birdlife = 'blue-footed-booby-sula-nebouxii';
      
    case 'Sula_dactylatra'
      id_CoL = '683dec48774282e3a2fcc82ce816d57b';
      id_WoRMS = '212599';
      id_Taxo = '51661';        
      id_EoL = '1048601';
      id_AnAge = taxon;       
      id_avibase = '22D1B4A2F0911712';
      id_birdlife = 'masked-booby-sula-dactylatra';
      
    case 'Sula_leucogaster'
      id_CoL = '76358cc2af96ab41d7de587799bd53c5';
      id_WoRMS = '212597';
      id_Taxo = '51662';        
      id_EoL = '1048611';
      id_AnAge = taxon;       
      id_avibase = '5EC21767FC58DB7D';
      id_birdlife = 'brown-booby-sula-leucogaster';
      
    case 'Papasula_abbotti'
      id_CoL = '97ec679bb0dfb2dba2efea2c498ffedf';
      id_WoRMS = '344099';
      id_Taxo = '51658';        
      id_EoL = '1049633';
      id_AnAge = ''; % not present 2018/10/07       
      id_avibase = '92A2CCFC06063A60';
      id_birdlife = 'abbotts-booby-papasula-abbotti';
      
    case 'Balaeniceps_rex'
      id_CoL = '16bde12b82a99c26cf61f1229cd3f41a';
      id_Taxo = '51842';  
      id_EoL = '1049385';
      id_AnAge = taxon;      
      id_avibase = '47C7FDFD96162AC1';
      id_birdlife = 'shoebill-balaeniceps-rex';
      
    case 'Pelecanus_onocrotalus'
      id_CoL = '93042a2bf3d8f48f27fe9b410ac0d62a';
      id_WoRMS = '137176';
      id_Taxo = '51649'; 
      id_EoL = '1049382';
      id_AnAge = taxon;
      id_avibase = '8BAFB01E85D7AF4B';
      id_birdlife = 'great-white-pelican-pelecanus-onocrotalus';
      
    case 'Pelecanus_occidentalis'
      id_CoL = 'fedeb1874452ed896bb42c4dfc17b08f';
      id_WoRMS = '343935';
      id_Taxo = '51646'; 
      id_EoL = '1048599';
      id_AnAge = taxon;
      id_avibase = 'F59AB6B357BF97D8';
      id_birdlife = 'brown-pelican-pelecanus-occidentalis';
      
    case 'Scopus_umbretta'
      id_CoL = '9662bfb7db9b03adc1bca8cf7f493673';
      id_WoRMS = ''; % not present 2018/10/12
      id_Taxo = '51839'; 
      id_EoL = '1049601';
      id_AnAge = ''; % not present 2018/10/12
      id_avibase = 'FC10F6ED31D29188';
      id_birdlife = 'hamerkop-scopus-umbretta';
      id_ADW = ''; % not present 2018/10/12
      
    case 'Ardea_herodias'
      id_CoL = '6efeb35a87864c70193c0a75b38d01aa';
      id_WoRMS = '159382';
      id_Taxo = '51741'; 
      id_EoL = '1048656';
      id_AnAge = taxon;
      id_avibase = '93694BB5492F7012';
      id_birdlife = 'great-blue-heron-ardea-herodias';
      
    case 'Ardea_purpurea'
      id_CoL = 'b3b7059145f5bf471fcb7cfb65edc3a4';
      id_WoRMS = ''; % not present 2018/10/19
      id_Taxo = '51747'; 
      id_EoL = '1048985';
      id_AnAge = taxon;
      id_avibase = '8D6CB009B4D20368';
      id_birdlife = 'purple-heron-ardea-purpurea';
      
    case 'Bubulcus_ibis'
      id_CoL = 'd0eded93aea3f404ba4f291897195150';
      id_WoRMS = ''; % not present 2018/10/18
      id_Taxo = '51763'; 
      id_EoL = '1048666';
      id_AnAge = taxon;
      id_avibase = 'AB1CB2161CDC177A';
      id_birdlife = 'cattle-egret-bubulcus-ibis';
      
    case 'Platalea_leucorodia'
      id_CoL = '94c683511cf31861591cdf435513d232';
      id_WoRMS = '416678';
      id_Taxo = '51947'; 
      id_EoL = '1049642';
      id_AnAge = taxon;
      id_avibase = 'A0A584C1E7D786FE';
      id_birdlife = 'eurasian-spoonbill-platalea-leucorodia';
      
    case 'Geronticus_eremita'
      id_CoL = 'f562beb5c711d2f61ad9594ed3cd693f';
      id_WoRMS = ''; % not present at 2018/07/30
      id_Taxo = '51905'; 
      id_EoL = '1049656';
      id_AnAge = taxon;
      id_avibase = 'B20FECE2231097F4';
      id_birdlife = 'northern-bald-ibis-geronticus-eremita';
      
    case 'Aquila_chrysaetos'
      id_CoL = '5b68758c108a10b7c6be9f990d3ad0a3';
      id_Taxo = '52605'; 
      id_EoL = '1049119';
      id_AnAge = taxon;      
      id_avibase = '5F8E7CA845BD413F';
      id_birdlife = 'golden-eagle-aquila-chrysaetos';
      
    case 'Haliaeetus_albicilla'
      id_CoL = '61d3e9ec4bba1729c234095596d5e452';
      id_Taxo = '52680'; 
      id_EoL = '1049120';
      id_AnAge = taxon;      
      id_avibase = '5A3D91D3254A568D';
      id_birdlife = 'white-tailed-sea-eagle-haliaeetus-albicilla';
      
    case 'Gyps_rueppellii'
      id_CoL = 'd20945b21051ecce4ea8346951047ba6';
      id_Taxo = '52470'; 
      id_EoL = '1047563';
      id_AnAge = taxon;      
      id_avibase = '76B512B1EE9B10EC';
      id_birdlife = 'ruppells-vulture-gyps-rueppelli';
      id_ADW = ''; % not present 2018/08/07
      
    case 'Gyps_africanus'
      id_CoL = 'bf65f5edb9673a0e76788ca16f01e088';
      id_Taxo = '52462'; 
      id_EoL = '1047564';
      id_AnAge = taxon;      
      id_avibase = '0419DDC2F668EEE5';
      id_birdlife = 'white-backed-vulture-gyps-africanus';
      
    case 'Gyps_coprotheres'
      id_CoL = '4ccc6035b905d7bd01564007e0366560';
      id_Taxo = '52464'; 
      id_EoL = '912805';
      id_AnAge = ''; % not present 2018/10/17      
      id_avibase = 'F85BEEB442E4D57D';
      id_birdlife = 'cape-vulture-gyps-coprotheres';
      
    case 'Neophron_percnopterus'
      id_CoL = 'b209dec88cafe4aeec24aa1d83280319';
      id_Taxo = '52475'; 
      id_EoL = '914577';
      id_AnAge = taxon;      
      id_avibase = '6D3480A64B4953CE';
      id_birdlife = 'egyptian-vulture-neophron-percnopterus';
      
    case 'Necrosyrtes_monachus'
      id_CoL = '677a8f57af0272a5504e67028c77d1fc';
      id_Taxo = '52473'; 
      id_EoL = '1048942';
      id_AnAge = taxon;      
      id_avibase = '131038ADDA3373B0';
      id_birdlife = 'hooded-vulture-necrosyrtes-monachus';
      
    case 'Accipiter_fasciatus'
      id_CoL = '2c4dded548b877f5b5cb38a9cc9c136a';
      id_Taxo = '52540';        
      id_EoL = '1047987';
      id_AnAge = ''; % not present 2018/10/18       
      id_avibase = '8257AE54E56538E3';
      id_birdlife = 'brown-goshawk-accipiter-fasciatus';
      
    case 'Accipiter_nisus'
      id_CoL = '82b99b149d9ea234e5711f7f95f3d563';
      id_Taxo = '52565'; 
      id_EoL = '1048393';
      id_AnAge = taxon; 
      id_avibase = 'DB376A66278ED21E';
      id_birdlife = 'eurasian-sparrowhawk-accipiter-nisus';
      
    case 'Circus_aeruginosus'
      id_CoL = '86e884dce0543b20ad3f399fc9ce5198';
      id_Taxo = '52508';        
      id_EoL = '1047915';
      id_AnAge = taxon;       
      id_avibase = 'E2A19474E62F83E1';
      id_birdlife = 'western-marsh-harrier-circus-aeruginosus';
      
    case 'Circus_cyaneus'
      id_CoL = '2b4a6431dc9c5fc6b1c51cebdd705da9';
      id_Taxo = '52512';        
      id_EoL = '1049123';
      id_AnAge = taxon;       
      id_avibase = 'F558C7F96E40C134';
      id_birdlife = 'hen-harrier-circus-cyaneus';
      
    case 'Milvus_milvus'
      id_CoL = 'd5a14a9a82d09e99a21b03ffe7528d0e';
      id_Taxo = '52442';        
      id_EoL = '914570';
      id_AnAge = taxon;       
      id_avibase = '4E76C8C0085794FE';
      id_birdlife = 'red-kite-milvus-milvus';
      
    case 'Butastur_rufipennis'
      id_CoL = 'fc88155b922c5fb3cbc8bbcabb6ab085';
      id_Taxo = '52625';        
      id_EoL = '1047310';
      id_AnAge = ''; % not present 2018/10/14       
      id_avibase = '45A1D850C0690AD0';
      id_birdlife = 'grasshopper-buzzard-butastur-rufipennis';
      
    case 'Buteo_oreophilus'
      id_CoL = '54786ca59ccae2ae00dab160b16e8691';
      id_Taxo = '52652';        
      id_EoL = '1048454';
      id_AnAge = ''; % not present 2018/10/18       
      id_avibase = '5BFEFD9AB8F3FD64';
      id_birdlife = 'mountain-buzzard-buteo-oreophilus';
      
    case 'Buteo_lineatus'
      id_CoL = 'ba66abc0d0859e26ad70d38c3fd49434';
      id_Taxo = '52649';        
      id_EoL = '1049068';
      id_AnAge = taxon;       
      id_avibase = 'EA4D6C0B76852200';
      id_birdlife = 'red-shouldered-hawk-buteo-lineatus';
      
    case 'Sagittarius_serpentarius'
      id_CoL = 'ec311a0d228794fde1b568883133f0ac';
      id_Taxo = '52756';        
      id_EoL = '1049539';
      id_AnAge = ''; % not present 2018/08/11       
      id_avibase = 'DCBCCEB89FD9FC3F';
      id_birdlife = 'secretarybird-sagittarius-serpentarius';
      
    case 'Vultur_gryphus'
      id_CoL = 'e012d92f1ab45b81706d72e36c5512e0';
      id_Taxo = '52316';        
      id_EoL = '1049160';
      id_AnAge = taxon;       
      id_avibase = '659E8F5C0AEA27F2';
      id_birdlife = 'andean-condor-vultur-gryphus';
      
    case 'Sarcoramphus_papa'
      id_CoL = 'd4f208e55ab5b06e088645870c406d60';
      id_Taxo = '52311';        
      id_EoL = '1049159';
      id_AnAge = taxon;       
      id_avibase = '9306DA2F3B23E74C';
      id_birdlife = 'king-vulture-sarcoramphus-papa';
      
    case 'Tyto_alba'
      id_CoL = '6fcd23e9a266d2ec77f69e02b75fbead';
      id_Taxo = '54626';        
      id_EoL = '914939';
      id_AnAge = taxon;      
      id_avibase = '96B91A6873827284';
      id_birdlife = 'common-barn-owl-tyto-alba';
      
    case 'Bubo_scandiacus'
      id_CoL = '1347e0b2597b16465cd5674f305fafd4';
      id_Taxo = '54708'; % present as Nyctea scandiaca (C. Linnaeus, 1758)       
      id_EoL = '1036388';
      id_AnAge = taxon;
      id_ADW = 'Nyctea_scandiaca';
      id_avibase = '5B23B360E7DEC4A9';
      id_birdlife = 'snowy-owl-bubo-scandiacus';
      
    case 'Bubo_virginianus'
      id_CoL = '657c70b3ce45f54079dabb6949fb5ac2';
      id_Taxo = '54659';        
      id_EoL = '914958';
      id_AnAge = taxon;       
      id_avibase = 'FC366114BD3B51A0';
      id_birdlife = 'great-horned-owl-bubo-virginianus';
      
    case 'Ninox_novaeseelandiae'
      id_CoL = '7d44fc621bf240f281a88fa5fb15a468';
      id_Taxo = '54695';        
      id_EoL = '1178330';
      id_AnAge = ''; % not present 2018/09/02       
      id_avibase = 'E8E9C26DAFD46DC2';
      id_birdlife = 'morepork-ninox-novaeseelandiae';
      
    case 'Asio_otus'
      id_CoL = '74712e866357bed002de74350710c8c8';
      id_Taxo = '54695';        
      id_EoL = '915724';
      id_AnAge = taxon;
      id_avibase = 'FC4D40D2D5CEA6BE';
      id_birdlife = 'northern-long-eared-owl-asio-otus';
      
    case 'Asio_flammeus'
      id_CoL = 'fd0d693dcff690444079656e8325fea4';
      id_Taxo = '54765';        
      id_EoL = '915724';
      id_AnAge = taxon;
      id_avibase = '8F123A11E5DADFDD';
      id_birdlife = 'short-eared-owl-asio-flammeus';
      
    case 'Otus_senegalensis'
      id_CoL = '63852ffa1673f7c03497044276f64f5c';
      id_Taxo = '54735';        
      id_EoL = '1036379';
      id_AnAge = 'Otus_scops';
      id_avibase = 'F0AA4FE4EE5F5395';
      id_birdlife = 'african-scops-owl-otus-senegalensis';
      
    case 'Athene_noctua'
      id_CoL = 'f021258882a76882cfe825b4184b33c1';
      id_Taxo = '54645';        
      id_EoL = '1178306';
      id_AnAge = taxon;
      id_avibase = '9A7B268C4EF6F803';
      id_birdlife = 'little-owl-athene-noctua';
      
    case 'Urocolius_macrourus'
      id_CoL = 'e563e083718e4eb3a35fbcbde6fcaadd';
      id_Taxo = '55152';        
      id_EoL = '915736';
      id_AnAge = taxon;     
      id_avibase = 'E45D9EB2FE2364EE';
      id_birdlife = 'blue-naped-mousebird-urocolius-macrourus';
      
    case 'Leptosomus_discolor'
      id_CoL = 'fb7bb155923268f8cec398b5e34a27b5';
      id_Taxo = '55345';        
      id_EoL = '1050030';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = 'BCC6CD0D279E592A';
      id_birdlife = 'cuckoo-roller-leptosomus-discolor';
      
    case 'Euptilotis_neoxenus'
      id_CoL = '9e2e1359f85b411a7a1c34b7aa1151b5';
      id_Taxo = '55161';        
      id_EoL = '917143';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = 'BCC6CD0D279E592A';
      id_birdlife = 'eared-quetzal-euptilotis-neoxenus';
      
    case 'Rhabdotorrhinus_exarhatus'
      id_CoL = 'b1273e386f95abf5dd47986f8e09cc4b';
      id_Taxo = '72968';        
      id_EoL = '1047995';
      id_AnAge = ''; % not present 2018/08/08        
      id_avibase = 'C0BD105FF3017FFC';
      id_birdlife = 'sulawesi-hornbill-rhabdotorrhinus-exarhatus';
      
    case 'Tockus_monteiri'
      id_CoL = 'f6af371eceef6d176816e122ba494466';
      id_Taxo = '72957';        
      id_EoL = '914497';
      id_AnAge = ''; % not present 2018/10/106        
      id_avibase = 'C8898E88839C3CA2';
      id_birdlife = 'monteiros-hornbill-tockus-monteiri';
      
    case 'Bucorvus_leadbeateri'
      id_CoL = 'c37431d15839c9b467569ad3045869be';
      id_Taxo = '105636';        
      id_EoL = '1048004';
      id_AnAge = taxon;       
      id_avibase = '4192DE77F2F73998';
      id_birdlife = 'southern-ground-hornbill-bucorvus-leadbeateri';
      
    case 'Upupa_epops'
      id_CoL = 'b43247ae6156750fcfdbf4b472d3645b';
      id_Taxo = '55348';        
      id_EoL = '917145';
      id_AnAge = taxon;       
      id_avibase = 'F4D0DB8E39216416';
      id_birdlife = 'common-hoopoe-upupa-epops';
      
    case 'Todiramphus_cinnamominus'
      id_CoL = '1c50b024147aadb63f1f128e5afa7e79';
      id_Taxo = '1125446';        
      id_EoL = '1064917';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '3FD21E0406D6A736';
      id_birdlife = 'guam-kingfisher-todiramphus-cinnamominus';
      
    case 'Merops_bulocki'
      id_CoL = '92edd4c2f907dae8786acec63c9f7786';
      id_Taxo = '93273';        
      id_EoL = '1050036';
      id_AnAge = ''; % not present 2018/10/16       
      id_avibase = 'E6DC5DA11534CBD6';
      id_birdlife = 'red-throated-bee-eater-merops-bulocki';
      
    case 'Merops_orientalis'
      id_CoL = '7e43d7a1e5eb64f155fe5719c05dc6c5';
      id_Taxo = '55307';        
      id_EoL = '45513612';
      id_AnAge = ''; % not present 2019/06/18       
      id_avibase = '0562A30F1285DB6E';
      id_birdlife = 'asian-green-bee-eater-merops-orientalis';
      
    case 'Ramphastos_toco'
      id_CoL = '5cf6207f05c77e03bcbcd85733db072f';
      id_Taxo = '55573';        
      id_EoL = '1177788';
      id_AnAge = taxon;       
      id_avibase = 'D42641C0E83A2C10';
      id_birdlife = 'toco-toucan-ramphastos-toco';
      
    case 'Jynx_torquilla'
      id_CoL = '3a38254e7d541ce65f7befae820a116a';
      id_Taxo = '55583';        
      id_EoL = '917141';
      id_AnAge = taxon;       
      id_avibase = 'B2E6AB9FC2608DFA';
      id_birdlife = 'eurasian-wryneck-jynx-torquilla';
      
    case 'Cariama_cristata'
      id_CoL = '51010aa3e16c9d55c093b195102bac97';
      id_Taxo = '53437';        
      id_EoL = '915312';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '5817C5F7C841C6DE';
      id_birdlife = 'red-legged-seriema-cariama-cristata';
      
    case 'Falco_naumanni'
      id_CoL = 'bc99d387d3a7b447bf1d951ef8111cc2';
      id_Taxo = '52830';        
      id_EoL = '1049201';
      id_AnAge = taxon;       
      id_avibase = 'BECA271F14F77BEE';
      id_birdlife = 'lesser-kestrel-falco-naumanni';
      
    case 'Falco_tinnunculus'
      id_CoL = 'f30a471764fb219cde0a6bdaed72dca7';
      id_Taxo = '52853';        
      id_EoL = '1049167';
      id_AnAge = taxon;       
      id_avibase = 'DCDDC20BDA55E5D3';
      id_birdlife = 'common-kestrel-falco-tinnunculus';
      
    case 'Falco_columbarius'
      id_CoL = '75ecdeb482ff861644679d1cf4236827';
      id_Taxo = '52817';        
      id_EoL = '1049166';
      id_AnAge = taxon;       
      id_avibase = 'F3DA111CC8A6841B';
      id_birdlife = 'merlin-falco-columbarius';
      
    case 'Strigops_habroptila'
      id_CoL = '20a82a91a368244a12ed957c64f608cd';
      id_Taxo = '1125230';        
      id_EoL = '311770';
      id_AnAge = taxon;       
      id_avibase = '16804FAF5DCCB288';
      id_birdlife = '22685245';
      
    case 'Nestor_notabilis'
      id_CoL = '664d6a3ea4220b6b8b7bc36205567848';
      id_Taxo = '54207';        
      id_EoL = '1177837';
      id_AnAge = taxon;       
      id_avibase = 'D2E2AE57ABAD79F3';
      id_birdlife = 'kea-nestor-notabilis';
      
    case 'Calyptorhynchus_lathami'
      id_CoL = 'adf0301d062ec2ea740e1e67228c4a77'; 
      id_Taxo = '70575';      
      id_EoL = '1177831';
      id_AnAge = taxon;       
      id_avibase = 'D090A8A4A7716960';
      id_birdlife = 'glossy-black-cockatoo-calyptorhynchus-lathami';
      
    case 'Zanda_funerea'
      id_CoL = '7a47e67a03092b7e9be4de5b1b6df5ea'; % present as Calyptorhynchus funereus 2018/10/09
      id_Taxo = '54189'; % present as Calyptorhynchus funereus 2018/10/09       
      id_EoL = '1177830'; % present as Calyptorhynchus funereus 2018/10/09
      id_AnAge = 'Calyptorhynchus_funereus';       
      id_avibase = 'E6DFA7077084129A';
      id_birdlife = 'yellow-tailed-black-cockatoo-zanda-funerea';
      
    case 'Probosciger_aterrimus'
      id_CoL = 'c1b2b9bf490c44f132ac4dcd7877091b';
      id_Taxo = '54193';        
      id_EoL = '1177829';
      id_AnAge = taxon;       
      id_avibase = 'ADC0F2618675AC3B';
      id_birdlife = '22684723';
      
    case 'Cacatua_ophthalmica'
      id_CoL = '0efc677801d94a8928c8a4872806803b';
      id_Taxo = '70577';        
      id_EoL = '1178084';
      id_AnAge = taxon;       
      id_avibase = '54B51CFD75691AE9';
      id_birdlife = 'blue-eyed-cockatoo-cacatua-ophthalmica';
      
    case 'Cacatua_moluccensis'
      id_CoL = '6bf09cd69058be85068c56af7154421b';
      id_Taxo = '54180';        
      id_EoL = '1178085';
      id_AnAge = taxon;       
      id_avibase = '0B5492FA03FB597B';
      id_birdlife = 'salmon-crested-cockatoo-cacatua-moluccensis';
      id_ADW = ''; % nor present 2018/08/06
      
    case 'Cacatua_tenuirostris'
      id_CoL = '0aaef5f863ce97f4cd383f7298463c97';
      id_Taxo = '54184';        
      id_EoL = '1178090';
      id_AnAge = taxon;       
      id_avibase = 'F2A2FB6A910FE3C8';
      id_birdlife = 'long-billed-corella-cacatua-tenuirostris';
      
     case 'Poicephalus_robustus'
      id_CoL = '31ab651454981a843b7828d79a2fcb29';
      id_Taxo = '54376';        
      id_EoL = '1177918';
      id_AnAge = taxon;       
      id_avibase = 'D21C1A59BBB9A895';
      id_birdlife = 'cape-parrot-poicephalus-robustus';
      
    case 'Poicephalus_cryptoxanthus'
      id_CoL = 'd7ba32ae3a3d3dfa5a11b841b9c3cc53';
      id_Taxo = '70666';        
      id_EoL = '1177914';
      id_AnAge = taxon;       
      id_avibase = '4A03982169A8494D';
      id_birdlife = 'brown-headed-parrot-poicephalus-cryptoxanthus';
      
    case 'Cyanopsitta_spixii'
      id_CoL = '186620ee8938aeb164c570ca8f42e46a';
      id_Taxo = '70692';        
      id_EoL = '1177960';
      id_AnAge = taxon;       
      id_avibase = 'FB8F32C30473F64B';
      id_birdlife = 'spixs-macaw-cyanopsitta-spixii';
      
    case 'Ara_ararauna'
      id_CoL = '6a101975b78c4f5c22ff46fc4be8b43f';
      id_Taxo = '54396';        
      id_EoL = '1177961';
      id_AnAge = taxon;       
      id_avibase = '18AEC3532537ACCB';
      id_birdlife = 'blue-and-yellow-macaw-ara-ararauna';
      
    case 'Ara_macao'
      id_CoL = '3c4dad9b93db0297037993866e72329d';
      id_Taxo = '54398';        
      id_EoL = '1177962';
      id_AnAge = taxon;       
      id_avibase = '5B015EDA14786E2D';
      id_birdlife = 'scarlet-macaw-ara-macao';
      
    case 'Cyanoliseus_patagonus'
      id_CoL = '7fa6e83064c52d5d31e55651a857099d';
      id_Taxo = '54421';        
      id_EoL = '1177987';
      id_AnAge = taxon;       
      id_avibase = '1A7D8F6BCD3DFE25';
      id_birdlife = 'burrowing-parrot-cyanoliseus-patagonus';
      
    case 'Amazona_amazonica'
      id_CoL = 'c19a03f82708bd327ac7ba77a8d4bb80';
      id_Taxo = '54344';        
      id_EoL = '1178051';
      id_AnAge = taxon;       
      id_avibase = '0F2066D5BB706CD2';
      id_birdlife = 'orange-winged-amazon-amazona-amazonica';
      id_ADW = ''; % not present at 2018/07/2';
      
    case 'Amazona_finschi'
      id_CoL = 'a17c95bc09df808e3c0ee4f0343e44b5';
      id_Taxo = '107781';        
      id_EoL = '1178070';
      id_AnAge = taxon;       
      id_avibase = '66C32CC9A92F6633';
      id_birdlife = 'lilac-crowned-amazon-amazona-finschi';
      id_ADW = ''; % not present at 2018/10/04';
      
    case 'Myiopsitta_monachus'
      id_CoL = '66379bf2092e6d5ed3e6728d671bc89f';
      id_Taxo = '54433';        
      id_EoL = '915945';
      id_AnAge = taxon;       
      id_avibase = '35810386DDA72E08';
      id_birdlife = 'monk-parakeet-myiopsitta-monachus';
      
    case 'Forpus_passerinus'
      id_CoL = '9dde78344c3ce809f5af4d35947c6ae0';
      id_Taxo = '54427';        
      id_EoL = '1178014';
      id_AnAge = taxon;       
      id_avibase = 'E43CCCA642160851';
      id_birdlife = 'green-rumped-parrotlet-forpus-passerinus';
      
    case 'Psittrichas_fulgidus'
      id_CoL = 'c4e116ad8d3e8bcbf9c175f5768134c0';
      id_Taxo = '54276';        
      id_EoL = '1177869';
      id_AnAge = taxon;       
      id_avibase = '110E01EA39D4647F';
      id_birdlife = 'pesquets-parrot-psittrichas-fulgidus';
      id_ADW = ''; % not present 2018/08/07
      
    case 'Coracopsis_barklyi'
      id_CoL = '80e1be27f5d7bd1205f366d66c3b23bf'; % present as Coracopsis nigra 2018/10/14
      id_Taxo = '54359';  % present as Coracopsis nigra 2018/10/14       
      id_EoL = '43000262';
      id_AnAge = 'Coracopsis_nigra';       
      id_avibase = 'EB97C0F2675AD210';
      id_birdlife = 'seychelles-parrot-coracopsis-barklyi';
      id_ADW = 'Coracopsis_nigra';
      
    case 'Eos_histrio'
      id_CoL = '520503d51d2f744dbcf7e45bf21d1cf3';
      id_Taxo = '70541';        
      id_EoL = '1177801';
      id_AnAge = taxon;       
      id_avibase = '5B9183E866BDCA6D';
      id_birdlife = 'red-and-blue-lory-eos-histrio';
      
    case 'Melopsittacus_undulatus'
      id_CoL = 'f683faf1a057f5da3a1c30c0bbaf51fd';
      id_Taxo = '54299';        
      id_EoL = '914969';
      id_AnAge = taxon;       
      id_avibase = 'D17D101A132D3FB2';
      id_birdlife = 'budgerigar-melopsittacus-undulatus';
      
    case 'Psittaculirostris_salvadorii'
      id_CoL = '87acc58bee3ad5aa750b76f0f6ef7728';
      id_Taxo = '70587';        
      id_EoL = '1177847';
      id_AnAge = taxon;       
      id_avibase = '66AC2F1833D93970';
      id_birdlife = 'salvadoris-fig-parrot-psittaculirostris-salvadorii';
      
    case 'Prosopeia_tabuensis'
      id_CoL = '87acc58bee3ad5aa750b76f0f6ef7728';
      id_Taxo = '70587';        
      id_EoL = '1177847';
      id_AnAge = taxon;       
      id_avibase = '66AC2F1833D93970';
      id_birdlife = 'salvadoris-fig-parrot-psittaculirostris-salvadorii';
      
    case 'Eunymphicus_cornutus'
      id_CoL = '441c13783d18f589b4dfec3a94ec5c7b';
      id_Taxo = '54293';        
      id_EoL = '1177900';
      id_AnAge = taxon;       
      id_avibase = 'FC7AB945C8292D66';
      id_birdlife = 'horned-parakeet-eunymphicus-cornutus';
      
    case 'Acanthisitta_chloris'
      id_CoL = '5b8863030a8922433d7393bcad9b9192';
      id_Taxo = '56235';        
      id_EoL = '915638';
      id_AnAge = ''; % not present 2018/06/07       
      id_avibase = '7D5E37D94F5EBA80';
      id_birdlife = 'rifleman-acanthisitta-chloris';
      
    case 'Aphrastura_spinicauda'
      id_CoL = 'fc5861eec01a70a052c61fd549cbe59c';
      id_Taxo = '74811';        
      id_EoL = '917985';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '42F16BDC71348982';
      id_birdlife = 'thorn-tailed-rayadito-aphrastura-spinicauda';
      
    case 'Dendroplex_picus'
      id_CoL = '0a5f580f14c149511c9f975e7cbc972f'; % present as Xiphorhynchus picus 2018/10/20
      id_Taxo = '74728'; % present as Xiphorhynchus picus 2018/10/20        
      id_EoL = '1050730'; % present as Xiphorhynchus picus 2018/10/20
      id_AnAge = ''; % not present 2018/10/20       
      id_avibase = '9C163605D9726273';
      id_birdlife = 'straight-billed-woodcreeper-dendroplex-picus';
      
    case 'Premnoplex_brunnescens'
      id_CoL = '07e1049d593035b296a48aa535263d32';
      id_Taxo = '74932';         
      id_EoL = '1050159'; 
      id_AnAge = ''; % not present 2018/10/20       
      id_avibase = 'B023E37883BB7D29';
      id_birdlife = 'spotted-barbtail-premnoplex-brunnescens';
      
    case 'Phacellodomus_ruber'
      id_CoL = '4521031bee484b4d61395c744d53cdd6';
      id_Taxo = '74917';         
      id_EoL = '1050149'; 
      id_AnAge = ''; % not present 2018/10/31       
      id_avibase = 'ABE64671CA2ED32C';
      id_birdlife = 'greater-thornbird-phacellodomus-ruber';
      
    case 'Phacellodomus_sibilatrix'
      id_CoL = '829a4898dd10221253665fca47579f29';
      id_Taxo = '74912';         
      id_EoL = '1050151'; 
      id_AnAge = ''; % not present 2018/10/31       
      id_avibase = '01BB9F459559232B';
      id_birdlife = 'little-thornbird-phacellodomus-sibilatrix';
      
    case 'Tyrannus_tyrannus'
      id_CoL = 'e2f3ff2fc877b9322dbd4fbe6a87f5f7';
      id_Taxo = '56162';        
      id_EoL = '917490';
      id_AnAge = taxon;       
      id_avibase = '082D833CF61D6360';
      id_birdlife = 'eastern-kingbird-tyrannus-tyrannus';
      
    case 'Tyrannus_forficatus'
      id_CoL = 'e47386fbfbc03f9d58ae46cb41fb9a41';
      id_Taxo = '56160';        
      id_EoL = '917499';
      id_AnAge = ''; % not present 2018/09/28     
      id_avibase = '6F65F82B4A1BA7F2';
      id_birdlife = 'scissor-tailed-flycatcher-tyrannus-forficatus';
      
    case 'Tyrannus_savana'
      id_CoL = 'cead207da2850dd87d2dd12ac78bae9d';
      id_Taxo = '81074';        
      id_EoL = '917500';
      id_AnAge = ''; % not present 2018/09/28     
      id_avibase = 'A2510EF44C67DD52';
      id_birdlife = 'fork-tailed-flycatcher-tyrannus-savana';
      id_ADW = ''; % not present 2018/09/28
      
    case 'Sayornis_phoebe'
      id_CoL = 'a15591a5779bfc04754d9082dbfc27dd';
      id_Taxo = '56141';        
      id_EoL = '1046715';
      id_AnAge = taxon;       
      id_avibase = '62CA2AF81AF5B68D';
      id_birdlife = 'eastern-phoebe-sayornis-phoebe';

    case 'Empidonax_oberholseri'
      id_CoL = '9103cb570d8c573e92b3c3b6c9794d25';
      id_Taxo = '80942';        
      id_EoL = '1046725';
      id_AnAge = taxon;       
      id_avibase = '499FFF98B510A2C8';
      id_birdlife = 'american-dusky-flycatcher-empidonax-oberholseri';
      id_ADW = ''; % not present 2018/09/29

    case 'Leptopogon_amaurocephalus'
      id_CoL = '76f8498ae10915e3c6817294a9b3fc16';
      id_Taxo = '80712';        
      id_EoL = '1053171';
      id_AnAge = ''; % not present 2018/10/01      
      id_avibase = '61EA91A86889AEAB';
      id_birdlife = 'sepia-capped-flycatcher-leptopogon-amaurocephalus';

    case 'Mionectes_oleagineus'
      id_CoL = '1a173e25ca8c37c9f56623949e1cf9df';
      id_Taxo = '56199';        
      id_EoL = '1053189';
      id_AnAge = ''; % not present 2018/10/01      
      id_avibase = '0EFCDBB88117489F';
      id_birdlife = 'ochre-bellied-flycatcher-mionectes-oleagineus';

    case 'Archboldia_papuensis'
      id_CoL = '263acd7a02c49b8ca297932078040d08';
      id_Taxo = '59360';        
      id_EoL = '919930';
      id_AnAge = ''; % not present at 2018/10/03       
      id_avibase = '1146BB4A502AE807';
      id_birdlife = 'archbolds-bowerbird-archboldia-papuensis';
      id_ADW = ''; % not present at 2018/10/03 

    case 'Chlamydera_nuchalis'
      id_CoL = '8d1d45c6650fc058ed2b2722e9ffa9fc';
      id_Taxo = '59367';        
      id_EoL = '919935';
      id_AnAge = ''; % not present at 2018/10/03       
      id_avibase = '0F4DA8F3F7DEB379';
      id_birdlife = 'great-bowerbird-chlamydera-nuchalis';

    case 'Ailuroedus_crassirostris'
      id_CoL = 'b8b495ce243e7bed223013b0d346a951';
      id_Taxo = '59352';        
      id_EoL = '919925';
      id_AnAge = ''; % not present at 2018/10/03       
      id_avibase = 'D0C1FDA27471E909';
      id_birdlife = 'green-catbird-ailuroedus-crassirostris';

    case 'Malurus_splendens'
      id_CoL = '2604fb76c7c942370309f9a64870599d';
      id_Taxo = '85322';        
      id_EoL = '918371';
      id_AnAge = ''; % not present at 2018/10/01       
      id_avibase = '391EA6CB4F70C90F';
      id_birdlife = 'splendid-fairy-wren-malurus-splendens';

    case 'Ramsayornis_modestus'
      id_CoL = '8fde52516c3f6b9aa10172f19fb57b79';
      id_Taxo = '57988';        
      id_EoL = '918796';
      id_AnAge = ''; % not present at 2018/10/17       
      id_avibase = '8C34DEDF626266FD';
      id_birdlife = 'brown-backed-honeyeater-ramsayornis-modestus';

    case 'Acanthiza_chrysorrhoa'
      id_CoL = 'abee6623e4e8633c35d81f7cd4dc3cb4';
      id_Taxo = '57622';        
      id_EoL = '1051894';
      id_AnAge = ''; % not present at 2018/10/02       
      id_avibase = 'B1B0E34392DDCE8B';
      id_birdlife = 'yellow-rumped-thornbill-acanthiza-chrysorrhoa';
      id_ADW = ''; %  not present at 2018/10/02

    case 'Acanthiza_inornata'
      id_CoL = '60e979634ccf4e67804cedb2ff8bb67f';
      id_Taxo = '85359';        
      id_EoL = '1051896';
      id_AnAge = ''; % not present at 2018/10/02       
      id_avibase = '6601168A1B3CCECF';
      id_birdlife = 'western-thornbill-acanthiza-inornata';

    case 'Gerygone_igata'
      id_CoL = '391dd50a3cba64d9e4f12407cb921729';
      id_Taxo = '85384';        
      id_EoL = '1051927';
      id_AnAge = ''; % not present at 2018/10/02       
      id_avibase = 'C3D7DC15FA86C16E';
      id_birdlife = 'grey-gerygone-gerygone-igata';

    case 'Gerygone_flavolateralis'
      id_CoL = '98f9466ac13b2e51430a63da93055088';
      id_Taxo = '85381';        
      id_EoL = '1051924';
      id_AnAge = ''; % not present at 2018/10/21       
      id_avibase = 'B7AC535886BF296E';
      id_birdlife = 'fan-tailed-gerygone-gerygone-flavolateralis';

    case 'Pomatostomus_temporalis'
      id_CoL = 'c92091998117188ba812c3b5660ba295';
      id_Taxo = '57054';        
      id_EoL = '919822';
      id_AnAge = ''; % not present at 2018/10/15       
      id_avibase = 'B783AA95BBE71F78';
      id_birdlife = 'grey-crowned-babbler-pomatostomus-temporalis';
      id_ADW = '';  % not present at 2018/10/15   

    case 'Paradisaea_rubra'
      id_CoL = '150e58f547fcbceda2a7149c865a9c36';
      id_Taxo = '59419';        
      id_EoL = '1051878';
      id_AnAge = ''; % not present at 2018/07/27       
      id_avibase = '2215C01D11B737E6';
      id_birdlife = 'red-bird-of-paradise-paradisaea-rubra';

    case 'Paradigalla_brevicauda'
      id_CoL = 'be1fad7542c3889cc7931e6db54c37f2';
      id_Taxo = '87735';        
      id_EoL = '1051871';
      id_AnAge = ''; % not present at 2018/07/27       
      id_avibase = '1444D04FE604ADD9';
      id_birdlife = 'short-tailed-paradigalla-paradigalla-brevicauda';

    case 'Astrapia_mayeri'
      id_CoL = '2ed62ac51a588c41ffaa169601a2b7e0';
      id_Taxo = '59387';        
      id_EoL = '1051849';
      id_AnAge = ''; % not present at 2018/10/17       
      id_avibase = '8F49F93299C815A4';
      id_birdlife = 'ribbon-tailed-astrapia-astrapia-mayeri';
      id_ADW = ''; % not present at 2018/10/17  

    case 'Lanius_senator'
      id_CoL = '2f89fd5f925b02ec2152336e3e270879';
      id_Taxo = '56645';        
      id_EoL = '1050932';
      id_AnAge = taxon;       
      id_avibase = '7E70D490A6476D16';
      id_birdlife = 'woodchat-shrike-lanius-senator';
      
    case 'Pica_pica'
      id_CoL = '15edda20e5f20f4e97c324d80eb1cf6f';
      id_Taxo = '59494';        
      id_EoL = '1177362';
      id_AnAge = taxon;       
      id_avibase = '1EB2E3C72A6B688A';
      id_birdlife = 'eurasian-magpie-pica-pica';
      
    case 'Aphelocoma_coerulescens'
      id_CoL = '178c32cd8d9b9b96aec67d3b8f66ab93';
      id_Taxo = '59439';        
      id_EoL = '855943';
      id_AnAge = taxon;       
      id_avibase = 'D78D24B97846B620';
      id_birdlife = 'florida-scrub-jay-aphelocoma-coerulescens';
      
    case 'Cyanopica_cyanus'
      id_CoL = 'f1da4d5d17fb0e8b6dc8803996bba073';
      id_Taxo = '93367';        
      id_EoL = '916487';
      id_AnAge = ''; % not present 2018/10/04       
      id_avibase = '659D6E44CDDBC5F1';
      id_birdlife = 'asian-azure-winged-magpie-cyanopica-cyanus';
      id_ADW = ''; % not present 2018/10/04       
      
    case 'Corvus_monedula'
      id_CoL = '8b1d7741c6b8ad881d4f28e0bbe0bdeb';
      id_Taxo = '59548';        
      id_EoL = '1177485';
      id_AnAge = ''; % not present 2017/06/18 
      id_avibase = 'D4C32F8E792B65BA';
      id_birdlife = 'eurasian-jackdaw-corvus-monedula';
      
    case 'Corvus_hawaiiensis'
      id_CoL = '373f45316d19bbb301d547ad775f6276';
      id_Taxo = '87773';        
      id_EoL = '1177475';
      id_AnAge = taxon; 
      id_avibase = '2CDECD36D1A0E5F3';
      id_birdlife = 'hawaiian-crow-corvus-hawaiiensis';
      
    case 'Corvus_splendens'
      id_CoL = 'b4d718fbe5ad0d58713d39068a8a0064';
      id_Taxo = '59557';        
      id_EoL = '916246';
      id_AnAge = ''; % not present 2018/10/14 
      id_avibase = '3986890399CA4859';
      id_birdlife = 'house-crow-corvus-splendens';
      
    case 'Corvus_albus'
      id_CoL = '512cfa54fde63929123878fb014a5d93';
      id_Taxo = '59521';        
      id_EoL = '917338';
      id_AnAge = ''; % not present 2018/10/17 
      id_avibase = '34D538E14AA16E13';
      id_birdlife = 'pied-crow-corvus-albus';
      
    case 'Picathartes_gymnocephalus'
      id_CoL = '8f49aaf3ff51bd1b89d3460db10997ab';
      id_Taxo = '57200';        
      id_EoL = '918815';
      id_AnAge = '';       
      id_avibase = '303653379A703A4F';
      id_birdlife = '22708108';
      
    case 'Remiz_pendulinus'
      id_CoL = '3970051da664fb71a70190918d8739e8';
      id_Taxo = '57690';        
      id_EoL = '1051179';
      id_AnAge = taxon;       
      id_avibase = 'F81EB04951AA84BB';
      id_birdlife = 'eurasian-penduline-tit-remiz-pendulinus';
      
    case 'Lophophanes_cristatus'
      id_CoL = 'cd1512991114f0bcfd9c50282ed817d7';
      id_Taxo = '57703'; % present as Parus cristatus Linnaeus, 1758     
      id_EoL = '1052002';
      id_AnAge = taxon;
      id_ADW = 'Parus cristatus'; 
      id_avibase = 'E553193354C74B21';
      id_birdlife = 'crested-tit-lophophanes-cristatus';
      
    case 'Poecile_atricapillus'
      id_CoL = 'aed95c6ec867d5d04bbab05d19687d73';
      id_Taxo = '57697';   % present as Parus atricapillus     
      id_EoL = '1178539';
      id_AnAge = taxon;    
      id_avibase = 'B1F0CC82E34E4541'; 
      id_ADW = 'Parus_atricapillus';
      id_birdlife = 'black-capped-chickadee-poecile-atricapillus';
      
    case 'Parus_major'
      id_CoL = '9a3033c7cf62b8a01f58d9a946e06126';
      id_Taxo = '57713';        
      id_EoL = '1051974';
      id_AnAge = taxon;       
      id_avibase = '7296BC772F2643AD';
      id_birdlife = 'great-tit-parus-major';
      
    case 'Cyanistes_caeruleus'
      id_CoL = 'df55272f9bdde6d18cd7f4942fe59ad9';
      id_Taxo = '57700'; % present as Parus caeruleus       
      id_EoL = '1051997';
      id_AnAge = taxon;       
      id_avibase = '9BE53D340F9A4305';
      id_ADW = 'Parus_caeruleus';
      id_birdlife = 'eurasian-blue-tit-cyanistes-caeruleus';
      
    case 'Periparus_ater'
      id_CoL = 'a1536cbd36af848c4cfb9234fad2e1e0';
      id_Taxo = '57696'; % present as Parus ater Linnaeus, 1758       
      id_EoL = '1052006';
      id_AnAge = taxon;
      id_ADW = 'Parus_ater'; 
      id_avibase = 'A4EBA919FCAFED5E';
      id_birdlife = 'coal-tit-periparus-ater';
      
    case 'Alauda_arvensis'
      id_CoL = 'f42843b15106ffcf24b9e321c81480f6';
      id_Taxo = '56272';        
      id_EoL = '916864';
      id_AnAge = taxon;       
      id_avibase = '2D9A361995111F42';
      id_birdlife = 'eurasian-skylark-alauda-arvensis';
      id_ADW = ''; % not present 2018/10/04
      
    case 'Galerida_cristata'
      id_CoL = 'c9baf55211fff56d2918637118277b53';
      id_Taxo = '56309';        
      id_EoL = '913308';
      id_AnAge = taxon;       
      id_avibase = 'FC79EB47AF9F3925';
      id_birdlife = 'crested-lark-galerida-cristata';
      
    case 'Ammomanes_deserti'
      id_CoL = '0483e5663c20bc90300e591479b37700';
      id_Taxo = '56275';        
      id_EoL = '915660';
      id_AnAge = taxon;       
      id_avibase = 'A977348D32FB435E';
      id_birdlife = 'desert-lark-ammomanes-deserti';
      
    case 'Calendulauda_erythrochlamys'
      id_CoL = 'c78fc3c9ed92dd2e06d3039495dc1ada';
      id_Taxo = '80786'; % present as Certhilauda erythrochlamys 2018/10/14       
      id_EoL = '915697';
      id_AnAge = ''; % not present 2018/10/14       
      id_avibase = '214FC4649C27757F';
      id_birdlife = 'dune-lark-calendulauda-erythrochlamys';
      id_ADW = ''; % not present 2018/10/14    
      
    case 'Eremophila_alpestris'
      id_CoL = '23385a5da2c69da434c39cd4ab5c1a5a';
      id_Taxo = '56302'; 
      id_EoL = '915655';
      id_AnAge = taxon; 
      id_avibase = '77AFF9B86BC9FEE3';
      id_birdlife = 'horned-lark-eremophila-alpestris';
      
    case 'Delichon_urbicum'
      id_CoL = '1f9be412a6454b0bfd18f48e515e2592';
      id_Taxo = '1125977';        
      id_EoL = '284079';
      id_AnAge = taxon;       
      id_avibase = 'E4BB82F50C488B8B';
      id_birdlife = 'northern-house-martin-delichon-urbicum';
      
    case 'Tachycineta_leucorrhoa'
      id_CoL = 'add025935759ec84ff690fc0cc8d8393';
      id_Taxo = '56442';        
      id_EoL = '1050737';
      id_AnAge = ''; % not present 2018/10/06       
      id_avibase = 'B9861E4A3002BEE4';
      id_birdlife = 'white-rumped-swallow-tachycineta-leucorrhoa';
      
    case 'Tachycineta_albilinea'
      id_CoL = '05c5fa92f49dec6fda577a28b82ded63';
      id_Taxo = '56437';        
      id_EoL = '1050734';
      id_AnAge = ''; % not present 2018/10/08       
      id_avibase = 'DBF8F78C668FEDF8';
      id_birdlife = 'mangrove-swallow-tachycineta-albilinea';
      
    case 'Hirundo_tahitica'
      id_CoL = '7904554037aab6bd85484fad221e9ab7';
      id_Taxo = '56383';        
      id_EoL = '1050787';
      id_AnAge = taxon;       
      id_avibase = 'B9AC53DEE40266A7';
      id_birdlife = 'tahiti-swallow-hirundo-tahitica';
      
    case 'Hirundo_rustica'
      id_CoL = 'fecc373b4a53e6c2e4c850b903531594';
      id_Taxo = '56376';        
      id_EoL = '917688';
      id_AnAge = taxon;       
      id_avibase = '58C502EA7AF3E023';
      id_birdlife = 'barn-swallow-hirundo-rustica';
      
    case 'Hirundo_neoxena'
      id_CoL = '7d9a4f1f514c16b797f68c0b7289ed55';
      id_Taxo = '81105';        
      id_EoL = '1050772';
      id_AnAge = ''; % not present 2018/10/18       
      id_avibase = 'F8F6B79557EFD5FA';
      id_birdlife = 'welcome-swallow-hirundo-neoxena';
      
    case 'Petrochelidon_spilodera'
      id_CoL = '71189ed208e795bf13932045e8813238';
      id_Taxo = '56405';        
      id_EoL = '1050785'; % present as Hirundo spilodera 2018/10/18
      id_AnAge = ''; % not present 2018/10/18      
      id_avibase = '7D1AE743D8097CD7';
      id_birdlife = 'south-african-swallow-petrochelidon-spilodera';
      
    case 'Petrochelidon_ariel'
      id_CoL = 'cf5073a09ebb8d9bb2def5a61013f379';
      id_Taxo = '56397';        
      id_EoL = '1050757'; % present as Hirundo ariel 2018/10/18
      id_AnAge = ''; % not present 2018/10/18       
      id_avibase = '7FB743966F7573BB';
      id_birdlife = 'fairy-martin-petrochelidon-ariel';
      
    case 'Sylvia_atricapilla'
      id_CoL = '4134d00c993b71067bfeb807a0d09c4b';
      id_Taxo = '57368';        
      id_EoL = '1052362';
      id_AnAge = taxon;       
      id_avibase = '61F9065BE0965E1A';
      id_birdlife = 'eurasian-blackcap-sylvia-atricapilla';
      
    case 'Phylloscopus_trochilus'
      id_CoL = '9f7d79f2f0a042ef0e8368239dfb1cb3';
      id_Taxo = '57343';        
      id_EoL = '1052636';
      id_AnAge = taxon;       
      id_avibase = '88F4B969622B8268';
      id_birdlife = 'willow-warbler-phylloscopus-trochilus';
      
    case 'Acrocephalus_arundinaceus'
      id_CoL = '246b509e1f2c8e458fa21727049844e2';
      id_Taxo = '57226';        
      id_EoL = '1052541';
      id_AnAge = taxon;       
      id_avibase = 'B283E33243C17D97';
      id_birdlife = 'great-reed-warbler-acrocephalus-arundinaceus';
      
    case 'Acrocephalus_scirpaceus'
      id_CoL = '52f40a2e6ff37f8b358b05b2f708f774';
      id_Taxo = '57235';        
      id_EoL = '1052563';
      id_AnAge = ''; % not present 2018/10/03       
      id_avibase = '4B3E6D256004B252';
      id_birdlife = 'common-reed-warbler-acrocephalus-scirpaceus';
      
    case 'Garrulax_strepitans'
      id_CoL = 'f1c6695d476872862420f7a6325db0f0';
      id_Taxo = '84574';        
      id_EoL = '1052627';
      id_AnAge = ''; % not present 2018/08/10       
      id_avibase = '830EF7CF19980BBD';
      id_birdlife = 'white-necked-laughingthrush-garrulax-strepitans';
      
    case 'Argya_squamiceps'
      id_CoL = '7a520c6434abc2ace93e7ebd5676f614'; % present as Turdoides squamiceps 2018/09/29
      id_Taxo = '84542'; % present as Turdoides squamiceps 2018/09/29       
      id_EoL = '1052432'; % present as Turdoides squamiceps 2018/09/29  
      id_AnAge = 'Turdoides_squamiceps';    
      id_avibase = 'E99FE2FE9B88115E';
      id_birdlife = 'arabian-babbler-argya-squamiceps';
      id_Wiki = 'Turdoides_squamiceps';
      id_ADW = ''; % not present 2018/09/29 
      
    case 'Regulus_regulus'
      id_CoL = '39de64eea659b04cfd67c5d4ff5633f4';
      id_Taxo = '57355';        
      id_EoL = '1051232';
      id_AnAge = taxon;      
      id_avibase = 'A7CC62D6BD333F25';
      id_birdlife = 'goldcrest-regulus-regulus';
      
    case 'Regulus_ignicapillus'
      id_CoL = '8480c26fe2dde898a777686976e2e1e4';
      id_Taxo = '1126234'; % unaccepted, to Regulus ignicapilla (Temminck, 1820)       
      id_EoL = '1051231';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '85B03849153146D8';
      id_birdlife = 'common-firecrest-regulus-ignicapilla';
      
    case 'Tichodroma_muraria'
      id_CoL = '1c8d1f126dda2f5330c60f85fcfb30c4';
      id_Taxo = '57768';        
      id_EoL = '1051060';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = '89C425901C5B5343';
      id_birdlife = 'wallcreeper-tichodroma-muraria';
      
    case 'Troglodytes_aedon'
      id_CoL = '844d88011fccf9fc3ebd08155e87483b';
      id_Taxo = '56758';        
      id_EoL = '1050659';
      id_AnAge = taxon;      
      id_avibase = '51E937020E0F3B99';
      id_birdlife = 'house-wren-troglodytes-aedon';
      
    case 'Sitta_europaea'
      id_CoL = '9ba4a95ae5651cb91dbeca2e404f662d';
      id_Taxo = '57744';        
      id_EoL = '1051081';
      id_AnAge = taxon;      
      id_avibase = '9C2B53A087F44E10';
      id_birdlife = 'eurasian-nuthatch-sitta-europaea';
      
    case 'Cinclus_cinclus'
      id_CoL = 'fcb3f9f786fe924fe49d1c502504a864';
      id_Taxo = '56716';        
      id_EoL = '916125';
      id_AnAge = taxon;
      id_avibase = '9C2B53A087F44E10';
      id_birdlife = 'white-throated-dipper-cinclus-cinclus';
      
    case 'Turdus_merula'
      id_CoL = '8539f68b2f729827c29dc81a2b30763a';
      id_Taxo = '57002';        
      id_EoL = '1177498';
      id_AnAge = taxon;
      id_avibase = '6D7A9C93AD1830EB';
      id_birdlife = 'eurasian-blackbird-turdus-merula';
      
    case 'Turdus_philomelos'
      id_CoL = '9015bb30c0dcb8d6b26e8fd46c70d8ac';
      id_Taxo = '57011';        
      id_EoL = '1052742';
      id_AnAge = taxon;       
      id_avibase = 'D929EB214A698282';
      id_birdlife = 'song-thrush-turdus-philomelos';
      
    case 'Turdus_migratorius'
      id_CoL = '777be7339135b948e17df3b6e23e4549';
      id_Taxo = '57003';        
      id_EoL = '1177506';
      id_AnAge = taxon;
      id_avibase = 'D77E4B418D581FB2';
      id_birdlife = 'american-robin-turdus-migratorius';
      
    case 'Turdus_eremita'
      id_CoL = '070c73c2aa0e407d7fe37fe0e0391d0f'; % present as Nesocichla eremita 2018/10/16
      id_Taxo = '84397'; % present as Nesocichla eremita 2018/10/16       
      id_EoL = '1052828'; % present as Nesocichla eremita 2018/10/16   
      id_AnAge = ''; % not present 2018/10/16
      id_avibase = 'C740512DF96766B1';
      id_birdlife = 'tristan-thrush-turdus-eremita';
      id_ADW = 'Nesocichla_eremita';
      
    case 'Catharus_minimus'
      id_CoL = 'a396879ac8ff28c620d38e100c18fa5d';
      id_Taxo = '56821';        
      id_EoL = '1177538';
      id_AnAge = taxon;
      id_avibase = 'B904BB227C07317E';
      id_birdlife = 'grey-cheeked-thrush-catharus-minimus';

    case 'Myadestes_obscurus'
      id_CoL = 'cb55927e7a3df3d00f28dad38627af8e';
      id_Taxo = '84317';        
      id_EoL = '1177908';
      id_AnAge = ''; % not present at 2018/07/28
      id_avibase = 'A1C41A3FDDC9EA25';
      id_birdlife = 'omao-myadestes-obscurus';

    case 'Myadestes_palmeri'
      id_CoL = 'f98e3376b047ee8476ce49b3508a07fe';
      id_Taxo = '84319';        
      id_EoL = '1177952';
      id_AnAge = ''; % not present at 2018/07/28
      id_avibase = '62B955D337163376';
      id_birdlife = 'puaiohi-myadestes-palmeri';

    case 'Hylocichla_mustelina'
      id_CoL = 'd3caee875b2cc0a2a47f1e1eae7f3f2b';
      id_Taxo = '56878';        
      id_EoL = '1177531';
      id_AnAge = taxon; 
      id_avibase = '8E1D9327B8DAFD54';
      id_birdlife = 'wood-thrush-hylocichla-mustelina';

    case 'Sturnus_vulgaris'
      id_CoL = 'cbb6ad24ade1b086f9f6ad89fe92ac3d';
      id_Taxo = '59258';        
      id_EoL = '922253';
      id_AnAge = taxon;       
      id_avibase = '94A4403295E2D9BE';
      id_birdlife = 'common-starling-sturnus-vulgaris';

    case 'Buphagus_erythrorhynchus'
      id_CoL = '3e8f6e0b090a6f84931f2b7c00219ffe';
      id_Taxo = '59266';        
      id_EoL = '1052164';
      id_AnAge = ''; % not present 2018/10/18       
      id_avibase = '7471E71D4A122CE3';
      id_birdlife = 'red-billed-oxpecker-buphagus-erythrorynchus'; % watch deviating spelling

    case 'Toxostoma_curvirostre'
      id_CoL = '004ebe47b553114eda7f8ccc707f1348';
      id_Taxo = '83018';        
      id_EoL = '1050711';
      id_AnAge = taxon;       
      id_avibase = '2B37C1B59B70D72B';
      id_birdlife = 'curve-billed-thrasher-toxostoma-curvirostre';
      
    case 'Oenanthe_oenanthe'
      id_CoL = 'a98ec4f444eec6222c26db7465a6866e';
      id_Taxo = '56939';
      id_EoL = '1177543';
      id_AnAge = taxon; 
      id_avibase = 'DF526047637004DD';
      id_birdlife = 'northern-wheatear-oenanthe-oenanthe';
                 
    case 'Saxicola_rubicola'
      id_CoL = '3a7ef4deaf1586f777dff42cee7be10d';
      id_Taxo = '';    % not present at 2018/09/19    
      id_EoL = '2870505';
      id_AnAge = ''; % not present at 2018/09/19      
      id_avibase = '0EA8F8B905405FB3';
      id_birdlife = ''; % not present at 2018/09/19 
                 
    case 'Saxicola_torquata'
      id_CoL = '0f543dacea5bfb58b1564ecca0a610d1';
      id_Taxo = '1126423';   
      id_EoL = '284202';
      id_AnAge = taxon;   
      id_avibase = '222CAA6E0DDDFE7E';
      id_birdlife = 'common-stonechat-saxicola-torquatus'; 
      
    case 'Saxicola_rubetra'
      id_CoL = 'a6bea4e070afe0013dbc45b0ce7e513b';
      id_Taxo = '56975';   
      id_EoL = '1051480';
      id_AnAge = taxon;   
      id_avibase = 'A0EDAEA2E89A9A96';
      id_birdlife = 'whinchat-saxicola-rubetra'; 
      
    case 'Ficedula_hypoleuca'
      id_CoL = 'abf8789e1d20be70f734faf3bac68ef9';
      id_Taxo = '168169';   
      id_EoL = '1051410';
      id_AnAge = taxon;   
      id_avibase = '6E352E1870A195B7';
      id_birdlife = 'european-pied-flycatcher-ficedula-hypoleuca'; 
      id_ADW = ''; % not present 2018/10/04
      
    case 'Myrmecocichla_formicivora'
      id_CoL = '7dac65c12557ec13699c6d7b19b6a233';
      id_Taxo = '93293';   
      id_EoL = '1051590';
      id_AnAge = ''; % not present 2018/10/16   
      id_avibase = '400A83B9AE890813';
      id_birdlife = 'southern-anteater-chat-myrmecocichla-formicivora'; 
      
    case 'Cinnyris_jugularis'
      id_CoL = 'd7ff4b36e31373ca9a0d3b401e370436';
      id_Taxo = '1126557';        
      id_EoL = '1051761';
      id_AnAge = ''; % not present 2017/06/18       
      id_avibase = 'CBE7EC407BB927CB';
      id_birdlife = 'olive-backed-sunbird-cinnyris-jugularis';
      
    case 'Ploceus_castaneiceps'
      id_CoL = '2c70a58aced703a025fb477fa7dd690f';
      id_Taxo = '58970';        
      id_EoL = '919008';
      id_AnAge = ''; % not present 2018/08/01       
      id_avibase = '2379E3EBD59FFCE6';
      id_birdlife = 'taveta-golden-weaver-ploceus-castaneiceps';
      id_ADW = ''; % not present 2018/08/01      
      
    case 'Foudia_rubra'
      id_CoL = '190ff237ae7e40a8765423fe50be4bf6';
      id_Taxo = '59062';        
      id_EoL = '919647';
      id_AnAge = taxon;       
      id_avibase = '2F37FD057AB5E306';
      id_birdlife = 'mauritius-fody-foudia-rubra';
      
    case 'Passer_domesticus'
      id_CoL = '9cd9581803902beb26aee9ddcc6e4575';
      id_Taxo = '59109';        
      id_EoL = '922241';
      id_AnAge = taxon;       
      id_avibase = '240E33900CE34D44';
      id_birdlife = 'house-sparrow-passer-domesticus';
      
    case 'Passer_montanus'
      id_CoL = '67221704ec8940302afd7725ddba87be';
      id_Taxo = '59125';        
      id_EoL = '922242';
      id_AnAge = taxon;       
      id_avibase = 'C22FBF8D36F91BCA';
      id_birdlife = 'eurasian-tree-sparrow-passer-montanus';
      
    case 'Taeniopygia_guttata'
      id_CoL = '06ff618268d51f635be7a84662273262';
      id_Taxo = '58868';        
      id_EoL = '1050500';
      id_AnAge = taxon;       
      id_avibase = 'CF7D71B0FC773B09';
      id_birdlife = 'timor-zebra-finch-taeniopygia-guttata';
      
    case 'Amandava_subflava'
      id_CoL = '30d5788e4061c63641d5dbd58349eb37';
      id_Taxo = '167305';        
      id_EoL = '1050409';
      id_AnAge = ''; % not present 2018/10/15      
      id_avibase = 'ECC40D44CF305866';
      id_birdlife = 'timor-zebra-finch-taeniopygia-guttata';
      
    case 'Anthus_pratensis'
      id_CoL = 'eb78a0bc492c93711d4c1ca8426d71d9';
      id_Taxo = '56453';        
      id_EoL = '1051319';
      id_AnAge = taxon;       
      id_avibase = '14873249B607CEB1';
      id_birdlife = 'meadow-pipit-anthus-pratensis';
      
    case 'Anthus_spinoletta'
      id_CoL = '3d31f2037ae8838b4234d121738d39f8';
      id_Taxo = '56456';        
      id_EoL = '1282295';
      id_AnAge = taxon;       
      id_avibase = '0A3FA18502F4FC70';
      id_birdlife = 'water-pipit-anthus-spinoletta';
      
    case 'Motacilla_flava'
      id_CoL = 'eca91fcd14896fe760fc1c8eef9774bf';
      id_Taxo = '56477';        
      id_EoL = '4405334';
      id_AnAge = taxon;    
      id_avibase = '5983D6776C4C4F85';
      id_birdlife = 'western-yellow-wagtail-motacilla-flava';
      
    case 'Motacilla_citreola'
      id_CoL = '9f8c207270d7843d72f06265f6c0553d';
      id_Taxo = '56476';        
      id_EoL = '1178526';
      id_AnAge = ''; % not present 2018/10/22    
      id_avibase = '5B0295C122B63ED3';
      id_birdlife = 'citrine-wagtail-motacilla-citreola';
      
    case 'Motacilla_aguimp'
      id_CoL = 'ce26c7b210a316bd482c036ae2052894';
      id_Taxo = '82699';        
      id_EoL = '1051307';
      id_AnAge = ''; % not present 2018/10/17    
      id_avibase = 'CE7D41A6447BCC86';
      id_birdlife = 'african-pied-wagtail-motacilla-aguimp';
      
    case 'Motacilla_clara'
      id_CoL = 'd88708530dba109eafae7f64c0a9729c';
      id_Taxo = '82696';        
      id_EoL = '1051314';
      id_AnAge = ''; % not present 2018/10/18    
      id_avibase = '747B3A52F2260C65';
      id_birdlife = 'mountain-wagtail-motacilla-clara';
      
    case 'Calcarius_lapponicus'
      id_CoL = 'bd8ade26596fee00d0d7d72a59703c7f';
      id_Taxo = '58033';        
      id_EoL = '1052765';
      id_AnAge = taxon;    
      id_avibase = '3534E4CEBACCB166';
      id_birdlife = 'lapland-longspur-calcarius-lapponicus';
      id_ADW = ''; % not present 2018/09/30
      
    case 'Emberiza_calandra'
      id_CoL = '0b7699ffcd0234298096adc11e685bfe';
      id_Taxo = '58051';        
      id_EoL = '892214';
      id_AnAge = taxon;    
      id_avibase = '9A87EBB0B75C410B';
      id_birdlife = 'corn-bunting-emberiza-calandra';
      id_ADW = ''; % not present 2018/10/04
      
    case 'Emberiza_citrinella'
      id_CoL = '2fae186795fa76651dba5efa031cbbd4';
      id_Taxo = '58057';        
      id_EoL = '1046716';
      id_AnAge = taxon;    
      id_avibase = '56FB47C05CB7275F';
      id_birdlife = 'yellowhammer-emberiza-citrinella';
      
    case 'Passerculus_sandwichensis'
      id_CoL = 'a40e57e0efe04426fca93156aee1edf4';
      id_Taxo = '58100';        
      id_EoL = '1052592';
      id_AnAge = taxon;       
      id_avibase = '26EB95E7DDA0BFEB';
      id_birdlife = 'savannah-sparrow-passerculus-sandwichensis';
      
    case 'Passerella_iliaca'
      id_CoL = 'bd0ac24c9c3e1d6db6c2380ff226c261';
      id_Taxo = '58102';        
      id_EoL = '922653';
      id_AnAge = taxon;       
      id_avibase = '0B1B2EB673757787';
      id_birdlife = 'red-fox-sparrow-passerella-iliaca';
      
    case 'Zonotrichia_leucophrys'
      id_CoL = 'd0c8d5e9ad2b93f844411eea5c4095f5';
      id_Taxo = '58134';        
      id_EoL = '1052728';
      id_AnAge = taxon;       
      id_avibase = '8601A4678CABA542';
      id_birdlife = 'white-crowned-sparrow-zonotrichia-leucophrys';
      
    case 'Spizelloides_arborea'
      id_CoL = '1639e2f02600e5075a95beebeae976a6';
      id_Taxo = '58125'; % present as Spizella arborea        
      id_EoL = '46349910';
      id_AnAge = taxon;       
      id_avibase = '2A86F9C93636CDA3';
      id_ADW = 'Spizella_arborea';
      id_birdlife = 'american-tree-sparrow-passerella-arborea';
      
    case 'Spizella_passerina'
      id_CoL = '2fd94651fc14ab9ad28ee966cbf8a52f';
      id_Taxo = '58126'; 
      id_EoL = '1053011';
      id_AnAge = taxon;       
      id_avibase = '37E9CCDA7A4B06ED';
      id_birdlife = 'chipping-sparrow-spizella-passerina';
      
    case 'Atlapetes_melanolaemus'
      id_CoL = '1aec0d913c7d2012f784386d26321b5a';
      id_Taxo = '86344'; 
      id_EoL = '268983';
      id_AnAge = ''; % not present 2018/10/20       
      id_avibase = 'F0263CAC25552FBF';
      id_birdlife = 'black-faced-brush-finch-atlapetes-melanolaemus';
      
    case 'Chlorospingus_flavigularis'
      id_CoL = '44328d16bf36cdece73b120d3b97f473';
      id_Taxo = '1126733'; 
      id_EoL = '920869';
      id_AnAge = ''; % not present 2018/10/21       
      id_avibase = '3B14D5D64BDFCAB0';
      id_birdlife = 'yellow-throated-bush-tanager-chlorospingus-flavigularis';
      
    case 'Melospiza_melodia'
      id_CoL = '8cb008e58c8f06a69b97f0e18548faca';
      id_Taxo = '58090'; 
      id_EoL = '1052763';
      id_AnAge = taxon; 
      id_avibase = 'A5F09E0521019564';
      id_birdlife = 'song-sparrow-melospiza-melodia';
      
    case 'Chlorodrepanis_virens'
      id_CoL = '3362e7a2fffa3335d25516046a693e21';
      id_Taxo = '408685';  % present as Hemignathus virens
      id_EoL = '921996';   % present as Hemignathus virens
      id_AnAge = taxon;       
      id_avibase = 'A2BB98A9A61F777B';
      id_ADW = ''; % not present at 2018/07/27
      id_birdlife = 'hawaii-amakihi-chlorodrepanis-virens';
      
    case 'Acanthis_flammea'
      id_CoL = '67942f4f3c2cad73a6cc089d61db86cc';
      id_Taxo = '58520';  % present as Carduelis flammea 
      id_EoL = '1051077'; % present as Carduelis flammea 
      id_AnAge = taxon;       
      id_avibase = 'ABB15738E3BBDEE6';
      id_ADW = ''; % not present at 2017/12/17
      id_birdlife = 'redpoll-acanthis-flammea';
      
    case 'Carduelis_carduelis'
      id_CoL = '8388549b54689013a002e39459658043';
      id_Taxo = '58514';        
      id_EoL = '1051079';
      id_AnAge = taxon;       
      id_avibase = '1B235E0052ACC519';
      id_birdlife = 'european-goldfinch-carduelis-carduelis';

    case 'Sporophila_beltoni'
      id_CoL = '40551a82f07481b666e4eedd9ada5aa9';
      id_Taxo = '58154'; % present at genus level only 2018/09/30      
      id_EoL = '39632523'; 
      id_AnAge = ''; % not present 2018/09/30      
      id_avibase = '8C17A126452E9B87';
      id_ADW = ''; % not present at 2019/09/30
      id_birdlife = 'tropeiro-seedeater-sporophila-beltoni';

    case 'Geospiza_fortis'
      id_CoL = 'bdce3d15863ee1c521230265f6c3adf0';
      id_Taxo = '58154'; % present at genus level only 2018/09/30      
      id_EoL = '1050332'; 
      id_AnAge = ''; % not present 2018/10/26      
      id_avibase = '4112A42BE83BAE8A';
      id_birdlife = 'medium-ground-finch-geospiza-fortis';

    case 'Geospiza_scandens'
      id_CoL = 'ad7f0e5eb903702fde182d5ca17bbf60';
      id_Taxo = '58186';       
      id_EoL = '1050335'; 
      id_AnAge = ''; % not present 2018/10/26      
      id_avibase = 'EFA269E49108F1D9';
      id_birdlife = 'common-cactus-finch-geospiza-scandens';

    case 'Setophaga_striata'
      id_CoL = '891172a2730002d57948ac2b10c03c80';
      id_Taxo = '58396'; % present at genus level only 2017/12/17      
      id_EoL = '918802'; % present as Dendroica striata 2017/12/17 
      id_AnAge = taxon;       
      id_avibase = '544A5E6BC69CEAAC';
      id_ADW = ''; % not present at 2017/12/17
      id_birdlife = 'blackpoll-warbler-setophaga-striata';

    case 'Xanthocephalus_xanthocephalus'
      id_CoL = '95f15b97996c8c47552339fb8cebce70';
      id_Taxo = '58485';    
      id_EoL = '1052016'; 
      id_AnAge = taxon;       
      id_avibase = '3E2D0C9BADB782DB';
      id_birdlife = 'yellow-headed-blackbird-xanthocephalus-xanthocephalus';

    case 'Molothrus_bonariensis'
      id_CoL = '381b48dcbe9fd51aac196e1393c9a2e5';
      id_Taxo = '58465';    
      id_EoL = '45511157'; 
      id_AnAge = ''; % not present 2019/01/30       
      id_avibase = 'AA7798040CC37113';
      id_birdlife = 'shiny-cowbird-molothrus-bonariensis';

    case 'Ornithorhynchus_anatinus'
      id_CoL = '3bc186304963c8d2e15564c630a7021e';
      id_Taxo = '59646';        
      id_EoL = '323858';
      id_AnAge = taxon;
      id_MSW3 = '10300020';
       
    case 'Tachyglossus_aculeatus'
      id_CoL = 'db1edc1588907fc51323d4829f25036a';
      id_Taxo = '59632';        
      id_EoL = '323859';
      id_AnAge = taxon;
      id_MSW3 = '10300004';
       
    case 'Caluromys_philander'
      id_CoL = '25a051d8684830574aa21163f5c0217c';
      id_Taxo = '59811';        
      id_EoL = '133312';
      id_AnAge = taxon;
      id_MSW3 = '10400021';
       
    case 'Didelphis_virginiana'
      id_CoL = '5e9ae59ab0006f520ea05758db530df8';
      id_Taxo = '59824';        
      id_EoL = '328501';
      id_AnAge = taxon;
      id_MSW3 = '10400045';
       
    case 'Monodelphis_domestica'
      id_CoL = '01e68657062e2a98f079c956ad6f99f1';
      id_Taxo = '63619';        
      id_EoL = '1039322';
      id_AnAge = taxon;
      id_MSW3 = '10400138';
       
    case 'Sarcophilus_harrisii'
      id_CoL = '5ce2db014e2fa02fef465ca6c68f66b3';
      id_Taxo = '60018';        
      id_EoL = '311781';
      id_AnAge = taxon;
      id_MSW3 = '10800047';
       
    case 'Dasyurus_viverrinus'
      id_CoL = '8ff9da85871d400b6a4cc78e9c208645';
      id_Taxo = '60002';        
      id_EoL = '323728';
      id_AnAge = taxon;
      id_MSW3 = '10800025';
       
    case 'Phascogale_calura'
      id_CoL = '8974d37010484473520e968ea6a47a17';
      id_Taxo = '59939';        
      id_EoL = '323736';
      id_AnAge = taxon;
      id_MSW3 = '10800075';
       
    case 'Planigale_tenuirostris'
      id_CoL = '2943952d712f27eadc09e679dac0bbc0';
      id_Taxo = '59954';        
      id_EoL = '323744';
      id_AnAge = taxon;
      id_MSW3 = '10800121';
       
    case 'Perameles_nasuta'
      id_CoL = '42469df66a2b4861d91637f73b420616';
      id_Taxo = '60062';        
      id_EoL = '323870';
      id_AnAge = taxon;
      id_MSW3 = '10900026';
       
    case 'Isoodon_macrourus'
      id_CoL = '0b13200f76e06b47e32b3375684ad03c';
      id_Taxo = '60050';        
      id_EoL = '323866';
      id_AnAge = taxon;
      id_MSW3 = '10900016';
       
    case 'Phascolarctos_cinereus'
      id_CoL = '4d7e8acef0e44fe001cc83caff8712ae';
      id_Taxo = '60425';        
      id_EoL = '128425';
      id_AnAge = taxon;
      id_MSW3 = '11000005';
       
    case 'Tarsipes_rostratus'
      id_CoL = '6aca15b06107dd17949dd6cfdb40d63b';
      id_Taxo = '60483';        
      id_EoL = '323836';
      id_AnAge = taxon;
      id_MSW3 = '11000166';
       
    case 'Lagostrophus_fasciatus'
      id_CoL = '37ca2270c6d654da367c38945787f398';
      id_Taxo = '60319';        
      id_EoL = '1038585';
      id_AnAge = taxon;
      id_MSW3 = '11000196';
       
    case 'Lagorchestes_conspicillatus'
      id_CoL = '68f725633c4212acffbfa1a59952cdd4';
      id_Taxo = '60310';        
      id_EoL = '127000';
      id_AnAge = taxon;
      id_MSW3 = '11000236';
       
    case 'Lagorchestes_hirsutus'
      id_CoL = 'e886ae8ef2084c39d3da70956b52cf31';
      id_Taxo = '60313';        
      id_EoL = '127004';
      id_AnAge = taxon;
      id_MSW3 = '11000237';
       
    case 'Macropus_agilis'
      id_CoL = '836cb084ad966ce1b076f68c8ee96cde';
      id_Taxo = '168613';        
      id_EoL = '133201';
      id_AnAge = taxon;
      id_MSW3 = '11000243'; 
       
    case 'Macropus_antilopinus'
      id_CoL = 'a3ad146035807271d4c927c78c191a41';
      id_Taxo = '168614';        
      id_EoL = '133167';
      id_AnAge = taxon;
      id_MSW3 = '11000248';
       
    case 'Macropus_eugenii'
      id_CoL = '3122737d84947ba114ffb6f396b21872';
      id_Taxo = '168617';        
      id_EoL = '46322993';
      id_AnAge = taxon;
      id_MSW3 = '';
       
    case 'Macropus_fuliginosus'
      id_CoL = 'c71786cbfbff0f76624c73efcca4cdf1';
      id_Taxo = '168618';        
      id_EoL = '351020';
      id_AnAge = taxon;
      id_MSW3 = '11000251';
       
    case 'Macropus_giganteus'
      id_CoL = '9e81e89d48f74c749a1895f37ed33f1b';
      id_Taxo = '168619';        
      id_EoL = '777872';
      id_AnAge = taxon;
      id_MSW3 = '11000256';
       
    case 'Macropus_parma'
      id_CoL = '562a352c8d1a274b7d6167186f2afc49';
      id_Taxo = '168624';        
      id_EoL = '122570';
      id_AnAge = taxon;
      id_MSW3 = '11000261';
       
    case 'Macropus_rufogriseus'
      id_CoL = '6adcb8c69536b16f12dbd411354abec2';
      id_Taxo = '168627';        
      id_EoL = '133321';
      id_AnAge = taxon;
      id_MSW3 = '11000268';
       
    case 'Macropus_rufus'
      id_CoL = '3029b1dda9dc6bbc86de28d511e30b9c';
      id_Taxo = '168628';        
      id_EoL = '122672';
      id_AnAge = taxon;
      id_MSW3 = '11000272';
       
    case 'Onychogalea_fraenata'
      id_CoL = '38206e3877fe578667a6fa6a3996e930';
      id_Taxo = '60360';        
      id_EoL = '999120';
      id_AnAge = taxon;
      id_MSW3 = '11000274';
       
    case 'Petrogale_xanthopus'
      id_CoL = 'd82664b4636348f01da6058c4ab2aa04';
      id_Taxo = '60376';        
      id_EoL = '325810';
      id_AnAge = taxon;
      id_MSW3 = '11000296';
       
    case 'Setonix_brachyurus'
      id_CoL = '5566abe065e293ca9524aa2d42679bbb';
      id_Taxo = '60383';        
      id_EoL = '127458';
      id_AnAge = taxon;
      id_MSW3 = '11000300';
       
    case 'Wallabia_bicolor'
      id_CoL = '933f2699e0a7dd8d84cefe693500fc89';
      id_Taxo = '60392';        
      id_EoL = '310755';
      id_AnAge = taxon;
      id_MSW3 = '11000314';
       
    case 'Choloepus_didactylus'
      id_CoL = 'adaac139dab05d9b3e7140a769c5aa3a';
      id_Taxo = '60529';        
      id_EoL = '328521';
      id_AnAge = taxon;
      id_MSW3 = '11800018';
       
    case 'Myrmecophaga_tridactyla'
      id_CoL = '99e9905aadb48ff76d1717ea7020ecb7';
      id_Taxo = '60511';        
      id_EoL = '328523';
      id_AnAge = taxon;
      id_MSW3 = '11800038';
       
    case 'Tamandua_mexicana'
      id_CoL = 'aa240c69ff1ac00b60b09650416d89c4';
      id_Taxo = '60514';        
      id_EoL = '328524';
      id_AnAge = taxon;
      id_MSW3 = '11800043';
       
    case 'Dasypus_novemcinctus'
      id_CoL = 'f4765b154fabeda6821bb372a27914fa';
      id_Taxo = '328482';        
      id_EoL = '328482';
      id_AnAge = taxon;
      id_MSW3 = '11700009';
      
    case 'Dasypus_septemcinctus'
      id_CoL = '12f3fef7c33878c7093dca29b4c1414d';
      id_Taxo = '60601';        
      id_EoL = '328487';
      id_AnAge = taxon;
      id_MSW3 = '11700018';
       
    case 'Orycteropus_afer'
      id_CoL = 'fa01640674c52e1bc9664c729beebce7';
      id_Taxo = '69227';        
      id_EoL = '327830';
      id_AnAge = taxon;
      id_MSW3 = '11300004';
       
    case 'Macroscelides_proboscideus'
      id_CoL = 'a7c9d1f954a2b7ad2ab9a93e86028ced';
      id_Taxo = '61602';        
      id_EoL = '326395';
      id_AnAge = taxon;
      id_MSW3 = '11200023';
       
    case 'Elephantulus_rufescens'
      id_CoL = '20df5cab78f3cb488470d9bc1d61ecd7';
      id_Taxo = '61599';        
      id_EoL = '326393';
      id_AnAge = taxon;
      id_MSW3 = '11200014';
       
    case 'Hemicentetes_semispinosus'
      id_CoL = '2a69b74156efdf595db62090e21e94f5';
      id_Taxo = '60681';        
      id_EoL = '1178674';
      id_AnAge = taxon;
      id_MSW3 = '11100045';
       
    case 'Loxodonta_africana'
      id_CoL = '7b498777d8b86d615d26fb2555362a5d';
      id_Taxo = '69361';        
      id_EoL = '289808';
      id_AnAge = taxon;
      id_MSW3 = '11500009';
       
    case 'Elephas_maximus'
      id_CoL = '6fb47237753f0901b5bb779c6e9e1369';
      id_Taxo = '69348';        
      id_EoL = '997407';
      id_AnAge = taxon;
      id_MSW3 = '11500004';
       
    case 'Trichechus_inunguis'
      id_CoL = '42e827c36ce872e11d6f6b1db7aee2fa';
      id_Taxo = '69439';        
      id_EoL = '328646';
      id_AnAge = taxon;
      id_MSW3 = '11600011';
      id_WoRMS = '255026';
       
    case 'Trichechus_manatus'
      id_CoL = 'c3d197ef1aab6e2fec27daf65bbee371';
      id_Taxo = '69441';        
      id_EoL = '328644';
      id_AnAge = taxon;
      id_MSW3 = '11600012';
      id_WoRMS = '159509';
       
    case 'Dugong_dugon'
      id_CoL = 'fd213122953885dcd829a317a6998c55';
      id_Taxo = '69403';        
      id_EoL = '328641';
      id_AnAge = taxon;
      id_MSW3 = '11600005';
      id_WoRMS = '220227';
       
    case 'Hydrodamalis_gigas'
      id_CoL = '1602170874866484671f52435ec52e95';
      id_Taxo = '69421';        
      id_EoL = '328642';
      id_AnAge = ''; % not present at 2018/07/17
      id_MSW3 = '11600008';
      id_WoRMS = '255025';
       
    case 'Procavia_capensis'
      id_CoL = '2385d7456a495dac2061e5db25291a9a';
      id_Taxo = '69207';        
      id_EoL = '326384';
      id_AnAge = taxon;
      id_MSW3 = '11400040';
       
    case 'Sorex_araneus'
      id_CoL = '246f61356ae2711049eb21ec5abafa02';
      id_Taxo = '169834';        
      id_EoL = '124497';
      id_AnAge = taxon;
      id_MSW3 = '13700459';
      
    case 'Crocidura_russula'
      id_CoL = '8f9e91369c3c40c674d13412c96d9d95';
      id_Taxo = '61149';        
      id_EoL = '1178862';
      id_AnAge = taxon;
      id_MSW3 = '13700198';
       
    case 'Talpa_europaea'
      id_CoL = '3f6d0f42542751148164e4e7a2a67132';
      id_Taxo = '61343';        
      id_EoL = '1241324';
      id_AnAge = taxon;
      id_MSW3 = '13700730';
       
    case 'Talpa_occidentalis'
      id_CoL = '792cc7348dec4c6b13c672504d67fbfc';
      id_Taxo = '61356';        
      id_EoL = '1178990';
      id_AnAge = ''; % not present 2017/06/18
      id_MSW3 = '13700740';
       
    case 'Erinaceus_europaeus'
      id_CoL = 'cdc488ce6cf0ecb5a02221ef40111c12';
      id_Taxo = '60805';        
      id_EoL = '1178684';
      id_AnAge = taxon;
      id_MSW3 = '13600020';
       
    case 'Atelerix_albiventris'
      id_CoL = 'b46493af25f49ac40f8aeb488bbafa9d';
      id_Taxo = '167398';        
      id_EoL = '1178677';
      id_AnAge = taxon;
      id_MSW3 = '13600005';
       
    case 'Eidolon_helvum'
      id_CoL = 'e734438d4d6d888c4526530f829f62cc';
      id_Taxo = '63745';        
      id_EoL = '327335';
      id_AnAge = taxon;
      id_MSW3 = '13800097';
      
    case 'Rousettus_aegyptiacus'
      id_CoL = 'e34d7bd62bb6259fca64de38f894e5f0';
      id_Taxo = '63887';        
      id_EoL = '323421';
      id_AnAge = taxon;
      id_MSW3 = '13800397';
       
    case 'Epomops_buettikoferi'
      id_CoL = '1ef96271e3e6443927fbbd1233cc6015';
      id_Taxo = '63745';        
      id_EoL = '327343';
      id_AnAge = ''; % not present 2018/11/06
      id_MSW3 = '13800121';
      
    case 'Micropteropus_pusillus'
      id_CoL = 'f64e807530d1f410729e00cf39c09117';
      id_Taxo = '63783';        
      id_EoL = '289597';
      id_AnAge = ''; % not present 2018/11/06
      id_MSW3 = '13800174';
      
    case 'Megaderma_lyra'
      id_CoL = '843e42882d96b0e24e2c7030919c6681';
      id_Taxo = '168689';        
      id_EoL = '328821';
      id_AnAge = taxon;
      id_MSW3 = '13800875';
      
    case 'Rhinolophus_hipposideros'
      id_CoL = 'c17422dcc16d254fd33cb3ff9389f12e';
      id_Taxo = '64130';        
      id_EoL = '328775';
      id_AnAge = taxon;
      id_MSW3 = '13800555';
      
    case 'Rhinolophus_cornutus'
      id_CoL = '2c7cff1f44a655ee9a187b7edbcde369';
      id_Taxo = '64111';        
      id_EoL = '328763';
      id_AnAge = ''; % not present 2018/11/06
      id_MSW3 = '13800506';
      id_ADW = ''; % not present 2018/11/06
      
    case 'Miniopterus_schreibersii'
      id_CoL = 'e41c465b3340bc16c35ac03d158a1ab6';
      id_Taxo = '65101';        
      id_EoL = '4437149';
      id_AnAge = taxon;
      id_MSW3 = '13802613';
       
    case 'Mystacina_tuberculata'
      id_CoL = '34bbdfa4ed006609c8454241ecc933a7';
      id_Taxo = '65183';        
      id_EoL = '1038741';
      id_AnAge = taxon;
      id_MSW3 = '13801090';
       
    case 'Desmodus_rotundus'
      id_CoL = '5ed68b3442894a2a01c67ec56d5bc32a';
      id_Taxo = '64537';        
      id_EoL = '289588';
      id_AnAge = taxon;
      id_MSW3 = '13801094';
       
    case 'Carollia_perspicillata'
      id_CoL = 'b3658b2f62ac063825c67f88f1b3db18';
      id_Taxo = '64417';        
      id_EoL = '327438';
      id_AnAge = taxon;
      id_MSW3 = '13801300';
       
    case 'Dermanura_watsoni'
      id_CoL = '036d07e727e3f5b150385bb5ac40e415';
      id_Taxo = '64468'; % present as Artibeus watsoni 2018/10/30       
      id_EoL = '4438521';
      id_AnAge = ''; % not present 2018/10/30
      id_MSW3 = '13801395'; % present as Artibeus watsoni 2018/10/30
      id_ADW = ''; % not present 2018/10/30
       
    case 'Tadarida_brasiliensis'
      id_CoL = 'f6ac3f27f010ac109c046f34d2b68ccf';
      id_Taxo = '65317';        
      id_EoL = '327954';
      id_AnAge = taxon;
      id_MSW3 = '13801768';
       
    case 'Pipistrellus_pipistrellus'
      id_CoL = 'cb943ad6e446a67c750a5ad39aa8e911';
      id_Taxo = '169449';        
      id_EoL = '127390';
      id_AnAge = taxon;
      id_MSW3 = '13802094';
       
    case 'Pipistrellus_subflavus'
      id_CoL = '7ca757a5fb1cdf6112061aed3bef766c';
      id_Taxo = '169457';        
      id_EoL = '327665';
      id_AnAge = taxon;
      id_MSW3 = '13802110';
       
    case 'Hypsugo_savii'
      id_CoL = 'f34d43a00d990b21d09297759436320e';
      id_Taxo = '2677544';        
      id_EoL = '127025';
      id_AnAge = ''; % not present 2018/08/08
      id_MSW3 = '13802235';
       
    case 'Scotophilus_kuhlii'
      id_CoL = '3ba39a5a10f605bf60d3e501deb80c4c';
      id_Taxo = '64970';        
      id_EoL = '310390';
      id_AnAge = ''; % not present 2018/08/26
      id_MSW3 = '13801973';

    case 'Plecotus_auritus'
      id_CoL = '6a47e8a076cf215b2d6c70b3714c4e69';
      id_Taxo = '169514';        
      id_EoL = '289433';
      id_AnAge = taxon; 
      id_MSW3 = '13802155';

    case 'Eptesicus_fuscus'
      id_CoL = 'e96775f92a3bb541e376d759c5cdd59d';
      id_Taxo = '168011';        
      id_EoL = '327553';
      id_AnAge = taxon; 
      id_MSW3 = '13801829';

    case 'Eptesicus_serotinus'
      id_CoL = '93c4a3c328b3693b87ff550d1a4cfd83';
      id_Taxo = '168026';
      id_EoL = '327660';
      id_AnAge = taxon; 
      id_MSW3 = '13801865';

    case 'Nyctalus_noctula'
      id_CoL = 'd4ba865b7e926adb75bc46ee4101b3f3';
      id_Taxo = '64834';        
      id_EoL = '1038529';
      id_AnAge = taxon; 
      id_MSW3 = '13802038';

    case 'Manis_crassicaudata'
      id_CoL = '736a2ea04e95eb28f95226cc77b01c98';
      id_Taxo = '168633';        
      id_EoL = '982442';
      id_AnAge = taxon;
      id_MSW3 = '13900009';
      
   case 'Manis_pentadactyla'
      id_CoL = '0103f1733efea9fe8678f7a7e5eac782';
      id_Taxo = '168636';        
      id_EoL = '337658';
      id_AnAge = taxon;
      id_MSW3 = '13900013';
       
    case 'Neofelis_nebulosa'
      id_CoL = 'c0dc3b3850869e22d6c3e67f0841c371';
      id_Taxo = '67260';        
      id_EoL = '328675';
      id_AnAge = taxon;
      id_MSW3 = '14000222';
       
    case 'Uncia_uncia'
      id_CoL = '0beb05194a457cca0a963057e9d89cb4';
      id_Taxo = '170178';        
      id_EoL = '328676';
      id_AnAge = taxon;
      id_MSW3 = '14000269';
      
    case 'Panthera_tigris'
      id_CoL = '9c35aba4cb7f388bf29a05fba221135c';
      id_Taxo = '67312';        
      id_EoL = '45890457';
      id_AnAge = taxon;
      id_MSW3 = '14000259';
      
   case 'Panthera_tigris_tigris'
      id_CoL = '2e22c32cf3f2d235ac8befd16e04a27d';
      id_Taxo = '67319';        
      id_EoL = '1240403';
      id_AnAge = taxon;
      id_MSW3 = '14000260';
       
    case 'Panthera_pardus'
      id_CoL = 'fd90e5f300d0c6eb358333ea2ad7f92e';
      id_Taxo = '67285';        
      id_EoL = '328606';
      id_AnAge = taxon;
      id_MSW3 = '14000250';
      
   case 'Panthera_onca'
      id_CoL = '4ffa941b074645715ff39f515fb9fcea';
      id_Taxo = '67276';        
      id_EoL = '328606';
      id_AnAge = taxon;
      id_MSW3 = '14000240';
       
    case 'Panthera_leo'
      id_CoL = 'c67c449dc0cc8bf14732d7fabf8f2b10';
      id_Taxo = '67265';        
      id_EoL = '328672';
      id_AnAge = taxon;
      id_MSW3 = '14000228';
       
    case 'Pardofelis_marmorata'
      id_CoL = '9936a9948cb6bea51b1330cc3931f1e4';
      id_Taxo = '169207';        
      id_EoL = '311554';
      id_AnAge = taxon;
      id_MSW3 = '14000177';

    case 'Caracal_caracal'
      id_CoL = 'e12e3486709068246795a98ddfaedb8e';
      id_Taxo = '167589';        
      id_EoL = '312855';
      id_AnAge = taxon;
      id_MSW3 = '14000014';
       
    case 'Profelis_aurata'
      id_CoL = '408359af435a5d6b3f65338dc01ae280';
      id_Taxo = '169617';        
      id_EoL = '328036';
      id_AnAge = taxon;
      id_MSW3 = '14000200';
       
    case 'Leopardus_wiedii'
      id_CoL = '2077ee04ff75244cb8e6236cdffc3e38';
      id_Taxo = '168445';        
      id_EoL = '311954';
      id_AnAge = taxon;
      id_MSW3 = '14000119';
       
    case 'Lynx_lynx'
      id_CoL = '89f97dcbcfdbcaad43c3645951bbcaa5';
      id_Taxo = '168586';        
      id_EoL = '328603';
      id_AnAge = taxon;
      id_MSW3 = '14000156';
       
    case 'Lynx_pardinus'
      id_CoL = '02948d4498549b8011f6185079aab076';
      id_Taxo = '107145';        
      id_EoL = '347432';
      id_AnAge = taxon;
      id_MSW3 = '14000156';
       
    case 'Acinonyx_jubatus'
      id_CoL = '6ce647e8a93e5794b622e28d477a7113';
      id_Taxo = '67330';        
      id_EoL = '328680';
      id_AnAge = taxon;
      id_MSW3 = '14000006';
       
    case 'Puma_concolor'
      id_CoL = '0b4c73f8591ab777e49e32be159e3a18';
      id_Taxo = '169680';        
      id_EoL = '46367484';
      id_AnAge = taxon;
      id_MSW3 = '14000204';
       
    case 'Prionailurus_rubiginosus'
      id_CoL = '7af061152c657a9222e9a50732d36737';
      id_Taxo = '67242';        
      id_EoL = '312856';
      id_AnAge = taxon;
      id_MSW3 = '14000195';
      
    case 'Felis_nigripes'
      id_CoL = '10ce4d605a3b3dc0933b2debdb40fdc0';
      id_Taxo = '168142';        
      id_EoL = '328666';
      id_AnAge = taxon;
      id_MSW3 = '14000054';
  
    case 'Felis_silvestris'
      id_CoL = '831a91e848fe73787ed3c97aa0d5b349';
      id_Taxo = '168147';        
      id_EoL = '328605';
      id_AnAge = taxon;
      id_MSW3 = '14000057';
      
    case 'Arctictis_binturong'
      id_CoL = '3c735d7b095669a2a48998e96246a492';
      id_Taxo = '66896';        
      id_EoL = '328085';
      id_AnAge = taxon;
      id_MSW3 = '14000273';
       
    case 'Paradoxurus_hermaphroditus'
      id_CoL = 'fc764f5ca19d53d8b128c77ad58ce166';
      id_Taxo = '66914';        
      id_EoL = '328089';
      id_AnAge = taxon;
      id_MSW3 = '14000317';

    case 'Civettictis_civetta'
      id_CoL = '0ddd3f80f4a56b0703a6c258eb5f296a';
      id_Taxo = '66880';        
      id_EoL = '328092';
      id_AnAge = taxon;
      id_MSW3 = '14000378';
      id_ADW = ''; % not present 2018/02/01 
       
    case 'Crocuta_crocuta'
      id_CoL = '93b93fda51bb5cdc6f82fe48dadab8b6';
      id_Taxo = '67062';        
      id_EoL = '311569';
      id_AnAge = taxon;
      id_MSW3 = '14000684';

    case 'Hyaena_brunnea'
      id_CoL = '403909c9def187964308949247e2a53c';
      id_Taxo = '168311';        
      id_EoL = '32527772';
      id_AnAge = taxon;
      id_MSW3 = '14000686';

    case 'Atilax_paludinosus'
      id_CoL = '1d6f6170cd196481c17a080406f6bbb4';
      id_Taxo = '66960';        
      id_EoL = '1038688';
      id_AnAge = taxon;
      id_MSW3 = '14000479';

    case 'Herpestes_javanicus'
      id_CoL = '758edaecdd2102d8deff382f324cd6f1';
      id_Taxo = '168277';        
      id_EoL = '311956';
      id_AnAge = taxon;
      id_MSW3 = '14000608';

    case 'Suricata_suricatta'
      id_CoL = '5c20e061da841fd6a2a5ec9c3cb8687d';
      id_Taxo = '67031';        
      id_EoL = '311580';
      id_AnAge = taxon;
      id_MSW3 = '14000678';
      
   case 'Cryptoprocta_ferox'
      id_CoL = '26cba61f8182dafb47d6fe03dc54db8a';
      id_Taxo = '66938';        
      id_EoL = '46321719';
      id_AnAge = taxon;
      id_MSW3 = '14000446';

    case 'Vulpes_lagopus'
      id_CoL = '74f649c50206103b78005228c898e177';
      id_WoRMS = '404130';
      id_Taxo = '112284';        
      id_EoL = '1053894';
      id_AnAge = taxon;
      id_MSW3 = '14000873';
       
    case 'Vulpes_vulpes'
      id_CoL = 'f76554e91aa357dd527f70ed534fa52c';
      id_Taxo = '66456';        
      id_EoL = '328609';
      id_AnAge = taxon;
      id_MSW3 = '14000892';
      
    case 'Vulpes_zerda'
      id_CoL = '0974e2e971e67503122402cf46b5fb1e';
      id_Taxo = '66461';        
      id_EoL = '328001';
      id_AnAge = taxon;
      id_MSW3 = '14000938';
       
    case 'Chrysocyon_brachyurus'
      id_CoL = '0b3e53b24ae32db8b7f60d943b8c3814';
      id_Taxo = '66468';        
      id_EoL = '328686';
      id_AnAge = taxon;
      id_MSW3 = '14000791';
       
    case 'Cerdocyon_thous'
      id_CoL = '9491363ed5ec89660e88360f5b26371d';
      id_Taxo = '66474';        
      id_EoL = '328685';
      id_AnAge = taxon;
      id_MSW3 = '14000791';
       
    case 'Canis_lupus'
      id_CoL = 'bcd6035778291a7feaad52cb7ac167cb';
      id_Taxo = '66415';        
      id_EoL = '328607';
      id_AnAge = taxon;
      id_MSW3 = '14000783';
       
    case 'Nyctereutes_procyonoides'
      id_CoL = '6ec904764dc49972c516a4e145fe1119';
      id_Taxo = '66488';    
      id_EoL = '328684';
      id_AnAge = taxon;
      id_MSW3 = '14000825';
      
   case 'Speothos_venaticus'
      id_CoL = '1c649d85dbd9ca61520070161bbb35b2';
      id_Taxo = '66499';    
      id_EoL = '328687';
      id_AnAge = taxon;
      id_MSW3 = '14000836';
       
    case 'Ursus_arctos'
      id_CoL = '3620a6afc683c9cb9e66e3bc9d143133';
      id_Taxo = '170192';        
      id_EoL = '328581';
      id_AnAge = taxon;
      id_MSW3 = '14000970';
      
    case 'Ursus_arctos_middendorffi'
      id_CoL = '04c8bf0dc540147b82dcdac40369bfb7';
      id_Taxo = '973088';        
      id_EoL = '1266086';
      id_AnAge = taxon;
      id_MSW3 = '14000982';
     
    case 'Ursus_maritimus'
      id_CoL = 'ecf9a73302aa9be16e68c89fb524feb8';
      id_WoRMS = '137085';
      id_Taxo = '170194';        
      id_EoL = '328580';
      id_AnAge = taxon;
      id_MSW3 = '14000987';
       
   case 'Ursus_americanus'
      id_CoL = 'd10fb048779c2a96bf447fb4d3d50591';
      id_WoRMS = '';
      id_Taxo = '170191';        
      id_EoL = '328582';
      id_AnAge = taxon;
      id_MSW3 = '14000953';
      
    case 'Ailuropoda_melanoleuca'
      id_CoL = 'e2e3653c631047a2e41328c4dc46151e';
      id_Taxo = '66575';        
      id_EoL = '328070';
      id_AnAge = taxon;
      id_MSW3 = '14000941';
       
    case 'Ailurus_fulgens'
      id_CoL = 'a07ca43a0c727b51a5b150c820059dda';
      id_Taxo = '66628';        
      id_EoL = '327984';
      id_AnAge = taxon;
      id_MSW3 = '14001690';
       
    case 'Mephitis_mephitis'
      id_CoL = 'a0856c50ba56219cf5adef9e4b42ac81';
      id_Taxo = '66780';        
      id_EoL = '328593';
      id_AnAge = taxon;
      id_MSW3 = '14001552';
       
    case 'Lutra_lutra'
      id_CoL = 'bb5ed0ac46e6bd2037497c639615f07e';
      id_WoRMS = '137076';
      id_Taxo = '66811';        
      id_EoL = '328044';
      id_AnAge = taxon;
      id_MSW3 = '14001112';
       
    case 'Pteronura_brasiliensis'
      id_CoL = 'aafba4e7635db0e65f55c84a5d4f6bf2';
      id_WoRMS = ''; % not present 2018/08/05
      id_Taxo = '66829';        
      id_EoL = '328029';
      id_AnAge = taxon;
      id_MSW3 = '14001131';
   
    case 'Enhydra_lutris'
      id_CoL = 'f16ca52d25de7fb367832b86dac2e970';
      id_WoRMS = '242598';
      id_Taxo = '66804';        
      id_EoL = '328583';
      id_AnAge = taxon;
      id_MSW3 = '14001090';
      
   case 'Lutrogale_perspicillata'
      id_CoL = '327858d33b6be4d3345ea4e550442718';
      id_WoRMS = '404088';
      id_Taxo = '66816';        
      id_EoL = '328583';
      id_AnAge = taxon;
      id_MSW3 = '14001127';
      
    case 'Mustela_nigripes'
      id_CoL = '50d9c54b54500504be4546ab8332eafb';
      id_WoRMS = ''; % not present at 2018/07/22
      id_Taxo = '66716';        
      id_EoL = '328590';
      id_AnAge = ''; % not present at 2018/07/22
      id_MSW3 = '14001437';
       
    case 'Neovison_vison'
      id_CoL = '5cf003221fbb88870322ee317ea43681';
      id_WoRMS = ''; % not present at 2018/07/22
      id_Taxo = '1684130';        
      id_EoL = '922786';
      id_AnAge = taxon;
      id_MSW3 = '14001484';
       
    case 'Gulo_gulo'
      id_CoL = 'cc7f1e94c7b74bcdd7ddef185e92d22a';
      id_WoRMS = ''; % not present at 2018/08/10
      id_Taxo = '66650';        
      id_EoL = '328585';
      id_AnAge = taxon;
      id_MSW3 = '14001166';
      
    case 'Martes_pennanti'
      id_CoL = '9d97f9fb613094a861721b619df5c77b';
      id_WoRMS = ''; % not present at 2018/07/23
      id_Taxo = '1684130';        
      id_EoL = '922786';
      id_AnAge = taxon;
      id_MSW3 = '14001254';
       
    case 'Eira_barbara'
      id_CoL = '37edd78088c43fec3bd4b1ee3566ac99';
      id_WoRMS = ''; % not present at 2018/09/02
      id_Taxo = '66639';        
      id_EoL = '328036';
      id_AnAge = taxon;
      id_MSW3 = '14001144';
      
    case 'Meles_meles'
      id_CoL = '423f1dbd6d3e388a3382399597913189';
      id_Taxo = '66751';        
      id_EoL = '328046';
      id_AnAge = taxon;
      id_MSW3 = '14001283';
      
   case 'Mellivora_capensis'
      id_CoL = 'b97e91ce1fcdc534969ca750e4356ce4';
      id_Taxo = '66740';        
      id_EoL = '328035';
      id_AnAge = taxon;
      id_MSW3 = '14001293';
       
    case 'Procyon_lotor'
      id_CoL = '14b81ecc6b8b77c9ae06b5f4d59826d5';
      id_WoRMS = ''; % not present at 2018/01/28
      id_Taxo = '66671';       
      id_EoL = 'overview';
      id_AnAge = taxon;
      id_MSW3 = '14001664';
      
   case 'Potos_flavus'
      id_CoL = 'cfbac87b78e63895bab1a1b67e7dd37c';
      id_WoRMS = ''; % not present at 2018/09/13
      id_Taxo = '66603';       
      id_EoL = '328067';
      id_AnAge = taxon;
      id_MSW3 = '14001650';
       
    case 'Phoca_vitulina'
      id_CoL = 'ec87dba768bbab3b0900ff52a327031d';
      id_WoRMS = '137084';
      id_Taxo = '67459';        
      id_EoL = '328629';
      id_AnAge = taxon;
      id_MSW3 = '14001060';
       
    case 'Pusa_hispida'
      id_CoL = 'ce85c9680b8cfb790125278785a9fe70';
      id_WoRMS = '159021';
      id_Taxo = '67467';        
      id_EoL = '1052724';
      id_AnAge = taxon;
      id_MSW3 = '14001068';
       
    case 'Halichoerus_grypus'
      id_CoL = '571ff3eefa181344bc8dd6e8a54886ce';
      id_WoRMS = '137080';
      id_Taxo = '67432';        
      id_EoL = '328630';
      id_AnAge = taxon;
      id_MSW3 = '';
       
    case 'Pagophilus_groenlandicus'
      id_CoL = 'ed5280adb77539a0b58955aa822a70e7';
      id_WoRMS = '159019';
      id_Taxo = '67439';        
      id_EoL = '1052720';
      id_AnAge = taxon;
      id_MSW3 = '14001036';
       
    case 'Erignathus_barbatus'
      id_CoL = '52717fb428839ec4ea46640eaad6ac88';
      id_WoRMS = '137079';
      id_Taxo = '67428';        
      id_EoL = '328631';
      id_AnAge = taxon;
      id_MSW3 = '14001032';
       
    case 'Cystophora_cristata'
      id_CoL = 'a83dce734f5caa4b3ec5cf33b7263b2d';
      id_WoRMS = '137078';
      id_Taxo = '67494';        
      id_EoL = '328632';
      id_AnAge = taxon;
      id_MSW3 = '14001030';
       
    case 'Mirounga_leonina'
      id_CoL = '7a1805d7e2224550b70452e4ab73e14a';
      id_WoRMS = '231413';
      id_Taxo = '67497';        
      id_EoL = '328639';
      id_AnAge = taxon;
      id_MSW3 = '14001049';
      
    case 'Lobodon_carcinophaga'
      id_CoL = '98f354c3c1713834bfe5402c396858a0';
      id_WoRMS = '344008';
      id_Taxo = '93681';   
      id_EoL = '1052723';
      id_AnAge = taxon;
      id_MSW3 = '14001046';
      
   case 'Callorhinus_ursinus'
      id_CoL = '4a75190e7f56b556cca2e56212dc703f';
      id_WoRMS = '254997';
      id_Taxo = '67400';        
      id_EoL = '328618';
      id_AnAge = taxon;
      id_MSW3 = '14001009';
       
    case 'Zalophus_californianus'
      id_CoL = 'd91b293e80e050a2fb51c2a464d52fc3';
      id_WoRMS = '255003';
      id_Taxo = '67414';        
      id_EoL = '328615';
      id_AnAge = taxon;
      id_MSW3 = '14001019';
       
    case 'Arctocephalus_australis'
      id_CoL = '5199b20a3dd0d2c55fd089253d5c1e08';
      id_WoRMS = '231435';
      id_Taxo = '67382';        
      id_EoL = '328623';
      id_AnAge = taxon;
      id_MSW3 = '14000998';
       
    case 'Arctocephalus_tropicalis'
      id_CoL = '6fd8b84fd278f83f3b5cd61c18a8cec1';
      id_WoRMS = '231432';
      id_Taxo = '67397';        
      id_EoL = '328622';
      id_AnAge = taxon;
      id_MSW3 = '14001007';
       
    case 'Arctocephalus_gazella'
      id_CoL = 'f7ababff1a8c3790cae18a2fc46c0213';
      id_WoRMS = '231404';
      id_Taxo = '67390';        
      id_EoL = '328620';
      id_AnAge = taxon;
      id_MSW3 = '14001001';
       
    case 'Arctocephalus_forsteri'
      id_CoL = 'c08dfc9edee19a1102e5e086974953cf';
      id_WoRMS = '231420';
      id_Taxo = '67385';
      id_EoL = '328621';
      id_AnAge = taxon;
      id_MSW3 = '14000999';
       
    case 'Arctocephalus_pusillus'
      id_CoL = 'e380c525933b3cb81672c786e5257032';
      id_WoRMS = '231410';
      id_Taxo = '67392';
      id_EoL = '328619';
      id_AnAge = taxon;
      id_MSW3 = '14001003';
       
    case 'Otaria_flavescens'
      id_CoL = 'f2a4b03712694cd124d8fd6b81c0da0e';
      id_WoRMS = '231425';
      id_Taxo = '67409';        
      id_EoL = '328614';
      id_AnAge = taxon;
      id_MSW3 = '14001015';
       
    case 'Odobenus_rosmarus_rosmarus'
      id_CoL = 'e0b6f3f450ac4d0393778f97dbccdb75';
      id_WoRMS = '255010';
      id_Taxo = '67371';        
      id_EoL = '1265950';
      id_AnAge = taxon;
      id_MSW3 = '14001025';
      id_ADW = 'Odobenus_rosmarus'; 
      
   case 'Odobenus_rosmarus_divergens'
      id_CoL = 'c50a598a30f8e58b39641bf8b83c25ef';
      id_WoRMS = '255011';
      id_Taxo = '67369';        
      id_EoL = '1274057';
      id_AnAge = taxon;
      id_MSW3 = '14001026';
      id_ADW = 'Odobenus_rosmarus'; 
      
    case 'Equus_quagga'
      id_CoL = 'a544b4b97773df703818fb547a3c05bc';
      id_Taxo = '168045'; % present as Equus burchellii       
      id_EoL = '328341'; % present as Equus burchellii
      id_AnAge = taxon;
      id_MSW3 = '14100008'; % present as Equus burchellii
       
    case 'Tapirus_terrestris'
      id_CoL = 'b887fe306ff897fd7ced2a4199ab2c30';
      id_Taxo = '69106';        
      id_EoL = '328009';
      id_AnAge = taxon;
      id_MSW3 = '14100043';
       
    case 'Tapirus_bairdii'
      id_CoL = '8de94ae97704e5f5a7732fd89b34d5d0';
      id_Taxo = '69106';        
      id_EoL = '129476';
      id_AnAge = taxon;
      id_MSW3 = '14100038';
       
    case 'Tapirus_pinchaque'
      id_CoL = '57ed851c9e69ce5fdd866f751c961190';
      id_Taxo = '69104';        
      id_EoL = '129472';
      id_AnAge = taxon;
      id_MSW3 = '14100042';
       
    case 'Acrocodia_indica'
      id_CoL = '9ce36ca8bf7e907829131e25ad2cb765';
      id_Taxo = '69102';        
      id_EoL = '129470';
      id_AnAge = taxon;
      id_MSW3 = '14100039';
       
    case 'Rhinoceros_unicornis'
      id_CoL = '2a40e3919813c0f16e7083e4301d72bb';
      id_Taxo = '69154';        
      id_EoL = '129470';
      id_AnAge = taxon;
      id_MSW3 = '14100071';
       
    case 'Dicerorhinus_sumatrensis'
      id_CoL = '43f507935a136e2a4c6221db63021549';
      id_Taxo = '69137';        
      id_EoL = '311504';
      id_AnAge = taxon;
      id_MSW3 = '14100054';
       
    case 'Diceros_bicornis'
      id_CoL = 'aac59ebec67cc13e0f7b15c8da03efd6';
      id_Taxo = '69139';        
      id_EoL = '311501';
      id_AnAge = taxon;
      id_MSW3 = '14100059';
       
    case 'Ceratotherium_simum'
      id_CoL = '6179a66ee04b226c191579679d6afeed';
      id_Taxo = '69123';        
      id_EoL = '311503';
      id_AnAge = taxon;
      id_MSW3 = '14100050';
       
    case 'Camelus_dromedarius'
      id_CoL = '2ce3845d28d43f30229bf4bcad752a19';
      id_Taxo = '67767';        
      id_EoL = '309019';
      id_AnAge = taxon;
      id_MSW3 = '14200115';
       
    case 'Camelus_bactrianus'
      id_CoL = '4d8f82467f8d38ec25f865f418291f62';
      id_Taxo = '67766';        
      id_EoL = '344581';
      id_AnAge = taxon;
      id_MSW3 = '14200112';
       
    case 'Lama_glama_guanicoe'
      id_CoL = '9f4d153285e23f9312eb0118d6e17197';
      id_Taxo = '154238';        
      id_EoL = '309017';
      id_AnAge = taxon;
      id_MSW3 = '14200120';
       
    case 'Sus_scrofa'
      id_CoL = '7f9608b34955e65ca451e980dec66dba';
      id_Taxo = '67678';        
      id_EoL = '328663';
      id_AnAge = taxon;
      id_MSW3 = '14200054';
       
    case 'Phacochoerus_aethiopicus'
      id_CoL = 'af7556fe60cc2da044faa81bc16507a2';
      id_Taxo = '67660';        
      id_EoL = '328331';
      id_AnAge = ''; % not present at 2018/07/11
      id_MSW3 = '14200019';
       
    case 'Pecari_tajacu'
      id_CoL = '594e1a3c780472d755737a6c14848649';
      id_Taxo = '169209';        
      id_EoL = '1037712';
      id_AnAge = taxon;
      id_MSW3 = '14200078';
       
    case 'Monodon_monoceros'
      id_CoL = 'ac12a283ac3c3ecb7c86d02da8dfaacc';
      id_WoRMS = '137116';
      id_Taxo = '68813';
      id_EoL = '328542';
      id_AnAge = taxon;
      id_MSW3 = '14300107';
       
    case 'Delphinapterus_leucas'
      id_CoL = 'd9b93553f1483a53529684b92f3e0872';
      id_WoRMS = '137115';
      id_Taxo = '68811';        
      id_EoL = '328541';
      id_AnAge = taxon;
      id_MSW3 = '14300105';
       
    case 'Phocoena_phocoena'
      id_CoL = '5a744a2d5381acb09097283fddd6095a';
      id_WoRMS = '137117';
      id_Taxo = '68799';        
      id_EoL = '328536';
      id_AnAge = taxon;
      id_MSW3 = '14300116';
       
    case 'Phocoenoides_dalli'
      id_CoL = '550c7eb789b9de28b3a78515508f30ff';
      id_WoRMS = '254987';
      id_Taxo = '68806';        
      id_EoL = '328540';
      id_AnAge = taxon;
      id_MSW3 = '14300123';
              
    case 'Neophocaena_phocaenoides'
      id_CoL = '56418c1f65c6b7767279aa7e205cc8ef';
      id_WoRMS = '254985';
      id_Taxo = '68785';  
      id_EoL = '328539';
      id_AnAge = taxon;
      id_MSW3 = '14300112';
              
    case 'Steno_bredanensis'
      id_CoL = 'd74feb06e2f90b07584650f37dec6553';
      id_WoRMS = '137110';
      id_Taxo = '68703';      
      id_EoL = '328478';
      id_AnAge = taxon;
      id_MSW3 = '14300096';

    case 'Sotalia_fluviatilis'
      id_CoL = '21144e096e8fc4585e6e8a33feb55839';
      id_WoRMS = '254982';
      id_Taxo = '68692';        
      id_EoL = '328481';
      id_AnAge = taxon;
      id_MSW3 = '14300080';

    case 'Sousa_chinensis'
      id_CoL = 'c9a114073abd663cf11fd327edf894fe';
      id_WoRMS = '220226';
      id_Taxo = '68698'; 
      id_EoL = '328479';
      id_AnAge = taxon;
      id_MSW3 = '14300082';

    case 'Stenella_coeruleoalba'
      id_CoL = '477991df751642baf5dd4f83a7cd8ffb';
      id_WoRMS = '137107';
      id_Taxo = '68735';        
      id_EoL = '129553';
      id_AnAge = taxon;
      id_MSW3 = '14300089';
       
    case 'Stenella_attenuata'
      id_CoL = '616be000b9e69fdbab5ae0b71cf43d31';
      id_WoRMS = '137105';
      id_Taxo = '68733';        
      id_EoL = '129550';
      id_AnAge = taxon;
      id_MSW3 = '14300085';
       
    case 'Stenella_longirostris'
      id_CoL = '378c33cc36a36de73b2fdda984b281f5';
      id_WoRMS = '137109';
      id_Taxo = '68739';        
      id_EoL = '129549';
      id_AnAge = ''; % not present at 2018/07/17
      id_MSW3 = '14300091';
       
    case 'Stenella_frontalis'
      id_CoL = '50eb4f2b6b238898b5a3cb7ef5ea1077';
      id_WoRMS = '137108';
      id_Taxo = '68737'; 
      id_EoL = '1035713';
      id_AnAge = ''; % not present at 2018/07/17
      id_MSW3 = '14300090';
       
    case 'Delphinus_delphis'
      id_CoL = '53f82736e0e55a75583156a10dc0770e';
      id_WoRMS = '137094';
      id_Taxo = '68711';        
      id_EoL = '314276';
      id_AnAge = taxon;
      id_MSW3 = '14300045';
       
    case 'Tursiops_truncatus'
      id_CoL = '5a97cc1e1ac71d45d276e12d8cdfd97d';
      id_WoRMS = '137111';
      id_Taxo = '68750';        
      id_EoL = '129548';
      id_AnAge = taxon;
      id_MSW3 = '14300099';
       
    case 'Lagenodelphis_hosei'
      id_CoL = 'b299579151158a1f160415f80199b67a';
      id_WoRMS = '137099';
      id_Taxo = '68721';   
      id_EoL = '314247';
      id_AnAge = taxon;
      id_MSW3 = '14300058';
       
    case 'Lissodelphis_borealis'
      id_CoL = '085ba2ad8d2f8c674a783bf2a8da11f7';
      id_WoRMS = '254975';
      id_Taxo = '68706';        
      id_EoL = '328527';
      id_AnAge = ''; % not present at 2018/07/17
      id_MSW3 = '14300065';
       
    case 'Cephalorhynchus_hectori'
      id_CoL = '543a9694b1ed879527944d26deabe1ac';
      id_WoRMS = '254979';
      id_Taxo = '68759';        
      id_EoL = '328526';
      id_AnAge = ''; % not present at 2018/07/17
      id_MSW3 = '14300040';
       
    case 'Lagenorhynchus_obscurus'
      id_CoL = '2b77c8ff7966c1a93528ee536722dd6d';
      id_WoRMS = '231434';
      id_Taxo = '68729';        
      id_EoL = '317317';
      id_AnAge = taxon;
      id_MSW3 = '14300065';
       
    case 'Lagenorhynchus_albirostris'
      id_CoL = '7ff6461ff29f2d00011fecb10904f995';
      id_WoRMS = '137101';
      id_Taxo = '68724';        
      id_EoL = '342089';
      id_AnAge = ''; % not presebt at 2018/07/16
      id_MSW3 = '14300061';

    case 'Globicephala_macrorhynchus'
      id_CoL = '98e64c7d6cd792ae61d35482a8856703';
      id_WoRMS = '137096';
      id_Taxo = '68767';        
      id_EoL = '328533';
      id_AnAge = taxon;
      id_MSW3 = '14300051';
       
    case 'Pseudorca_crassidens'
      id_CoL = '4d6423dbe228ecfca77db98f22b38979';
      id_WoRMS = '137104';
      id_Taxo = '68779';        
      id_EoL = '328532';
      id_AnAge = taxon;
      id_MSW3 = '14300078';
       
    case 'Orcinus_orca'
      id_CoL = '0d0c95b9ba62095a56695f520e3a09ce';
      id_WoRMS = '137102';
      id_Taxo = '68777';        
      id_EoL = '328534';
      id_AnAge = taxon;
      id_MSW3 = '14300074';
       
    case 'Kogia_breviceps'
      id_CoL = '10164399882cd75e52867d5b0f7c444a';
      id_WoRMS = '137113';
      id_Taxo = '68817'; 
      id_EoL = '328548';
      id_AnAge = taxon;
      id_MSW3 = '14300128'; 
      
    case 'Kogia_sima'
      id_CoL = '72154957f43f762fdf027b059bb7ea3c';
      id_WoRMS = '159025';
      id_Taxo = ''; % not present 2018/07/14    
      id_EoL = '328549';
      id_AnAge = ''; % not present 2018/07/14
      id_MSW3 = '14300129'; 
      
    case 'Physeter_macrocephalus'
      id_CoL = 'b3ea740b176c587935272fe4f127db73';
      id_WoRMS = '137119';
      id_Taxo = '68820'; % unaccepted, to Physeter catodon Linnaeus, 1758       
      id_EoL = '328547';
      id_AnAge = taxon;
      id_MSW3 = '14300131'; % present as Physeter catodon
      id_ADW = 'Physeter_catodon'; 
      
    case 'Pontoporia_blainvillei'
      id_CoL = '09ab20bd544602a13231f4895df42ae3';
      id_WoRMS = '254964';
      id_Taxo = '68677';        
      id_EoL = '328476';
      id_AnAge = taxon;
      id_MSW3 = '14300145';
       
    case 'Hyperoodon_ampullatus'
      id_CoL = '1f318418ad1c5ff2abf8d3376f196f45';
      id_WoRMS = '343899';
      id_Taxo = '68827';        
      id_EoL = '328556';
      id_AnAge = taxon;
      id_MSW3 = '14300153';
       
    case 'Berardius_bairdii'
      id_CoL = 'f96133c690f15a5343de0c866411239b';
      id_WoRMS = '242608';
      id_Taxo = '68825';        
      id_EoL = '328551';
      id_AnAge = taxon;
      id_MSW3 = '14300149';
       
    case 'Balaenoptera_acutorostrata'
      id_CoL = '03989edf0baedd8ab5478fca2ad3b410';
      id_WoRMS = '137087';
      id_Taxo = '68885';        
      id_EoL = '328570';
      id_AnAge = taxon;
      id_MSW3 = '14300012';
       
    case 'Balaenoptera_musculus'
      id_CoL = '64d8253f41d376fdd1f902527ed187c7';
      id_WoRMS = '137090';
      id_Taxo = '68889';        
      id_EoL = '328574';
      id_AnAge = taxon;
      id_MSW3 = '14300018';
       
    case 'Balaenoptera_physalus'
      id_CoL = 'fc70814cdb6032a77d67bf268d2fec4a';
      id_WoRMS = '137091';
      id_Taxo = '68892';        
      id_EoL = '328573';
      id_AnAge = taxon;
      id_MSW3 = '14300023';
       
    case 'Balaenoptera_borealis'
      id_CoL = '6efb6430c724449cc1f490fafd4a330b';
      id_WoRMS = '137088';
      id_Taxo = '68886';        
      id_EoL = '328572';
      id_AnAge = taxon;
      id_MSW3 = '14300014';
       
    case 'Eschrichtius_robustus'
      id_CoL = 'b4385cf8dc677811a74fa6ae3cb43adc';
      id_WoRMS = '137112';
      id_Taxo = '68881';        
      id_EoL = '328569';
      id_AnAge = taxon;
      id_MSW3 = '14300030';
       
    case 'Eubalaena_glacialis'
      id_CoL = 'e45c4cf3665144ef83bb225e971a91e6';
      id_WoRMS = '159023';
      id_Taxo = '68901'; % unaccpeted, to Balaena glacialis M�ller, 1776       
      id_EoL = '328579';
      id_AnAge = taxon;
      id_MSW3 = '14300008';
       
    case 'Balaena_mysticetus'
      id_CoL = '3ea1bf0273d2013ad96eb6afa9ceb890';
      id_WoRMS = '137086';
      id_Taxo = '68905';        
      id_EoL = '328577';
      id_AnAge = taxon;
      id_MSW3 = '14300005';
       
    case 'Hippopotamus_amphibius'
      id_CoL = 'd122689ccde0015d1426a4f7af9fa1be';
      id_Taxo = '67738';   
      id_EoL = '311532';
      id_AnAge = taxon;
      id_MSW3 = '14200106';
       
    case 'Hexaprotodon_liberiensis'
      id_CoL = '6cfa4c85eed64c9e83c3d0b3b695255b';
      id_Taxo = '67730';   
      id_EoL = '317313';
      id_AnAge = taxon;
      id_MSW3 = '14200102';
       
    case 'Antilocapra_americana'
      id_CoL = '1d7c1536f14b546ab7dcd045a719d4f2';
      id_Taxo = '68119';        
      id_EoL = '328661';
      id_AnAge = taxon;
      id_MSW3 = '14200476';
       
    case 'Giraffa_camelopardalis'
      id_CoL = '36ea034537a75e8ac153b4089c6d5646';
      id_Taxo = '68131';        
      id_EoL = '308378';
      id_AnAge = taxon;
      id_MSW3 = '14200468';
       
    case 'Okapia_johnstoni'
      id_CoL = '6e53878317a74051cf2698e02fd631b5';
      id_Taxo = '68116';        
      id_EoL = '308387';
      id_AnAge = taxon;
      id_MSW3 = '14200484';
       
    case 'Muntiacus_reevesi'
      id_CoL = '259c0fb7f774eba6e8f2991b80fa0505';
      id_Taxo = '67908'; 
      id_EoL = '308477';
      id_AnAge = taxon; 
      id_MSW3 = '14200419'; 
      
    case 'Cervus_canadensis'
      id_CoL = 'd116839109ff1e816c69b6ab69deb181';
      id_Taxo = '67943'; % unaccepeted, to Cervus elaphus canadensis Erxleben, 1777        
      id_EoL = '4446404';
      id_AnAge = 'Cervus_elaphus'; 
      id_MSW3 = '14200358'; % present as Cervus elaphus canadensis
      id_ADW = 'Cervus_elaphus'; 
      
    case 'Cervus_elaphus'
      id_CoL = 'a457faad0aee57cb2ab9cf7b1b850d84';
      id_Taxo = '167650'; 
      id_EoL = '46244532';
      id_AnAge = taxon; 
      id_MSW3 = '14200352'; 
      
    case 'Capreolus_capreolus'
      id_CoL = 'a68dfad054452fb4f0d890e296af9e2f';
      id_Taxo = '68090';    
      id_EoL = '308479';
      id_AnAge = taxon;
      id_MSW3 = '14200217';
       
    case 'Rangifer_tarandus'
      id_CoL = '26f5c11255f895a632fd2c2df42e0f60';
      id_Taxo = '68031';        
      id_EoL = '328653';
      id_AnAge = taxon;
      id_MSW3 = '14200328';
       
    case 'Odocoileus_virginianus'
      id_CoL = '49c19661f2a48ff49d60d571f9f827ca';
      id_Taxo = '68077';        
      id_EoL = '328652';
      id_AnAge = taxon;
      id_MSW3 = '14200278';
       
    case 'Alces_alces'
      id_CoL = 'fc7d998315ba4a3e50cfab10954bdc45';
      id_Taxo = '68020';        
      id_EoL = '328654';
      id_AnAge = taxon;
      id_MSW3 = '14200328';
       
    case 'Hydropotes_inermis'
      id_CoL = 'abcd3abe3efc636a99da025bc5b11474';
      id_Taxo = '67891';        
      id_EoL = '308404';
      id_AnAge = taxon;
      id_MSW3 = '14200463';
       
    case 'Taurotragus_oryx'
      id_CoL = 'e72425f86fc160fc77512d5156ca9e5c';
      id_Taxo = '68200';        
      id_EoL = '52578401';  
      id_AnAge = taxon; 
      id_MSW3 = '14200717'; 
      
    case 'Tragelaphus_strepsiceros'
      id_CoL = 'e3ccbb01c6f2880dd10a2fcdc0a9eb2e';
      id_Taxo = '68207';        
      id_EoL = '1038792';  
      id_AnAge = taxon; 
      id_MSW3 = '14200746'; 
      
     case 'Tragelaphus_imberbis'
      id_CoL = '0f2ae15d1a6ef6198ef73e2bf588c035';
      id_Taxo = '68198';        
      id_EoL = '1038789';  
      id_AnAge = taxon; 
      id_MSW3 = '14200730'; 
      
    case 'Bos_primigenius_Angus'
      id_CoL = '40e81482006c210a43ef64609163278e';
      id_Taxo = '167484'; % unaccepted, to Bos taurus primigenius Bojanus, 1827        
      id_Wiki = 'Bos_primigenius';
      id_EoL = '10408207'; % unaccepted, to Bos taurus primigenius Bojanus, 1827 
      id_AnAge = 'Bos_taurus'; 
      id_MSW3 = '14200690'; % unaccepted, to Bos taurus primigenius
      id_ADW = 'Bos_taurus'; 
      
    case 'Bos_primigenius_Holstein'
      id_CoL = '40e81482006c210a43ef64609163278e';
      id_Taxo = '167484'; % unaccepted, to Bos taurus primigenius Bojanus, 1827        
      id_Wiki = 'Bos_primigenius';
      id_EoL = '10408207'; % unaccepted, to Bos taurus primigenius Bojanus, 1827 
      id_AnAge = 'Bos_taurus'; 
      id_MSW3 = '14200690'; % unaccepted, to Bos taurus primigenius
      id_ADW = 'Bos_taurus'; 
      
    case 'Bos_primigenius_Brahman'
      id_CoL = '40e81482006c210a43ef64609163278e';
      id_Taxo = '167484'; % unaccepted, to Bos taurus primigenius Bojanus, 1827        
      id_Wiki = 'Bos_primigenius';
      id_EoL = '10408207'; % unaccepted, to Bos taurus primigenius Bojanus, 1827 
      id_AnAge = 'Bos_taurus'; 
      id_MSW3 = '14200690'; % unaccepted, to Bos taurus primigenius
      id_ADW = 'Bos_taurus'; 
      
    case 'Bison_bonasus'
      id_CoL = '03dfb5c2bf3a870ac472f60a8f4f78e4';
      id_Taxo = '68228';        
      id_EoL = '328110';  
      id_AnAge = taxon; 
      id_MSW3 = '14200670'; 
      
    case 'Bison_bison'
      id_CoL = '0f1f822b2020d3a6449ef19b6197ba51';
      id_Taxo = '68224';        
      id_EoL = '328109';  
      id_AnAge = taxon; 
      id_MSW3 = '14200669'; 
      
    case 'Syncerus_caffer'
      id_CoL = 'ac68b7fcf117c15f36c8ae17ca50b261';
      id_Taxo = '68279';        
      id_EoL = '328707';  
      id_AnAge = taxon; 
      id_MSW3 = '14200707'; 
      
    case 'Gazella_subgutturosa'
      id_CoL = 'd93ff923ac333b4c53b1d789faf17564';
      id_Taxo = '1596';        
      id_EoL = '129520';  
      id_AnAge = taxon; 
      id_MSW3 = '14200583'; 
      
    case 'Antidorcas_marsupialis'
      id_CoL = '2945dfdb821ebe8582a3aefa2813654a';
      id_Taxo = '68454';        
      id_EoL = '24917556';  
      id_AnAge = taxon; 
      id_MSW3 = '14200530'; 
      
    case 'Saiga_tatarica'
      id_CoL = 'fd74740449bbec04293ca517b20744fe';
      id_Taxo = '68501';        
      id_EoL = '103528';  
      id_AnAge = taxon; 
      id_MSW3 = '14200666'; 
      
    case 'Madoqua_kirkii'
      id_CoL = '300da862f4519ed04580fa7cea9878c1';
      id_Taxo = '68411';        
      id_EoL = '311498';  
      id_AnAge = taxon; 
      id_MSW3 = '14200596'; 
      
    case 'Cephalophus_dorsalis'
      id_CoL = '8ac3df7e3fc90fc0ddac5c0e445ad99e';
      id_Taxo = '68286';        
      id_EoL = '328703';  
      id_AnAge = taxon; 
      id_MSW3 = '14200870'; 
      
    case 'Cephalophus_niger'
      id_CoL = '3e3f5735be1f0e8c5c8d30d32556b3e5';
      id_Taxo = '68292';        
      id_EoL = '328709';  
      id_AnAge = taxon; 
      id_MSW3 = '14200880'; 
      
    case 'Cephalophus_rufilatus'
      id_CoL = '9a5d422b7963705648c6d98985edc6fc';
      id_Taxo = '68295';        
      id_EoL = '328711';  
      id_AnAge = taxon; 
      id_MSW3 = '14200921'; 
      
    case 'Cephalophus_sylvicultor'
      id_CoL = 'a4860932d190e6276e086a14b9e015a8';
      id_Taxo = '68307';        
      id_EoL = '328721';  
      id_AnAge = taxon; 
      id_MSW3 = '14200891'; 
      
    case 'Cephalophus_zebra'
      id_CoL = '0632d1dc0e608d95c2fa2509b205a251';
      id_Taxo = '68299';        
      id_EoL = '328710';  
      id_AnAge = taxon; 
      id_MSW3 = '14200902'; 
      
    case 'Sylvicapra_grimmia'
      id_CoL = 'a4860932d190e6276e086a14b9e015a8';
      id_Taxo = '68307';        
      id_EoL = '328711';  
      id_AnAge = taxon; 
      id_MSW3 = '14200921'; 
      
    case 'Kobus_kob'
      id_CoL = '7ed0a16eaa2327bf0a7b4fecbdb84428';
      id_Taxo = '68319';        
      id_EoL = '328731';  
      id_AnAge = taxon; 
      id_MSW3 = '14200975'; 
      
    case 'Redunca_fulvorufula'
      id_CoL = '7dff6ac0a5fa28f608e400b8ff4aa639';
      id_Taxo = '68331';        
      id_EoL = '331083';  
      id_AnAge = taxon; 
      id_MSW3 = '14200997'; 
      
    case 'Aepyceros_melampus'
      id_CoL = '0747c465edaff4d5301bd9f9baab8e52';
      id_Taxo = '68440';        
      id_EoL = '308540';
      id_AnAge = taxon;
      id_MSW3 = '14200488';
       
    case 'Ovibos_moschatus'
      id_CoL = 'e4475739e4b72bc21e5596c1e24de11e';
      id_Taxo = '68543';        
      id_EoL = '328656';
      id_AnAge = taxon;
      id_MSW3 = '14200813';
       
    case 'Capra_ibex'
      id_CoL = 'eb202c4a92a1e7edc6521f876ea20dd2';
      id_Taxo = '68570';        
      id_EoL = '328692';
      id_AnAge = taxon;
      id_MSW3 = '14200783'; 
       
    case 'Ovis_canadensis'
      id_CoL = '889b5d59b22fcf283bbfc85b2fe32430';
      id_Taxo = '68604';   
      id_EoL = '328658';
      id_AnAge = taxon;
      id_MSW3 = '14200783'; 
      
    case 'Ovis_ammon'
      id_CoL = '324c2c66140c2405e379f3c6bc85beb0';
      id_Taxo = '68593';   
      id_EoL = '328677';
      id_AnAge = taxon;
      id_MSW3 = '14200815';
       
    case 'Capricornis_crispus'
      id_CoL = '68d67aa10ab89ee9fb1bfa990a697965';
      id_Taxo = '68518';   
      id_EoL = '1038800';
      id_AnAge = taxon;
      id_MSW3 = '14200789'; 
       
    case 'Oreamnos_americanus'
      id_CoL = 'f519c69b4ce60807c5fed75c614aeb8a';
      id_Taxo = '68526';        
      id_EoL = '42402';
      id_AnAge = taxon;
      id_MSW3 = '14200811'; 
       
    case 'Rupicapra_rupicapra'
      id_CoL = 'd25ccfd780ea763f039935faa9b1f3c7';
      id_Taxo = '68532';        
      id_EoL = '331073';
      id_AnAge = taxon;
      id_MSW3 = '14200687'; 
       
    case 'Hippotragus_niger'
      id_CoL = '88d4521ac9cb966ab72ec0ae338342b5';
      id_Taxo = '68344';        
      id_EoL = '331077';
      id_AnAge = taxon;
      id_MSW3 = '14200947'; 
       
    case 'Oryx_leucoryx'
      id_CoL = 'd97cb5fd5dc2ea595d70e2ab1f6badb2';
      id_Taxo = '68358';        
      id_EoL = '331080';
      id_AnAge = taxon;
      id_MSW3 = '14200958'; 
       
    case 'Addax_nasomaculatus'
      id_CoL = '55007d735d4e2a4e692b198092284143';
      id_Taxo = '68349';        
      id_EoL = '331074';
      id_AnAge = taxon;
      id_MSW3 = '14200937'; 
       
    case 'Connochaetes_gnou'
      id_CoL = '771038eda5b175a6aefcd49d3711850e';
      id_Taxo = '68363';        
      id_EoL = '308530';
      id_AnAge = taxon;
      id_MSW3 = '14200509'; 
       
    case 'Connochaetes_taurinus'
      id_CoL = '6741e665d816f4619aa97359762d1e03';
      id_Taxo = '68364';        
      id_EoL = '4447134';
      id_AnAge = taxon;
      id_MSW3 = '14200510'; 
       
    case 'Pedetes_capensis'
      id_CoL = '0d413960a6814a83859b738b8453a188';
      id_Taxo = '62191';        
      id_EoL = '289798';
      id_AnAge = taxon;
      id_MSW3 = '13200003';
       
    case 'Heterocephalus_glaber'
      id_CoL = '578ce28e305022faa88b77f2b880502f';
      id_Taxo = '63627';        
      id_EoL = '326232';
      id_AnAge = taxon;
      id_MSW3 = '13400041';
       
    case 'Cryptomys_mechowi'
      id_CoL = 'eb112691eb817cb8db29ba1ed18949c1';
      id_Taxo = '112574';        
      id_EoL = '999274';
      id_AnAge = taxon;
      id_MSW3 = '13400019';
       
    case 'Cryptomys_hottentotus'
      id_CoL = 'b8f74ade6c124bfc247889ef16e86337';
      id_Taxo = '63620';        
      id_EoL = '326229';
      id_AnAge = taxon;
      id_MSW3 = '13400014';
       
    case 'Cryptomys_damarensis'
      id_CoL = '0d865a20cd237791a8ac342e37f5f012';
      id_Taxo = '63619';        
      id_EoL = '326229';
      id_AnAge = taxon;
      id_MSW3 = '13400011';
       
    case 'Georychus_capensis'
      id_CoL = '5b2f433372fa56fabd0527276e828080';
      id_Taxo = '63623';        
      id_EoL = '128073';
      id_AnAge = taxon;
      id_MSW3 = '13400027';
       
    case 'Bathyergus_suillus'
      id_CoL = '5806af0cfdd3e49f6af3011cd2600604';
      id_Taxo = '63617';        
      id_EoL = '127507';
      id_AnAge = ''; % not present 2018/10/25
      id_MSW3 = '13400006';
      id_ADW = ''; % not present 2018/10/25
       
    case 'Bathyergus_janetta'
      id_CoL = '449f33328e5451dcdca92bcea38c238b';
      id_Taxo = '89611';        
      id_EoL = '326572';
      id_AnAge = ''; % not present 2018/10/25
      id_MSW3 = '13400005';
      id_ADW = ''; % not present 2018/10/25
       
    case 'Hystrix_africaeaustralis'
      id_CoL = '2acff5dbbbdae886a56163692f0c86bb';
      id_Taxo = '63383';        
      id_EoL = '326520';
      id_AnAge = taxon;
      id_MSW3 = '13400050';
       
    case 'Atherurus_africanus'
      id_CoL = '8cf6e4cbede6861cd0d73a224acfb859';
      id_Taxo = '63375';        
      id_EoL = '4458218';
      id_AnAge = taxon;
      id_MSW3 = '13400044';
       
    case 'Geocapromys_ingrahami'
      id_CoL = '0b4d83ff43e2fc31fb32d3c7ca7d1fb7';
      id_Taxo = '63512';        
      id_EoL = '24934758';
      id_AnAge = taxon;
      id_MSW3 = '13400572';
       
    case 'Cavia_porcellus'
      id_CoL = '928a06f0767ad435adb2b3eb0fb000d5';
      id_Taxo = '63446';        
      id_EoL = '326924';
      id_AnAge = taxon;
      id_MSW3 = '13400181';
       
    case 'Cavia_tschudii'
      id_CoL = 'f83a21896fe575a2978cfd1222434dca';
      id_Taxo = '89491';        
      id_EoL = '326925';
      id_AnAge = taxon;
      id_MSW3 = '13400182';
       
    case 'Galea_musteloides'
      id_CoL = '1ee8167d07884684d90198da4471b66a';
      id_Taxo = '63449';        
      id_EoL = '1038694';
      id_AnAge = taxon;
      id_MSW3 = '13400191';
       
    case 'Hydrochoerus_hydrochaeris'
      id_CoL = 'cdece5c9f966826ad8a4f0b6b1c70d4c';
      id_Taxo = '647819';        
      id_EoL = '326517';
      id_AnAge = taxon;
      id_MSW3 = '13400218';
      
    case 'Dolichotis_patagonum'
      id_CoL = '6ba4eeee06aa0f9b6661ec4dab259e93';
      id_Taxo = '63457';        
      id_EoL = '326517';
      id_AnAge = taxon;
      id_MSW3 = '13400212';
       
    case 'Chinchilla_lanigera'
      id_CoL = '4cebac0788bb127166d0646c9ab23a33';
      id_Taxo = '63498';        
      id_EoL = '326926';
      id_AnAge = taxon;
      id_MSW3 = '13400134';
       
    case 'Lagostomus_maximus'
      id_CoL = 'fab7b2591249ffbbaa04ac931fd36c4a';
      id_Taxo = '63504';        
      id_EoL = '1038700';
      id_AnAge = taxon;
      id_MSW3 = '13400161';
       
    case 'Myoprocta_acouchy'
      id_CoL = 'd8372b39b01cdbd6dfa518269d480c03';
      id_Taxo = '93514';        
      id_EoL = '326580';
      id_AnAge = taxon;
      id_MSW3 = '13400266';
       
    case 'Erethizon_dorsatus'
      id_CoL = '2147e2adb893f3a46063dea642a45b67';
      id_Taxo = '63429';        
      id_EoL = '328469'; % present as Erethizon dorsatum 2017/12/30
      id_AnAge = taxon;
      id_MSW3 = '13400108'; % present as Erethizon dorsata 2017/12/30
      id_ADW = 'Erethizon_dorsatum';
      id_Wiki = 'Erethizon_dorsatum';
       
    case 'Myocastor_coypus'
      id_CoL = '36d74b421fdbd62de05372461c50d907';
      id_Taxo = '63540';        
      id_EoL = '328471';
      id_AnAge = taxon;
      id_MSW3 = '13400557';
       
    case 'Octodon_degus'
      id_CoL = '205cebbc86a7765cc84ef0a0a54dfccd';
      id_Taxo = '63545';        
      id_EoL = '326372';
      id_AnAge = taxon;
      id_MSW3 = '13400373';
       
    case 'Aplodontia_rufa'
      id_CoL = '2b7177151ff875a0061b0c4cfe8c14fb';
      id_Taxo = '61669';        
      id_EoL = '327978';
      id_AnAge = taxon; 
      id_MSW3 = '12300005';
       
    case 'Glis_glis'
      id_CoL = 'a35eaad2acaaf584762b9843f35c3dc5';
      id_Taxo = '168233';        
      id_EoL = '327942'; % unaccepted, to Myoxus glis
      id_AnAge = ''; % not present 2017/06/18
      id_MSW3 = '12500044';
       
    case 'Sciurus_carolinensis'
      id_CoL = '940aaf006e4e611ff7f68afc25bea81c';
      id_Taxo = '61711';        
      id_EoL = '347685';
      id_AnAge = taxon;
      id_MSW3 = '12400104';
       
    case 'Sciurus_aberti'
      id_CoL = '9446ae66b7bf08bf60b7a2c69d2bc270';
      id_Taxo = '61707';        
      id_EoL = '347427';
      id_AnAge = taxon;
      id_MSW3 = '12400074';
       
    case 'Tamiasciurus_hudsonicus'
      id_CoL = '4dae5823bf1d6af9c23ce0e3444e58f0';
      id_Taxo = '61734';        
      id_EoL = '347433';
      id_AnAge = taxon;
      id_MSW3 = '12400253';
       
    case 'Glaucomys_volans'
      id_CoL = '144951863a899b2070da16efc8a43a70';
      id_Taxo = '61979';        
      id_EoL = '347431';
      id_AnAge = taxon;
      id_MSW3 = '12400328';
       
    case 'Glaucomys_sabrinus'
      id_CoL = 'c5e60fae819a31c39a80fac071f72776';
      id_Taxo = '61978';        
      id_EoL = '12138923';
      id_AnAge = taxon;
      id_MSW3 = '12400302';
       
    case 'Tamias_striatus'
      id_CoL = '025829bf7b2e2a50ae1ce3ec11d3c545';
      id_Taxo = '170037';        
      id_EoL = '311526';
      id_AnAge = taxon;
      id_MSW3 = '12401228';
       
    case 'Tamias_amoenus'
      id_CoL = 'b744bf526adfc08db683a8e48a28eda4';
      id_Taxo = '170031';        
      id_EoL = '311551';
      id_AnAge = taxon;
      id_MSW3 = '12401136';
       
    case 'Tamias_townsendii'
      id_CoL = '190158bc4de1ecd0966eadbd150bcd4f';
      id_Taxo = '170038';        
      id_EoL = '311527';
      id_AnAge = taxon;
      id_MSW3 = '12401240';
       
    case 'Ammospermophilus_harrisii'
      id_CoL = 'aa50e3311e78c00098c12fe9639a281c';
      id_Taxo = '61826';        
      id_EoL = '311663';
      id_AnAge = taxon;
      id_MSW3 = '12400893';
       
    case 'Callospermophilus_lateralis'
      id_CoL = 'b870be4cb7eaf452c31f7c8791a50f33';
      id_Taxo = '61925'; % present as Spermophilus lateralis at 2017/12/31       
      id_EoL = '328006'; % present as Spermophilus lateralis at 2017/12/31
      id_AnAge = taxon;
      id_MSW3 = '12401029'; % present as Spermophilus lateralis at 2017/12/31
      id_ADW = 'Spermophilus_lateralis';
       
    case 'Callospermophilus_saturatus'
      id_CoL = '0a14a6e9cd95bc0f98cdd4c8be6d71dc';
      id_Taxo = '61925'; % present as Spermophilus saturatus at 2017/12/31       
      id_EoL = '128483'; % present as Spermophilus saturatus at 2017/12/31
      id_AnAge = taxon;
      id_MSW3 = '12401075'; % present as Spermophilus saturatus at 2017/12/31
      id_ADW = 'Spermophilus_saturatus';
       
    case 'Otospermophilus_variegatus'
      id_CoL = '09aca213f5710efdc88d82fd69b3cf32';
      id_Taxo = '61942'; % present as Spermophilus variegatus at 2017/12/31       
      id_EoL = '347435'; % present as Spermophilus variegatus at 2017/12/31
      id_AnAge = taxon;
      id_MSW3 = '12401120'; % present as Spermophilus variegatus at 2017/12/31
      id_ADW = 'Spermophilus_variegatus';

    case 'Xerospermophilus_mohavensis'
      id_CoL = 'ae8471806c13c7ba4da74cbb8069e7f4';
      id_Taxo = '61928'; % present as Spermophilus mohavensis at 2018/01/02       
      id_EoL = '328008'; % present as Spermophilus mohavensis at 2018/01/02  
      id_AnAge = taxon;
      id_MSW3 = '12401048'; % present as Spermophilus mohavensis at 2018/01/02  
      id_ADW = 'Spermophilus_mohavensis';
       
    case 'Xerospermophilus_tereticaudus'
      id_CoL = 'f8b97e9fa3bc95b60c979eebe7c935b1';
      id_Taxo = '61938'; % present as Spermophilus tereticaudus at 2018/01/02       
      id_EoL = '128481'; % present as Spermophilus tereticaudus at 2018/01/02  
      id_AnAge = taxon;
      id_MSW3 = '12401094'; % present as Spermophilus tereticaudus at 2018/01/02  
      id_ADW = 'Spermophilus_tereticaudus';
       
    case 'Marmota_flaviventris'
      id_CoL = '5032fb08abb378e862f86ede07e0bd88';
      id_Taxo = '61896';        
      id_EoL = '327985';
      id_AnAge = taxon;
      id_MSW3 = '12400944';
       
    case 'Marmota_monax'
      id_CoL = '52b1e5296dead9a1d7be6b5e5eff4566';
      id_Taxo = '61903';        
      id_EoL = '4465998';
      id_AnAge = taxon;
      id_MSW3 = '12400961';
       
    case 'Ictidomys_tridecemlineatus'
      id_CoL = 'b2c44e65cf9df66f7f6c25f9f2380e1e';
      id_Taxo = '61940';        
      id_EoL = '999163';
      id_AnAge = taxon;
      id_MSW3 = '12401102';
      id_ADW = ''; % not present at 2017/01/01
       
    case 'Cynomys_ludovicianus'
      id_CoL = 'fe2c48fc52f5c23504ec901961d8d0ed';
      id_Taxo = '61869';        
      id_EoL = '311548';
      id_AnAge = taxon;
      id_MSW3 = '12400916';
       
    case 'Urocitellus_richardsonii'
      id_CoL = '6fa3443ae9b8549b7238c1f332f5c44b';
      id_Taxo = '61934';    % present as Spermophilus richardsonii 2017/12/29       
      id_EoL = '327848';    % present as Spermophilus richardsonii 2017/12/29
      id_AnAge = taxon;     % present as Spermophilus richardsonii 2017/12/29
      id_MSW3 = '12401074'; % present as Spermophilus richardsonii 2017/12/29
      id_ADW = 'Spermophilus_richardsonii';
       
    case 'Urocitellus_beldingi'
      id_CoL = '4f972888f62f2be92cb8b89ec41d7a33';
      id_Taxo = '61915';    % present as Spermophilus beldingi 2017/12/29       
      id_EoL = '327991';    % present as Spermophilus beldingi 2017/12/29 
      id_AnAge = taxon;     % present as Spermophilus beldingi 2017/12/29
      id_MSW3 = '12401003'; % present as Spermophilus beldingi 2017/12/29
      id_ADW = 'Spermophilus_beldingi';
       
    case 'Castor_fiber'
      id_CoL = '3b8681fe6477ed5a3762fcdef4d00eb2';
      id_Taxo = '62130';        
      id_EoL = '1036116';
      id_AnAge = taxon;
      id_MSW3 = '12600005';
       
    case 'Geomys_bursarius'
      id_CoL = '40264570b2d60b43ba9eb087453b2d76';
      id_Taxo = '62007';        
      id_EoL = '328027';
      id_AnAge = taxon;
      id_MSW3 = '12800063';
       
    case 'Dipodomys_merriami'
      id_CoL = '868f1da7a95064a2d3cb7e0e2c5017d7';
      id_Taxo = '62063';        
      id_EoL = '328112';
      id_AnAge = taxon;
      id_MSW3 = '12700032';
       
    case 'Dipodomys_deserti'
      id_CoL = 'aeaca9e2da0962afc26ccd16e320346f';
      id_Taxo = '62059';        
      id_EoL = '328080';
      id_AnAge = taxon;
      id_MSW3 = '12700014';
       
    case 'Dipodomys_heermanni'
      id_CoL = 'de81a85e318366f42c8c9b701444bbc3';
      id_Taxo = '88476';        
      id_EoL = '328082';
      id_AnAge = taxon;
      id_MSW3 = '12700021';
       
    case 'Dipodomys_nitratoides'
      id_CoL = '151bc40902f93c775f4c1d12fa8116b8';
      id_Taxo = '88480';        
      id_EoL = '328114';
      id_AnAge = taxon;
      id_MSW3 = '12700067';
       
    case 'Dipodomys_spectabilis'
      id_CoL = '6b8a7cd938b901eca1a63a05f5af5049';
      id_Taxo = '62066';        
      id_EoL = '328117';
      id_AnAge = taxon;
      id_MSW3 = '12700118';
       
    case 'Dipodomys_stephensi'
      id_CoL = 'db5ba9f15a92403d21946ffa8f8d6274';
      id_Taxo = '62070';        
      id_EoL = '328118';
      id_AnAge = ''; % not present 2018/07/08
      id_MSW3 = '12700125';
       
    case 'Perognathus_longimembris'
      id_CoL = '9c5c1e0297c6a797711ecfd761e75f78';
      id_Taxo = '62103';        
      id_EoL = '311574';
      id_AnAge = taxon;
      id_MSW3 = '12700343';
      id_ADW = ''; % not present at 2018/01/01
       
    case 'Chaetodipus_formosus'
      id_CoL = 'd6b8db08d697f23f2779dc7fc335da83';
      id_Taxo = '93452';        
      id_EoL = '311911';
      id_AnAge = taxon;
      id_MSW3 = '12700240';
       
    case 'Jaculus_jaculus'
      id_CoL = '45c7e291464112f0fb107733e7dfc97b';
      id_Taxo = '63326';        
      id_EoL = '327896';
      id_AnAge = taxon;
      id_MSW3 = '12900051';
       
    case 'Zapus_hudsonius'
      id_CoL = '2a3a17939f78c55ad7b30ffe9ec74e0f';
      id_Taxo = '63313';        
      id_EoL = '328465';
      id_AnAge = taxon;
      id_MSW3 = '12900083';
       
    case 'Napaeozapus_insignis'
      id_CoL = '4c67c02931c22a7c1194f591c4b94271';
      id_Taxo = '63311';        
      id_EoL = '328468';
      id_AnAge = taxon;
      id_MSW3 = '12900081';
       
    case 'Arvicola_amphibius'
      id_CoL = '2e7ace9ed0522b2ef99288425947efc8';
      id_Taxo = '62634'; % unaccepted, to Arvicola terrestris (C. Linnaeus, 1758)       
      id_EoL = '1179597'; % unaccepted, to Arvicola terrestris (C. Linnaeus, 1758)       
      id_AnAge = 'Arvocola_terrestris';
      id_MSW3 = '13000176';
       
    case 'Microtus_richardsoni'
      id_CoL = 'b470d3ef6e289458445db3afa1fa0deb';
      id_Taxo = '62717';        
      id_EoL = '310295';
      id_AnAge = taxon; 
      id_MSW3 = '13000294';
  
    case 'Microtus_agrestis'
      id_CoL = 'b1eb34cbddc57d01c3cbb9147d337fdc';
      id_Taxo = '62672';        
      id_EoL = '1179633';
      id_AnAge = taxon;
      id_MSW3 = '13000246';
      id_ADW = ''; % not present at 2017/12/31
       
    case 'Microtus_arvalis'
      id_CoL = 'c316d43b9cbe48bea99f1d1a1f0c3f3d';
      id_Taxo = '62673';        
      id_EoL = '1179634';
      id_AnAge = taxon;
      id_MSW3 = '13000248';
       
    case 'Microtus_cabrerae'
      id_CoL = 'f79ac11999508ad757439910090b87b0';
      id_Taxo = '62682';        
      id_EoL = '1179636';
      id_AnAge = ''; % not present 2017/06/18
      id_MSW3 = '13000252';
       
    case 'Microtus_guentheri'
      id_CoL = '5f2b64945f3528a5244646de9b508423';
      id_Taxo = '62689';        
      id_EoL = '1179644';
      id_AnAge = taxon; 
      id_MSW3 = '13000266';
      id_ADW = ''; % not present at 2018/01/01
      
    case 'Microtus_subterraneus'
      id_CoL = 'b470d3ef6e289458445db3afa1fa0deb';
      id_Taxo = '62717';        
      id_EoL = '1179671';
      id_AnAge = taxon; 
      id_MSW3 = '13000300';
  
    case 'Microtus_pennsylvanicus'
      id_CoL = '1f2f938c0924db8b02fbf7dc834fbe2d';
      id_Taxo = '62713';        
      id_EoL = '1037788';
      id_AnAge = taxon; 
      id_MSW3 = '13000290';
  
    case 'Microtus_oeconomus'
      id_CoL = 'b95bd75199fbd9471a1047639476a687';
      id_Taxo = '62707';        
      id_EoL = '1037789';
      id_AnAge = taxon; 
      id_MSW3 = '13000287';
  
    case 'Microtus_pinetorum'
      id_CoL = 'ba5d5cb62a11f96e17a89455f0b3afed';
      id_Taxo = '62776';        
      id_EoL = '310271';
      id_AnAge = taxon; 
      id_MSW3 = '13000286';
  
    case 'Microtus_ochrogaster'
      id_CoL = 'ba5d5cb62a11f96e17a89455f0b3afed';
      id_Taxo = '62776';        
      id_EoL = '310271';
      id_AnAge = taxon; 
      id_MSW3 = '13000286';
  
    case 'Alticola_strelzowi'
      id_CoL = 'e5387d678cb5c5ba9bba34f82f34fe26';
      id_Taxo = '62628';        
      id_EoL = '1179594';
      id_AnAge = taxon; 
      id_MSW3 = '13000169';
  
    case 'Ondatra_zibethicus'
      id_CoL = '854bd3857f3a7b98b84db95db5ce47a8';
      id_Taxo = '62758';        
      id_EoL = '313678';
      id_AnAge = taxon; 
      id_MSW3 = '13000330';
  
    case 'Dicrostonyx_groenlandicus'
      id_CoL = 'bd34e658a344cf84f7883435a6afe136';
      id_Taxo = '62581';        
      id_EoL = '328424';
      id_AnAge = taxon;
      id_MSW3 = '13000190';
       
    case 'Dicrostonyx_torquatus'
      id_CoL = '9c4d9cc237156dbcb68fb8d3081e09bd';
      id_Taxo = '62583';        
      id_EoL = '328422';
      id_AnAge = taxon;
      id_MSW3 = '13000195';
       
    case 'Lagurus_lagurus'
      id_CoL = 'a5f1eab0fa22e76a1b54d43226f0023d';
      id_Taxo = '62663';        
      id_EoL = '1179627';
      id_AnAge = taxon;
      id_MSW3 = '13000224';
       
    case 'Lemmus_trimucronatus'
      id_CoL = '6d229d483afce29dae4bee95e6d4cca0';
      id_Taxo = '62591'; % unaccepted, to Lemmus sibiricus (Kerr, 1792)        
      id_EoL = '11022277';
      id_AnAge = ''; % not present 2017/06/18
      id_MSW3 = '13000236';
       
    case 'Lemmus_lemmus'
      id_CoL = '392246600f5efac3100ab1cd0d81e1ea';
      id_Taxo = '62589';        
      id_EoL = '1179632';
      id_AnAge = taxon;
      id_MSW3 = '13000233';
       
    case 'Myopus_schisticolor'
      id_CoL = 'e40fb437249a928ba5d7c03de7c016fe';
      id_Taxo = '62594';        
      id_EoL = '1179676';
      id_AnAge = taxon;
      id_MSW3 = '13000321';
       
    case 'Synaptomys_cooperi'
      id_CoL = '2ab16a5b45dde0c354d2656986874885';
      id_Taxo = '62597';        
      id_EoL = '328421';
      id_AnAge = taxon;
      id_MSW3 = '13000344';
       
    case 'Phenacomys_intermedius'
      id_CoL = '5af42f383812eb8cab6f27b2f41b1f6b';
      id_Taxo = '62760';        
      id_EoL = '328446';
      id_AnAge = taxon;
      id_MSW3 = '13000334';
       
    case 'Phenacomys_ungava'
      id_CoL = '3f0f17961b61411d407a22550eabbbfb';
      id_Taxo = '112365';        
      id_EoL = '1037972';
      id_AnAge = taxon;
      id_MSW3 = '13000335';
       
    case 'Cricetus_cricetus'
      id_CoL = 'eccb22160f6e4314b78276bc26e80bf8';
      id_Taxo = '62488'; 
      id_EoL = '1179512';
      id_AnAge = taxon; 
      id_MSW3 = '13000362';
       
    case 'Baiomys_taylori'
      id_CoL = '119f02f437c221d7b96ac293480559c4';
      id_Taxo = '62291'; 
      id_EoL = '328451';  
      id_AnAge = taxon;
      id_MSW3 = '13000380';
      id_ADW = ''; % not present at 2017/12/31 
       
    case 'Neotoma_floridana'
      id_CoL = '8d1b8e42c5c97c5f37d5dd0f9650a064';
      id_Taxo = '62330'; 
      id_EoL = '3892960';  
      id_AnAge = taxon;
      id_MSW3 = '13000412';
       
    case 'Neotoma_albigula'
      id_CoL = '876c7c8f0ca8e25508dd23af0babd70a';
      id_Taxo = '62327'; 
      id_EoL = '328452';  
      id_AnAge = taxon;
      id_MSW3 = '13000404';
       
    case 'Neotoma_micropus'
      id_CoL = '1473720c3f038495087fadd81791318d';
      id_Taxo = '88839'; 
      id_EoL = '328458';  
      id_AnAge = taxon;
      id_MSW3 = '13000421';
       
    case 'Neotoma_lepida'
      id_CoL = '9491a681ea620f25e65db83e1202ceab';
      id_Taxo = '88836'; 
      id_EoL = '328456';  
      id_AnAge = taxon;
      id_MSW3 = '13000415';
       
    case 'Neotoma_cinerea'
      id_CoL = '608e552f1c2316a8d594c4429ca369a6';
      id_Taxo = '62328'; 
      id_EoL = '328453';  
      id_AnAge = taxon;
      id_MSW3 = '13000410';
       
    case 'Peromyscus_polionotus'
      id_CoL = '15b221fdbebfa8b0e0e7d1bb13d9924f';
      id_Taxo = '62388'; 
      id_EoL = '1037783';  
      id_AnAge = taxon;
      id_MSW3 = '13000479';
       
    case 'Peromyscus_leucopus'
      id_CoL = '02b3c54a7f685e8420207c4b11b2a6d5';
      id_Taxo = '62374'; 
      id_EoL = '310653';  
      id_AnAge = taxon;
      id_MSW3 = '13000461';
       
    case 'Peromyscus_californicus'
      id_CoL = '5d17e90adf113cac19f513b7d340ef98';
      id_Taxo = '62368'; 
      id_EoL = '310823';  
      id_AnAge = taxon;
      id_MSW3 = '13000442';
       
    case 'Peromyscus_truei'
      id_CoL = 'bd8ef55242df20a8d735f6f7ede694bb';
      id_Taxo = '62391'; 
      id_EoL = '1037784';  
      id_AnAge = taxon;
      id_MSW3 = '13000489';
       
    case 'Peromyscus_crinitus'
      id_CoL = 'ca313224391ef343065e2059613c7543';
      id_Taxo = '62369'; 
      id_EoL = '313664';  
      id_AnAge = taxon;
      id_MSW3 = '13000444';
       
    case 'Onychomys_torridus'
      id_CoL = 'b8788f974cc0554690c6bbff97a16833';
      id_Taxo = '62349'; 
      id_EoL = '328464';  
      id_AnAge = taxon;
      id_MSW3 = '13000433';
       
    case 'Onychomys_leucogaster'
      id_CoL = '4616a5efba30ea103cb36172cda2ddbb';
      id_Taxo = '62346'; 
      id_EoL = '42347';  
      id_AnAge = taxon;
      id_MSW3 = '13000432';
       
    case 'Sigmodon_hispidus'
      id_CoL = '032d1817b74afd0b3f98ef6ec6bfa2bb';
      id_Taxo = '62413';      
      id_EoL = '328441';     
      id_AnAge = taxon;
      id_MSW3 = '13000917';
       
    case 'Otonyctomys_hatti'
      id_CoL = 'bec50c34d9c15688a3a32b28e953d479';
      id_Taxo = '88621';      
      id_EoL = '1180027';     
      id_AnAge = ''; % not present at 2017/12/25
      id_MSW3 = '13000984';
       
    case 'Nyctomys_sumichrasti'
      id_CoL = 'af95ac28d238593f34e5e40be71766d7';
      id_Taxo = '88620';      
      id_EoL = '1179963';     
      id_AnAge = taxon; 
      id_MSW3 = '13000982';
      id_ADW = ''; % not present at 2018/01/02
       
    case 'Tylomys_nudicaudus'
      id_CoL = 'abd4a69c940ac7edcb25b9c9e8b49413';
      id_Taxo = '88614';      
      id_EoL = '1180172';     
      id_AnAge = taxon; 
      id_MSW3 = '13000991';
       
    case 'Acomys_cahirinus'
      id_CoL = '5c3b33a388f9b15b2cc0f171852181fe';
      id_Taxo = '62902';        
      id_EoL = '1037942';
      id_AnAge = taxon;
      id_MSW3 = '13001002';
       
    case 'Meriones_unguiculatus'
      id_CoL = 'ce4af97516c27964f9650c4995810324';
      id_Taxo = '62832';        
      id_EoL = '1179766';
      id_AnAge = taxon;
      id_MSW3 = '13001155';
       
    case 'Meriones_libycus'
      id_CoL = '23309a6d2661c7bd164aa2bfb0481eb3';
      id_Taxo = '62822';        
      id_EoL = '1179758';
      id_AnAge = taxon;
      id_MSW3 = '13001147';
       
    case 'Meriones_shawi'
      id_CoL = '5ebce5881048ad6602ac0507caf0d446';
      id_Taxo = '62829';        
      id_EoL = '1179763';
      id_AnAge = taxon;
      id_MSW3 = '13001147';
       
    case 'Psammomys_obesus'
      id_CoL = 'fd682d424f1c84a57606aaf97701f48b';
      id_Taxo = '62839';        
      id_EoL = '1179772';
      id_AnAge = taxon;
      id_MSW3 = '13001163';
       
    case 'Gerbillus_pyramidum'
      id_CoL = '44ca94c1289f5fc4ed76824194176ea8';
      id_Taxo = '62814';        
      id_EoL = '1179741';
      id_AnAge = taxon;
      id_MSW3 = '13001130';
       
    case 'Micaelamys_namaquensis'
      id_CoL = 'd00a0572f2a845a4d3cc3543f8816523';
      id_Taxo = '62907';  % present as Aethomys namaquensis 2018/01/02       
      id_EoL = '1178645'; % present as Aethomys namaquensis 2018/01/02 
      id_AnAge = taxon;
      id_MSW3 = '13001524';
      id_Wiki = 'Aethomys_namaquensis';
       
    case 'Mus_musculus'
      id_CoL = '8fb9683c27c3f939a62710d716994ad3';
      id_Taxo = '63058';        
      id_EoL = '328450';
      id_AnAge = taxon;
      id_MSW3 = '13001562';
       
    case 'Praomys_tullbergi'
      id_CoL = '4fa1fb7d2d166432fa1cc84726d881f9';
      id_Taxo = '63110'; 
      id_EoL = '1179330';
      id_AnAge = taxon; 
      id_MSW3 = '13001693';
       
    case 'Rattus_norvegicus'
      id_CoL = '58d474ec035208b2194df25dde8f9259';
      id_Taxo = '63135';        
      id_EoL = '328448';
      id_AnAge = taxon;
      id_MSW3 = '13001766';
       
    case 'Rattus_norvegicus_Wistar'
      id_CoL = '58d474ec035208b2194df25dde8f9259';
      id_Taxo = '63135';        
      id_EoL = '328448';
      id_AnAge = taxon;
      id_MSW3 = '13001766';
       
    case 'Rattus_lutreolus'
      id_CoL = '19ef5909586d13d713d15cba40d7b422';
      id_Taxo = '63130';        
      id_EoL = '1179381';
      id_AnAge = taxon;
      id_MSW3 = '13001755';
       
    case 'Rattus_fuscipes'
      id_CoL = 'a58656e82babfcacc75bde2621ab0e66';
      id_Taxo = '63127';        
      id_EoL = '1179370';
      id_AnAge = taxon;
      id_MSW3 = '13001744';
       
    case 'Rattus_exulans'
      id_CoL = '74f0af5f2df65835ee9b991847f4fad4';
      id_Taxo = '63125';        
      id_EoL = '328449';
      id_AnAge = ''; % not present 2018/10/26
      id_MSW3 = '13001742';
       
    case 'Apodemus_sylvaticus'
      id_CoL = 'aaeda2082619f754c1fd3debd9bddbc0';
      id_Taxo = '167367';   
      id_EoL = '1178950';
      id_AnAge = taxon; 
      id_MSW3 = '13001221';
       
    case 'Apodemus_speciosus'
      id_CoL = '9227237b727b45659a549bd98af5c6cd';
      id_Taxo = '62924';   
      id_EoL = '1178949';
      id_AnAge = taxon; 
      id_MSW3 = '13001220';
       
    case 'Apodemus_agrarius'
      id_CoL = '881148241e8f1327aa73a5509759183f';
      id_Taxo = '62911';
      id_EoL = '1178729';
      id_AnAge = taxon; 
      id_MSW3 = '13001204';
       
    case 'Apodemus_semotus'
      id_CoL = '0b938bb38dd7de0b8c0ca769affddbd0';
      id_Taxo = '62923';
      id_EoL = '1178948';
      id_AnAge = taxon; 
      id_MSW3 = '13001219';
       
    case 'Apodemus_flavicollis'
      id_CoL = '0c8e6533fe4b4e6d0d4320cd4a4987cf';
      id_Taxo = '167365';
      id_EoL = '1178939';
      id_AnAge = taxon; 
      id_MSW3 = '13001210';
      id_ADW = ''; % not present at 2018/01/01
       
    case 'Chiropodomys_gliroides'
      id_CoL = '4fa238946382b63d9d4d55b59145c290';
      id_Taxo = '63224';
      id_EoL = '1179033';
      id_AnAge = taxon; 
      id_MSW3 = '13001277';
      id_ADW = ''; % not presetn at 2018/01/01
       
    case 'Hydromys_chrysogaster'
      id_CoL = '8fbe6cacb33128464db7383604d22f4a';
      id_Taxo = '63239';
      id_EoL = '1179099';
      id_AnAge = taxon; 
      id_MSW3 = '13001380s';
       
    case 'Notomys_alexis'
      id_CoL = 'cf09c16836cf5dadb18a38a593de0b5d';
      id_Taxo = '63088';
      id_EoL = '1179286';
      id_AnAge = taxon; 
      id_MSW3 = '13001619';
       
    case 'Arvicanthis_niloticus'
      id_CoL = '4d1ed15483c94551e0778524e5c884d5';
      id_Taxo = '62941'; 
      id_EoL = '1179006';
      id_AnAge = taxon; 
      id_MSW3 = '13001243';
       
    case 'Lemniscomys_striatus'
      id_CoL = '821498466f66f8a64b9ac2a6c9abd5af';
      id_Taxo = '63002'; 
      id_EoL = '1179127';
      id_AnAge = taxon; 
      id_MSW3 = '13001416';
       
    case 'Rhabdomys_pumilio'
      id_CoL = '3ed0f1ceaa91616fafdbd70905cd6479';
      id_Taxo = '63188'; 
      id_EoL = '1179410';
      id_AnAge = taxon; 
      id_MSW3 = '13001796';
      id_ADW = ''; % not present at 2017/12/30
       
    case 'Pseudomys_australis'
      id_CoL = '39847b8a929899b28b2ed1c4086ee9ac';
      id_Taxo = '62112'; 
      id_EoL = '1179335';
      id_AnAge = taxon; 
      id_MSW3 = '13001705';
       
    case 'Otomys_irroratus'
      id_CoL = '225b54b66948f4e9365e70906d9eda5c';
      id_Taxo = '62559'; 
      id_EoL = '1179573';
      id_AnAge = taxon; 
      id_MSW3 = '13001898';
       
    case 'Parotomys_brantsii'
      id_CoL = '5d900a29b7a191aadb0b8b7e4d091115';
      id_Taxo = '88886'; 
      id_EoL = '1179582';
      id_AnAge = ''; % not present 2018/10/30 
      id_MSW3 = '13001910';
       
    case 'Aethomys_hindei'
      id_CoL = 'ae68d55880bf8e910833b05a4f5fade1';
      id_Taxo = '89245'; 
      id_EoL = '1178643';
      id_AnAge = ''; % not present 2018/11/03 
      id_MSW3 = '13001192';
       
    case 'Mystromys_albicaudatus'
      id_CoL = '5e75183bc5d98e04c6fd26eb29e5219f';
      id_Taxo = '62552'; 
      id_EoL = '1179534';
      id_AnAge = taxon; 
      id_MSW3 = '13000113';
       
    case 'Oryctolagus_cuniculus'
      id_CoL = '0488cb00ad3e3545c4c28f8feaf747e0';
      id_Taxo = '61547';        
      id_EoL = '327977';
      id_AnAge = 'Oryctolagus_cuniculus';
      id_MSW3 = '13500254';
       
    case 'Oryctolagus_cuniculus_NZW'
      id_CoL = '0488cb00ad3e3545c4c28f8feaf747e0';
      id_Taxo = '61547';        
      id_EoL = '327977';
      id_AnAge = 'Oryctolagus_cuniculus';
      id_MSW3 = '13500254';
       
    case 'Lepus_europaeus'
      id_CoL = '2c10e1e11456722cf2f9741fec368a71';
      id_Taxo = '61511';        
      id_EoL = '118009';
      id_AnAge = taxon;
      id_MSW3 = '13500156';
       
    case 'Lepus_timidus'
      id_CoL = '019b4ba00fd3186934b195fc5299fc35';
      id_Taxo = '61531';        
      id_EoL = '133022';
      id_AnAge = taxon;
      id_MSW3 = '13500221';
       
    case 'Lepus_townsendii'
      id_CoL = '9ba228636f3424d649c1a984684238f2';
      id_Taxo = '93420';        
      id_EoL = '327968';
      id_AnAge = taxon;
      id_MSW3 = '13500246';
       
    case 'Lepus_capensis'
      id_CoL = 'fa486ea65739dbe3466bd630a8ba440b';
      id_Taxo = '61504';        
      id_EoL = '327967';
      id_AnAge = taxon;
      id_MSW3 = '13500139';
       
    case 'Sylvilagus_floridanus'
      id_CoL = 'ff8d8da834ed4f8cd07704d7c882c84b';
      id_Taxo = '61567';        
      id_EoL = '976910';
      id_AnAge = taxon;
      id_MSW3 = '13500330';
       
    case 'Ochotona_princeps'
      id_CoL = 'dab9df0f5ba85e77a043c3c9cb2da9e2';
      id_Taxo = '61458';        
      id_EoL = '133021';
      id_AnAge = taxon;
      id_MSW3 = '13500064';
       
    case 'Tupaia_glis'
      id_CoL = '597342aa9ef1ce5b5f9208b80f34e2ec';
      id_Taxo = '61384';        
      id_EoL = '327851';
      id_AnAge = taxon;
      id_MSW3 = '11900016';
       
    case 'Tupaia_belangeri'
      id_CoL = '9f6a4502634a7f2d0e4ebb99bb921068';
      id_Taxo = '61380';        
      id_EoL = '289557';
      id_AnAge = taxon;
      id_MSW3 = '11900011';
       
    case 'Galeopterus_variegatus'
      id_CoL = '4dcbb7c6e643932361541981ae29374b';
      id_Taxo = '1003254';        
      id_EoL = '1040858';
      id_AnAge = ''; % not present 2017/06/18
      id_MSW3 = '12000006';
       
    case 'Daubentonia_madagascariensis'
      id_CoL = '429cae10b932f86ee7eed6bb5e0f5c07';
      id_Taxo = '65533';        
      id_EoL = '324407';
      id_AnAge = taxon;
      id_MSW3 = '12100099';
       
    case 'Propithecus_diadema'
      id_CoL = 'b47ac2b3bb8803cc4e9873df0daf620e';
      id_Taxo = '65520';        
      id_EoL = '326457';
      id_AnAge = taxon;
      id_MSW3 = '12100089';
       
    case 'Propithecus_tattersalli'
      id_CoL = 'bcaf138ec9ec5d8c920ef4d316bdbecb';
      id_Taxo = '65524';        
      id_EoL = '326523';
      id_AnAge = taxon;
      id_MSW3 = '12100094';
       
    case 'Microcebus_murinus'
      id_CoL = 'fed2451960a842ce940ad5d48d81d81c';
      id_Taxo = '65426';        
      id_EoL = '324404';
      id_AnAge = taxon;
      id_MSW3 = '12100019';
       
    case 'Lepilemur_mustelinus'
      id_CoL = 'e8bfdcc70cea2d77b9b54a143392afc8';
      id_Taxo = '65477';        
      id_EoL = '326545';
      id_AnAge = taxon;
      id_MSW3 = '12100072';
       
    case 'Hapalemur_alaotrensis'
      id_CoL = '20d8a3172bc2fe9b9f839a0bc7ce2252';
      id_Taxo = '1003272';        
      id_EoL = '4454348';
      id_AnAge = taxon;
      id_MSW3 = '12100049';
       
    case 'Varecia_variegata'
      id_CoL = 'c8883cad4f1b3301686bf6ad91663991';
      id_Taxo = '65502';        
      id_EoL = '326534';
      id_AnAge = taxon;
      id_MSW3 = '12100061';
       
    case 'Nycticebus_coucang'
      id_CoL = '3cbe6f36284dc50c72e4dd60e01eade9';
      id_Taxo = '65545';        
      id_EoL = '326538';
      id_AnAge = taxon;
      id_MSW3 = '12100114';
       
    case 'Nycticebus_pygmaeus'
      id_CoL = 'bd143782fe2e7646c4a2d374b07ba6b8';
      id_Taxo = '65546';        
      id_EoL = '326539';
      id_AnAge = taxon;
      id_MSW3 = '12100118';
      
     case 'Perodicticus_potto'
      id_CoL = 'b1698df810567be01d469d5105920a08';
      id_Taxo = '65548';        
      id_EoL = '326540';
      id_AnAge = taxon;
      id_MSW3 = '12100120';
       
    case 'Loris_tardigradus'
      id_CoL = 'ef762a80ccc68823da1b199ae0301698';
      id_Taxo = '65539';        
      id_EoL = '326537';
      id_AnAge = taxon;
      id_MSW3 = '12100111';
       
    case 'Galago_senegalensis'
      id_CoL = '189e447f4b853cd7858295feb0c3f7b2';
      id_Taxo = '65569';        
      id_EoL = '311208';
      id_AnAge = taxon;
      id_MSW3 = '12100144';
       
    case 'Tarsius_tarsier'
      id_CoL = '363ad8f84b1e80546fe32ad936b16e48';
      id_Taxo = '1003327';        
      id_EoL = '46326375'; % cripple entry
      id_AnAge = 'Tarsius_spectrum';
      id_MSW3 = '12100176';
       
    case 'Carlito_syrichta'
      id_CoL = '25c88cc21071fd50bf7dbf6e5b806394';
      id_Taxo = '65621';        
      id_EoL = '126789'; 
      id_AnAge = taxon;
      id_MSW3 = '12100175';
       
    case 'Callithrix_pygmaea'
      id_CoL = 'd19f292374779e32b7ebc28a2c57d829';
      id_Taxo = '167532';        
      id_EoL = '323892';
      id_AnAge = taxon;
      id_MSW3 = '12100206';
       
    case 'Callithrix_jacchus'
      id_CoL = '62c40d93ae8fa0246b8a98d2e750ecd6';
      id_Taxo = '65645';        
      id_EoL = '323890';
      id_AnAge = taxon;
      id_MSW3 = '12100197';
       
    case 'Leontopithecus_rosalia'
      id_CoL = '34fc90bc0247a67e5691c7c947624599';
      id_Taxo = '65681';        
      id_EoL = '323897';
      id_AnAge = taxon;
      id_MSW3 = '12100214';
       
    case 'Aotus_trivirgatus'
      id_CoL = '1dd3fb0f05b62d171f7075d02a6f0478';
      id_Taxo = '65786';        
      id_EoL = '323931';
      id_AnAge = taxon;
      id_MSW3 = '12100313';
       
    case 'Pithecia_pithecia'
      id_CoL = 'ce9ff31788b98d22457a487c405ef871';
      id_Taxo = '65836';        
      id_EoL = '1010797';
      id_AnAge = taxon;
      id_MSW3 = '12100369';
       
    case 'Pithecia_monachus'
      id_CoL = 'c4b3eb7d5513d542ac109ed7cc6b238d';
      id_Taxo = '65835';        
      id_EoL = '1010832';
      id_AnAge = taxon;
      id_MSW3 = '12100366';
      id_ADW = ''; % not present at 2018/08/31
      
    case 'Cebus_capucinus'
      id_CoL = '0b4728552da36e92bba7b084a347127a';
      id_Taxo = '65749';        
      id_EoL = '323944';
      id_AnAge = taxon;
      id_MSW3 = '12100270';
       
    case 'Saimiri_sciureus'
      id_CoL = '8d7ee32920698d3911260b9a6a3ee269';
      id_Taxo = '65765';        
      id_EoL = '327956';
      id_AnAge = taxon;
      id_MSW3 = '12100291';
       
    case 'Ateles_geoffroyi'
      id_CoL = 'd184718db081d387d0269dc1262c766c';
      id_Taxo = '65860';        
      id_EoL = '323938';
      id_AnAge = taxon;
      id_MSW3 = '12100399';
       
   case 'Ateles_paniscus'
      id_CoL = 'a374189736a8a040793f9ff7e618efa2';
      id_Taxo = '65865';        
      id_EoL = '323933';
      id_AnAge = taxon;
      id_MSW3 = '12100407';
      
    case 'Alouatta_palliata'
      id_CoL = '06bc9289566826026b931f3c8667a0c2';
      id_Taxo = '65846';        
      id_EoL = '323919';
      id_AnAge = taxon;
      id_MSW3 = '12100385';
       
    case 'Lagothrix_lagothricha'
      id_CoL = 'c34625c16245785ce9b441b53e92475a';
      id_Taxo = '107088';        
      id_EoL = '323940';
      id_AnAge = taxon;
      id_MSW3 = '12100415';
       
    case 'Chlorocebus_aethiops'
      id_CoL = '76233bc1b7b6845442a6b98f93ac8124';
      id_Taxo = '167692';        
      id_EoL = '1037707';
      id_AnAge = taxon;
      id_MSW3 = '12100505';
       
    case 'Mandrillus_sphinx'
      id_CoL = '0664cb4a959840783ea73da95f43faea';
      id_Taxo = '65973';        
      id_EoL = '128436';
      id_AnAge = taxon;
      id_MSW3 = '12100576';
       
    case 'Papio_hamadryas'
      id_CoL = 'e54f36089676e764bb7e9f7481e21548';
      id_Taxo = '168632';        
      id_EoL = '310920';
      id_AnAge = taxon;
      id_MSW3 = '12100586';
       
    case 'Nasalis_larvatus'
      id_CoL = '627feeca55633fa8364d77479cf765a8';
      id_Taxo = '66088';        
      id_EoL = '310436';
      id_AnAge = taxon;
      id_MSW3 = '12100619';
       
    case 'Macaca_fascicularis'
      id_CoL = 'e892cc0e528de9a28fa926f75f5f3eeb';
      id_Taxo = '168592';        
      id_EoL = '46326393'; % cripple entry
      id_AnAge = taxon;
      id_MSW3 = '12100534';
       
    case 'Macaca_mulatta'
      id_CoL = '8302d6488dd331326b175296ccfbab12';
      id_Taxo = '168596';        
      id_EoL = '327960';
      id_AnAge = taxon;
      id_MSW3 = '12100551';
       
    case 'Macaca_fuscata'
      id_CoL = '061be7de98f5e928f0094eab26c73b82';
      id_Taxo = '168593';        
      id_EoL = '1037940';
      id_AnAge = taxon;
      id_MSW3 = '12100545';
       
    case 'Hylobates_lar'
      id_CoL = 'b567774eedd1fd38ce9a26e2fddfc628';
      id_Taxo = '66187';        
      id_EoL = '127643';
      id_AnAge = taxon;
      id_MSW3 = '12100761';
       
    case 'Symphalangus_syndactylus'
      id_CoL = 'df178ac7151d370e79a86ffac7daed45';
      id_Taxo = '66199';        
      id_EoL = '1038643'; % unaccepted, to Hylobates syndactylus
      id_AnAge = 'Hylobates_syndactylus';
      id_MSW3 = '12100785';
       
    case 'Pongo_pygmaeus'
      id_CoL = 'e2a643310fdb74fc698ec526f5852f93';
      id_Taxo = '66224';        
      id_EoL = '326450';
      id_AnAge = taxon;
      id_MSW3 = '12100805';
       
    case 'Gorilla_gorilla'
      id_CoL = '3525cf79aa420809edb33c4b6dd8601a';
      id_Taxo = '66213';        
      id_EoL = '326447';
      id_AnAge = taxon;
      id_MSW3 = '12100791';
       
    case 'Pan_troglodytes'
      id_CoL = '86b444a39d077c4e99f876aa5e8481df';
      id_Taxo = '66219';        
      id_EoL = '326449';
      id_AnAge = taxon;
      id_MSW3 = '12100798';
       
    case 'Homo_sapiens'
      id_CoL = 'e3b90576561f93a8ac8b59e185b01511';
      id_Taxo = '66295';        
      id_EoL = '327955';
      id_AnAge = taxon;
      id_MSW3 = '12100795';
       
    otherwise % set default filled id's on empty
      id_Wiki = '';
      id_ADW = '';
  end

  % compose (n,2) cell-array with links and descriptions
  links = { ...
  % general links
  ['http://www.catalogueoflife.org/col/details/species/id/', id_CoL], 'Cat of Life';  
  ['http://eol.org/pages/', id_EoL], 'Ency of Life';
  ['http://en.wikipedia.org/wiki/', id_Wiki], 'Wikipedia';
  ['http://animaldiversity.org/accounts/', id_ADW], 'ADW';
  ['http://taxonomicon.taxonomy.nl/TaxonTree.aspx?id=', id_Taxo], 'Taxonomicon';
  ['http://marinespecies.org/aphia.php?p=taxdetails&id=', id_WoRMS], 'WoRMS';
  % taxon-specific links
  ['http://www.molluscabase.org/aphia.php?p=taxdetails&id=', id_molluscabase], 'MolluscaBase';
  ['http://www.fishbase.org/summary/', id_fishbase], 'fishbase';
  ['http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=', id_amphweb], 'Amphibiaweb';
  ['http://reptile-database.reptarium.cz/species?', id_ReptileDB], 'ReptileDB';
  ['https://avibase.bsc-eoc.org/species.jsp?lang=EN&avibaseid=', id_avibase], 'Avibase';
  ['http://datazone.birdlife.org/species/factsheet/', id_birdlife], 'Birdlife';
  ['https://www.departments.bucknell.edu/biology/resources/msw3/browse.asp?s=y&id=', id_MSW3], 'Mammal Spec World';
  ['http://genomics.senescence.info/species/entry.php?species=', id_AnAge], 'AnAge'};
  % remove empty links
  links = links(~cellfun(@isempty, { ...
    id_CoL, id_EoL, id_Wiki, id_ADW, id_Taxo, id_WoRMS, ...                                                  % general/animal web sites
    id_molluscabase, id_fishbase, id_amphweb, id_ReptileDB, id_avibase, id_birdlife, id_MSW3, id_AnAge}),:); % taxon web sites
  n_links = size(links,1); 
  
  if n_links == 0
    fprintf(['warning from get_link for ', taxon, ': no links specified\n']);
  elseif exist('open', 'var') && open == true % open web sites
    for i= 1:n_links 
      web(links{i,1},'-browser');
    end
  end
    
