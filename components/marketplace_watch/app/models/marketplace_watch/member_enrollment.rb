module MarketplaceWatch
  class MemberEnrollment
    include Mongoid::Document
    include Mongoid::Timestamps

    field :sponsor_legal_name,				type: String
    field :sponsor_hbx_id,						type: String
    field :sponsor_fein,							type: String

    field :sponsor_id,								type: BSON::ObjectId
    field :profile_id,								type: BSON::ObjectId
    field :application_id,						type: BSON::ObjectId
    field :predecessor_id, 						type: BSON::ObjectId
    field :broker_id, 								type: BSON::ObjectId

    field :fte_count, 								type: Integer
    field :pte_count, 								type: Integer
    field :msp_count, 								type: Integer

    field :aasm_state, 								type: Symbol
    field :expiration_date, 					type: Date

    field :recorded_sic_code,       	type: String
		field :recorded_rating_area_id,		type: BSON::ObjectId

    field :effective_period_start_on, type: Date
    field :effective_period_end_on, 	type: Date
    field :open_enrollment_start_on, 	type: Date
    field :open_enrollment_end_on, 		type: Date


  end
end
