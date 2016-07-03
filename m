From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2] fujitsu-laptop: Unify max brightness of exported leds
Date: Mon, 4 Jul 2016 09:05:41 +0930
Message-ID: <20160703233541.GB1198@marvin.atrad.com.au>
References: <20160629072758.GA2778@Matej-PC.localdomain>
 <20160630130057.GE32030@marvin.atrad.com.au>
 <20160701191927.GA60048@f23x64.localdomain>
 <20160701212913.GA11588@Matej-PC.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:57006 "EHLO
	server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932191AbcGCXib (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 3 Jul 2016 19:38:31 -0400
Content-Disposition: inline
In-Reply-To: <20160701212913.GA11588@Matej-PC.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matej Groma <matejgroma@gmail.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jul 01, 2016 at 11:29:14PM +0200, Matej Groma wrote:
> On Fri, Jul 01, 2016 at 12:19:27PM -0700, Darren Hart wrote:
> > 1) Matej, why do you want to make this change? You mention consistency with
> > other LEDs drivers - which ones? Also, why? Is there a tool or something that
> > expects this behavior which you want to use? Why is this better than sticking
> > with LED_OFF and LED_FULL?
> 
> I got the idea looking at the input leds - they all have set max
> brightness at 1. I find it more intuitive because there are no
> intermediate brightness levels changing nothing. Also, I think
> brightness level 1 somewhat implies that the led should be at
> least "a little on".
> 
> > 2) If we change it, we need to first introduce a version attribute (separate
> > patch), and this patch following it should increment that version indicating the
> > value policy change.
> 
> I understand your concerns about breaking the userspace. Another way of
> handling this that comes to mind is not changing the max_brightness
> but activating the leds on values 1-255. This does not break things
> "as much". A version bump would be of course legitimate in either case.
> However, a problem with the second approach is that the set value would
> have to be stored in order to return the same when querying the status
> of the led. Or, on second thought, it's probably best to leave this all
> as it is.

At this point I am inclined to agree with you: leaving it as it is.  The
need to version the user space attribute just to make what is ultimately a
cosmetic change seems like a lot of churn which bring no practical benefit.

> By the way, the eco led patch (d6b88f64b0d46) I sent previously has set
> max_brightness of the led to 1. If that was a slip through, I can send
> a patch that corrects it.

I could argue both ways here because there's no userspace API to worry about
at this stage.  Given what Darren said there's no definitive convention to
call on.  I think on balance it would make more sense if the API for the
Fujitsu LEDS was consistent within itself as much as possible, so if you
could do up a patch to correct this for the eco LED that would be
appreciated.

If down the track circumstances create a practical benefit to an API change
then we can always revisit this.

Regards
  jonathan
