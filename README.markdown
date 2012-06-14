# obyK URL Shortener
This is a URL Shortener written with Ruby on Rails, for deployment to Heroku. It is a very simple shortener, with some basic tracking built in.

I wanted to write one of these just to see what made one tick. I know they're not overly complex, but as I found out, it's a little harder than you initially think. This one relies on the URL submitted and the time it was submitted to create a hash and then takes the first few characters of the hash for its short code. I'm sure there's a better algorithm than that, but for starters, that's what I went with.

## To Do
Some things that I would like to eventually add to the shortener

* Add some pretty. I'm not the best designer in the world, if anyone wants to add a bit of styling to the app, I'd appreciate it.
* Fix regex to check for valid URL, on submission. This is first liine of defense against bad data. This would go before the next bullet point.
* Add a check on submission to verify that the URL submitted is valid and returns either a 200 or 302 status code, in the case of a redirect, maybe store the new address and create a short code for it.

## License

### Why the GPL
I know some people that really dislike the GPL, however I would like changes to be brought back into this source tree here.  Though to be honest, I'm not going to be too much of a stickler about it.

Copyright (C) 2011 Michael Koby

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

