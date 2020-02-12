From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 01/18] platform/x86: intel_scu_ipc: Split out SCU IPC
 functionality from the SCU driver
Date: Wed, 12 Feb 2020 13:34:16 +0200
Message-ID: <20200212113416.GU2667@lahna.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-2-mika.westerberg@linux.intel.com>
 <20200211153924.GD10400@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200211153924.GD10400@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 11, 2020 at 05:39:24PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 11, 2020 at 04:25:46PM +0300, Mika Westerberg wrote:
> > The SCU IPC functionality is usable outside of Intel MID devices. For
> > example modern Intel CPUs include the same thing but now it is called
> > PMC (Power Management Controller) instead of SCU. To make the IPC
> > available for those split the driver into core part (intel_scu_ipc.c)
> > and the SCU PCI driver part (intel_scu_pcidrv.c) which then calls the
> > former before it goes and creates rest of the SCU devices. The SCU IPC
> > will also register a new class that gets assigned to the device that is
> > created under the parent PCI device.
> > 
> > We also split the Kconfig symbols so that INTEL_SCU_IPC enables the SCU
> > IPC library and INTEL_SCU_PCI the SCU driver and convert the users
> > accordingly. While there remove default y from the INTEL_SCU_PCI symbol
> > as it is already selected by X86_INTEL_MID.
> 
> ...
> 
> >  config INTEL_SCU_IPC
> 
> > +config INTEL_SCU
> 
> > +config INTEL_SCU_PCI
> 
> >  config INTEL_SCU_IPC_UTIL
> ...
> 
> >  obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
> >  obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
> >  obj-$(CONFIG_INTEL_SCU_IPC_UTIL)	+= intel_scu_ipcutil.o
> > +obj-$(CONFIG_INTEL_SCU_PCI)		+= intel_scu_pcidrv.o
> 
> Please, keep the symbol ordering (whatever you choose) the same
> in Makefile and Kconfig.

OK, will do.
