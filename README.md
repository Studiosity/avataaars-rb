# Avataaars for Ruby
Ruby wrapper library to call to [Avataaars React component](https://github.com/fangpenlin/avataaars) using NodeJS

Kudos to [Pablo Stanley](https://twitter.com/pablostanley) for creating the assets,
[Fang-Pen Lin](https://twitter.com/fangpenlin) for the React component and
the [Schmooze project](https://github.com/Shopify/schmooze) for which the Ruby<->NodeJS integration was based on.

<p align="center"><img src='avataaars-example.png?raw=true' /></p>

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'avataaars'
```

### Avataaars React component
```bash
npm install avataaars react react-dom
```

## Usage
```ruby
# Create an Avataaars SVG using the default attributes
avatar = Avataaars.new.create_avatar

# Create an Avataaars SVG using specific attributes
avatar = Avataaars.new(
  avatar_style: 'Circle',
  top_type: 'ShortHairShortFlat',
  hair_color: 'BrownDark',
  accessories_type: 'Round',
  facial_hair_type: 'BeardMedium',
  facial_hair_color: 'Auburn',
  clothe_type: 'Hoodie',
  clothe_color: 'PastelGreen',
  eye_type: 'Surprised',
  eyebrow_type: 'UpDown',
  mouth_type: 'Disbelief',
  skin_color: 'Brown'
).create_avatar

# When your node install is not in the PWD
avatar = Avataaars.new(root_path: 'some/other/path').create_avatar 
```

## Yeah, but why not just write it all in Ruby
:confused: This was considered but was more of a maintenance issue. Given the assets/React component haven't
seen much in the way of changes I may re-write the gem at some time to just implement the avatar creation.
Upside would be a pretty massive speed boost as calling out to NodeJS like this isn't super performant.  

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
