From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 20:16:36 +0930
Message-ID: <20160622104636.GC25599@marvin.atrad.com.au>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au>
 <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52469 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751175AbcFVLGl (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 07:06:41 -0400
Content-Disposition: inline
In-Reply-To: <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org

On Wed, Jun 22, 2016 at 09:32:13AM +0200, Micha?? K??pie?? wrote:
> > > A backlight device is available via /sys/class/backlight/intel_backlight
> > > and you can change brightness manually. AFAIK this device is provided by
> > > the i915 driver.
> > 
> > So perhaps the intent on other systems is to respond to the ACPI button
> > notifications by manipulating the intel backlight hardware.  If this is the
> > case we'd need a way to do this from within the fujitsu-laptop driver in
> > response to the buttons you've identified.
> 
> Is implementing this in the kernel really worth the effort?

For the newer hardware which seems to rely on non-ACPI methods to control
the brightness, I suspect not (I meant to mention this thought in my
response quoted above but got distracted and forgot about it).  Especially
when the vendor keeps changing their interfaces.

> I ended up using xbacklight bound (in my window manager) to the brightness
> hotkeys for both my Lifebook E744 and my Vostro V131, which has a royally
> borked ACPI backlight control implementation.  It seems using userspace
> helpers for backlight control is the new normal [1].  Yes, you lose
> console brightness control; I can live with that, YMMV.

When there is an alternative avenue to achieve the desired effect through
existing userspace solutions - as is the case in the situation putlined
above - then there seems little point in trying to duplicate the
functionality in the kernel.  Brightness control on the console these days
would be needed by very few people.

I am wondering whether an approach similar to the above might work for the
OP as a permanent solution.

Regards
  jonathan
