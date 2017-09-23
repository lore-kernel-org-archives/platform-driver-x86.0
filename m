From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Sat, 23 Sep 2017 11:33:11 +0930
Message-ID: <20170923020311.GA20659@marvin.atrad.com.au>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:47700 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751795AbdIWCEH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2017 22:04:07 -0400
Content-Disposition: inline
In-Reply-To: <20170923000048.GC20327@fury>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Darren Hart <dvhart@infradead.org>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>, platform-driver-x86@vger.kernel.org, Andy Shevchenko <andy@infradead.org>

Hi Darren

A quick reply since I have to go somewhere in a second.  I'll follow up in
more detail later.

On Fri, Sep 22, 2017 at 05:00:48PM -0700, Darren Hart wrote:
> On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> > From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > 
> > My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> > but it does have FUJ02B1. That means we do register the backlight
> > device (and it even seems to work), but the code will oops as soon
> > as we try to set the backlight brightness because it's trying to
> 
> I'm curious by what you mean with "it even seems to work". Since it
> crashes when adjusting, what does it do that "works" ?

I interpreted this to mean that things work with the patch in place.

jonathan
