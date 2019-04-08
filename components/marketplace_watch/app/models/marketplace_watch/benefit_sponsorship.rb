module MarketplaceWatch
  class BenefitSponsorship
    include Mongoid::Document

    store_in collection: 'benefit_sponsors_benefit_sponsorships_benefit_sponsorships'

    field :hbx_id,              type: String
    field :profile_id,          type: BSON::ObjectId

    # Effective begin/end are the date period during which this benefit sponsorship is active
    # Date when initial application coverage starts for this sponsor
    field :effective_begin_on,  type: Date

    # When present, date when all benefit applications are terminated and sponsorship ceases
    field :effective_end_on,    type: Date
    field :termination_kind,    type: Symbol
    field :termination_reason,  type: Symbol

    field :predecessor_id,  type: BSON::ObjectId

    # Immutable value indicating origination of this BenefitSponsorship
    field :source_kind,         type: Symbol, default: :self_serve
    field :registered_on,       type: Date,   default: ->{ TimeKeeper.date_of_record }

    # This sponsorship's workflow status
    field :aasm_state,          type: Symbol, default: :applicant do
      error_on_all_events { |e| raise WMS::MovementError.new(e.message, original_exception: e, model: self) }
    end

    delegate :sic_code,     :sic_code=,     to: :profile, allow_nil: true
    delegate :primary_office_location,      to: :profile, allow_nil: true
    delegate :enforce_employer_attestation, to: :benefit_market
    delegate :legal_name,   :fein,          to: :organization

    # belongs_to  :organization,
    #   inverse_of: :benefit_sponsorships,
    #   counter_cache: true,
    #   class_name: "BenefitSponsors::Organizations::Organization"

    # embeds_many :benefit_applications,
    #   class_name: "::BenefitSponsors::BenefitApplications::BenefitApplication"

    # has_many    :census_employees,
    #   class_name: "::CensusEmployee"

    # belongs_to  :benefit_market,
    #   counter_cache: true,
    #   class_name: "::BenefitMarkets::BenefitMarket"

    # belongs_to  :rating_area,
    #   counter_cache: true,
    #   class_name: "::BenefitMarkets::Locations::RatingArea"

    # has_and_belongs_to_many :service_areas,
    #   :inverse_of => nil,
    #   class_name: "::BenefitMarkets::Locations::ServiceArea"

    embeds_many :broker_agency_accounts, class_name: "BenefitSponsors::Accounts::BrokerAgencyAccount",
      validate: true

    embeds_many :general_agency_accounts, class_name: "BenefitSponsors::Accounts::GeneralAgencyAccount",
      validate: true

    embeds_one  :employer_attestation, class_name: "BenefitSponsors::Documents::EmployerAttestation"

    has_many    :documents,
      inverse_of: :benefit_sponsorship_docs,
      class_name: "BenefitSponsors::Documents::Document"  end
end
