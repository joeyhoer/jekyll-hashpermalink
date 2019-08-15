# Introduction

This plugin adds a `:static_id` variable into the Jekyll permalink configuration that allows authors to create evergreen permalinks.

**NOTE:** This plugin also requires server level configuration to redirect requests properly.

# Installation

Move `hashpermalink.rb` into the `_plugins` folder at the root of your Jekyll project, and update the `permalink` key in the `_config.yml` file to include `:static_id` (e.g. `permalink: '/:categories/:title-:static_id'`).

Then configure your server to serve the correct content for these requests. For example, when using Apache, the `.htaccess` file may include:

```
RewriteCond %{REQUEST_URI} -([^-]*)$
RewriteRule ^ %1/index.html
```
