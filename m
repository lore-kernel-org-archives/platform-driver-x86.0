From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Tue, 21 Jun 2016 17:42:29 +0930
Message-ID: <20160621081229.GE19735@marvin.atrad.com.au>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au>
 <5763C0DF.3030302@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52009 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750978AbcFUIwE (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2016 04:52:04 -0400
Content-Disposition: inline
In-Reply-To: <5763C0DF.3030302@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: platform-driver-x86@vger.kernel.org

Hi Jan-Marek

On Fri, Jun 17, 2016 at 11:20:31AM +0200, Jan-Marek Glogowski wrote:
> Just to make this clear. It's not "touchpad keys" but the "Fn + F4",
> which should toggle the touchpad functionality (is broken on Windows too).

No problem, that's what I understood from your original description.

> I'm just talking about Fn + Brightness (Fn + (F6|F7)) and "touchpad
> dis-/enable" (Fn + F4) key events.
> Not those real extra buttons, like ECO, RFkill, etc.

Thanks.

> >> I checked the DSTD from the old and new HW. The size has more then
> >> duplicated (414k => 955k) with a 43k diff. The diff for the FUJ02E3
> >> device is just 356 lines, but I couldn't identify anything, which might
> >> relate to the keys.
> 
> 43k = lines. (I didn't find a way to normalize the DSTD to catch moved
> objects).

Hmm, it sounds like they changed quite a bit. :-(

> > Perhaps they've introduced a new backlight control device with a different
> > HID (except you mentioned that only FUJ02E3 was listed even on other OSes,
> > so I guess this is unlikely).
> 
> The diff of the sorted device list is also 230 lines. I checked the
> devices, which start with F, but these don't seem interesting.

I'm not surprised.  If there was another HID it's reasonable to expect it to
be listed on the other systems.

> > I don't have access to any of the newer Fujitsu hardware so I can't do much
> > in relation to debugging the problem.  Obviously the buttons concerned
> > generate ACPI notifications.  Without a FUJ02B1 and any obvious extension 
> > to FUJ02E3, my only thought at present is that they've taken backlight
> > control out of ACPI (that is, based on the ACPI button notification they
> > poke other hardware to effect the brightness control).  It does seem a bit
> > odd though.
> > 
> > In any case, we'd have to identify what is meant to be done (and what is
> > done under other OSes) in reponse to these buttons.
> > 
> > I assume that the brightness buttons don't do anything when fujitsu-laptop
> > is unloaded?  I'm wondering whether the standard backlight driver might be
> > operational on this hardware.
> 
> Unloading doesn't help.

Again, no surprises.

> A backlight device is available via /sys/class/backlight/intel_backlight
> and you can change brightness manually. AFAIK this device is provided by
> the i915 driver.

So perhaps the intent on other systems is to respond to the ACPI button
notifications by manipulating the intel backlight hardware.  If this is the
case we'd need a way to do this from within the fujitsu-laptop driver in
response to the buttons you've identified.  I'm going from memory here, but
I don't think the S7020 that I have includes the intel backlight control
hardware.  This was the motivation for the initial implementation of the
fujitsu-laptop module which utilised the ACPI brightness controller.  It's
been a while since I did those investigations though: I'll see if I can find
my notes.

> We'll use the KDE battery applet as a workaround, so users have a way to
> change the backlight.

This may be the easiest approach, at least in the short term.

> OTOH a colleague told me our vendor has opened a service call with
> Fujitsu and was told Fujitsu is working on a fix - at least for the
> Touchpad button (quite probably a BIOS update).
> 
> If you don't have an additional ideas for me to check, I'll wait for a
> reply from Fujitsu.

Let's see what comes back, at least in response to the touchpad button.  If
they do issue a BIOS update it will be interesting to see whether the
brightness control is affected in any way.  I suspect it won't be, but you
never know.

Regards
  jonathan
