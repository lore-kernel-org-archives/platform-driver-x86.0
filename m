From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v3 26/36] mfd: intel_soc_pmic: Add SCU IPC member to
 struct intel_soc_pmic
Date: Wed, 15 Jan 2020 10:58:36 +0200
Message-ID: <20200115085836.GZ2838@lahna.fi.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
 <20200113135623.56286-27-mika.westerberg@linux.intel.com>
 <20200115084410.GG325@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200115084410.GG325@dell>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 15, 2020 at 08:44:10AM +0000, Lee Jones wrote:
> On Mon, 13 Jan 2020, Mika Westerberg wrote:
> 
> > Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
> > be using this field going forward to access the SCU IPC instance.
> > 
> > While there add kernel-doc for the intel_soc_pmic structure.
> > 
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/linux/mfd/intel_soc_pmic.h | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> > 
> > diff --git a/include/linux/mfd/intel_soc_pmic.h b/include/linux/mfd/intel_soc_pmic.h
> > index bfecd6bd4990..bda22d750be6 100644
> > --- a/include/linux/mfd/intel_soc_pmic.h
> > +++ b/include/linux/mfd/intel_soc_pmic.h
> > @@ -13,6 +13,20 @@
> >  
> >  #include <linux/regmap.h>
> >  
> > +/**
> > + * struct intel_soc_pmic - Intel SoC PMIC data
> > + * @irq: Interrupt number
> 
> Whose IRQ is this?  I guess the parent's/PMIC's?

Yes, I'll fix it up.

> > + * @regmap: Pointer to the regmap structure
> 
> Whose Regmap is this?  I guess the parent's/PMIC's?

Ditto

> > + * @irq_chip_data: IRQ chip data for the PMIC itself
> > + * @irq_chip_data_pwrbtn: Chained IRQ chip data for the power button
> > + * @irq_chip_data_tmu: Chained IRQ chip data for the TMU
> > + * @irq_chip_data_bcu: Chained IRQ chip data for the BCU
> > + * @irq_chip_data_adc: Chained IRQ chip data for the ADC
> > + * @irq_chip_data_chgr: Chained IRQ chip data for the CHGR
> > + * @irq_chip_data_crit: Chained IRQ chip data for the CRIT
> 
> Documentation is an ideal place to expand out these abbreviations.

OK, I'll try to expand them (not familiar with all of them).

> > + * @dev: Pointer to the PMIC device
> > + * @scu: SCU IPC pointer used for IPC operations
> 
> By this description I would have expected to find a struct of ops
> (operations [call-backs]), but instead I found this:
> 
>  struct intel_scu_ipc_dev {
>          struct device *dev;
>          void __iomem *ipc_base;
>          void __iomem *i2c_base;
>          struct completion cmd_complete;
>          u8 irq_mode;
>  };
> 
> Probably better to describe it as a "pointer to SCU (whatever that
> means) IPC (slightly more common, but still better to expand I think)
> device data structure".

Sure.
