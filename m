From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Mon, 25 Sep 2017 15:14:41 +0300
Message-ID: <20170925121441.GR4914@intel.com>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170923090839.GC21630@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:16761 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932656AbdIYMOw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 08:14:52 -0400
Content-Disposition: inline
In-Reply-To: <20170923090839.GC21630@marvin.atrad.com.au>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

On Sat, Sep 23, 2017 at 06:38:40PM +0930, Jonathan Woithe wrote:
> Hi Darren
> 
> The more detailed follow-up, as promised. :-)  Sorry for the delay.
> 
> On Fri, Sep 22, 2017 at 05:00:48PM -0700, Darren Hart wrote:
> > On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> > > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > 
> > > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > > but it does have FUJ02B1. That means we do register the backlight
> > > device (and it even seems to work), but the code will oops as soon
> > > as we try to set the backlight brightness because it's trying to
> > 
> > I'm curious by what you mean with "it even seems to work". Since it
> > crashes when adjusting, what does it do that "works" ?
> 
> As mentioned earlier, I have assumed that this means the backlight
> adjustment works correctly if the suggested patch has been applied.

Yes.

> Having
> thought about this some more I am unconvinced: if fext is NULL then
> call_fext_func() (with the check added) can't have any effect.  The
> backlight adjustment might still work, but it's not due to this code path.

It still calls set_lcd_level() which I assume is the thing that makes it
work.

-- 
Ville Syrjälä
Intel OTC
