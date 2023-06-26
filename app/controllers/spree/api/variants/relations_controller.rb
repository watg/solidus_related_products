# frozen_string_literal: true

module Spree
  module Api
    module Variants
      class RelationsController < Spree::Api::BaseController
        before_action :load_data, only: [:create, :destroy]
        before_action :find_relation, only: [:update, :destroy]

        def create
          authorize! :create, Relation
          @relation = @variant.relations.new(relation_params)
          @relation.relatable = @variant
          @relation.related_to = @relation.relation_type.applies_to
                                          .constantize.find(relation_params[:related_to_id])
          if @relation.save
            render json: @relation.to_json, status: :created
          else
            invalid_resource!(@relation)
          end
        end

        def update
          authorize! :update, Relation
          if @relation.update(relation_params)
            render json: @relation.to_json
          else
            invalid_resource!(@relation)
          end
        end

        def update_positions
          authorize! :update, Relation
          params[:positions].each do |id, index|
            model_class.where(id: id).update_all(position: index)
          end

          respond_to do |format|
            format.json { head :ok }
            format.js { render text: 'Ok' }
          end
        end

        def destroy
          authorize! :destroy, Relation
          @relation.destroy
          respond_with(@relation, status: 204)
        end

        private

        def relation_params
          params.require(:relation).permit(*permitted_attributes)
        end

        def permitted_attributes
          [
            :related_to,
            :relation_type,
            :relatable,
            :related_to_id,
            :quantity,
            :discount_amount,
            :description,
            :relation_type_id,
            :related_to_type,
            :position
          ]
        end

        def load_data
          @variant = Spree::Variant.find(params[:variant_id])
        end

        def find_relation
          @relation = Relation.find(params[:id])
        end

        def model_class
          Spree::Relation
        end
      end
    end
  end
end
