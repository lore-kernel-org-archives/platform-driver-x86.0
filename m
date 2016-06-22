From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Wed, 22 Jun 2016 20:23:33 +0930
Message-ID: <20160622105333.GD25599@marvin.atrad.com.au>
References: <575FC4E0.7080501@fbihome.de>
 <20160616234630.GB4764@marvin.atrad.com.au>
 <5763C0DF.3030302@fbihome.de>
 <20160621081229.GE19735@marvin.atrad.com.au>
 <20160622073213.GD3056@eudyptula.hq.kempniu.pl>
 <576A6604.8010907@fbihome.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:52466 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752071AbcFVKxw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 22 Jun 2016 06:53:52 -0400
Content-Disposition: inline
In-Reply-To: <576A6604.8010907@fbihome.de>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jan-Marek Glogowski <glogow@fbihome.de>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, platform-driver-x86@vger.kernel.org

On Wed, Jun 22, 2016 at 12:18:44PM +0200, Jan-Marek Glogowski wrote:
> Am 22.06.2016 um 09:32 schrieb Micha?? K??pie??:
> > Is implementing this in the kernel really worth the effort?  I ended up
> > using xbacklight bound (in my window manager) to the brightness hotkeys
> > for both my Lifebook E744 and my Vostro V131, which has a royally borked
> > ACPI backlight control implementation.  It seems using userspace helpers
> > for backlight control is the new normal [1].  Yes, you lose console
> > brightness control; I can live with that, YMMV.
> > 
> > [1] https://www.spinics.net/lists/platform-driver-x86/msg07902.html
> 
> The e7x6's DSTD misses the ACPI brightness control device (FUJ02B1), so
> the brightness part of the fujitsu-laptop driver isn't used and
> therefore - in addition to the direct brightness adjustment - generates
> no keycodes for the keys.
> 
> A userspace keycode handling solution would be totally sufficient. Would
> be nice, if it worked in kernel but that's clearly optional for me.

Since the newer hardware lacks an ACPI brightness controller and it is
possible to have userspace deal with the brightness in these cases, it seems
to me that the solution to the issue lies outside of the fujitsu-laptop
module (which is focussed on the custom devices in the laptops).  I am more
than willing to be convinced otherwise, but at present this seems to be the
prevailing line of thought.

Regards
  jonathan
