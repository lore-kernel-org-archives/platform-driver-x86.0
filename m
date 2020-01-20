From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 35/36] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Mon, 20 Jan 2020 11:14:50 +0000
Message-ID: <20200120111450.GE15507@dell>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-36-mika.westerberg@linux.intel.com>
 <20200116132108.GH325@dell>
 <20200116143730.GE2838@lahna.fi.intel.com>
 <20200117113202.GH15507@dell>
 <20200117142750.GP2838@lahna.fi.intel.com>
 <20200120081246.GS15507@dell>
 <20200120091258.GH2665@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200120091258.GH2665@lahna.fi.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 20 Jan 2020, Mika Westerberg wrote:

> On Mon, Jan 20, 2020 at 08:12:46AM +0000, Lee Jones wrote:
> > > Well, by "library" I mean that the SCU IPC itself does not bind to
> > > anything but instead it gets called by different drivers such as this
> > > one passing the device pointer that is the SCU IPC device. Here for
> > > example it is the platfrom device created from an ACPI description.
> > 
> > Not keen on that at all.  Why can it not be a platform device?
> 
> We also call the same library from a PCI driver (intel_scu_pcidrv.c in
> this series) where the device is of type struct pci_dev.

Not sure I understand the issue.

What does the device do?

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
