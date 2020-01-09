From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 34/36] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Thu, 9 Jan 2020 16:25:15 +0200
Message-ID: <20200109142515.GS32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-35-mika.westerberg@linux.intel.com>
 <20200109114354.GP32742@smile.fi.intel.com>
 <20200109114753.GF2838@lahna.fi.intel.com>
 <20200109125727.GG2838@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200109125727.GG2838@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 09, 2020 at 02:57:27PM +0200, Mika Westerberg wrote:
> On Thu, Jan 09, 2020 at 01:47:59PM +0200, Mika Westerberg wrote:
> > > >  config INTEL_SOC_PMIC_BXTWC
> > > >  	tristate "Support for Intel Broxton Whiskey Cove PMIC"
> > > > -	depends on INTEL_PMC_IPC
> > > > +	depends on MFD_INTEL_PMC_BXT
> > > >  	select MFD_CORE
> > > >  	select REGMAP_IRQ
> > > >  	help
> > > > @@ -632,6 +632,18 @@ config MFD_INTEL_MSIC
> > > >  	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
> > > >  	  devices used in Intel Medfield platforms.
> > > >  
> > > > +config MFD_INTEL_PMC_BXT
> > > > +	tristate "Intel PMC Driver for Broxton"
> > > 
> > > > +	depends on X86 && X86_PLATFORM_DEVICES && ACPI
> > > 
> > > Is the X86_PLATFORM_DEVICES dependency compulsory?
> > > Quick grep shows that none of drivers (except nouveau) relies on it.
> > 
> > Well, we need that to be able to do the "select INTEL_SCU_IPC" below.
> > I'm happy to change it if you have a better alternative ;-)
> 
> Just to provide more information. If I don't have that dependency I get
> warnings like this:
> 
> WARNING: unmet direct dependencies detected for INTEL_SCU_IPC
>   Depends on [n]: X86 [=y] && X86_PLATFORM_DEVICES [=n]
>     Selected by [y]:
>       - MFD_INTEL_PMC_BXT [=y] && HAS_IOMEM [=y] && X86 [=y] && ACPI [=y]

I see, thanks for elaboration.
Please, just split them one per line.

-- 
With Best Regards,
Andy Shevchenko
