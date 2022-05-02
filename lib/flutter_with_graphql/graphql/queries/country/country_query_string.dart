const COUNTRY_QUERY_STRING = """
  query SingleCountry(\$countryId: ID!) {
    country(code: \$countryId) {
      code
      name
      phone
      capital
    }
  }

""";
