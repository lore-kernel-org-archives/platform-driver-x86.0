From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 00/36] platform/x86: Rework intel_scu_ipc and
 intel_pmc_ipc drivers
Date: Mon, 13 Jan 2020 10:38:07 +0000
Message-ID: <20200113103807.GA5414@dell>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 08 Jan 2020, Mika Westerberg wrote:

> Hi,
> 
> Currently both intel_scu_ipc.c and intel_pmc_ipc.c implement the same SCU
> IPC communications with minor differences. This duplication does not make
> much sense so this series reworks the two drivers so that there is only a
> single implementation of the SCU IPC. In addition to that the API will be
> updated to take SCU instance pointer as an argument, and most of the
> callers will be converted to this new API. The old API is left there but
> the plan is to get rid the callers and then the old API as well (this is
> something we are working with Andy Shevchenko).
> 
> The intel_pmc_ipc.c is then moved under MFD which suits better for this
> kind of a driver that pretty much sets up the SCU IPC and then creates a
> bunch of platform devices for the things sitting behind the PMC. The driver
> is renamed to intel_pmc_bxt.c which should follow the existing conventions
> under drivers/mfd (and it is only meant for Intel Broxton derivatives).
> 
> Previous version of the series:
> 
>   https://www.spinics.net/lists/platform-driver-x86/msg20359.html
> 
> Changes from the previous version:
> 
>   * Update changelog of patch 16 according to what the patch actually does.
>   * Add kernel-doc for struct intel_soc_pmic.
>   * Move octal permission patch to be before MFD conversion.
>   * Convert the intel_pmc_bxt.c to MFD APIs whilst it is being moved under
>     drivers/mfd.
> 
> I'm including all x86 maintainers just to be sure they are aware of this as
> I'm not sure if x86@kernel.org reaches them all. Let me know if you have
> issues with this series.
> 
> I would prefer this to be merged through platform/x86 or MFD trees assuming
> there are no objections.
> 
> I have tested this on Intel Edison (Merrifield) and Joule (Broxton-M).

FYI, I'm waiting until v3 before I conduct my review.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
