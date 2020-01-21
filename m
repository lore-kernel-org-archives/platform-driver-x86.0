From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 36/38] platform/x86: intel_telemetry: Add
 telemetry_get_pltdata()
Date: Tue, 21 Jan 2020 20:00:15 +0200
Message-ID: <20200121180015.GC32742@smile.fi.intel.com>
References: <20200121160114.60007-1-mika.westerberg@linux.intel.com>
 <20200121160114.60007-37-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200121160114.60007-37-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mark Brown <broonie@kernel.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Jan 21, 2020 at 07:01:12PM +0300, Mika Westerberg wrote:
> Add new function that allows telemetry modules to get pointer to the
> platform specific configuration. This is needed to allow the telemetry
> debugfs module to fetch PMC IPC instance in the subsequent patch.

One comment below.
After addressing,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_telemetry.h      |  1 +
>  drivers/platform/x86/intel_telemetry_core.c | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/arch/x86/include/asm/intel_telemetry.h b/arch/x86/include/asm/intel_telemetry.h
> index e19deb776003..1335565c43b5 100644
> --- a/arch/x86/include/asm/intel_telemetry.h
> +++ b/arch/x86/include/asm/intel_telemetry.h
> @@ -99,6 +99,7 @@ int telemetry_set_pltdata(const struct telemetry_core_ops *ops,
>  int telemetry_clear_pltdata(void);
>  
>  int telemetry_pltconfig_valid(void);
> +struct telemetry_plt_config *telemetry_get_pltdata(void);
>  
>  int telemetry_get_evtname(enum telemetry_unit telem_unit,
>  			  const char **name, int len);
> diff --git a/drivers/platform/x86/intel_telemetry_core.c b/drivers/platform/x86/intel_telemetry_core.c
> index d4040bb222b4..e11b79d1b3a7 100644
> --- a/drivers/platform/x86/intel_telemetry_core.c
> +++ b/drivers/platform/x86/intel_telemetry_core.c
> @@ -369,6 +369,18 @@ int telemetry_pltconfig_valid(void)
>  }
>  EXPORT_SYMBOL_GPL(telemetry_pltconfig_valid);
>  
> +/**
> + * telemetry_get_pltdata() - Return telemetry platform config
> + *
> + * May be used by other telemetry modules to get platform specific
> + * configuration.
> + */
> +struct telemetry_plt_config *telemetry_get_pltdata(void)
> +{
> +	return telm_core_conf.plt_config;
> +}
> +EXPORT_SYMBOL_GPL(telemetry_get_pltdata);

Effectively this may replace telemetry_pltconfig_valid().

> +
>  static inline int telemetry_get_pssevtname(enum telemetry_unit telem_unit,
>  					   const char **name, int len)
>  {
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
