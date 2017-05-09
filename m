From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v1 3/3] platform/x86: thinkpad_acpi: Add a comment about
 0 in module_param_call()
Date: Tue, 9 May 2017 14:03:01 -0300
Message-ID: <20170509170301.GC19242@khazad-dum.debian.net>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
 <20170509141721.15841-3-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170509141721.15841-3-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Richard Weinberger <richard.weinberger@gmail.com>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 09 May 2017, Andy Shevchenko wrote:
> As per discussion [1] there are only few users of module_param_call() in
> kernel which prevent to read module parameters back.
> 
> It thinkpad_acpi driver there is even no method do so. Thus, for now,
> add just a comment to explain why 0 is used as permissions in
> module_param_call().
> 
> [1]: https://patchwork.ozlabs.org/patch/713245/
> 
> Cc: Richard Weinberger <richard.weinberger@gmail.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>

> ---
>  drivers/platform/x86/thinkpad_acpi.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index e6fbb2579dd9..f5bc888b2ef4 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -9663,6 +9663,7 @@ module_param_named(enable, alsa_enable, bool, 0444);
>  MODULE_PARM_DESC(enable, "Enable the ALSA interface for the ACPI EC Mixer");
>  #endif /* CONFIG_THINKPAD_ACPI_ALSA_SUPPORT */
>  
> +/* The module parameter can't be read back, that's why 0 is used here */
>  #define TPACPI_PARAM(feature) \
>  	module_param_call(feature, set_ibm_param, NULL, NULL, 0); \
>  	MODULE_PARM_DESC(feature, "Simulates thinkpad-acpi procfs command at module load, see documentation")

-- 
  Henrique Holschuh

  "One disk to rule them all, One disk to find them. One disk to bring
  them all and in the darkness grind them. In the Land of Redmond
  where the shadows lie." -- The Silicon Valley Tarot
