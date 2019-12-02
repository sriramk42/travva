# ✈️🚄⛱ Travva - Simplify your Travel

Travva helps you simplify your travel by having a simple interface to add items to your bucket list and plan your itinerary off the bucket list.

<img src="./Travva.png" width="500" />
Check it here: http://www.travva.me/
 
## Getting Started
### Setup

Install gems
```
bundle install
```
Inside `.env`, set `CLOUDINARY_URL` to your [cloudinary](https://cloudinary.com) environment variable (you need a cloudinary account). Additionally, get Google API Keys for Javascript API and Places and add to ENV/

Installs packages with Yarn
```
cd client && yarn
```

Create, migrate and populate the database
```
rails db:create db:migrate db:seed
```


### Run
```
rake start
```

## Built With
- [Rails 5 API](https://edgeguides.rubyonrails.org/api_app.html) - Backend
- [Google Maps API] (https://console.developers.google.com/apis/dashboard) - Maps and Places Autocomplete
- [Triposo] () - (https://www.triposo.com/) - Triposo for suggestions
- [Trello] — Task management
- [Figma](https://www.figma.com/file/2Hm6kITNlx4NL8T7q2rKtT/TRAVVA?node-id=2%3A0) — Prototyping

## License
This project is licensed under the MIT License

## Acknowledgements
- Developed by the awesome team of Silvia, Sabrina, Emmanuel and me.
