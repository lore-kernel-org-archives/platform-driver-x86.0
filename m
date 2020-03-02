From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v7 00/19] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Mon, 2 Mar 2020 16:38:03 +0200
Message-ID: <20200302143803.GI2667@lahna.fi.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
 <20200302142621.GB3494@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200302142621.GB3494@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 02, 2020 at 02:26:21PM +0000, Lee Jones wrote:
> On Mon, 02 Mar 2020, Mika Westerberg wrote:
> 
> > Hi all,
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
> > This is on top of platform-driver-x86.git/for-next branch because there is
> > already some cleanup work queued that re-organizes Kconfig and Makefile
> > entries.
> > 
> > I have tested this on Intel Joule (Broxton-M) board.
> > 
> > Changes from v6:
> > 
> >   * Added Reviewed-by tag from Andy
> >   * Expanded PMC, IPC and IA acronyms
> >   * Drop TCO_DEVICE_NAME, PUNIT_DEVICE_NAME and TELEMETRY_DEVICE_NAME
> >   * Move struct intel_pmc_dev into include/linux/mfd/intel_pmc_bxt.h
> >   * Add PMC_DEVICE_MAX to the enum and use it
> >   * Add kernel-docs for simplecmd_store() and northpeak_store()
> >   * Use if (ret) return ret; over the ternary operator
> >   * Drop "This is index X" from comments
> >   * Use acpi_has_watchdog() to determine whether iTCO_wdt is added or not.
> >   * Rename intel_scu_ipc_pdata -> intel_scu_ipc_data to make it less
> >     confusing wrt. platform data for platform drivers.
> 
> Any reason why you've dropped all my tags?

You mean these?

For my own reference:                                                                                                                                                                       
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

I wasn't really sure what to do with them. They are not in the normal
tag format I've seen so I thought you use them yourself somehow to
manage your mailboxes. I can add them back if needed.
