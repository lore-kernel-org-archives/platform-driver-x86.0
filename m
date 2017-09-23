From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Fri, 22 Sep 2017 17:00:48 -0700
Message-ID: <20170923000048.GC20327@fury>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:41260 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752183AbdIWAAz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2017 20:00:55 -0400
Content-Disposition: inline
In-Reply-To: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Andy Shevchenko <andy@infradead.org>

On Mon, Sep 18, 2017 at 11:00:59PM +0300, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> My Fujitsu-Siemens Lifebook S6120 doesn't have the FUJ02E3 device,
> but it does have FUJ02B1. That means we do register the backlight
> device (and it even seems to work), but the code will oops as soon
> as we try to set the backlight brightness because it's trying to

I'm curious by what you mean with "it even seems to work". Since it
crashes when adjusting, what does it do that "works" ?

> call call_fext_func() with a NULL device. Let's just skip those
> function calls when the FUJ02E3 device is not present.
> 

Interesting. We call call_fext_func from many locations using the
"device" argument, or the driver static "fext".

This looks to me that we should be a bit more consistent here.

Finally, it seems a proper fix would be to either not register the
backlight device if !fext or to check for !fext inside call_fext_func.

Jonathan, your thoughts?

-- 
Darren Hart
VMware Open Source Technology Center
