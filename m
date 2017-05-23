From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH v2 5/8] platform/x86: fujitsu-laptop: track the last
 instantiated FUJ02E3 ACPI device
Date: Tue, 23 May 2017 23:47:06 +0200
Message-ID: <20170523214706.GA3151@kmp-mobile.hq.kempniu.pl>
References: <20170519074448.12716-1-kernel@kempniu.pl>
 <20170519074448.12716-6-kernel@kempniu.pl>
 <20170521231856.GC28475@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170521231856.GC28475@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Woithe <jwoithe@just42.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> On Fri, May 19, 2017 at 09:44:45AM +0200, Micha?? K??pie?? wrote:
> > It is easier to simply store a module-wide
> > pointer to the last (most likely only) FUJ02E3 ACPI device found, make
> > the aforementioned API use it and cover our bases by warning the user if
> > firmware exposes multiple FUJ02E3 ACPI devices.
> > :
> > @@ -788,6 +789,9 @@ static int acpi_fujitsu_laptop_add(struct acpi_device *device)
> >  	if (!priv)
> >  		return -ENOMEM;
> >  
> > +	WARN_ONCE(fext, "More than one FUJ02E3 ACPI device was found.  Driver may not work as intended.");
> > +	fext = device;
> > +
> >  	fujitsu_laptop = priv;
> >  	fujitsu_laptop->acpi_handle = device->handle;
> >  	sprintf(acpi_device_name(device), "%s",
> 
> I thought WARN_ONCE() printed the warning when it was encountered for the
> first time and then suppressed it on all other occasions.

Correct.

> If this is true
> then we'll get the warning even when there is only one FUJ02E3 in the
> system.  Am I missing something?

Probably the fact that the first argument of the macro is a conditional
expression ("fext" is functionally equivalent to "fext != NULL" in this
case).  In other words, the warning will only ever be issued if
acpi_fujitsu_laptop_add() is called at least twice - note the assignment
on the line following WARN_ONCE().

-- 
Best regards,
Michał Kępień
