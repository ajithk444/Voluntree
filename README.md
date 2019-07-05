

# Project Title

Voluntree

# Project Description

Voluntree is a mobile cross-platform application that facilitates peer-to-peer communication and collaboration in case of natural disasters, connecting people affected by catastrophes with volunteers who have the ability to help in a quick, efficient and reliable way.

Voluntree is written in Dart, and it is built using Flutter, an open-source mobile app framework created by Google that enables cross-platform development.

// TODO Add video link, add architectural diagram

# Current Problem 

In the unpredictable event of a natural disaster, such as a flood, earthquake or wildfire, inmediate and efficient response is required to mitigate damage and save lives. Emergency response teams do their best to face these catastrophes, but sometimes their effort is not enough. At the same time, we know that these situations bring out the best in people, since whenever a natural disaster occurs we see hundreds of messages in social media of individuals trying to help victims by offering what they can. We believe that people's willingness to collaborate can be a life-saver, if organized properly.

# Solution Description 

Voluntree is a tool that enables volunteers help the most vulnerable people during natural disasters. We are implementing a mobile application oriented to both volunteers and people affected by natural disasters, so they can collaborate efficiently without the intervention of third parties. Users will receive push notifications if something happens near them and their help may be needed. This way, people will always be up to date and they will have the information available to them in an efficient way. Users will be able to give help or ask for it in four categories: transportation, food and supplies, medical assistance and housing/sheltering. The application will register data from users, and it will use that information to match people in need with volunteers, so that coordination between parties is automatized, minimizing interferences.

We have focused our efforts in the transportation case scenario.

-    Users who need help will have access to tools that will let them get to a safe shelter as soon as possible. For example, they will be able to get updates on the affected areas, see refuges set up by authorities available near them in a map, they will be matched to a volunteer who offers transportation, and they will be able to check how much time is left for the volunteer to arrive. 
-    The app will automatize and simplify steps needed to take for volunteers to help people, in order to make organization easier for everybody. They will be automatically matched with people who need help, and the app will show them the best route to reach them in a map, avoiding affected areas and traffic jams. Once a volunteer reaches a victim, the app will lead both of them to a safe shelter by showing them the optimal route with directions.

# Included Components 

We have leveraged the following IBM components in our application:

-   **IBM Cloudant.** The NoSQL DB service from IBM offers us a way to store all the registrations (whether they are victims or helpers) and all the relevant information related to the catastrophe. We have chosen it for its lightweight database, easy quering, scalability, and because it can provide data stored directly in JSON format.
-   **IBM Push Notifications.** Essential for our mobile application. It will allow us to notify users and keep them up to date with events and relevant information about the catastrophe. It is the perfect component for push notifications in our app because of its compatibility with IBM Cloud System.
-    **IBM Cloud Functions.** We want to react to changes in IBM Cloudant and send push notifications to users if needed as soon as possible, so we connect both the IBM Cloudant and the IBM Push Notification services using IBM Cloud Functions. It detects changes whenever data is updated in Cloudant and checks if any notifications should be sent. It is easy to compose using JS, it gives us control over our IBM data flow, and handles IBM Services events.
-    **IBM Watson Assistant.** In an event of a natural disaster users may need to express what they want instead of filling forms. We work with Watson Assistant for building a natural conversation, giving victims a feeling of calm and serenity with its advanced conversational skills and natural language. We have chosen it since it is also compatible with other IBM Speech Services.

# Featured Technologies 

We have chosen Flutter to build Voluntree as a natively compiled mobile application on both iOS and Android from a single codebase. Flutter is Google's mobile UI framework which provides a reactive framework for building cross-platform apps. Voluntree is written in Dart, a modern, expressive language with a declarative approach.

The main reasons for this choice are:

-    **Open-source**: it allows collaborative contributions to improve the project.
-    **One development for both platforms**: same user experience for both iOS and Android, we want Voluntree to be lightweight and able to run even in older devices.
-    **Highly productive**: since the app is compiled for both platforms from a single codebase, we can do more with less code.
-    We can **prototype and iterate easily** using hot reload.

# Architecture Diagram

The following scheme is used to describe how Voluntree works: authorities store data to IBM Cloudant regarding the affected areas and the available shelters. Once information is uploaded, IBM Cloudant emits an event to IBM Cloud functions, triggering a push notification to nearby users via IBM Push Notifications. This way, users will be able to start asking for help or offering it. Also, whenever a user registers their data in the app, Voluntree will upload it to IBM Cloudant, letting the servers match victims with volunteers efficiently.

![Voluntree Diagram 1](https://raw.githubusercontent.com/cfc-hummingbirds/Voluntree/master/assets/diagrams/diagram1.png "Voluntree Diagram 1")

Data from conversations that users will hold with Watson Assistant will also be stored to IBM Cloudant and used to optimize peer-to-peer collaboration and user matching.

![Voluntree Diagram 2](https://raw.githubusercontent.com/cfc-hummingbirds/Voluntree/master/assets/diagrams/diagram2.png "Voluntree Diagram 2")

# Steps 

-	Installing Flutter to run the app in debug mode: follow the official Flutter guide to get started and run the app with Android Studio or VSC in this link. [Flutter official installation guide.](https://flutter.dev/docs/get-started/install)
-	Running the .apk on an Android device: download the voluntree-debug.apk file from this repository ([link to apps folder in this repository](https://github.com/cfc-hummingbirds/Voluntree/tree/master/apps)) and execute it on an Android device.

# Results 

In our first approach, we have focused our attention in the transportation use case, and we hope Voluntree will be an efficient tool in organizing peer-to-peer evacuations and making them quicker. But our scope does not stop there. There are three more use cases that we want to include in our final solution:

-    **Medical assistance**: we want to connect people who needs medicines with the nearest specialists to speed up aid and reach more people.
-    **Food and supplies**: in this kind of situations, access to food and basic supplies is often difficult, so we want to offer a way to make it easier for people to share food and supplies between them.
-    **Housing**: in a natural disaster, homes may be damaged or innaccessible due to weather, so we want to give the possibility to offer and ask for shelter.

We are also looking forward to implementing a chatbot using IBM Watson Assistant, since in an event of a natural disaster users may be shocked, so it will be hard for them to navigate through the app and fill forms. We want to use the latest technology on conversational assistants to help users with the process of asking for help. Also, using Google Assistant and Siri shortcuts we will be able to launch Watson Assistant in order to start talking with it by simply saying: “I want to talk to Voluntree”, or just “I need help”.

More refinement and features could be added in the future to Voluntree. For example, we want to improve the flow of the app and study user behaviour to avoid blocking and the feeling of not knowing what to do or how to continue. We are also planning to add a newsletter feed to Voluntree based on Watson Discovery, so that users are always aware of the incoming events during a natural disaster.
