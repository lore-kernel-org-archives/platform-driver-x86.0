From: Jens Taprogge <jens.taprogge@taprogge.org>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Sat, 24 Mar 2012 01:05:10 +0100
Message-ID: <20120324000510.GB5722@endeavour.taprogge.org>
References: <20120322234934.GA8338@endeavour.taprogge.org>
 <20120323193951.GA24054@khazad-dum.debian.net>
 <20120323194355.GA27877@srcf.ucam.org>
 <20120323233807.GA12072@khazad-dum.debian.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from shamrock.taprogge.org ([213.146.117.139]:35497 "EHLO
	shamrock.taprogge.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559Ab2CXAFT (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 20:05:19 -0400
Content-Disposition: inline
In-Reply-To: <20120323233807.GA12072@khazad-dum.debian.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

On Fri, Mar 23, 2012 at 08:38:07PM -0300, Henrique de Moraes Holschuh wrote:
> On Fri, 23 Mar 2012, Matthew Garrett wrote:
> > I'm a little unenthusiastic about just pulling this in without working 
> > out how userspace is going to consume it. It's a problem we may hit on 
> > other devices as well, so we potentially need some sort of consistent 
> > naming to indicate that it's a built-in mute LED.
> 
> Hmm, I am not enthusiastic about exposing MIC leds for userspace to screw up
> at all.  I'd rather expose an alsa mixer control that lets one mute/unmute
> the platform MIC, and have the kernel (if the platform doesn't do it
> already) enforce the LED to always be in the correct state.
> 
> In my book, MICs getting enabled "stealthly" is something to be avoided on
> the design.
> 
> However, I am not sure this platform interface exists on thinkpads (I do
> think there is something, though.  Tracking the HKEY event on several DSDTs
> and looking at what it touches in the EC, plus some experiments should be
> able to give us a better picture).
> 
> Exposing the LED for anyone who wants to play with it looked like a good
> compromise for the time being.  Since it is not considered a "safe" led, it
> is not something that will be made generally available (requires a kconfig
> option to be set, which distros are not supposed to enable).
> 
> I don't have anything against using a standard name, if such a thing exists
> though.  But it would make a LOT more sense to have alsa provide a
> standard-named *trigger* that could be hooked to any LED and follows the MIC
> mute state of a mixer...

I am cc:ing Takashi Iwai.

I am not sure thinkpad_acpi needs to provide a mixer.  I think what is
important is that the user can rely on the LED to be only on if the mic
is muted.  The mute key can be handled by userspace as long as the led
always gives the correct information.

The modern laptops are all based on HDA audio.  In the BIOS the
different functions of the respective connections are stored.  So the
sound layer knows which connection is the internal mic.  (An after
analyzing the information provided on the Thinkpads seems to be correct
in this regard.)

So to make sure the LED presents the actual state of the muting it would
be sufficient for ALSA to expose the mixer state to thinkpad_acpi or
better call a callback on changes.  To make it applicable to a wider
range of devices one could come up with a design like this:

   #define SND_ENABLED_INTMIC      1 << 0
   #define SND_ENABLED_INT_SPEAKER 1 << 16
   #define SND_ENABLED_ALLINPUTS   0x0000ffff
   #define SND_ENABLED_ALLOUTPUTS  0xffff0000

   /* returns current state or -1 for error */
   int snd_register_mute_cb(void (*callback)(int muted, void *private), void *private);
   int snd_unregister_mute_cb(void (*callback)(int muted, void *private));

This would give any other module the ability to receive a notification
when a device is muted.  The internal mic is special since the user can
not unplug it.  So it gets a defined position in the array.  Apart from
that one could use the LED to display if any mic is open.

Best Regards
Jens
