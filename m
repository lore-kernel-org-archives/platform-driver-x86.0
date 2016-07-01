From: Matej Groma <matejgroma@gmail.com>
Subject: Re: [PATCH v2] fujitsu-laptop: Unify max brightness of exported leds
Date: Fri, 1 Jul 2016 23:29:14 +0200
Message-ID: <20160701212913.GA11588@Matej-PC.localdomain>
References: <20160629072758.GA2778@Matej-PC.localdomain>
 <20160630130057.GE32030@marvin.atrad.com.au>
 <20160701191927.GA60048@f23x64.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36638 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752025AbcGAV3U (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 1 Jul 2016 17:29:20 -0400
Content-Disposition: inline
In-Reply-To: <20160701191927.GA60048@f23x64.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: jwoithe@just42.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 01, 2016 at 12:19:27PM -0700, Darren Hart wrote:
> On Thu, Jun 30, 2016 at 10:30:57PM +0930, Jonathan Woithe wrote:
> > On Wed, Jun 29, 2016 at 09:28:03AM +0200, Matej Groma wrote:
> > > Exported leds had maximum brightness previously unset, thus having
> > > value 255. Set maximum brightness of leds that can only be turned
> > > off or on to 1, making the behavior more consistent with other leds
> > > having binary state.
> > 
> > I understand the motivation here.  Is this change consistent with the LED
> > API though?  Currently for the binary state Fujitsu LEDs, LED_OFF (0) means
> > off and LED_FULL (255) means on.  It seems to me that this is the most
> > obvious way to use the LED API with binary state LEDs.  This patch changes
> 
> That was my reading as well. There is no "enum led_toggle", so using LED_OFF (0)
> and LED_FULL (255) seems like the natural set of values. That said, the
> "max_brightness" field seems somewhat orthogonal to to the enum led_brightness
> mechanism.... hrm...
> 
> 
> > the "on" brightness to 1, which is clearly not LED_FULL (it does however
> > match the max_brightness configured for the LED).  Thus there is an
> > inconsistency: the brightness isn't LED_FULL but in reality the LED is as
> > bright as it goes.  Could this create problems within the LED subsystem, or
> > is there nothing special attached to the LED_FULL value?  A quick look
> > through the leds driver didn't turn up anything obvious, but I might have
> > missed some subtlties.
> > 
> > Darren: any thoughts?
> 
> According to Documentation/leds/leds-class.txt:
> 
> "
> In its simplest form, the LED class just allows control of LEDs from userspace.
> LEDs appear in /sys/class/leds/. The maximum brightness of the LED is defined in
> max_brightness file. The brightness file will set the brightness of the LED
> (taking a value 0-max_brightness). Most LEDs don't have hardware brightness
> support so will just be turned on for non-zero brightness settings.
> "
> 
> So, using 1 is consistent with the above, but it isn't clear that it's "better"
> or "more correct". It does change the user interface to the LEDs on fujitsu
> laptops, which we have to consider very carefully. If we do this, we need to
> introduce a version attribute. See Documentation/sysfs-rules.txt:
> 
> "
> Userspace applications can, however, expect the format and contents of the
> attribute files to remain consistent in the absence of a version attribute
> change in the context of a given attribute.
> "
> 
> Next steps:
> 
> 1) Matej, why do you want to make this change? You mention consistency with
> other LEDs drivers - which ones? Also, why? Is there a tool or something that
> expects this behavior which you want to use? Why is this better than sticking
> with LED_OFF and LED_FULL?
> 

I got the idea looking at the input leds - they all have set max
brightness at 1. I find it more intuitive because there are no
intermediate brightness levels changing nothing. Also, I think
brightness level 1 somewhat implies that the led should be at
least "a little on".

> 2) If we change it, we need to first introduce a version attribute (separate
> patch), and this patch following it should increment that version indicating the
> value policy change.
> 

I understand your concerns about breaking the userspace. Another way of
handling this that comes to mind is not changing the max_brightness
but activating the leds on values 1-255. This does not break things
"as much". A version bump would be of course legitimate in either case.
However, a problem with the second approach is that the set value would
have to be stored in order to return the same when querying the status
of the led. Or, on second thought, it's probably best to leave this all
as it is.

By the way, the eco led patch (d6b88f64b0d46) I sent previously has set
max_brightness of the led to 1. If that was a slip through, I can send
a patch that corrects it.

> --
> Darren
> 
> 
> > 
> > Regards
> >   jonathan
> > 
> > > Signed-off-by: Matej Groma <matejgroma@gmail.com>
> > > ---
> > > Changes from v1:
> > > 	made commit message more clear
> > > 	rebased on testing
> > > 
> > >  drivers/platform/x86/fujitsu-laptop.c | 10 ++++++----
> > >  1 file changed, 6 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > > index 6ce8e78..abb7c62 100644
> > > --- a/drivers/platform/x86/fujitsu-laptop.c
> > > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > > @@ -192,6 +192,7 @@ static void kblamps_set(struct led_classdev *cdev,
> > > 
> > >  static struct led_classdev kblamps_led = {
> > >   .name = "fujitsu::kblamps",
> > > + .max_brightness = 1,
> > >   .brightness_get = kblamps_get,
> > >   .brightness_set = kblamps_set
> > >  };
> > > @@ -202,6 +203,7 @@ static void radio_led_set(struct led_classdev *cdev,
> > > 
> > >  static struct led_classdev radio_led = {
> > >   .name = "fujitsu::radio_led",
> > > + .max_brightness = 1,
> > >   .brightness_get = radio_led_get,
> > >   .brightness_set = radio_led_set
> > >  };
> > > @@ -285,7 +287,7 @@ static void logolamp_set(struct led_classdev *cdev,
> > >  static void kblamps_set(struct led_classdev *cdev,
> > >  			       enum led_brightness brightness)
> > >  {
> > > -	if (brightness >= LED_FULL)
> > > +	if (brightness)
> > >  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_ON);
> > >  	else
> > >  		call_fext_func(FUNC_LEDS, 0x1, KEYBOARD_LAMPS, FUNC_LED_OFF);
> > > @@ -294,7 +296,7 @@ static void kblamps_set(struct led_classdev *cdev,
> > >  static void radio_led_set(struct led_classdev *cdev,
> > >  				enum led_brightness brightness)
> > >  {
> > > -	if (brightness >= LED_FULL)
> > > +	if (brightness)
> > >  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, RADIO_LED_ON);
> > >  	else
> > >  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
> > > @@ -332,7 +334,7 @@ static enum led_brightness kblamps_get(struct led_classdev *cdev)
> > >  	enum led_brightness brightness = LED_OFF;
> > > 
> > >  	if (call_fext_func(FUNC_LEDS, 0x2, KEYBOARD_LAMPS, 0x0) == FUNC_LED_ON)
> > > -		brightness = LED_FULL;
> > > +		brightness = cdev->max_brightness;
> > > 
> > >  	return brightness;
> > >  }
> > > @@ -342,7 +344,7 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
> > >  	enum led_brightness brightness = LED_OFF;
> > > 
> > >  	if (call_fext_func(FUNC_RFKILL, 0x4, 0x0, 0x0) & RADIO_LED_ON)
> > > -		brightness = LED_FULL;
> > > +		brightness = cdev->max_brightness;
> > > 
> > >  	return brightness;
> > >  }
> > 
> > -- 
> > 
> 
> -- 
> Darren Hart
> Intel Open Source Technology Center
