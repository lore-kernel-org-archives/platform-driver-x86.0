From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v4 37/38] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Wed, 22 Jan 2020 13:27:57 +0000
Message-ID: <20200122132757.GM15507@dell>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-38-mika.westerberg@linux.intel.com>
 <20200122123454.GL15507@dell>
 <20200122125300.GO2665@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122125300.GO2665@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 22 Jan 2020, Mika Westerberg wrote:

> On Wed, Jan 22, 2020 at 12:34:54PM +0000, Lee Jones wrote:
> > > +static int intel_pmc_probe(struct platform_device *pdev)
> > > +{
> > > +	struct intel_scu_ipc_pdata pdata = {};
> > > +	struct intel_pmc_dev *pmc;
> > > +	int ret;
> > > +
> > > +	pmc = devm_kzalloc(&pdev->dev, sizeof(*pmc), GFP_KERNEL);
> > > +	if (!pmc)
> > > +		return -ENOMEM;
> > > +
> > > +	pmc->dev = &pdev->dev;
> > > +	spin_lock_init(&pmc->gcr_lock);
> > > +
> > > +	ret = intel_pmc_get_resources(pdev, pmc, &pdata);
> > > +	if (ret) {
> > > +		dev_err(&pdev->dev, "Failed to request resources\n");
> > > +		return ret;
> > > +	}
> > > +
> > > +	pmc->scu = devm_intel_scu_ipc_register(&pdev->dev, &pdata);
> > > +	if (IS_ERR(pmc->scu))
> > > +		return PTR_ERR(pmc->scu);
> > 
> > *_register is better than *_probe.  If it was called that (or maybe
> > *_init) initially I may have missed the issue altogether ...
> > 
> > However, I still think it the SCU IPC *device* needs to be a device
> > driver and abide by the rules, ensuring it uses the device driver
> > model/API.  As such, it should be registered and probed as a device.
> 
> Which type of device you suggest here? And which bus it should be
> registered to? I think we can make this create a platform_device but
> then we would need to do that from the PCI driver as well which seems
> unnecessary since we already have the struct pci_dev.

What kind of device is it?

Refrain from using platform device, unless it is one please.

> For instance in drivers/mfd/intel-lpss* we use similar approach (the
> core part is library that gets called by probe drivers (ACPI, PCI). We
> don't create any additional platform_devices.

That's different.  Here the *-acpi.c and *-pci.c are only used as
registration hooks into the same device.  The semantics we're
discussing are seemingly used to probe/init a different device in a
separate subsystem.

> There is another twist. Ideally we would like to see the SCU IPC probed
> and intialized before the MFD children so that we know the SCU IPC is
> ready by the time the children devices are created. I guess we could
> work it around by returning -EPROBE_DEFER but that does not feel right
> to be honest.

That's precisely what -EPROBE_DEFER was designed for.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
