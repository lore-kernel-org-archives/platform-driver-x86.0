From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v5 07/18] platform/x86: intel_scu_ipc: Add managed
 function to register SCU IPC
Date: Wed, 12 Feb 2020 13:44:24 +0200
Message-ID: <20200212114424.GX2667@lahna.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-8-mika.westerberg@linux.intel.com>
 <20200211155129.GG10400@smile.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200211155129.GG10400@smile.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 11, 2020 at 05:51:29PM +0200, Andy Shevchenko wrote:
> On Tue, Feb 11, 2020 at 04:25:52PM +0300, Mika Westerberg wrote:
> > Drivers such as intel_pmc_ipc.c can be unloaded as well so in order to
> > support those in this driver add a new function that can be called to
> > unregister the SCU IPC when it is not needed anymore.
> > 
> > We also add a managed version of the intel_scu_ipc_register() that takes
> > care of calling intel_scu_ipc_unregister() automatically when the driver
> > is unbound.
> 
> ...
> 
> > +	devres = devres_alloc(devm_intel_scu_ipc_unregister, sizeof(*devres),
> > +			      GFP_KERNEL);
> 
> Maybe devres -> dr and put on one line?
> But it's up to you, I'm fine with the current as well.

Sure, I'll change that.
