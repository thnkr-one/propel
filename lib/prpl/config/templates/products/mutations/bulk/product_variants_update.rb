session = ShopifyAPI::Auth::Session.new(
  shop: "your-development-store.myshopify.com",
  access_token: access_token
)
client = ShopifyAPI::Clients::Graphql::Admin.new(
  session: session
)

query = <<~QUERY
  mutation ProductVariantsUpdate($productId: ID!) {
    productVariantsBulkUpdate(productId: $productId, variants: [{id: "gid://shopify/ProductVariant/1", barcode: "12345"}, {id: "gid://shopify/ProductVariant/2", barcode: "67890"}]) {
      product {
        id
      }
      productVariants {
        id
        metafields(first: 2) {
          edges {
            node {
              namespace
              key
              value
            }
          }
        }
      }
      userErrors {
        field
        message
      }
    }
  }
QUERY

variables = {
  "productId": "gid://shopify/Product/20995642",
  "variants": [{"id"=>"gid://shopify/ProductVariant/1", "barcode"=>"12345"}, {"id"=>"gid://shopify/ProductVariant/2", "barcode"=>"67890"}]
}

response = client.query(query: query, variables: variables)

# {
#   "productId": "gid://shopify/Product/20995642",
#   "variants": [
#     {
#       "id": "gid://shopify/ProductVariant/1",
#       "barcode": "12345"
#     },
#     {
#       "id": "gid://shopify/ProductVariant/2",
#       "barcode": "67890"
#     }
#   ]
# }

# Response #
# {
#   "productVariantsBulkUpdate": {
#     "product": {
#       "id": "gid://shopify/Product/20995642"
#     },
#     "productVariants": null,
#     "userErrors": [
#       {
#         "field": [
#           "variants",
#           "0",
#           "id"
#         ],
#         "message": "Product variant does not exist"
#       },
#       {
#         "field": [
#           "variants",
#           "1",
#           "id"
#         ],
#         "message": "Product variant does not exist"
#       }
#     ]
#   }
# }