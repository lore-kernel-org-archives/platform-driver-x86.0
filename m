From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 33/37] platform/x86: intel_pmc_ipc: Move under MFD
Date: Thu, 2 Jan 2020 09:41:26 +0000
Message-ID: <20200102094126.GG22390@dell>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-34-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191223141716.13727-34-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 23 Dec 2019, Mika Westerberg wrote:

> This driver only creates a bunch of platform devices sharing resources
> belonging to the PMC device. This is pretty much what MFD subsystem is
> for so move the driver there, renaming it to intel_pmc_bxt.c which
> should be more clear what it is. We convert the driver to call MFD APIs
> in subsequent patches.

Nope.  Not happening.

It's not appropriate to dump a 1000+ line source file into MFD without
a thorough review.  For starters, the 100's of lines of code which
support the bespoke IPC APIs should remain within the 'platform'
domain.

It's okay to move the subordinate device registration into MFD, but it
will need to be converted *whilst* transferring it, rather than the
dump/edit method currently implemented.

> While there update Kconfig entry to be more descriptive.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/mfd/Kconfig                           |  13 +-
>  drivers/mfd/Makefile                          |   1 +
>  .../intel_pmc_ipc.c => mfd/intel_pmc_bxt.c}   | 214 +++++++++---------
>  drivers/platform/x86/Kconfig                  |  16 +-
>  drivers/platform/x86/Makefile                 |   1 -
>  .../platform/x86/intel_telemetry_debugfs.c    |   2 +-
>  drivers/usb/typec/tcpm/Kconfig                |   2 +-
>  .../linux/mfd/intel_pmc_bxt.h                 |  11 +-
>  8 files changed, 132 insertions(+), 128 deletions(-)
>  rename drivers/{platform/x86/intel_pmc_ipc.c => mfd/intel_pmc_bxt.c} (72%)
>  rename arch/x86/include/asm/intel_pmc_ipc.h => include/linux/mfd/intel_pmc_bxt.h (83%)

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
