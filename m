From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Mon, 25 Sep 2017 22:46:58 +0930
Message-ID: <20170925131658.GA6745@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170923090839.GC21630@marvin.atrad.com.au>
 <20170925121441.GR4914@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:56736 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932107AbdIYNRt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 25 Sep 2017 09:17:49 -0400
Content-Disposition: inline
In-Reply-To: <20170925121441.GR4914@intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

On Mon, Sep 25, 2017 at 03:14:41PM +0300, Ville Syrjälä wrote:
> On Sat, Sep 23, 2017 at 06:38:40PM +0930, Jonathan Woithe wrote:
> > > I'm curious by what you mean with "it even seems to work". Since it
> > > crashes when adjusting, what does it do that "works" ?
> > 
> > As mentioned earlier, I have assumed that this means the backlight
> > adjustment works correctly if the suggested patch has been applied.
> 
> Yes.

Great - thanks for confirming.

> > Having
> > thought about this some more I am unconvinced: if fext is NULL then
> > call_fext_func() (with the check added) can't have any effect.  The
> > backlight adjustment might still work, but it's not due to this code path.
> 
> It still calls set_lcd_level() which I assume is the thing that makes it
> work.

Yes, of course.  Thanks, I was overthinking things. :-)

Darren: this confirms that the idea of only registering FUJ02B1 if FUJ02E3
exists is no good: the S6120 (and probably others) needs FUJ02B1 but doesn't
have a FUJ02E3.  This means that at least for the purposes of addressing
this regression, the null device check is the best option: either in
bl_update_status() (Ville's original patch) or in call_fext_func() (as
suggested by Michel, with a suggested patch in my post on the 24th).

Regards
  jonathan
