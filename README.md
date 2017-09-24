# Release Maker

When notified by Github that a pull request was merged, creates or adds to a draft
release on Github for the same project.

To run or develop this project:

* `git clone <repository-url>` this repository
* change into the new directory
* `rbenv install`
* `gem install bundler`
* `bundle install`

## Functionality

This is a Rails application that uses:

* Postgres as a relational database. It [manages changes to the structure of the database](http://edgeguides.rubyonrails.org/active_record_migrations.html).

### Prerequisites

This project uses `rbenv` to install and select the correct version of Ruby.
This is optional, but it is highly recommended.
You can also use rvm for example, but you will need to configure it within this project.

The `pg` gem requires that Postgres client libraries be installed.

### Configuration

The following environment variables are used:

- `DATABASE_URL`: Database used to store operational data.
- `GITHUB_WEBHOOK_SECRET`: Webhook secret configured on Github
- `NEW_RELIC_LICENSE_KEY`: Used by New Relic. Should not be set in development unless developing changes to New Relic integration. Should never be set in test environment.
- `NEW_RELIC_APP_NAME`: Used by New Relic.
- `SENTRY_DSN`: Used by Sentry. Should not be set in development unless developing changes to Sentry integration.

## Development

It is recommended that you use [Pow](http://pow.cx) so that the application runs
on a real-looking hostname, and don't clash with other applications.
This is best managed using Powder, which can be installed using `gem install powder`.

To set this application up:

    powder link

Then visit [http://maverick-manager.dev](http://maverick-manager.dev).
The app will be started automatically.

In addition, you can use [Anvil](http://anvilformac.com) as a UI to manage Pow.

### Better Errors

We use [Better Errors](https://github.com/charliesome/better_errors) as a development console,
which allows inspection of runtime state and an in-browser REPL.
It is presented when an error occurs during an HTML request.

If an error occurs during a JSON request, the response will include some basic information about the error that occurred.

Visiting [/__better_errors](http://maverick-manager.dev) will present the console
for the most recent error that occurred.

Occasionally, Better Errors tries to present far too much data and locks up the Rails process.
When this occurs, it's necessary to restart Pow.
(This can be done using `powder respawn`.)

### Tests

We use [rspec](https://www.relishapp.com/rspec).

