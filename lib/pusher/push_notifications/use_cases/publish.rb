# frozen_string_literal: true

require 'caze'

module Pusher
  module PushNotifications
    module UseCases
      class Publish
        include Caze

        export :call, as: :publish

        def initialize(interests:, payload: {})
          @interests = interests
          @payload = payload
        end

        def call
          data = { interests: interests }.merge!(payload)
          client.post('publishes', data)
        end

        private

        attr_reader :interests, :payload

        def client
          @_client ||= PushNotifications::Client.new
        end
      end
    end
  end
end
