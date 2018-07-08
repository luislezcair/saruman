# frozen_string_literal: true

# Parser para suprimir de la respuesta cualquier atributo que se llame
# 'attributes' porque rompe la gema Her. TODO: si alguna vez se necesita este
# atributo hay que procesarlo para cambiarle el nombre en vez de eliminarlo.
#
# TODO: esto pordría mejorarse incorporando comportamiento para el manejo de
# errores de https://github.com/remiprev/her/blob/master/lib/her/middleware/parse_json.rb
#
class UcrmResponseParser < Faraday::Response::Middleware
  def on_complete(env)
    json = MultiJson.load(env[:body], symbolize_keys: true)

    # La respuesta es un arreglo cuando se devuelven más de un elemento. Si es
    # un solo elemento la respuesta es directamente un Hash.
    if json.is_a?(Array)
      json.each do |item|
        item.delete(:attributes)
      end
    else
      json.delete(:attributes)
    end

    # Devolvemos el body en el formato que espera Her.
    env[:body] = {
      data: json,
      errors: {},
      metadata: {}
    }
  end
end
