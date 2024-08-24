% Read data from column A starting from cell A2
rawIds = readtable('FSGData.xlsx', 'ReadVariableNames', false);

% Convert the table to a cell array if needed
ids = table2cell(rawIds(2:end, 1));

% Filter out empty cells
ids = ids(~cellfun('isempty', ids));

% Base URL for API call
baseUrl = 'https://teams.dl.fsg.one/api/v1/logs/';

% Loop through each ID and save the data
for i = 1:length(ids)
    currentID = ids{i};
    url = [baseUrl, currentID, '/file?&max-data-points=100000'];
    
    try
        % Fetch data using webread
        data = webread(url);
        
        % Save the data to a .mat file named after the ID
        saveFilename = [currentID, '.mat'];
        save(saveFilename, 'data');
        
        fprintf('Data for ID %s saved successfully.\n', currentID);
    catch ME
        % Handle any errors during the fetch process
        warning('Failed to retrieve data for ID %s: %s', currentID, ME.message);
    end
end