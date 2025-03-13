require 'shopify_api'
require 'graphql'
require 'graphql/client'
require 'graphql/client/http'

module Prpl
  module Config
    module Templates
      module Products
        module Queries
          class GetProductByHandle
            # GraphQL query for fetching product by handle with variables
            PRODUCT_QUERY = <<~GQL
              query GetProductByHandle($handle: String!) {
                productByHandle(handle: $handle) {
                  id
                  title
                }
              }
            GQL

            attr_reader :client

            # Initializes the GetProductByHandle query class with a GraphQL client.
            #
            # @param client [Object] A GraphQL client instance to execute queries.
            def initialize(client)
              @client = client
            end

            # Fetches a product by handle.
            #
            # @param handle [String] The product handle to look up.
            # @return [Hash] The parsed JSON response from the GraphQL API.
            def fetch_product(handle)
              variables = {
                "handle" => handle
              }
              response = client.query(query: PRODUCT_QUERY, variables: variables)
              response.body
            end
          end
        end
      end
    end
  end
end