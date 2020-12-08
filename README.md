# README

# Front-End

## Purpose of App

- The main purpose of this **repo** is to serve as the frontend to the larger group project we're calling "Classroom Wars". The GitHub repo's can all be found [here](https://github.com/Classroom-Wars).

- The inception of **Classroom Wars** came from the brilliant minds of some of the contributors of this project who, in a previous life, were teachers. They saw classrooms (especially remote classromms) inadequately using technology to engage students. This project seeks to remedy that issue.


## Design

1. The entire app is split into 3 repo's: Front-End, Back-End, and Sinatra. The front-end is responsible for the views that the user sees, as well as initiating the process of making API calls and database queries. The database exists on the back-end, and the actual API calls are made in the back-end as well.

2. One of the first design decisions was to split API calls into facades (where the API methods are called, and objects created if needed) and services (where the API's are actually called). This adheres more to the single line responsbility principle.

## Using the app

- Follow the instructions below under "Set-up" to make sure you've got the correct environments

## Set up

1. Make sure you have the correct Ruby version installed (2.5.3). To check your Ruby version, from your command line, run `ruby -v`
  - If you do not have the correct version, follow the instructions to install 2.5.3: from the command line, run `rbenv install 2.5.3`
1. Make sure you have the correct Rails version installed (5.2.4.3). To check your Rails version, from your command line, run `rails -v`
  - If you do not have the correct Rails version, [follow these instructions to install 2.5.4.3](https://github.com/turingschool-examples/task_manager_rails/blob/master/rails_uninstall.md)
1. Fork and Clone this repo
1. Install gem packages: `bundle install`
1. Setup the database: `rails db:create`
1. Register with Google Api Console and follow steps for consent
1. Add a Credential, select external use, web application, give your usage a title (like Google Login) and add this uri to the redirect field (LOCAL) ```http://localhost:3001/auth/google_oauth2/callback``` or (PRODUCTION) ```sleepy-forest-61862.herokuapp.co/auth/google_oauth2/callback```
1. You will be given a client id and client secret, see below
1. Run: `bundle exec figaro install` and the following information as environment variables
```ruby
GOOGLE_CLIENT_ID: <add your client id>
GOOGLE_CLIENT_SECRET: <add your client secret>
CLASS_WARS_DOMAIN: <add your backend server>
```
1. For our backend server, please use (LOCAL) ```http://localhost:3000``` or (PRODUCTION) ```http://polar-anchorage-12813.herokuapp.com```

#### Running Locally
1. From Sinatra, run: ```rackup -p 4567```
1. From Back End, run: ```rails s```
1. From Front End, run: ```rails s -p 3001```
1. From your browser, go to: ```http://localhost:3001```

[Heroku App Found Here](http://sleepy-forest-61862.herokuapp.com)

## Contributors
<br>
In no particular order...
<br><br>

[<img align="left" alt="arique github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-arique]
[<img align="left" alt="arique linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-arique]
Mariveliz Arique Ortiz 
<br />
<br>
Cam Chery
[<img align="left" alt="cam github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-cam]
[<img align="left" alt="cam linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-cam]
<br />
<br>
Christopher Allbritton
[<img align="left" alt="mckinstrybros website" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-chris]
[<img align="left" alt="Travis' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-chris]
<br />
<br>
Corey Carter
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-corey]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-corey]
<br />
<br>
Dan Halverson
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-dan]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-dan]
<br />
<br>
Garrett Gerdsen
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-gar]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-gar]
<br />
<br>
Judith Pillado
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-jud]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-jud]
<br />
<br>
Tyler Fields
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-tyler]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-tyler]
<br />
<br>
Pryia Power
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-pr]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-pr]
<br />
<br>
Saryn Mooney
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-sar]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-sar]
<br />
<br>
Phillip DeFraties
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-phil]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-phil]
<br />
<br>
Travis McKinstry
[<img align="left" alt="corey github" width="22px" src="https://raw.githubusercontent.com/iconic/open-iconic/master/svg/globe.svg" />][git-travis]
[<img align="left" alt="corey linkedin' | LinkedIn" width="22px" src="https://cdn.jsdelivr.net/npm/simple-icons@v3/icons/linkedin.svg" />][linkedin-travis]
<br />

[git-corey]: https://github.com/coreycartercodes
[linkedin-corey]: https://www.linkedin.com/in/carter-codes/

[git-cam]: https://github.com/Callbritton
[linkedin-cam]: https://github.com/Callbritton

[git-arique]: https://github.com/Arique1104
[linkedin-arique]: https://www.linkedin.com/in/arique/


[git-chris]: https://github.com/Callbritton
[linkedin-chris]: https://www.linkedin.com/in/arique/


[git-dan]: https://github.com/dhalverson
[linkedin-dan]: https://www.linkedin.com/in/daniel-halverson/


[git-gar]: https://github.com/ggerdsen
[linkedin-gar]: https://www.linkedin.com/in/ggerdsen/


[git-jud]: https://github.com/judithpillado
[linkedin-jud]: https://www.linkedin.com/in/judith-pillado/
 
[git-tyler]: https://github.com/fieldstyler
[linkedin-tyler]: https://www.linkedin.com/in/tyler-fields-583084197/

[git-pr]: https://github.com/priyapower
[linkedin-pr]: https://www.linkedin.com/in/priya-power/

[git-sar]: https://github.com/sarynm12
[linkedin-sar]: https://www.linkedin.com/in/saryn-mooney-34503984/

[git-phil]: https://github.com/PhilipDeFraties
[linkedin-phil]: https://www.linkedin.com/in/philip-defraties-4232681b6/

[git-travis]: https://github.com/TravisGM92
[linkedin-travis]: https://www.linkedin.com/in/travis-mckinstry/
