class PoliticianSerializer < ActiveModel::Serializer
  attributes :id,
    :name,
    :email,
    :legislature,
    :party,
    :birth_date,
    :telephone,
    :photo_url,
    :legislative_experience,
    :location,
    :last_degree_of_studies,
    :district,
    :city,
    :relative_majority,
    :category,
    :social_links
  
  has_one :state
end
