session = ShopifyAPI::Auth::Session.new(
  shop: "your-development-store.myshopify.com",
  access_token: access_token
)
client = ShopifyAPI::Clients::Graphql::Admin.new(
  session: session
)

query = <<~QUERY
  query {
    product(id: "gid://shopify/Product/108828309") {
      title
      variants(first: 10) {
        edges {
          node {
            selectedOptions {
              name
              value
            }
            media(first: 10) {
              edges {
                node {
                  alt
                  mediaContentType
                  status
                  __typename
                  ... on MediaImage {
                    id
                    preview {
                      image {
                        originalSrc
                      }
                    }
                    __typename
                  }
                }
              }
            }
          }
        }
      }
    }
  }
QUERY

response = client.query(query: query)
