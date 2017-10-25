From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] platform/x86: fujitsu-laptop: Don't oops when FUJ02E3 is
 not presnt
Date: Wed, 25 Oct 2017 13:05:15 +0300
Message-ID: <20171025100515.GI10981@intel.com>
References: <20170918200059.16279-1-ville.syrjala@linux.intel.com>
 <20170923000048.GC20327@fury>
 <20170926044908.GA9170@kmp-mobile.hq.kempniu.pl>
 <20171018151058.GL10981@intel.com>
 <20171025045131.GB13202@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:43740 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932432AbdJYKF1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Oct 2017 06:05:27 -0400
Content-Disposition: inline
In-Reply-To: <20171025045131.GB13202@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org

On Wed, Oct 25, 2017 at 06:51:31AM +0200, Michał Kępień wrote:
> > > Finally, it seems the S6120 also has a row of "application panel"
> > > hotkeys above the keyboard, but lacks the FUJ02E3 ACPI device, so I am
> > > wondering whether these hotkeys work in Linux.  Ville, do they?
> > 
> > They work via the apanel driver.
> 
> Oops, then it looks like we have two drivers which poke the same
> hardware at the same time using different methods: apanel uses SMBus,
> fujitsu-laptop uses ACPI (the former is inferior as it resorts to
> polling, which causes key presses to be reported with a delay).  I just
> loaded both drivers on my Fujitsu Lifebook S7020 and it results in
> duplicate events being passed to userspace.  We should probably prevent
> this, but I am not quite sure how to achieve that.

Maybe in apanel probe?

#if ENABLED(FUJITSU_LAPTOP)
	if (ACPI thing available)
		fail;
#endif

-- 
Ville Syrjälä
Intel OTC
