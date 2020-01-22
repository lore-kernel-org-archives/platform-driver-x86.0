From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 27/38] mfd: intel_soc_pmic_bxtwc: Convert to use new
 SCU IPC API
Date: Wed, 22 Jan 2020 16:41:45 +0200
Message-ID: <20200122144145.GW2665@lahna.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-28-mika.westerberg@linux.intel.com>
 <20200122134621.GF4963@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122134621.GF4963@kroah.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 02:46:21PM +0100, Greg Kroah-Hartman wrote:
> >  	if (ret) {
> >  		dev_err(pmic->dev, "Failed to read from PMIC\n");
> 
> Meta-comment, the call should be the thing making that error message,
> do not force all callers to log it again, or in some other way.  That
> just makes for a larger mess.

OK, I'll do that.
