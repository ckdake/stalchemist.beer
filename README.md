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
- **Brewery-wide statistics** on the beers page:
  - Total check-ins
  - Unique users
  - Total beers
  - Overall rating
  
- **Individual beer statistics** on batch pages (for batches with Untappd URLs):
  - Total check-ins
  - Unique users
  - Average rating
  - Number of ratings

**Example Output:**

When API credentials are configured, the beers page will show:
```
Brewery Stats
- Total Check-ins: 1,234
- Unique Users: 567
- Total Beers: 15
- Rating: 4.2
```

And batch pages with Untappd URLs will show:
```
Untappd Stats
- Total Check-ins: 123
- Unique Users: 89
- Rating: 4.5 (67 ratings)
```

If API credentials are not configured, the site will build normally without the statistics.

**Testing the Integration:**

You can test the API integration without building the entire site:
```bash
export UNTAPPD_CLIENT_ID=your_client_id
export UNTAPPD_CLIENT_SECRET=your_client_secret
bundle exec ruby -e "require './lib/untappd_helper'; puts brewery_stats('83021').inspect"
```

Deploying To Server
================================
1. Push to Github!

For Netlify deployments, you can configure the environment variables in the Netlify dashboard under Site Settings > Build & Deploy > Environment.

[![Netlify Status](https://api.netlify.com/api/v1/badges/94ca1c4a-c8c2-4e2c-897e-382deb2a6cd4/deploy-status)](https://app.netlify.com/sites/confident-euler-9cf971/deploys)
