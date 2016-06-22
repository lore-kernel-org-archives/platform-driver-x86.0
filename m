From: Matej Groma <matejgroma@gmail.com>
Subject: Re: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Wed, 22 Jun 2016 14:48:52 +0200
Message-ID: <20160622124850.GA8407@Matej-PC.localdomain>
References: <20160621080918.GA3333@Matej-PC.localdomain>
 <20160622110027.GE25599@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35005 "EHLO
	mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141AbcFVMs4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 08:48:56 -0400
Received: by mail-wm0-f66.google.com with SMTP id a66so881867wme.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Jun 2016 05:48:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160622110027.GE25599@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

On Wed, Jun 22, 2016 at 08:30:28PM +0930, Jonathan Woithe wrote:
> On Tue, Jun 21, 2016 at 10:09:21AM +0200, Matej Groma wrote:
> > There is an indicator LED signaling activated power saving mode
> > on certain Fujitsu laptop models. This has currently no use on Linux.
> > Export it to userspace.
> 
> This looks ok to me.  My only reservation is the implicit assumption that
> bit 14 is uniquely used across all models supported by this driver to
> indicate the presence of this LED.  The assumption seems reasonable enough
> based on what we know though, so in the absence of any documentation the
> best thing we can do is put the patch out there and see if there are any
> unintended side effects.

Thank you for your review. If you want me to, I can also add a check based on
a presence of eco button and join it with AND or OR. The patch should not
introduce a regression because the firmware consistently returns
UNSUPPORTED_CMD when queried about unknown leds.

On a different note, I propose consolidating maximum brightnesses of leds
to 1 where applicable, because all but one can have only two states. I can
send another patch if that's okay.

> 
> Acked-by: Jonathan Woithe <jwoithe@just42.net>
> 
> > 
> > Signed-off-by: Matej Groma <matejgroma@gmail.com>
> > ---
> > 
> > Notes:
> >     Tested on Lifebook E756
> > 
> >  drivers/platform/x86/fujitsu-laptop.c | 56 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> > 
> > diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/fujitsu-laptop.c
> > index ce41bc3..66e12a2 100644
> > --- a/drivers/platform/x86/fujitsu-laptop.c
> > +++ b/drivers/platform/x86/fujitsu-laptop.c
> > @@ -108,6 +108,8 @@
> >  #define LOGOLAMP_POWERON 0x2000
> >  #define LOGOLAMP_ALWAYS  0x4000
> >  #define RADIO_LED_ON	0x20
> > +#define ECO_LED	0x10000
> > +#define ECO_LED_ON	0x80000
> >  #endif
> > 
> >  /* Hotkey details */
> > @@ -176,6 +178,7 @@ struct fujitsu_hotkey_t {
> >  	int logolamp_registered;
> >  	int kblamps_registered;
> >  	int radio_led_registered;
> > +	int eco_led_registered;
> >  };
> > 
> >  static struct fujitsu_hotkey_t *fujitsu_hotkey;
> > @@ -212,6 +215,17 @@ static struct led_classdev radio_led = {
> >   .brightness_get = radio_led_get,
> >   .brightness_set = radio_led_set
> >  };
> > +
> > +static enum led_brightness eco_led_get(struct led_classdev *cdev);
> > +static void eco_led_set(struct led_classdev *cdev,
> > +			       enum led_brightness brightness);
> > +
> > +static struct led_classdev eco_led = {
> > + .name = "fujitsu::eco_led",
> > + .max_brightness = 1,
> > + .brightness_get = eco_led_get,
> > + .brightness_set = eco_led_set
> > +};
> >  #endif
> > 
> >  #ifdef CONFIG_FUJITSU_LAPTOP_DEBUG
> > @@ -296,6 +310,18 @@ static void radio_led_set(struct led_classdev *cdev,
> >  		call_fext_func(FUNC_RFKILL, 0x5, RADIO_LED_ON, 0x0);
> >  }
> > 
> > +static void eco_led_set(struct led_classdev *cdev,
> > +				enum led_brightness brightness)
> > +{
> > +	int curr;
> > +
> > +	curr = call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0);
> > +	if (brightness)
> > +		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr | ECO_LED_ON);
> > +	else
> > +		call_fext_func(FUNC_LEDS, 0x1, ECO_LED, curr & ~ECO_LED_ON);
> > +}
> > +
> >  static enum led_brightness logolamp_get(struct led_classdev *cdev)
> >  {
> >  	enum led_brightness brightness = LED_OFF;
> > @@ -330,6 +356,16 @@ static enum led_brightness radio_led_get(struct led_classdev *cdev)
> > 
> >  	return brightness;
> >  }
> > +
> > +static enum led_brightness eco_led_get(struct led_classdev *cdev)
> > +{
> > +	enum led_brightness brightness = LED_OFF;
> > +
> > +	if (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) & ECO_LED_ON)
> > +		brightness = cdev->max_brightness;
> > +
> > +	return brightness;
> > +}
> >  #endif
> > 
> >  /* Hardware access for LCD brightness control */
> > @@ -943,6 +979,23 @@ static int acpi_fujitsu_hotkey_add(struct acpi_device *device)
> >  			       result);
> >  		}
> >  	}
> > +
> > +	/* Support for eco led is not always signaled in bit corresponding
> > +	 * to the bit used to control the led. According to the DSDT table,
> > +	 * bit 14 seems to indicate presence of said led as well.
> > +	 * Confirm by testing the status.
> > +	*/
> > +	if ((call_fext_func(FUNC_LEDS, 0x0, 0x0, 0x0) & BIT(14)) &&
> > +	   (call_fext_func(FUNC_LEDS, 0x2, ECO_LED, 0x0) != UNSUPPORTED_CMD)) {
> > +		result = led_classdev_register(&fujitsu->pf_device->dev,
> > +						&eco_led);
> > +		if (result == 0) {
> > +			fujitsu_hotkey->eco_led_registered = 1;
> > +		} else {
> > +			pr_err("Could not register LED handler for eco LED, error %i\n",
> > +			       result);
> > +		}
> > +	}
> >  #endif
> > 
> >  	return result;
> > @@ -972,6 +1025,9 @@ static int acpi_fujitsu_hotkey_remove(struct acpi_device *device)
> > 
> >  	if (fujitsu_hotkey->radio_led_registered)
> >  		led_classdev_unregister(&radio_led);
> > +
> > +	if (fujitsu_hotkey->eco_led_registered)
> > +		led_classdev_unregister(&eco_led);
> >  #endif
> > 
> >  	input_unregister_device(input);
