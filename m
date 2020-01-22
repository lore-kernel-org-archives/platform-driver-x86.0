From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v4 37/38] platform/x86: intel_pmc_ipc: Convert to MFD
Date: Wed, 22 Jan 2020 16:45:23 +0200
Message-ID: <20200122144523.GX2665@lahna.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-38-mika.westerberg@linux.intel.com>
 <20200122123454.GL15507@dell>
 <20200122125300.GO2665@lahna.fi.intel.com>
 <20200122132757.GM15507@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200122132757.GM15507@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 22, 2020 at 01:27:57PM +0000, Lee Jones wrote:
> > Which type of device you suggest here? And which bus it should be
> > registered to? I think we can make this create a platform_device but
> > then we would need to do that from the PCI driver as well which seems
> > unnecessary since we already have the struct pci_dev.
> 
> What kind of device is it?

It is either part of an ACPI device (platform_device) or a PCI device
depending on the platform.

> Refrain from using platform device, unless it is one please.

OK.

Greg suggested making the SCU IPC functionality a class and I think it
fits here nicely so I'm going to try that next if nobody objects. I'll
send the first cleanup patches separately.
