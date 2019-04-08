module MarketplaceWatch
  class SponsorApplication
    include Mongoid::Document
    include Mongoid::Timestamps

    field :organization_id,							type: BSON::ObjectId
    field :sponsor_id,									type: BSON::ObjectId
    field :sponsor_profile_id,					type: BSON::ObjectId
    field :sponsor_legal_name,					type: String
    field :sponsor_hbx_id,							type: String
    field :sponsor_fein,								type: String
		field :sponsor_source_kind,         type: Symbol
		field :sponsor_registered_on,       type: Date
    field :sponsor_aasm_state, 					type: Symbol
    field :sponsor_termination_kind,    type: Symbol
    field :sponsor_termination_reason,	type: Symbol
    field :sponsor_broker_id, 					type: BSON::ObjectId

    field :appl_id,											type: BSON::ObjectId
    field :appl_predecessor_id,					type: BSON::ObjectId

    field :appl_fte_count, 							type: Integer
    field :appl_pte_count, 							type: Integer
    field :appl_msp_count, 							type: Integer

    field :appl_aasm_state, 						type: Symbol
    field :appl_expiration_date, 				type: Date

    field :appl_sic_code,      					type: String
		field :appl_rating_area_id,					type: BSON::ObjectId

    field :appl_eff_period_start_on, 		type: Date
    field :appl_eff_period_end_on, 			type: Date
    field :appl_oe_start_on, 						type: Date
    field :appl_oe_end_on, 							type: Date

    field :appl_created_at, 						type: Date
    field :appl_updated_at, 						type: Date

  end
end
