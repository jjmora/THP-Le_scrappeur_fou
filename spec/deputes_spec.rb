require_relative '../lib/deputes'

# describe "the get_list_depute_url method" do
#   it "should" do
#     expect(met()).to eq()
#   end

#   it "should " do
#     expect(met()).to eq()
#   end
# end

describe "the get_data_from_one_depute method" do
  it "should" do
    expect(get_data_from_one_depute("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA605036")).to eq("{'first_name'=>'Damien', 'last_name'=>'Abad', 'email'=>'damien.abad@assemblee-nationale.fr'}")
  end

  it "should" do
    expect(get_data_from_one_depute("http://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA722038")).to eq("'first_name'=>'Damien', 'last_name'=>'Adam', 'email'=>'damien.adam@assemblee-nationale.fr'}")
  end
end

