From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v7 00/19] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Mon, 2 Mar 2020 18:07:46 +0200
Message-ID: <20200302160746.GF2540@lahna.fi.intel.com>
References: <20200302133327.55929-1-mika.westerberg@linux.intel.com>
 <20200302142621.GB3494@dell>
 <20200302143803.GI2667@lahna.fi.intel.com>
 <20200302151924.GC3494@dell>
 <20200302154205.GF1224808@smile.fi.intel.com>
 <20200302155716.GD3494@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200302155716.GD3494@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Mar 02, 2020 at 03:57:16PM +0000, Lee Jones wrote:
> > This series has dependencies to PDx86 (as mentioned in cover letter).
> > 
> > What do you prefer then, me to:
> > a) prepare ib from what I have, then you take it followed by me taking your ib, or
> > b) take everything and prepare ib for you?
> 
> Either would be fine by me.

I would prefer these to go through pdx86 because of the dependency.

> What kind of dependencies are they?  Are they protected by Kconfig
> options?  Another way of asking that would be to say, would this set
> throw build errors if I tried to apply and build it or would it just
> refuse to compile?

They do not apply cleanly because linux-platform-drivers-x86.git/for-next
re-organizes Kconfig and Makefile entries. I think they should still
build fine, though.
