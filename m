From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 12:09:08 -0500
Message-ID: <20120813170908.GC24088@thinkpad-t410>
References: <5028CC19.6070003@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:53614 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752690Ab2HMRJb (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 13:09:31 -0400
Content-Disposition: inline
In-Reply-To: <5028CC19.6070003@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>, Greg KH <gregkh@linuxfoundation.org>

On Mon, Aug 13, 2012 at 11:42:49AM +0200, Bernhard Froemel wrote:
> 
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Dear all,
> 
> Apple changed the interface to the gmux device in recent models (at
> least MBP 10,1).
> This patch [1] (also attached) against 3.6-rc1 adds support for the
> changed interface.
> Previously the interface to gmux registers was memory mapped, now there
> is a message box
> interface (address, status, data I/O ports). The gmux register layout
> itself seems to be unchanged.
> I chose rather safe delays (1 ms) for access relaxation -- without any
> relaxation the
> communication is unreliable for me.
> If someone with an older MBP could test whether the interface detection
> (DPM/classic) works it
> would be great. I used a similar detection routine Apple is using in
> their driver.

Matthew also made some progress with this last week, at least enough to
get the backlight working. From what I remember of looking at his
changes these look fairly similar, but I think his implementation looked
cleaner and possibly more complete.

> I see that there is a lot going on concerning and related to the
> apple-gmux currently:
> https://lkml.org/lkml/2012/7/9/715
> https://lkml.org/lkml/2012/8/3/300

I'm slowly making progress on the graphics switching stuff. I've got
patches for vga_switcheroo and apple-gmux that make the muxing itself
work fine, the problems now all revolve around making the graphics
drivers deal with difficult behavior from Apple machines.

Thanks,
Seth
