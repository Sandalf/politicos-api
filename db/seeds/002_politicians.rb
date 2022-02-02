require 'json'
POLITICIAN_CATEGORY = {
    senator: 1,
    federal_deputy: 2
}

PARTY = {
    mc: 1,
    morena: 2,
    pan: 3,
    pvem: 4,
    prd: 5,
    pri: 6,
    pt: 7
}

POLITICIAN_RECORD_TYPE = {
    committee_history: 1,
    administrative_history: 2,
    legislative_history: 3,
    political_history: 4,
    academic_history: 5,
    private_experience: 6,
    other_experience: 7,
}

def insert_politicians (data, category)
    data.each do |politician|
        state = State.find_by(name: politician['state'].upcase)
        party = nil

        case politician['party']
            when "MC"
                party = PARTY[:mc]
            when "Morena"
                party = PARTY[:morena]
            when "PAN"
                party = PARTY[:pan]
            when "PVEM"
                party = PARTY[:pvem]
            when "PRD"
                party = PARTY[:prd]
            when "PRI"
                party = PARTY[:pri]
            when "PT"
                party = PARTY[:pt]
        end

        deputy = Politician.create(
            name: politician['name'],
            email: politician['email'],
            legislature: politician['legislature'],
            active: politician['active'],
            party: party,
            birth_date: politician['birth_date'].present? ? politician['birth_date'].to_date : nil,
            telephone: politician['telephone'],
            photo_url: politician['photo_urls'][0],
            legislative_experience: politician['legislative_experience'].present? ? politician['legislative_experience']['es_MX'] : nil,
            swearing_date: politician['swearing_date'],
            academic_preparation: politician['academic_preparation'].present? ? politician['academic_preparation']['es_MX'] : nil,
            location: politician['location'],
            last_degree_of_studies: politician['last_degree_of_studies'].present? ? politician['last_degree_of_studies']['es_MX'] : nil,
            state_id: state.present? ? state.id : nil,
            district: politician['district'],
            city: politician['city'],
            relative_majority: politician['relative_majority'],
            category: category,
            social_links: politician['social_links']
        )

        politician['committee_history'].each do |record|
            description = "#{record['role']['es_MX']} en #{record['name']['es_MX']}"
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_date'].present? ? record['start_date'].to_date : nil,
                end_date: record['end_date'].present? ? record['end_date'].to_date : nil,
                description: description,
                category: POLITICIAN_RECORD_TYPE[:committee_history]
            )
        end

        politician['administrative_history'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:administrative_history]
            )
        end

        politician['legislative_history'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:legislative_history]
            )
        end

        politician['political_history'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:political_history]
            )
        end

        politician['academic_history'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:academic_history]
            )
        end

        politician['private_experience'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:private_experience]
            )
        end

        politician['other_experience'].each do |record|
            PoliticianRecord.create(
                politician_id: deputy.id,
                start_date: record['start_year'].present? ? Date.strptime("01 01 #{record['start_year']}", "%m %d %Y") : nil,
                end_date: record['end_year'].present? ? Date.strptime("12 31 #{record['end_year']}", "%m %d %Y") : nil,
                description: record['description']['es_MX'],
                category: POLITICIAN_RECORD_TYPE[:other_experience]
            )
        end
    end
end

deputies_file = File.read(Rails.root.join('db', 'seeds', 'json', 'deputies.json'))
deputies_data = JSON.parse(deputies_file)

insert_politicians(deputies_data, POLITICIAN_CATEGORY[:federal_deputy])

senators_file = File.read(Rails.root.join('db', 'seeds', 'json', 'senators.json'))
senators_data = JSON.parse(senators_file)

insert_politicians(senators_data, POLITICIAN_CATEGORY[:senator])
