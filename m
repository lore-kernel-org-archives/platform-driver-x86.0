From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 35/36] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Mon, 20 Jan 2020 08:12:46 +0000
Message-ID: <20200120081246.GS15507@dell>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-36-mika.westerberg@linux.intel.com>
 <20200116132108.GH325@dell>
 <20200116143730.GE2838@lahna.fi.intel.com>
 <20200117113202.GH15507@dell>
 <20200117142750.GP2838@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200117142750.GP2838@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, 17 Jan 2020, Mika Westerberg wrote:

> On Fri, Jan 17, 2020 at 11:32:02AM +0000, Lee Jones wrote:
> > On Thu, 16 Jan 2020, Mika Westerberg wrote:
> > > On Thu, Jan 16, 2020 at 01:21:08PM +0000, Lee Jones wrote:
> > > > On Mon, 13 Jan 2020, Mika Westerberg wrote:
> > > > 
> > > > > This driver only creates a bunch of platform devices sharing resources
> > > > > belonging to the PMC device. This is pretty much what MFD subsystem is
> > > > > for so move the driver there, renaming it to intel_pmc_bxt.c which
> > > > > should be more clear what it is.
> > > > > 
> > > > > MFD subsystem provides nice helper APIs for subdevice creation so
> > > > > convert the driver to use those. Unfortunately the ACPI device includes
> > > > > separate resources for most of the subdevices so we cannot simply call
> > > > > mfd_add_devices() to create all of them but instead we need to call it
> > > > > separately for each device.
> > > > > 
> > > > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > > > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > ---
> > > > >  drivers/mfd/Kconfig                           |  16 +-
> > > > >  drivers/mfd/Makefile                          |   1 +
> > > > >  drivers/mfd/intel_pmc_bxt.c                   | 543 +++++++++++++++
> > > > >  drivers/platform/x86/Kconfig                  |  16 +-
> > > > >  drivers/platform/x86/Makefile                 |   1 -
> > > > >  drivers/platform/x86/intel_pmc_ipc.c          | 650 ------------------
> > > > >  .../platform/x86/intel_telemetry_debugfs.c    |   2 +-
> > > > >  drivers/usb/typec/tcpm/Kconfig                |   2 +-
> > > > >  .../linux/mfd/intel_pmc_bxt.h                 |  11 +-
> > > > >  9 files changed, 573 insertions(+), 669 deletions(-)
> > > > >  create mode 100644 drivers/mfd/intel_pmc_bxt.c
> > > > >  delete mode 100644 drivers/platform/x86/intel_pmc_ipc.c
> > > > >  rename arch/x86/include/asm/intel_pmc_ipc.h => include/linux/mfd/intel_pmc_bxt.h (83%)

[...]

> > > > > +	scu = intel_scu_ipc_probe(&pdev->dev, &pdata);
> > > > 
> > > > This is a parent or child device?
> > > 
> > > The SCU IPC is a library so here it is just the device that has the SCU
> > > IPC registers the library can use.
> > 
> > "probing" a library doesn't sound right.
> > 
> > Looking at the code, I think this should be a device.
> 
> Well, by "library" I mean that the SCU IPC itself does not bind to
> anything but instead it gets called by different drivers such as this
> one passing the device pointer that is the SCU IPC device. Here for
> example it is the platfrom device created from an ACPI description.

Not keen on that at all.  Why can it not be a platform device?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
