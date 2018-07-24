# frozen_string_literal: true

# Cuando el usuario Contador exporta los servicios técnicos realizos en un
# período determinado y marca estos servicios como facturados, se crea un
# BillingExport con la información de qué servicios se exportaron, qué usuario
# lo hizo y cuál fue el monto total de todos los servicios.
#
class BillingExport < ApplicationRecord
  extend Enumerize

  belongs_to :background_job, optional: true

  has_many :invoices, dependent: :restrict_with_error
  has_many :technical_services, dependent: :nullify

  enumerize :export_type, in: { csv: 0, api: 1 },
                          default: :csv,
                          predicates: true

  attribute :datetime, :datetime, default: -> { Time.current }

  validate :at_least_one_technical_service?
  validate :billed_technical_services?, on: :create

  after_create :create_invoices

  # Construye un nombre de archvio con el rango de fechas y la cantidad de
  # Invoices exportados.
  # TODO: La exportación mediante CSV es para comprobantes ya emitidos por
  # talonario o electrónicamente. Nosotros tenemos que emitir comprobantes del
  # tipo "cotización" que luego se van a emitir realmente en Contabilium.
  #
  def filename
    "billing_export_X.#{export_type}"
  end

  # Crea un BackgroundJob y lo encola para ejecutarse en Sidekiq.
  #
  def perform_sync
    job_id = InvoiceSyncJob.perform_in(2.seconds, id)
    self.background_job = BackgroundJob.create(job_id: job_id, job_item: self)
    save!
  end

  private

  # Una vez guradado el BillingExport se pueden crear las facturas para los
  # servicios técnicos asociados a este BillingExport.
  # FIXME: default parameters for invoice should be set in config files.
  #
  def create_invoices
    clients_with_ts = technical_services.group_by(&:client)

    clients_with_ts.each do |client, services|
      invoice = invoices.build(client: client,
                               emission_date: Time.current,
                               expiry_date: Time.current.advance(days: 30))
      invoice.create_invoice_items(services)
      invoice.save!
    end

    self.total_amount = invoices.includes(:invoice_items).sum(:amount)
    save!
  end

  def at_least_one_technical_service?
    return unless technical_services.empty?
    errors.add(:technical_services, :empty)
  end

  # Comprueba que los servicios técnicos que se vayan a facturar ya no estén
  # facturados o "cerrados".
  # TODO: falta considerar "cerrados".
  #
  def billed_technical_services?
    return if technical_services.all? { |ts| ts.invoice.blank? }
    errors.add(:technical_services, :billed)
  end
end
