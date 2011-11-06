# obyK URL Shortener
This is a URL Shortener written with Ruby on Rails, for deployment to Heroku. It is a very simple shortener, with some basic tracking built in.

## To Do
Some things that I would like to eventually add to the shortener

* Add some pretty. I'm not the best designer in the world, if anyone wants to add a bit of styling to the app, I'd appreciate it
* Use Javascript to display the shortened URL on the create page after submission
* Add analytics to the SHOW page, so that a user can see where clicks to a short code are coming from
* Add a check on submission to verify that the URL submitted is valid and returns either a 200 or 302 status code, in the case of a redirect, maybe store the new address and create a short code for it

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

