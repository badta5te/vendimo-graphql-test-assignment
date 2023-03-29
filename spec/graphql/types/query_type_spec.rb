# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'properties' do
    context 'list of properties' do
      let!(:properties) { create_pair(:property) }

      let(:query) do
        %(query {
        properties {
          id
          propertyType
        }
      })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns all properties' do
        expect(result.dig('data', 'properties')).to match_array(
          properties.map do |property|
            { 'id' => property.id.to_s,
              'propertyType' => property.property_type }
          end
        )
      end
    end

    context 'query specific property' do
      let!(:property) { create(:property) }

      let(:query) do
        %(query {
          property(id: #{property.id}) {
            id
            address
          }
        })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns property by id' do
        expect(result.dig('data', 'property')).to eql(
          { 'id' => property.id.to_s, 'address' => property.address }
        )
      end
    end

    context 'mutations of properties' do
      context 'create property' do
        let(:query) do
          %(mutation {
            createProperty(
              input: {
                address: "fake address",
                propertyType: "flat",
                size: 500.5,
                bedrooms: 5,
              }
            ) {
              property {
                id
                address
                size
              }
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'create property' do
          expect(result.dig('data', 'createProperty', 'property')).to(eql(
                                                                        { 'id' => '1',
                                                                          'address' => 'fake address',
                                                                          'size' => 500.5 }
                                                                      ))
        end

        it 'increase number of properties by 1' do
          expect { request }.to change { Property.count }.by(1)
        end
      end

      context 'destroy property' do
        let!(:property) { create(:property) }

        let(:query) do
          %(mutation {
            destroyProperty(input: {
              id: #{property.id}
            }) {
              id
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'destroy property' do
          expect(result.dig('data', 'destroyProperty')).to eql({ 'id' => property.id.to_s })
        end

        it 'decrease number of properties by 1' do
          expect { request }.to change { Property.count }.by(-1)
        end
      end
    end
  end

  describe 'valuations' do
    context 'list of valuations' do
      let!(:valuations) { create_pair(:valuation) }

      let(:query) do
        %(query {
          valuations {
            id
            value
            property {
              id
            }
          }
        })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns all valuations' do
        expect(result.dig('data', 'valuations')).to match_array(
          valuations.map do |valuation|
            { 'id' => valuation.id.to_s,
              'value' => valuation.value,
              'property' => { 'id' => valuation.property.id.to_s } }
          end
        )
      end
    end

    context 'query specific valuation' do
      let!(:valuation) { create(:valuation) }

      let(:query) do
        %(query {
          valuation(id: #{valuation.id}) {
            id
            value
            evaluator
            property {
              id
            }
          }
        })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns valuation by id' do
        expect(result.dig('data', 'valuation')).to eql(
          { 'id' => valuation.id.to_s,
            'value' => valuation.value,
            'evaluator' => valuation.evaluator,
            'property' => {
              'id' => valuation.property.id.to_s
            } }
        )
      end
    end

    context 'mutations of valuations' do
      context 'create valuation' do
        let!(:property) { create(:property) }

        let(:query) do
          %(mutation {
            createValuation(
              input: {
                date: "2023-08-23",
                value: 300.5,
                currency: "USD",
                evaluator: "random evaluator",
                propertyId: #{property.id}
              }
            ) {
              valuation {
                id
                value
                property {
                  id
                }
              }
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'create valuation' do
          expect(result.dig('data', 'createValuation', 'valuation')).to(eql(
                                                                          { 'id' => '1',
                                                                            'value' => 300.5,
                                                                            'property' => {
                                                                              'id' => property.id.to_s
                                                                            } }
                                                                        ))
        end

        it 'increase number of valuations by 1' do
          expect { request }.to change { Valuation.count }.by(1)
        end
      end

      context 'destroy valuation' do
        let!(:valuation) { create(:valuation) }

        let(:query) do
          %(mutation {
            destroyValuation(input: {
              id: #{valuation.id}
            }) {
              id
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'destroy valuation' do
          expect(result.dig('data', 'destroyValuation')).to eql({ 'id' => valuation.id.to_s })
        end

        it 'decrease number of valuations by 1' do
          expect { request }.to change { Valuation.count }.by(-1)
        end
      end
    end
  end

  describe 'furnishings' do
    context 'list of furnishings' do
      let!(:furnishings) { create_pair(:furnishing) }

      let(:query) do
        %(query {
          furnishings {
            id
            name
            quantity
            property {
              id
            }
          }
        })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns all furnishings' do
        expect(result.dig('data', 'furnishings')).to match_array(
          furnishings.map do |furnishing|
            { 'id' => furnishing.id.to_s,
              'name' => furnishing.name,
              'quantity' => furnishing.quantity,
              'property' => { 'id' => furnishing.property.id.to_s } }
          end
        )
      end
    end

    context 'query specific furnishing' do
      let!(:furnishing) { create(:furnishing) }

      let(:query) do
        %(query {
          furnishing(id: #{furnishing.id}) {
            id
            name
            color
            property {
              id
            }
          }
        })
      end

      subject(:result) do
        VendimoGraphqlSchema.execute(query).as_json
      end

      it 'returns furnishing by id' do
        expect(result.dig('data', 'furnishing')).to eql(
          { 'id' => furnishing.id.to_s,
            'name' => furnishing.name,
            'color' => furnishing.color,
            'property' => {
              'id' => furnishing.property.id.to_s
            } }
        )
      end
    end

    context 'mutations of furnishings' do
      context 'create furnishing' do
        let!(:property) { create(:property) }

        let(:query) do
          %(mutation {
            createFurnishing(
              input: {
                color: "brown",
                condition: "new",
                name: "random name",
                quantity: 4,
                propertyId: #{property.id}
              }
            ) {
              furnishing {
                id
                color
                property {
                  id
                }
              }
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'create furnishing' do
          expect(result.dig('data', 'createFurnishing', 'furnishing')).to(eql(
                                                                            { 'id' => '1',
                                                                              'color' => 'brown',
                                                                              'property' => {
                                                                                'id' => property.id.to_s
                                                                              } }
                                                                          ))
        end

        it 'increase number of furnishings by 1' do
          expect { request }.to change { Furnishing.count }.by(1)
        end
      end

      context 'destroy furnishing' do
        let!(:furnishing) { create(:furnishing) }

        let(:query) do
          %(mutation {
            destroyFurnishing(input: {
              id: #{furnishing.id}
            }) {
              id
            }
          })
        end

        subject(:result) do
          VendimoGraphqlSchema.execute(query).as_json
        end
        subject(:request) do
          VendimoGraphqlSchema.execute(query)
        end

        it 'destroy furnishing' do
          expect(result.dig('data', 'destroyFurnishing')).to eql({ 'id' => furnishing.id.to_s })
        end

        it 'decrease number of furnishings by 1' do
          expect { request }.to change { Furnishing.count }.by(-1)
        end
      end
    end
  end
end
