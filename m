From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 19 Sep 2017 13:51:50 +0930
Message-ID: <20170919042150.GD10399@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:39378 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750765AbdISEfM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 00:35:12 -0400
Content-Disposition: inline
In-Reply-To: <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

Hi Michal

On Tue, Sep 19, 2017 at 06:06:48AM +0200, Micha?? K??pie?? wrote:
> > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > but it does have FUJ02B1. That means we do register the backlight
> > device (and it even seems to work), but the code will oops as soon
> > as we try to set the backlight brightness because it's trying to
> > call call_fext_func() with a NULL device. Let's just skip those
> > function calls when the FUJ02E3 device is not present.
> 
> Oh, the irony...  I have literally just sat down to dust off the patch
> series I have had queued for the past couple of months which makes the
> driver for FUJ02B1 a separate module depending on the FUJ02E3 driver.
> Then I saw your email and it is now clear that such a dependency is
> bogus.  AFAIR, until now everyone involved was expecting the FUJ02E3
> ACPI device to be present on all Fujitsu laptops.

Yes, this was the general concensus (although admittedly it was based on a
relatively small sample of Fujitsu models).

> I need to refresh my memory a bit and think about next steps.  I still
> have one more cleanup series queued that is worth posting and I also
> need to fix radio LED detection.  My spare time is still very limited,
> but I will do my best to post something soon.

In the meantime, I think we ought to consider pushing the proposed patch in
order to restore functionality for the S6120 - as it stands the code oopses,
which isn't great.  Is there any reason not to do so?

Regards
  jonathan
