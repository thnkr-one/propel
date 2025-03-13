session = ShopifyAPI::Auth::Session.new(
  shop: "your-development-store.myshopify.com",
  access_token: access_token
)
client = ShopifyAPI::Clients::Graphql::Admin.new(
  session: session
)

query = <<~QUERY
  query GetProduct($id: ID!) {
    product(id: $id) {
      id
      title
      variants(first: 10) {
        nodes {
          id
          title
        }
      }
      collections(first: 10) {
        nodes {
          id
          title
        }
      }
    }
  }
QUERY

variables = {
  "id": "gid://shopify/Product/108828309"
}

response = client.query(query: query, variables: variables)
