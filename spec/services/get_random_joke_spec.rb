require 'rails_helper'
require 'api_helper'

RSpec.describe GetRandomJoke do
  describe 'Try Get a Random Joke about Chuck Norris' do
    it 'expect service return true' do
      expect(GetRandomJoke.call(nil).success?).to be true
    end

    it 'pass category return true' do
      expect(GetRandomJoke.call('dev').success?).to be true
    end

    it 'pass category return errors' do
      expect(GetRandomJoke.call('CategoryNotExists').success?).to be false
    end
  end
end
