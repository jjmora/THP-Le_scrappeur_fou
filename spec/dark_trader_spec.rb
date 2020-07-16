require_relative '../lib/dark_trader'

describe 'the check_get_hash_one_crypto method' do
  it 'should return true for both values of the hash' do
    #1) le fonctionnement de base de ton programme (pas d'erreur ni de retour vide)
    expect(check_get_hash_one_crypto()).to eq([true, true])
  end

  it 'check the size of the hash for one crypto' do
    expect(check_if_name_exists('Bitcoin')).to eq(['Bitcoin'])
  end

  it 'check the size of the hash for one crypto' do
    expect(check_if_value_exists('Bitcoin')).to eq(true)
  end

  it 'should return the number of cryptos finded within the cryptos given' do 
    expect(check_if_cryptos('Bitcoin', 'Ethereum','XRP', 50)).to eq(3)
  end
end
