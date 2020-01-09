From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 34/36] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Thu, 9 Jan 2020 13:47:53 +0200
Message-ID: <20200109114753.GF2838@lahna.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-35-mika.westerberg@linux.intel.com>
 <20200109114354.GP32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200109114354.GP32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jan 09, 2020 at 01:43:54PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 08, 2020 at 02:41:59PM +0300, Mika Westerberg wrote:
> > This driver only creates a bunch of platform devices sharing resources
> > belonging to the PMC device. This is pretty much what MFD subsystem is
> > for so move the driver there, renaming it to intel_pmc_bxt.c which
> > should be more clear what it is.
> > 
> > MFD subsystem provides nice helper APIs for subdevice creation so
> > convert the driver to use those. Unfortunately the ACPI device includes
> > separate resources for most of the subdevices so we cannot simply call
> > mfd_add_devices() to create all of them but instead we need to call it
> > separately for each device.
> 
> Comments below, after addressing,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> >  drivers/mfd/Kconfig                           |  14 +-
> >  drivers/mfd/Makefile                          |   1 +
> >  .../intel_pmc_ipc.c => mfd/intel_pmc_bxt.c}   | 394 +++++++-----------
> >  drivers/platform/x86/Kconfig                  |  16 +-
> >  drivers/platform/x86/Makefile                 |   1 -
> >  .../platform/x86/intel_telemetry_debugfs.c    |   2 +-
> >  drivers/usb/typec/tcpm/Kconfig                |   2 +-
> >  .../linux/mfd/intel_pmc_bxt.h                 |  11 +-
> >  8 files changed, 171 insertions(+), 270 deletions(-)
> >  rename drivers/{platform/x86/intel_pmc_ipc.c => mfd/intel_pmc_bxt.c} (50%)
> >  rename arch/x86/include/asm/intel_pmc_ipc.h => include/linux/mfd/intel_pmc_bxt.h (83%)
> > 
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 59515142438e..04542feffe25 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -551,7 +551,7 @@ config INTEL_SOC_PMIC
> >  
> >  config INTEL_SOC_PMIC_BXTWC
> >  	tristate "Support for Intel Broxton Whiskey Cove PMIC"
> > -	depends on INTEL_PMC_IPC
> > +	depends on MFD_INTEL_PMC_BXT
> >  	select MFD_CORE
> >  	select REGMAP_IRQ
> >  	help
> > @@ -632,6 +632,18 @@ config MFD_INTEL_MSIC
> >  	  Passage) chip. This chip embeds audio, battery, GPIO, etc.
> >  	  devices used in Intel Medfield platforms.
> >  
> > +config MFD_INTEL_PMC_BXT
> > +	tristate "Intel PMC Driver for Broxton"
> 
> > +	depends on X86 && X86_PLATFORM_DEVICES && ACPI
> 
> Is the X86_PLATFORM_DEVICES dependency compulsory?
> Quick grep shows that none of drivers (except nouveau) relies on it.

Well, we need that to be able to do the "select INTEL_SCU_IPC" below.
I'm happy to change it if you have a better alternative ;-)

> For the rest two I think we might split one per line to be consistent with
> existing example(s) in  drivers/mfd/Kconfig.

OK

> 
> > +	select INTEL_SCU_IPC
> > +	select MFD_CORE
> > +	help
> > +	  This driver provides support for PMC (Power Management
> > +	  Controller) on Intel Broxton and Apollo Lake. PMC is a
> > +	  multi-function device that exposes IPC, General Control
> > +	  Register and P-unit access. In addition this creates devices
> > +	  for iTCO watchdog and telemetry that are part of the PMC.
