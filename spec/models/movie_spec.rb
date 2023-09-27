# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe 'validations' do
    let(:valid_movie) { Movie.new(name: 'Iron Man', release_date: '02/05/2008') }
    let(:existing_movie_name) { Movie.new(name: 'Iron Man', release_date: '12/09/2008') }
    let(:invalid_movie_name) { Movie.new(name: nil, release_date: '02/05/2008') }
    let(:invalid_release_date) { Movie.new(name: 'Iron Man', release_date: nil) }

    context 'valid' do
      it 'with valid attributes' do
        expect(valid_movie).to be_valid
      end
    end
    context 'invalid' do
      it 'without a name' do
        expect(invalid_movie_name).not_to be_valid
      end
      it 'without a release date' do
        expect(invalid_release_date).not_to be_valid
      end
      it 'with an existing movie name' do
        valid_movie.save
        expect { existing_movie_name.save! }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
