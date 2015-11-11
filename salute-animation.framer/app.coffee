Framer.Device.background.backgroundColor = "purple"
Framer.Device.background.backgroundColor = "#B4DCD8"
Framer.Device.phone.image = ""


sketch = Framer.Importer.load "imported/2014.9"


eventDetailsScreen = sketch.eventDetails
scroll = ScrollComponent.wrap(eventDetailsScreen)
scroll.scrollHorizontal = false

backArrow = sketch.backArrow
backArrow.props =
	opacity: 0
	rotation: 90
	scale: .2

eventsScreen = sketch.eventsScreen

nearbyEvents = sketch.nearbyEvents
socialMedia = sketch.socialMediaConference
localAction = sketch.localActionFund
meetGreet = sketch.meetGreet
pastEvents = sketch.pastEvents
attendeeHeader = sketch.attendeeHeader
attendeeHeader.opacity = 0
first = sketch.first
second = sketch.second
third = sketch.third
fourth = sketch.fourth
fifth = sketch.fifth

fade = sketch.fade
title = sketch.title
location = sketch.location
attendeesNumber = sketch.attendeeNumber
photo = sketch.photo

titleBlockArray = [title, location, attendeesNumber]
for item in titleBlockArray
	item.opacity = 0

connectionRequest = sketch.connectionRequest
contactPopup = sketch.contactRequest
contactBackground = sketch.backgroundDim
connectButton = sketch.connectJames
contactCancel = sketch.cancel
contactPopup.opacity = 0
contactBackground.opacity = 0
contactCancel.opacity = 0

contactPopupEndY = contactPopup.y
contactPopup.y += 600

contactCancelEndY = contactCancel.y
contactCancel.y += 200

attendeeHeaderEndY = attendeeHeader.y
attendeeHeader.y += 36

glass = sketch.glass
card = sketch.card
circle = sketch.circle
checkmarkEdge = sketch.checkmarkEdge
wholeCardOutline = sketch.wholeCardOutline
confirmation = sketch.confirmation
illustration = sketch.illustration
checkmarkEdgeLong = sketch.checkmarkEdgeLong

checkmarkEdgeLong.opacity = 0
illustration.opacity = 0
checkmarkEdge.opacity = 0
glassEndY = glass.y
glass.y += 56
confirmation.opacity = 0	
confirmationEndY = confirmation.y
illustrationEndY = illustration.y
wholeCardOutline.opacity = 0

sending = sketch.sending
sending.opacity = 0

blueBG = sketch.blueBG
blueBG.opacity = 0

sendConnectionRequest = sketch.sendConnectionRequest

pechaKucha = sketch.pechaKucha

pechaKuchaMask = new Layer
	height: 540
	width: 640
	superLayer: sketch.image

pechaKucha.superLayer = pechaKuchaMask

eventsBG = sketch.eventsBG
eventsBG.opacity = 0

radar = sketch.radar
searching = sketch.searching

radar2 = sketch.radar2

radarBluetooth = sketch.radarBluetooth
titleBlock = sketch.titleBlock
pechaKuchaMask.height = 492

touchCircle = new Layer
	width: 30
	height: 30
	borderRadius: 30
	backgroundColor: 'lightgray'
	opacity: 0
	
circleExpand = new Animation
	layer: touchCircle
	properties: 
		scale: 6
		opacity: 0
	curve: 'ease-out'
	time: .25

touch = (xPos, yPos) ->
	touchCircle.x = xPos
	touchCircle.y = yPos
	touchCircle.opacity = 1
	circleExpand.start()
	circleExpand.on "end", ->
		touchCircle.scale = 1



first = sketch.first
first.opacity = 0
firstEndY = first.y
first.y += 36










radar1Spin = radar.animate
	properties:
		rotation: 360
	time: 3
	curve: 'linear'








# titleBlock.opacity = 0
eventEnters = ->
	#	Exit searching (radar)
	radarBluetooth.animate
		properties:
			opacity: 0
		time: .7
	
	searching.animate
		properties:
			opacity: 0
		time: .7
		delay: .2
	
	
	Utils.delay .3, ->
		t = 0
		for item in titleBlockArray
			do (item) ->
				itemEndY = item.y
				item.y += 36
				item.animate
					properties:
						y: itemEndY
						opacity: 1
					time: .2
					delay: .02 * t
				t++
		

openEvent = ->
	photoMoveSpeed = .4
	
	#	nearby event disappears
	nearbyEvents.animate
		properties:
			y: nearbyEvents.y - nearbyEvents.height
			opacity: 0
		time: .3
	
	
