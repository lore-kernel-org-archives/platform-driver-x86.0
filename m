From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Wed, 27 Sep 2017 16:57:51 +0930
Message-ID: <20170927072750.GK32089@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170927065655.GA30358@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:60876 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752195AbdI0H2k (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 03:28:40 -0400
Content-Disposition: inline
In-Reply-To: <20170927065655.GA30358@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

Hi Darren

On Tue, Sep 26, 2017 at 11:56:55PM -0700, Darren Hart wrote:
> On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > but it does have FUJ02B1. That means we do register the backlight
> > device (and it even seems to work), but the code will oops as soon
> > as we try to set the backlight brightness because it's trying to
> > call call_fext_func() with a NULL device. Let's just skip those
> > function calls when the FUJ02E3 device is not present.
> > 
> > Cc: Jonathan Woithe <jwoithe@just42.net>
> > Cc: Darren Hart <dvhart@infradead.org>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> Thanks for all the discussion on this patch. While there are a couple approaches
> we can take, it is clear further clean up and refactoring is in order. To fix
> the Ooops now, I will apply this patch to fixes and Cc Stable.

Thanks Darren.

jonathan
