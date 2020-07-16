require_relative '../lib/get_email'

describe "the get_townhall_email method" do
  it "should" do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/amenucourt.html")).to eq('mairie.amenucourt@wanadoo.fr')
  end

  it "should " do
    expect(get_townhall_email("https://www.annuaire-des-mairies.com/95/seraincourt.html")).to eq('mairie.seraincourt95@wanadoo.fr')
  end
end

# describe "the  method" do
#   it "should" do
#     expect(met()).to eq()
#   end

#   it "should " do
#     expect(met()).to eq()
#   end
# end