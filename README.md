# FB Messenger Platform Setup

## Steps for `development` environment

### 1. Create a Facebook App and Page

Create a new Facebook App and Page or use existing ones. Go to the App Dashboard and under Product Settings click `Add Product` and select `Messenger.`

![img1]

### 2. Token Generation

In the Token Generation section, select your Page. A Page Access Token will be generated for you. Copy this Page Access Token. Note: The generated token will NOT be saved in this UI. Each time you select that Page a new token will be generated. However, any previous tokens created will continue to function.
![img3]

### 3. Webhook

Find `Webhook` section then click on `Setup Webhooks`

![img2]

Enter a URL for a webhook, enter a Verify Token and select `messages` and `messaging_postbacks` under `Subscription Fields`.

`Callback URL` should be your server `https://myserver.com/webhook` *or* you can also use [ngrok](https://ngrok.com/) that tunnel your node from your machine.

When verify FB request will enter line `app.get('/webhook'` in `app.js`

`Verify Token` can be *anything* unique, this will be used in `default.json` `validationToken` in `Setup your bot` section below

![img4]

## Steps for `production` environment

### 4. App Review for Messenger

To use Messenger platform in `publicly`, your app needs to be approved for Send/Receive API (pages_messaging). The Send/Receive API should only be used to send organic content and should not be used to send marketing or other promotional communications.


[img1]: https://scontent.fbkk13-1.fna.fbcdn.net/v/t39.2178-6/12995587_195576307494663_824949235_n.png?oh=c2d8210d366a5650df958c86a08792c5&oe=596749C3
[img2]: https://scontent.fbkk13-1.fna.fbcdn.net/v/t39.2178-6/13331609_660771177408445_306127577_n.png?oh=881074a3a391da021b726c2db479b0e9&oe=599A194C
[img3]: https://scontent.fbkk13-1.fna.fbcdn.net/v/t39.2178-6/12995543_1164810200226522_2093336718_n.png?oh=235fb47b7aa4a365da133567baad3b9d&oe=595A1F09
[img4]: https://scontent.fbkk13-1.fna.fbcdn.net/v/t39.2178-6/12057143_211110782612505_894181129_n.png?oh=d597a8c5c31841201ab07d79c4d7b5f9&oe=5963D7F1

## Setup your bot

### 1. Modify your `config/default.json`
```json
{
    "appSecret": "From your App dashboard",
    "pageAccessToken": "Generated from step #2",
    "validationToken": "someuniquetext that will be used in step #3",
    "serverURL": "your server url"
}
```

### 2. Replace values for `APP_ID` and `PAGE_ID` in `public/index.html`.

`APP_ID` you can get from [developers.facebook.com](https://developers.facebook.com/apps) dashboard
`PAGE_ID` you can get from the URL of your page, 

example `https://www.facebook.com/DigithunDev-407027276326992/` this means the `PAGE_ID` is 407027276326992

### 3. Run the bot server !

## Legacy server
```shell
$ npm i
$ npm start
``` 

## Docker
```shell
docker build -t fbmsgrbot . 
docker run -it -d -p 5000:5000 --name fbmsgrbot fbmsgrbot
``` 

Or just use:
```
. run.sh
```

## Testing when FB has not yet approved

Assumed that you already added your `Webhook` at `developers dashboard` and `Setup your bot`

You must add a Tester *FB account as Admin* to the FB Page used for generate `pageAccessToken`, so that the bot will have permission to send messages.

Message types such as images must be added in section `3. Webhook` to allow bot to send images.

To hotlink chat with your bot. You can type in your server url in the browser which will go to `public/index.html` this page has `message-us` button, which will enter FB page chat window.