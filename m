From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 00/38] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Tue, 21 Jan 2020 19:21:41 +0200
Message-ID: <20200121172141.GB2665@lahna.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121162157.GD4656@sirena.org.uk>
 <20200121163312.GZ2665@lahna.fi.intel.com>
 <20200121164515.GG4656@sirena.org.uk>
 <20200121170022.GA2665@lahna.fi.intel.com>
 <20200121170656.GI4656@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121170656.GI4656@sirena.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 21, 2020 at 05:06:56PM +0000, Mark Brown wrote:
> On Tue, Jan 21, 2020 at 07:00:22PM +0200, Mika Westerberg wrote:
> 
> > OK, thanks for the clarification. I guess in this case we can probably
> > just live without using it, if that's fine for Lee and others. The new
> > MFD driver itself is ~500 lines so not sure how much regmap would help
> > there, and we only expose two simple functions for the subdevices both
> > dealing with 64-bit registers.
> 
> The usual motivation is all the diagnostic infrastructure you get with
> regmap - tracepoints for I/O and the ability to dump the register map in
> debugfs mainly.

Right.

Here we are talking about a "map" of two registers so probably not worth
the added trouble ;-)
