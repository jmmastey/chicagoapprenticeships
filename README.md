Chicago Apprenticeships
----------------------------

See the site at http://chicagoapprenticeships.com.

For once, this app isn't OSS. The template / code isn't very valuable,
and the data isn't something that I'd generally share.

### Running the App

```bash
chruby 2.3.1
bundle install
ruby app.rb
```

### Adding Programs

All programs are added through `apprenticeships.json`. If the app ever gets
serious traffic, we'll need to change to memoizing the result, but it
hasn't been necessary.

There are buttons in the interface for relevant info (like product companies
versus consulting companies), which are driven out of tags.
