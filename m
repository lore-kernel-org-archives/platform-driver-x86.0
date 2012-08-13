From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: [PATCH] apple-gmux: Add support for message box interface (as
 found in MBP10,1/Retina MacBook Pro)
Date: Mon, 13 Aug 2012 14:15:37 -0500
Message-ID: <20120813191537.GG24088@thinkpad-t410>
References: <5028CC19.6070003@vmars.tuwien.ac.at>
 <20120813170908.GC24088@thinkpad-t410>
 <502940FD.4090202@vmars.tuwien.ac.at>
 <20120813181700.GD24088@thinkpad-t410>
 <50294E9D.8050905@vmars.tuwien.ac.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:54130 "EHLO
	youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751908Ab2HMTP4 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 13 Aug 2012 15:15:56 -0400
Content-Disposition: inline
In-Reply-To: <50294E9D.8050905@vmars.tuwien.ac.at>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Bernhard Froemel <froemel@vmars.tuwien.ac.at>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org, Andreas Heider <andreas@meetr.de>, Greg KH <gregkh@linuxfoundation.org>

On Mon, Aug 13, 2012 at 08:59:41PM +0200, Bernhard Froemel wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> On 08/13/2012 08:17 PM, Seth Forshee wrote:
> > It was discussed briefly on irc.
> > 
> > http://irclogs.ubuntu.com/2012/08/09/%23ubuntu-kernel.txt
> > 
> Yes, it's very similar. Don't want to start any wars here ;) but:
> >>> but I think his implementation looked cleaner
> I only occasionally write kernel code, but can't there be any
> concurrency issues during reads/writes of internal gmux registers (I
> used a semaphore to prevent that)? Especially if vga_switcheroo also
> taps in?

There aren't concurrency issues right now since only backlight is
supported, and the backlight class driver serializes callbacks into the
driver with a mutex. But when switcheroo support is added some
concurrency protection is probably necessary. A mutex should be used
rather than a semaphore however.

Seth
