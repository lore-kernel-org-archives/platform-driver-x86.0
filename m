From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH] [thinkpad-acpi] Add T410s and T420s LED support
Date: Fri, 23 Mar 2012 23:50:38 -0300
Message-ID: <20120324025038.GA23662@khazad-dum.debian.net>
References: <20120322234934.GA8338@endeavour.taprogge.org>
 <20120323193951.GA24054@khazad-dum.debian.net>
 <20120323194355.GA27877@srcf.ucam.org>
 <20120323233807.GA12072@khazad-dum.debian.net>
 <20120324000510.GB5722@endeavour.taprogge.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42283 "EHLO
	out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754180Ab2CXCus (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 23 Mar 2012 22:50:48 -0400
Received: from compute2.internal (compute2.nyi.mail.srv.osa [10.202.2.42])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id 0442B2171F
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 Mar 2012 22:50:48 -0400 (EDT)
Content-Disposition: inline
In-Reply-To: <20120324000510.GB5722@endeavour.taprogge.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jens Taprogge <jens.taprogge@taprogge.org>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, platform-driver-x86@vger.kernel.org, Takashi Iwai <tiwai@suse.de>

On Sat, 24 Mar 2012, Jens Taprogge wrote:
> I am not sure thinkpad_acpi needs to provide a mixer.  I think what is

It does, but not on all thinkpads.  AFAIK, even the newer ones that are not
OEM junk with a thin layer of thinkpad IP added still have a FET mute-gating
the speakers, controlled by the EC.

> important is that the user can rely on the LED to be only on if the mic
> is muted.  The mute key can be handled by userspace as long as the led
> always gives the correct information.

And as long as it is not in control of the firmware.  Otherwise, bad things
happen.

> The modern laptops are all based on HDA audio.  In the BIOS the
> different functions of the respective connections are stored.  So the
> sound layer knows which connection is the internal mic.  (An after
> analyzing the information provided on the Thinkpads seems to be correct
> in this regard.)

Have you tested and made sure Lenovo did not mute-gate the MIC through the
EC on the better thinkpad lines?

> So to make sure the LED presents the actual state of the muting it would
> be sufficient for ALSA to expose the mixer state to thinkpad_acpi or
> better call a callback on changes.  To make it applicable to a wider
> range of devices one could come up with a design like this:
> 
>    #define SND_ENABLED_INTMIC      1 << 0
>    #define SND_ENABLED_INT_SPEAKER 1 << 16
>    #define SND_ENABLED_ALLINPUTS   0x0000ffff
>    #define SND_ENABLED_ALLOUTPUTS  0xffff0000
> 
>    /* returns current state or -1 for error */
>    int snd_register_mute_cb(void (*callback)(int muted, void *private), void *private);
>    int snd_unregister_mute_cb(void (*callback)(int muted, void *private));
> 
> This would give any other module the ability to receive a notification
> when a device is muted.  The internal mic is special since the user can
> not unplug it.  So it gets a defined position in the array.  Apart from
> that one could use the LED to display if any mic is open.

If you're going to do it that way, why not provide LED triggers?

-- 
  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
  Henrique Holschuh
