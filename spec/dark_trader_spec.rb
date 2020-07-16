require_relative '../lib/dark_trader'


=begin
a = [
  { "BTC" => 5245.12 },
  { "ETH" => 217.34 }, 
  etc
]


 
2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).

Coinmarketcap
    => nom des crypto 
        Bitcoin = 
          xpath = /html/body/div[1]/div[1]/div[2]/div[1]/div[2]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[2]/div/a
    => leur cours.
=end


describe 'the check_get_hash_one_crypto method' do
  it 'should return the lenght of the hash for ONE cryptocurrency from coinmarketcap' do
    #1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide)
    expect(check_get_hash_one_crypto()).to eq([true, true])
  end

  it 'gets the name and value of the cryptocurrencies from coinmarketcap' do
    #2) que ton programme sort bien un array cohérent (vérifier la présence de 2-3 cryptomonnaies, vérifier que l’array est de taille cohérente, etc.).
    expect(get_crypto_values(2)).to eq([{"Bitcoin"=>"$9,111.85"}, {"Ethereum"=>"$232.40"}])
  end

  it 'should return the number of cryptos finded within the cryptos given' do 
    expect(check_if_cryptos('Bitcoin', 'Ethereum','XRP', 50)).to eq(3)
  end

end
