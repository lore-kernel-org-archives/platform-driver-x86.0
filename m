From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 18/18] MAINTAINERS: Update entry for Intel Broxton PMC
 driver
Date: Wed, 12 Feb 2020 13:48:06 +0200
Message-ID: <20200212114806.GZ2667@lahna.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-19-mika.westerberg@linux.intel.com>
 <20200211160133.GI10400@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200211160133.GI10400@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 11, 2020 at 06:01:33PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 11, 2020 at 04:26:03PM +0300, Mika Westerberg wrote:
> > The driver lives now under MFD so split the current entry into two parts
> > and add me as co-maintainer of the Intel Broxton PMC driver. While there
> > correct formatting of Zha Qipeng's email address.
> 
> ...
> 
> > -INTEL PMC/P-Unit IPC DRIVER
> > -M:	Zha Qipeng<qipeng.zha@intel.com>
> > +INTEL P-Unit IPC DRIVER
> > +M:	Zha Qipeng <qipeng.zha@intel.com>
> >  L:	platform-driver-x86@vger.kernel.org
> >  S:	Maintained
> > -F:	arch/x86/include/asm/intel_pmc_ipc.h
> >  F:	arch/x86/include/asm/intel_punit_ipc.h
> > -F:	drivers/platform/x86/intel_pmc_ipc.c
> >  F:	drivers/platform/x86/intel_punit_ipc.c
> >  
> >  INTEL PMIC GPIO DRIVERS
> 
> Does it stays at the same place after executing parse-maintainers.pl?

Good point, the entry needs to be moved in the correct place to keep it
sorted alphabetically since the name changes now from PMC -> P-Unit.
