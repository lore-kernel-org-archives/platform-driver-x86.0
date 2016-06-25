From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: Brightness and "touchpad dis-/enable" keys not working for
 Fujitsu e7x6
Date: Sat, 25 Jun 2016 18:20:53 +0930
Message-ID: <20160625085052.GA5137@marvin.atrad.com.au>
References: <576A90FB.9090506@fbihome.de>
 <20160623111819.GA4284@eudyptula.hq.kempniu.pl>
 <576BD150.6050304@fbihome.de>
 <20160623123506.GA4461@eudyptula.hq.kempniu.pl>
 <576C1B0C.5050206@fbihome.de>
 <20160624071224.GA5289@eudyptula.hq.kempniu.pl>
 <576CFBC6.2000309@fbihome.de>
 <20160624102024.GA5461@eudyptula.hq.kempniu.pl>
 <576D5523.7030309@fbihome.de>
 <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:53579 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751229AbcFYIvP (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sat, 25 Jun 2016 04:51:15 -0400
Content-Disposition: inline
In-Reply-To: <20160624201737.GA5843@eudyptula.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Jan-Marek Glogowski <glogow@fbihome.de>, platform-driver-x86@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>

On Fri, Jun 24, 2016 at 10:17:37PM +0200, Micha?? K??pie?? wrote:
> > Got an other call from Fujitsu. They pointed me to the i915 patchset,
> > fixing the bug: https://www.spinics.net/lists/intel-gfx/msg98326.html
> > 
> > I backported the patchset to my Ubuntu Xenial i915 module, and I have
> > working brightness keys :-)
> 
> Great!  Kudos to Fujitsu for getting back to you so quickly with a
> working solution.

That's great news.  Thanks to all who have pursued this issue.  At least now
we have some understanding as to what's going on behind the scenes on this
hardware, even it if it rather convoluted.

> ...though if you think about it, the whole thing is absolutely hideous:
> an *ACPI* driver requires cooperation from a *video* driver to notify
> the operating system about a *key press*.

Yeah.  On one hand I'm utterly amazed.  On the other, I've seen and read
about other really bizarre things which go on in the BIOSes of computers
over the years, so nothing really surprises me anymore. :-)

My understanding based on this latest information is that the patch to the
i915 driver fixes the brightness control on these laptops and that no
changes to fujitsu-laptop are required for this.  Is this correct?  As to
the touch keys, it sounds like this might be a BIOS thing to - is it?

Regards
  jonathan
