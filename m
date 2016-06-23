From: Matej Groma <matejgroma@gmail.com>
Subject: Re: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Thu, 23 Jun 2016 19:57:24 +0200
Message-ID: <20160623175723.GA22637@Matej-PC.localdomain>
References: <20160621080918.GA3333@Matej-PC.localdomain>
 <20160622110027.GE25599@marvin.atrad.com.au>
 <20160622124850.GA8407@Matej-PC.localdomain>
 <20160623081304.GH17670@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35783 "EHLO
	mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751713AbcFWR53 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 13:57:29 -0400
Received: by mail-wm0-f68.google.com with SMTP id a66so12891165wme.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jun 2016 10:57:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160623081304.GH17670@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jun 23, 2016 at 05:43:05PM +0930, Jonathan Woithe wrote:
> On Wed, Jun 22, 2016 at 02:48:52PM +0200, Matej Groma wrote:
> > On Wed, Jun 22, 2016 at 08:30:28PM +0930, Jonathan Woithe wrote:
> > > On Tue, Jun 21, 2016 at 10:09:21AM +0200, Matej Groma wrote:
> > > > There is an indicator LED signaling activated power saving mode
> > > > on certain Fujitsu laptop models. This has currently no use on Linux.
> > > > Export it to userspace.
> > > 
> > > This looks ok to me.  My only reservation is the implicit assumption that
> > > bit 14 is uniquely used across all models supported by this driver to
> > > indicate the presence of this LED.  The assumption seems reasonable enough
> > > based on what we know though, so in the absence of any documentation the
> > > best thing we can do is put the patch out there and see if there are any
> > > unintended side effects.
> > 
> > Thank you for your review. If you want me to, I can also add a check based on
> > a presence of eco button and join it with AND or OR. The patch should not
> > introduce a regression because the firmware consistently returns
> > UNSUPPORTED_CMD when queried about unknown leds.
> 
> An additional AND check based on this sounds like a good idea since it
> provides another level of confidence that the LED concerned really is an Eco
> LED.  It is also straight forward to do.  If the machine does not have an
> Eco button then it's highly unlikely that it would have an Eco LED.

I failed to identify the bit indicating presence of eco button. I guess there is
a difference between the old 4-key security pads (some of them have a key mapped
to eco mode and I have no idea whether that counts as presence) and the other
ones. Here are some values for future reference found in various kernel logs.
Model		BTNI
P7120		0x80001
SH561,S761	0x10f0101
U554,AH512	0x80001
E744,E756 	0x01010001
E8420		0x000F0101
S7220		0xf0101
S7020		0xf0001
For the time being I suggest keeping the patch as it is, also the last check
should be itself sufficient.