# 	Utils.delay .1, ->
	pechaKuchaMask.animate
		properties:
			height: attendeeHeader.y
		time: photoMoveSpeed

	#	Photo has to move to correct location
	photo.animate
		properties:
			y: 56
		time: photoMoveSpeed
	
	#	Fade has to move to correct location
	fade.animate
		properties:
			y: 94
		time: photoMoveSpeed

	# 	title block moves
	titleBlock.animate
		properties:
			y: 280
		time: .4

			

	
	Utils.delay .3, ->
		# 	attendees header enters
		attendeeHeader.animate
			properties:
				opacity: 1
				y: attendeeHeaderEndY
			time: photoMoveSpeed
		
		# arrow appears
		backArrow.animate
			properties:
				opacity: 1
				scale: 1
				rotation: 1
			time: .4
			delay: .1
		
		# first person enters
		first.animate
			properties:
				y: firstEndY
				opacity: 1
			time: .6
			delay: .1




addJames = ->
		contactBackground.animate
			properties:
				opacity: 1
			time: .8
	
		Utils.delay .2, ->
			contactPopup.animate
				properties:
					opacity: 1
					y: contactPopupEndY
				time: .3
			
			contactCancel.animate
				properties:
					opacity: 1
					y: contactCancelEndY
					rotation: 180
				time: .3
				delay: .25
		


delivered = sketch.delivered
delivered.props = 
	opacity: 0

deliveringText = sketch.textDelivering
deliveringText.scale = .8

sendRequest = ->
	Utils.delay .1, ->
		radar2.animate
			properties:
				rotation: 360
			time: 3
			curve: 'linear'
		
		blueBG.animate
			properties:
				opacity: .8
			time: .4
		
		contactPopup.animate
			properties:
				y: -900
			time: .4
				
		
		
		
		# Delivered Animations	
		delivered.rotation = -12
		delivered.animate	
			properties:
				opacity: .8
			time: .55
		
		deliveringText.rotation = -38
		deliveringText.animate
			properties:
				rotation: 8
			time: 2.7
			curve: 'linear'
		
		
		
			
		Utils.delay .1, ->
			confirmation.animate
				properties:
					opacity: 1
					y: confirmationEndY
				time: .4
			
			sending.animate
				properties:
					opacity: 1
				time: .8
			
				

checkmarkEnters = ->	
	# 	confirmation checkmark animation
	Utils.delay 0, ->
		delivered.animate
			properties:
				opacity: 0
				rotation: 50
			curve: 'ease-in'
			time: .25
		
		contactCancel.animate
			properties:
				y: contactCancelEndY + 200
			time: .3
		
		sending.animate
			properties:
				opacity: 0
			time: .2
		
		illustration.animate
			properties:
				y: illustrationEndY
				opacity: 1
				
		wholeCardOutline.animate
			properties:
				opacity: 1
		
		
		Utils.delay .2, ->
			checkmarkEdgeLong.opacity = 1
			checkmarkEdgeLong.animate
				properties:
					opacity: 0
				time: .15	
		
			illustration.animate
				properties:
					opacity: 1
				time: .4
			
			glass.animate
				properties:
					y: glassEndY
				time: .3
		
			checkmarkEdge.animate
				properties:
					opacity: 1
				time: 1		
		

		
				
checkmarkExits = ->
	#	confirmation checkmark leaves
	
	checkmarkEdge.animate
		properties:
			opacity: 0
		time: .1	
					
	card.animate
		properties:
			y: card.y + 290
			opacity: 0
		time: .3
		curve: 'ease-in'
	
	glass.animate
		properties:
			y: glass.y + 290
			opacity: 0
		time: .3
		delay: .1
		curve: 'ease-in'
	
		
	contactBackground.animate
		properties:
			opacity: 0
		time: .4
		delay: .4









# Story Controller
Utils.delay 2.4, ->
	eventEnters()
	
	
	Utils.delay 1.2, ->
		openEvent()
		
		touch(440, 355)
		
		
		Utils.delay 1.2, ->
			scroll.scrollToPoint(
				y: 699, x: 0
				true
				curve: 'ease', time: .9
			)
			
			touch(530, 790)
			touchCircle.animate
				properties:
					y: touchCircle.y - 310
				time: .3
			
			
			Utils.delay .6, ->
				scroll.scrollToPoint(
					y: 1518, x: 0
					true
					curve: 'ease', time: 1.1
				)
				
				touch(520, 750)
				touchCircle.animate
					properties:
						y: touchCircle.y - 290
					time: .3
				
				
				Utils.delay 1.1, ->
					addJames()
					
					touch(163, 400)
					
					
					Utils.delay 1.6, ->
						sendRequest()
						touch(500, 775)
						
						
						Utils.delay 1.9, ->
							checkmarkEnters()
							
							
							Utils.delay 1.4, ->
								checkmarkExits()
						
			