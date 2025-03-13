
=begin
query GetLocations($first: Int = 20) {
  locations(first: $first) {
    edges {
      node {
        id
        name
        address {
          address1
          address2
          city
          province
          zip
          country
        }
        isActive
        fulfillsOnlineOrders
      }
    }
    pageInfo {
      hasNextPage
      endCursor
    }
  }
}

# {
#   "variables": {
#     "first": 20
#   }
# }

Response:
{
  "data": {
    "locations": {
      "edges": [
        {
          "node": {
            "id": "gid://shopify/Location/96950124791",
            "name": "Grove Online",
            "address": {
              "address1": "4911 Grove Avenue",
              "address2": "",
              "city": "Richmond",
              "province": "Virginia",
              "zip": "23226",
              "country": "United States"
            },
            "isActive": true,
            "fulfillsOnlineOrders": true
          }
        },
        {
          "node": {
            "id": "gid://shopify/Location/95270469879",
            "name": "Grove Store",
            "address": {
              "address1": "4913 Grove Avenue",
              "address2": "",
              "city": "Richmond",
              "province": "Virginia",
              "zip": "23226",
              "country": "United States"
            },
            "isActive": true,
            "fulfillsOnlineOrders": true
          }
        }
      ],
      "pageInfo": {
        "hasNextPage": false,
        "endCursor": "eyJsYXN0X2lkIjo5NTI3MDQ2OTg3OSwibGFzdF92YWx1ZSI6Ikdyb3ZlIFN0b3JlIn0="
      }
    }
  },
  "extensions": {
    "cost": {
      "requestedQueryCost": 7,
      "actualQueryCost": 3,
      "throttleStatus": {
        "maximumAvailable": 4000,
        "currentlyAvailable": 3997,
        "restoreRate": 200
      }
    }
  }
}
=end