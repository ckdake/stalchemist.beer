Running stalchemist.beer locally
================================

1. gem install bundler && bundle
1. bundle exec nanoc compile
1. bundle exec nanoc view
1. open http://localhost:3000/

Untappd API Integration
================================

The site can optionally pull check-in data from Untappd at build time.

To enable this feature:

1. Register an application at https://untappd.com/api/register
2. Set environment variables with your API credentials:
   ```bash
   export UNTAPPD_CLIENT_ID=your_client_id
   export UNTAPPD_CLIENT_SECRET=your_client_secret
   ```
3. Build the site: `bundle exec nanoc compile`

The integration will display:
- Brewery-wide statistics (total check-ins, unique users, total beers, rating) on the beers page
- Individual beer statistics (check-ins, unique users, rating) on batch pages with Untappd URLs

If API credentials are not configured, the site will build normally without the statistics.

Deploying To Server
================================
1. Push to Github!

[![Netlify Status](https://api.netlify.com/api/v1/badges/94ca1c4a-c8c2-4e2c-897e-382deb2a6cd4/deploy-status)](https://app.netlify.com/sites/confident-euler-9cf971/deploys)
