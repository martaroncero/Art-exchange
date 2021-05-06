# ArtExchange!
A platform where you can lease out your paintings as well as rent others!
Decorate your walls with refreshing art that reinvigorates your inspiration.

[http://art-exchange-app.herokuapp.com/](http://art-exchange-app.herokuapp.com/)

## Project outline
During the final weeks of Le Wagon we were given the task of creating an airbnb like clone for our first collaboration project, and so we decided on an art exchange idea.

The entire website was built from scratch by us over a simple rails boilerplate. It was designed, developed, deployed and presented all within one week.

We took the following process:
 1. Created **user stories** 
 2. Outlined **user actions**
 3. Created a model **schema**
 4. Outlined necessary **routes/controllers**
 5. Decided **team workflow** and began coding
 6. [Gayatri Arora](https://github.com/GayatriArora) presented mid-project on the Wednesday
 7. Improved the app based on feedback
  8. [Ryan Woods](https://github.com/ryanofwoods) presented the final project on the Friday

Everyday we discussed our progress, decided what needed completing for the day, and then divided the tasks.

## How it works
### Schema
The app contains three models: User, Painting and Booking. There is only type of user who can do both leasing and renting painting actions.

![art-exchange schema](https://user-images.githubusercontent.com/76776099/117302978-7f4f1900-ae7c-11eb-8ec0-0b34dc60fac8.PNG)

### Actions
#### Visitor (not logged in)
- Sign up (create a user)
- Visit homepage
- Browse all paintings
- Browse an individual painting listing

#### User (logged in)
- Login
- Edit their login user details
- List a painting to rent out (create painting model)
- Edit a painting listing (model)
- Book a painting (create booking model)
- Can view their bookings (bookings on their paintings and bookings on paintings they have booked)

## Techstack

**Core languages/tools:**
- Ruby on Rails
- PostgreSQL
- Heroku

**Features:**
- Mapbox -> map on paintings#show
- Cloudinary -> hosting the images
- PGsearch -> searching for a product on paintings#index

## Created by
- [Gayatri Arora](https://github.com/GayatriArora)
- [Won Lee](https://github.com/wonnie2020)
- [Marta Roncero](https://github.com/martaroncero/)
- [Ryan Woods](https://github.com/ryanofwoods)

