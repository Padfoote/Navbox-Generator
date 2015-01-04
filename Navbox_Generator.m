%%An attempt to automate navbox creation for the FTB wiki team, created by
%%Padfoote. Hope it helps someone make this process a little bit less
%%painless.

clear all;
clc;

%This will be required for the correct template naming
nameMod = input('Please insert the mod''s name: ', 's');
abrevMod = input('Please insert the mod''s abreviation: ', 's');

%Beginning output for navbox
fprintf('\n{{Navbox\n|title={{L|%s}}\n|name=Navbox %s\n|titlestyle=background:#CCCCCC;\n|groupstyle=background:#DDDDDD;\n|state=collapsed\n\n', nameMod, nameMod);

%This will be required for a loop later to create the navbox groups
numSubGroups = input('Please input the number of navbox subgroups: ');

amountSubGroups = zeros(1:numSubGroups);

%Begin code for middle of navbox
for h = 1:numSubGroups
    numGroups = input('Please input the number of groups for this subgroup: ');
    amountGroups = zeros(1:numGroups);
    nameSubGroups = input('Please insert the name of this subgroup: ', 's');
    
    fprintf('\n|list%i={{Navbox subgroup\n     |title=%s \n     |state={{{state|uncollapsed}}}\n\n', h, nameSubGroups);
    for k = 1:numGroups
        fprintf('Please insert the number of entries for group %i:',k);
        numEntries(k) = input(' ');
        groupEntries = numEntries(k);
        %This is the code to generate the code for each navbox entry
        for j = 1:groupEntries
            if j == 1
                nameGroup = input('Please input the name of the group: ', 's');
                fprintf('Please insert the name of entry #%i:', j);
                nameEntry = input(' ', 's');
                %Output - The spacing makes it readable
                fprintf('\n          |group%i=%s\n', k, nameGroup);
                fprintf('          |list%i={{NI|%s|mod=%s}}{{,}}<!--\n\n', k, nameEntry, abrevMod);
            elseif  j == max(groupEntries)
                fprintf('Please insert the name of entry #%i:', j);
                nameEntry = input(' ', 's');
                %Output - The spacing makes it readable
                fprintf('\n              -->{{NI|%s|mod=%s}}\n}}', nameEntry, abrevMod);
            else
                fprintf('Please insert the name of entry #%i:', j);
                nameEntry = input(' ', 's');
                %Output - The spacing makes it readable
                fprintf('\n              -->{{NI|%s|mod=%s}}{{,}}<!--\n\n', nameEntry, abrevMod);
            end
        end
    end
end
%End output for the navbox
fprintf('}}\n<noinclude>{{Navbox Applied Energistics/doc|the items in the [[%s]] mod}}</noinclude>\n\n', nameMod);

%This is a test output. Remove after completion
%fprintf('Mod: %s. Mod Abrev: %s. Groups: %i. Entries: %i.\n', nameMod, abrevMod, numGroups, numEntries);
