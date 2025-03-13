session = ShopifyAPI::Auth::Session.new(
  shop: "your-development-store.myshopify.com",
  access_token: access_token
)
client = ShopifyAPI::Clients::Graphql::Admin.new(
  session: session
)

query = <<~QUERY
  query {
    products(first: 100, query: "updated_at:>2025-02-01") {
      edges {
        node {
          id
          title
          updatedAt
          featuredMedia {
            preview {
              image {
                url
              }
            }
          }
        }
      }
    }
  }
QUERY
