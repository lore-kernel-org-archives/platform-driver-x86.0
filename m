From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 00/36] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Thu, 9 Jan 2020 08:13:16 +0200
Message-ID: <20200109061316.GB2838@lahna.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108173444.GZ32742@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108173444.GZ32742@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 07:34:44PM +0200, Andy Shevchenko wrote:
> On Wed, Jan 08, 2020 at 02:41:25PM +0300, Mika Westerberg wrote:
> > Hi,
> > 
> > Currently both intel_scu_ipc.c and intel_pmc_ipc.c implement the same SCU
> > IPC communications with minor differences. This duplication does not make
> > much sense so this series reworks the two drivers so that there is only a
> > single implementation of the SCU IPC. In addition to that the API will be
> > updated to take SCU instance pointer as an argument, and most of the
> > callers will be converted to this new API. The old API is left there but
> > the plan is to get rid the callers and then the old API as well (this is
> > something we are working with Andy Shevchenko).
> > 
> > The intel_pmc_ipc.c is then moved under MFD which suits better for this
> > kind of a driver that pretty much sets up the SCU IPC and then creates a
> > bunch of platform devices for the things sitting behind the PMC. The driver
> > is renamed to intel_pmc_bxt.c which should follow the existing conventions
> > under drivers/mfd (and it is only meant for Intel Broxton derivatives).
> > 
> > Previous version of the series:
> > 
> >   https://www.spinics.net/lists/platform-driver-x86/msg20359.html
> > 
> > Changes from the previous version:
> > 
> >   * Update changelog of patch 16 according to what the patch actually does.
> >   * Add kernel-doc for struct intel_soc_pmic.
> >   * Move octal permission patch to be before MFD conversion.
> >   * Convert the intel_pmc_bxt.c to MFD APIs whilst it is being moved under
> >     drivers/mfd.
> 
> Hmm... I didn't see you appended Lee's ACKs.

I thought those were for his own reference:

  For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

I can add them if that's not the case.

> > I'm including all x86 maintainers just to be sure they are aware of this as
> > I'm not sure if x86@kernel.org reaches them all. Let me know if you have
> > issues with this series.
> > 
> > I would prefer this to be merged through platform/x86 or MFD trees assuming
> > there are no objections.
> 
> I'm almost reviewed it (few patches left which I plan to do soon), I'm fine if
> it goes via other tree.

Thanks a lot for the review!
