# Representable Expandable Extension
[![Build Status](https://travis-ci.org/ashkan18/representable-expandable.svg?branch=master)](https://travis-ci.org/ashkan18/representable-expandable)
This gem is an extension on top of [Representable](https://github.com/apotonick/representable) which allows us to by default exclude properties/collections from representables and explicitly include them by setting right option on Representable. 

## Install
Add following line to your Gemfile

```
gem 'representable-expandable'
```

## Usage
You can make a collection `Expandable` by includeing `Representable::Expandable` in your `Representable` and set `expandable: true` for your expandable properties/colloections. Here is a sample:

```ruby
module MessageRepresenter
  include Roar::JSON
  include Expandable

  property :id
  property :subject
  property :body
  collection :attachments, extend: AttachmentRepresenter, class: Attachment, expandable: true
end
```

In the above example `attachments` are expandable which means by default they won't get rendered in `MessageRepresenter`. In order to explicitly add them to representer we need to set `expand` options of representer using `to_json` method:

```ruby
message = Message.new(id: 'test', subject: 'test subject', body: 'test body', attachments: ['1', '2'])
message.extend(MessageRepresenter).to_json(expand: ['attachments'])
```
Note that `expand` gets an array as input.
