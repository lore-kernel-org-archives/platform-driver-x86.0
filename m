From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 09/18] mfd: intel_soc_pmic: Add SCU IPC member to
 struct intel_soc_pmic
Date: Tue, 11 Feb 2020 17:57:06 +0200
Message-ID: <20200211155706.GH10400@smile.fi.intel.com>
References: <20200211132603.73509-1-mika.westerberg@linux.intel.com>
 <20200211132603.73509-10-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200211132603.73509-10-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Feb 11, 2020 at 04:25:54PM +0300, Mika Westerberg wrote:
> Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
> be using this field going forward to access the SCU IPC instance.
> 
> While there add kernel-doc for the intel_soc_pmic structure.

> + * @irq_chip_data_pwrbtn: Chained IRQ chip data for the power button
> + * @irq_chip_data_tmu: Chained IRQ chip data for the time management unit
> + * @irq_chip_data_bcu: Chained IRQ chip data for the burst control unit
> + * @irq_chip_data_adc: Chained IRQ chip data for the general purpose ADC
> + * @irq_chip_data_chgr: Chained IRQ chip data for the external charger
> + * @irq_chip_data_crit: Chained IRQ chip data for the critical event handler

Perhaps capitalize the decoded abbreviation, e.g.
general purpose ADC -> General Purpose ADC ?

-- 
With Best Regards,
Andy Shevchenko
