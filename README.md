# RailsQuest Rails Templates

This is a collection of templates for Rails projects.

## Usage

### Direct from GitHub

```bash
rails new PROJECT_NAME --template https://raw.githubusercontent.com/RailsQuest/rails-templates/refs/heads/master/default.rb
```

### Clone and use locally

```bash
git clone https://github.com/RailsQuest/rails-templates.git
cd rails-templates
rails new PROJECT_NAME --template default.rb
```

## Templates

### `default.rb`

The default template for Rails projects.

It includes:

- Authentication with authentication-zero
- Standard for Linting
- Litestack for production sqlite (see [litestack](https://github.com/oldmoe/litestack))
  - Check out fly.io's writeup on [how and why you might want to use sqlite in production on fly.io](https://fly.io/ruby-dispatch/sqlite-and-rails-in-production/)
