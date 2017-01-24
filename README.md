# Lazy Serialize
<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 

Lazy Serialize is an alternative to ActiveRecord's `serialize` method which does not serialize each column until the first call to the attribute. 

# Install
```ruby
# Gemfile
gem 'lazy_serialize'
```

# Usage

Usage is almost the same as the regular serialize

```ruby
class MyClass
  include LazySerialize

  lazy_serialize :my_attribute, Hash
end
```

Available Types are Hash, HashWithIndifferentAccess, Array, JSON, YAML
    
# Credits
Created by Weston Ganger - @westonganger


<a href='https://ko-fi.com/A5071NK' target='_blank'><img height='32' style='border:0px;height:32px;' src='https://az743702.vo.msecnd.net/cdn/kofi1.png?v=a' border='0' alt='Buy Me a Coffee' /></a> 
