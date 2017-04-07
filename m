From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 00/11] fujitsu-laptop: backlight cleanup
Date: Fri, 7 Apr 2017 21:41:35 +0930
Message-ID: <20170407121135.GD15240@marvin.atrad.com.au>
References: <20170405064910.3162-1-kernel@kempniu.pl>
 <20170405153600.GC27833@fury>
 <20170405195534.GB892@kmp-mobile.hq.kempniu.pl>
 <20170406004514.GC25480@marvin.atrad.com.au>
 <20170406030754.GA23819@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:37018 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932938AbdDGMML (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 7 Apr 2017 08:12:11 -0400
Content-Disposition: inline
In-Reply-To: <20170406030754.GA23819@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Micha?? K??pie?? <kernel@kempniu.pl>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Apr 05, 2017 at 08:07:54PM -0700, Darren Hart wrote:
> On Thu, Apr 06, 2017 at 10:15:14AM +0930, Jonathan Woithe wrote:
> > On Wed, Apr 05, 2017 at 09:55:34PM +0200, Micha?? K??pie?? wrote:
> > > > On Wed, Apr 05, 2017 at 08:48:59AM +0200, Micha?? K??pie?? wrote:
> > > > > This series introduces further changes to the way LCD backlight is
> > > > > handled by fujitsu-laptop.  These changes include fixing a bug in code
> > > > > responsible for generating brightness-related input events, cleaning up
> > > > > handling of module parameters, reducing code duplication, removing
> > > > > superfluous debug messages and other fixes.
> > > > > 
> > > > > This series was tested on a Lifebook S7020 and a Lifebook E744.
> > > > > 
> > > > > This series is based on the testing branch as it requires earlier patch
> > > > > series I submitted in order to apply cleanly.
> > > > > 
> > > > > Changes from v1:
> > > > > 
> > > > >   - Update debug message logged by set_lcd_level() to reflect code flow
> > > > >     changes introduced by patch 04/11.
> > > > 
> > > > Queued to testing, thanks! 
> > > 
> > > Jonathan, I would still love to hear your opinion on this series.  Take
> > > your time, though, I do not see any reason to rush things.  I will only
> > > send the next series once you ack this one.
> > 
> > Sure, no problem.  As mentioned earlier, this week has been busy.  I am
> > hoping I might find the time to complete my review this evening.  If not, it
> > will be some time over the weekend.
> 
> Eeek, I jumped the gun on that. I've moved this from testing to fujitsu, and
> it'll wait there until Jonathan gets a chance to review. Apologies Jonathan.

That's fine, these things happen.

I've completed a review of this series.  It represents another worthwhile
evolutionary clean up of the fujitsu-laptop driver, this time concentrating
on the backlight functions.  Importantly, it makes adjustments for changes
in related kernel infrastructure as it has evolved over the last few
years (the handling of module parameters, method return values and so on).

I am happy for this series to be merged.  Thanks Michael for your continued
clean up efforts.

Reviewed-by: Jonathan Woithe <jwoithe@just42.net>

Regards
  jonathan
