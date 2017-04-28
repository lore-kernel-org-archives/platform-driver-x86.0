From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: Make SILEAD_DMI depend on
 TOUCHSCREEN_SILEAD
Date: Fri, 28 Apr 2017 15:14:35 -0700
Message-ID: <20170428221435.GA32336@fury>
References: <20170428210019.GA32026@fury>
 <20170428210900.GG4949@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170428210900.GG4949@dtor-ws>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Andy Shevchenko <andy@infradead.org>, Jean Delvare <jdelvare@suse.de>
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 28, 2017 at 02:09:00PM -0700, Dmitry Torokhov wrote:
> On Fri, Apr 28, 2017 at 02:00:19PM -0700, Darren Hart (VMware) wrote:
> > SILEAD_DMI provides platform specific data for the TOUCHSCREEN_SILEAD
> > driver. Make this explicitly clear in the Kconfig depends.
> > 
> > Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
> > Cc: Hans de Goede <hdegoede@redhat.com>
> > Cc: Andy Shevchenko <andy@infradead.org>
> > Cc: Jean Delvare <jdelvare@suse.de>
> > Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 9e5b2c2..5690664 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -1101,7 +1101,7 @@ config INTEL_TURBO_MAX_3
> >  
> >  config SILEAD_DMI
> >  	bool "Tablets with Silead touchscreens"
> > -	depends on ACPI && DMI && I2C=y && INPUT
> > +	depends on ACPI && DMI && I2C=y && INPUT && TOUCHSCREEN_SILEAD
> 
> Bikeshed: TOUCHSCREEN_SILEAD already depends on INPUT, so you can drop
> INPUT dependency.
> 

Done, thanks.

> Otherwise
> 
> Reviewed-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> -- 
> Dmitry
> 

-- 
Darren Hart
VMware Open Source Technology Center
