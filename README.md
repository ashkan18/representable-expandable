# Representable Expandable Extension
This gem is an extension on top of Representable(https://github.com/apotonick/representable) which allows us to by default exclude properties/collections from representables and explicitly include them by setting right option on Representable. 

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


https://travis-ci.org/ashkan18/representable-expandable.svg?branch=master