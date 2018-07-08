# frozen_string_literal: true

# Helpers utilizados en las vistas de Technical Services.
#
module TechnicalServicesHelper
  def sorted_clients
    Client.sorted
  end

  def sorted_cities
    City.sorted
  end

  def sorted_plan_services
    PlanService.sorted
  end

  def sorted_towers
    Tower.sorted
  end

  def sorted_transmitters
    Transmitter.sorted
  end

  def sorted_devices
    Device.sorted
  end

  def sorted_balancers
    Balancer.sorted
  end

  def sorted_support_types
    SupportType.sorted
  end

  def sorted_ground_wire_setup_types
    GroundWireSetupType.sorted
  end

  def sorted_surge_protector_setup_types
    SurgeProtectorSetupType.sorted
  end
end
