From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 02/18] platform/x86: intel_scu_ipc: Log more
 information if SCU IPC command fails
Date: Wed, 12 Feb 2020 13:54:42 +0200
Message-ID: <20200212115442.GS10400@smile.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-3-mika.westerberg@linux.intel.com>
 <20200211154138.GE10400@smile.fi.intel.com>
 <20200212113649.GV2667@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200212113649.GV2667@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 12, 2020 at 01:36:49PM +0200, Mika Westerberg wrote:
> On Tue, Feb 11, 2020 at 05:41:38PM +0200, Andy Shevchenko wrote:
> > On Tue, Feb 11, 2020 at 04:25:47PM +0300, Mika Westerberg wrote:

...

> > >  	mutex_lock(&ipclock);
> > 
> > > +	cmdval = (inlen << 16) | (sub << 12) | cmd;
> > > +	ipc_command(scu, cmdval);
> > >  	err = intel_scu_ipc_check_status(scu);
> > > -
> > > -	if (!err) {
> > > +	if (err) {
> > > +		dev_err(&scu->dev, "IPC command %#x failed with %d\n", cmdval,
> > > +			err);
> > > +	} else {
> > >  		for (i = 0; i < outlen; i++)
> > >  			*out++ = ipc_data_readl(scu, 4 * i);
> > >  	}
> > 
> > It's not visible in this context but it looks like above applies here as well.
> 
> You mean move outside of the lock? This one calls ipc_data_readl()
> which should be under the lock.

I meant to move dev_err() out of the lock. The rest of course requires to stay
under it.

-- 
With Best Regards,
Andy Shevchenko
