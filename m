From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 14/38] platform/x86: intel_scu_ipc: Introduce new SCU
 IPC API
Date: Wed, 22 Jan 2020 15:49:39 +0100
Message-ID: <20200122144939.GA59473@kroah.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-15-mika.westerberg@linux.intel.com>
 <20200122134359.GE4963@kroah.com>
 <20200122144048.GV2665@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122144048.GV2665@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 04:40:48PM +0200, Mika Westerberg wrote:
> On Wed, Jan 22, 2020 at 02:43:59PM +0100, Greg Kroah-Hartman wrote:
> > > +	if (!scu->dev)
> > > +		goto err_unlock;
> > > +	if (!try_module_get(scu->dev->driver->owner))
> > > +		goto err_unlock;
> > > +	mutex_unlock(&ipclock);
> > > +	return scu;
> > 
> > NO REFERENCE COUNT INCREMENT???
> 
> You mean increment the scu->dev reference count? I kind of thought that
> the try_module_get() should make sure the thing stays there as long as
> the caller has not called _put() but now when I think about it bit more
> we would need to do device_get() here as well.

module reference counts handle _code_ while structure reference counts
handle _data_.

You should almost never need to worry about module reference counts if
your code is structured properly, only handle the reference counts on
the pointers you throw around.

The fact that you are even calling try_module_get() is a huge flag that
something is wrong here.

thanks,

greg k-h
