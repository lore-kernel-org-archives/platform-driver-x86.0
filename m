From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Tue, 19 Sep 2017 16:25:15 +0300
Message-ID: <20170919132515.GS4914@intel.com>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:60158 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750822AbdISNZT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Sep 2017 09:25:19 -0400
Content-Disposition: inline
In-Reply-To: <20170919040648.GA8426@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Woithe <jwoithe@just42.net>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>

On Tue, Sep 19, 2017 at 06:06:48AM +0200, Michał Kępień wrote:
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

BTW I just double checked my other laptops; S6010 doesn't have FUJ02E3
either, but S7110 does have it. So I have machines that go both ways,
in case you need help with testing something.

-- 
Ville Syrjälä
Intel OTC
