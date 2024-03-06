iOS Swift
•	build a native app that captures video & audio from the camera
•	adds mustache to the user' face using ARKit
•	user should be able to change mustache style on the fly (embed a few mustache images)
•	session video/duration should be saved into ORM

Video screen
•	recordings button (leads to Recording screen)
•	Mustaches list. On tap currently selected mustaches get replaced
•	Stop button. It stops recording and presenting a popup to a user. A popup contains a ‘tag’ text field. Once the user enters a ‘tag’, data gets saved(video / duration / ‘tag’) into ORM or DB

Recording list screen
•	A grid of the recordings
•	Each row in the grid includes:
•	Preview for a video
•	video duration
•	Tag
•	New recording button(leads to the Video screen)

Current State:

We can switch between saved files and recording.
<img width="1276" alt="Screenshot 2024-03-05 at 10 46 13 PM" src="https://github.com/loksp27/mustache_app/assets/71844449/849c234d-ef5d-497e-ac7f-a93746a0ba1f">
<img width="359" alt="Screenshot 2024-03-05 at 10 48 19 PM" src="https://github.com/loksp27/mustache_app/assets/71844449/099540ae-89cc-4fd2-8662-026e77c0d2cf">

we can identify and give a warning message if no camera is available
<img width="1276" alt="Screenshot 2024-03-05 at 10 46 13 PM" src="https://github.com/loksp27/mustache_app/assets/71844449/849c234d-ef5d-497e-ac7f-a93746a0ba1f">
after stoping the you can type a string value for the tag
<img width="1280" alt="Screenshot 2024-03-05 at 10 46 37 PM" src="https://github.com/loksp27/mustache_app/assets/71844449/c331a0fa-6940-47ff-8c55-a614b78dff08">
It lets you choose between multiple mustaches
<img width="404" alt="Screenshot 2024-03-05 at 10 47 00 PM" src="https://github.com/loksp27/mustache_app/assets/71844449/fb496b42-57a5-4726-ba26-d4b1b38d1a99">

