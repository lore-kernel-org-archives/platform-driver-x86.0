From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 11/38] platform/x86: intel_scu_ipc: Drop
 intel_scu_ipc_raw_command()
Date: Wed, 22 Jan 2020 16:33:14 +0200
Message-ID: <20200122143314.GS2665@lahna.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-12-mika.westerberg@linux.intel.com>
 <20200122133619.GB4963@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122133619.GB4963@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 02:36:19PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Jan 21, 2020 at 07:00:47PM +0300, Mika Westerberg wrote:
> > There is no user for this function so we can drop it from the driver.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  arch/x86/include/asm/intel_scu_ipc.h |  2 -
> >  drivers/platform/x86/intel_scu_ipc.c | 63 ----------------------------
> >  2 files changed, 65 deletions(-)
> 
> These first 11 patches are fine, why didn't you just submit them as
> cleanups/fixes and then build on them with the rest?  Having to wade
> through 38-patch series is a pain...

OK, I'll submit the first cleanup patches separately so they can be
applied first and then rework rest of the series on top.
