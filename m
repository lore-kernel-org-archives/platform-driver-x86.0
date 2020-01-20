From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 35/36] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Mon, 20 Jan 2020 11:13:12 +0000
Message-ID: <20200120111312.GD15507@dell>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-36-mika.westerberg@linux.intel.com>
 <20200116132108.GH325@dell>
 <20200116143730.GE2838@lahna.fi.intel.com>
 <20200117113202.GH15507@dell>
 <20200120092650.GI2665@lahna.fi.intel.com>
 <20200120111159.GC15507@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200120111159.GC15507@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Mark Brown <broonie@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Adding Mark (the Regmap Maintainer) to the conversation.

Fingers faster than brain!

I'll actually add him this time - sorry for the noise!

> On Mon, 20 Jan 2020, Mika Westerberg wrote:
> > On Fri, Jan 17, 2020 at 11:32:02AM +0000, Lee Jones wrote:
> > > [...]
> > > 
> > > > > Looks like Regmap could save you the trouble here.
> > > > 
> > > > Agreed.
> > > 
> > > Great.
> > 
> > I started to implement regmap for this driver but I run into some
> > problems. The registers we read/write are all 64-bit and accessed trough
> > readq/writeq accessors. However, the regmap API takes unsigned int:
> > 
> >   int regmap_write(struct regmap *map, unsigned int reg, unsigned int val);
> >   int regmap_read(struct regmap *map, unsigned int reg, unsigned int *val);
> > 
> > I'm not sure how we can take advantage of this API with the 64-bit
> > registers. There are "raw" versions of the functions that take void
> > pointer like:
> > 
> >  int regmap_raw_read(struct regmap *map, unsigned int reg,
> >                      void *val, size_t val_len);
> > 
> > but looking at the implementation if the register gets cached it
> > internally does reads in unsigned int sized chunks (if I understand it
> > right).
> > 
> > Any ideas how this can be done?
 
Mark,

  Does Regmap support 64bit accesses?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
