require 'spec_helper'

describe Representable::Expandable do
  before do
    class Song < OpenStruct
    end
    module SongExpandable
      include Representable::JSON
      include Representable::Expandable
      property :name, expandable: true
      collection :genres, expandable: true
    end
    @song = Song.new(name: 'Summertime', genres: ['jazz', 'classic'])
  end
  context 'property' do
    it 'does not include name when not expanded' do
      response = @song.extend(SongExpandable).to_json
      expect(response).not_to include 'name'
    end

    it 'includes name when expanded' do
      response = @song.extend(SongExpandable).to_json(expand: ['name'])
      expect(response).to include 'name'
    end
  end

  context 'collection' do
    it 'does not include genres when not expanded' do
      response = @song.extend(SongExpandable).to_json
      expect(response).not_to include 'genres'
    end

    it 'includes name when expanded' do
      response = @song.extend(SongExpandable).to_json(expand: ['genres'])
      expect(response).to include 'genres'
    end
  end

  context 'expand list' do
    it 'includes genres and names when both' do
      response = @song.extend(SongExpandable).to_json(expand: ['genres', 'name'])
      expect(response).to include 'genres'
      expect(response).to include 'name'
    end
  end
end
