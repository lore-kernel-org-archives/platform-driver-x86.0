From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 26/37] mfd: intel_soc_pmic: Add SCU IPC member to struct
 intel_soc_pmic
Date: Thu, 2 Jan 2020 09:01:32 +0000
Message-ID: <20200102090132.GD22390@dell>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-27-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191223141716.13727-27-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, 23 Dec 2019, Mika Westerberg wrote:

> Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
> be using this field going forward to access the SCU IPC instance.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  include/linux/mfd/intel_soc_pmic.h | 1 +
>  1 file changed, 1 insertion(+)

This might be a good time to add a Kerneldoc header.

> diff --git a/include/linux/mfd/intel_soc_pmic.h b/include/linux/mfd/intel_soc_pmic.h
> index bfecd6bd4990..8ac130428bb4 100644
> --- a/include/linux/mfd/intel_soc_pmic.h
> +++ b/include/linux/mfd/intel_soc_pmic.h
> @@ -24,6 +24,7 @@ struct intel_soc_pmic {
>  	struct regmap_irq_chip_data *irq_chip_data_chgr;
>  	struct regmap_irq_chip_data *irq_chip_data_crit;
>  	struct device *dev;
> +	struct intel_scu_ipc_dev *scu;
>  };
>  
>  int intel_soc_pmic_exec_mipi_pmic_seq_element(u16 i2c_address, u32 reg_address,

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
