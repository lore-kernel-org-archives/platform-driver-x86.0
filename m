From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] fujitsu-laptop: Add support for eco LED
Date: Fri, 24 Jun 2016 09:29:38 +0930
Message-ID: <20160623235938.GD11197@marvin.atrad.com.au>
References: <20160621080918.GA3333@Matej-PC.localdomain>
 <20160622110027.GE25599@marvin.atrad.com.au>
 <20160622124850.GA8407@Matej-PC.localdomain>
 <20160623081304.GH17670@marvin.atrad.com.au>
 <20160623175723.GA22637@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:53077 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751706AbcFWX7r (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 23 Jun 2016 19:59:47 -0400
Content-Disposition: inline
In-Reply-To: <20160623175723.GA22637@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jun 23, 2016 at 07:57:24PM +0200, Matej Groma wrote:
> > > Thank you for your review. If you want me to, I can also add a check based on
> > > a presence of eco button and join it with AND or OR. The patch should not
> > > introduce a regression because the firmware consistently returns
> > > UNSUPPORTED_CMD when queried about unknown leds.
> > 
> > An additional AND check based on this sounds like a good idea since it
> > provides another level of confidence that the LED concerned really is an Eco
> > LED.  It is also straight forward to do.  If the machine does not have an
> > Eco button then it's highly unlikely that it would have an Eco LED.
> 
> I failed to identify the bit indicating presence of eco button. I guess
> there is a difference between the old 4-key security pads (some of them
> have a key mapped to eco mode and I have no idea whether that counts as
> presence) and the other ones.

That is unfortunate and does indeed make a check based on this awkward.

> For the time being I suggest keeping the patch as it is, also the last
> check should be itself sufficient.

In the circumstances I agree.  Let's run with the current patch as is and
see what happens.

Regards
  jonathan
