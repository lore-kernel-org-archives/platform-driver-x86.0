From: Jonathan Woithe <jwoithe@just42.net>
Subject: Re: [PATCH v2 5/8] platform/x86: fujitsu-laptop: track the last
 instantiated FUJ02E3 ACPI device
Date: Wed, 24 May 2017 09:23:17 +0930
Message-ID: <20170523235317.GE11878@marvin.atrad.com.au>
References: <20170519074448.12716-1-kernel@kempniu.pl>
 <20170519074448.12716-6-kernel@kempniu.pl>
 <20170521231856.GC28475@marvin.atrad.com.au>
 <20170523214706.GA3151@kmp-mobile.hq.kempniu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from server.atrad.com.au ([150.101.241.2]:54016 "EHLO
        server.atrad.com.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933214AbdEWXyS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 23 May 2017 19:54:18 -0400
Content-Disposition: inline
In-Reply-To: <20170523214706.GA3151@kmp-mobile.hq.kempniu.pl>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Micha?? K??pie?? <kernel@kempniu.pl>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, May 23, 2017 at 11:47:06PM +0200, Micha?? K??pie?? wrote:
> > On Fri, May 19, 2017 at 09:44:45AM +0200, Micha?? K??pie?? wrote:
> > > It is easier to simply store a module-wide
> > > pointer to the last (most likely only) FUJ02E3 ACPI device found, make
> > > the aforementioned API use it and cover our bases by warning the user if
> > > firmware exposes multiple FUJ02E3 ACPI devices.
> > > :
> > > @@ -788,6 +789,9 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
> > >  	if (!priv)
> > >  		return -ENOMEM;
> > >  
> > > +	WARN_ONCE(fext, "More than one FUJ02E3 ACPI device was found.  Driver may not work as intended.");
> > > +	fext = device;
> > > +
> > >  	fujitsu_laptop = priv;
> > >  	fujitsu_laptop->acpi_handle = device->handle;
> > >  	sprintf(acpi_device_name(device), "%s",
> > 
> > I thought WARN_ONCE() printed the warning when it was encountered for the
> > first time and then suppressed it on all other occasions.
> 
> Correct.
> 
> > If this is true
> > then we'll get the warning even when there is only one FUJ02E3 in the
> > system.  Am I missing something?
> 
> Probably the fact that the first argument of the macro is a conditional
> expression ...

Ah (having now had an opportunity to look at the source of WARN_ONCE()),
it's tested within WARN_ONCE.

> ("fext" is functionally equivalent to "fext != NULL" in this case).

Indeed, by virtue of the test done in WARN_ONCE().  Ok, that makes sense.

Regards
  jonathan
