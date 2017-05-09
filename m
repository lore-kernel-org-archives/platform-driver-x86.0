From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: [PATCH v1 1/3] platform/x86: thinkpad_acpi: Make logic straight
 in hotkey_exit()
Date: Tue, 9 May 2017 14:02:06 -0300
Message-ID: <20170509170206.GB19242@khazad-dum.debian.net>
References: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170509141721.15841-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Tue, 09 May 2017, Andy Shevchenko wrote:
> The commit 4be73005e4dc
> 
> 	("thinkpad-acpi: remove uneeded tp_features.hotkey tests in hotkey_exit")
> 
> adds a complex logic behind hotkey status check in a way
> it started mixing logical operations with bitwise ones.
> 
> Refactor the code to make it straight and slightly clearer.

Eh, I find this actually less clear, given the comment that was in the
old code, which you deleted.

Please keep the important part of the comment at the very least.

> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/platform/x86/thinkpad_acpi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7b6cb0c69b02..7740b5e1b998 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -3090,6 +3090,8 @@ static void tpacpi_send_radiosw_update(void)
>  
>  static void hotkey_exit(void)
>  {
> +	int res;
> +
>  #ifdef CONFIG_THINKPAD_ACPI_HOTKEY_POLL
>  	mutex_lock(&hotkey_mutex);
>  	hotkey_poll_stop_sync();
> @@ -3101,11 +3103,8 @@ static void hotkey_exit(void)
>  
>  	dbg_printk(TPACPI_DBG_EXIT | TPACPI_DBG_HKEY,
>  		   "restoring original HKEY status and mask\n");
> -	/* yes, there is a bitwise or below, we want the
> -	 * functions to be called even if one of them fail */
> -	if (((tp_features.hotkey_mask &&
> -	      hotkey_mask_set(hotkey_orig_mask)) |
> -	     hotkey_status_set(false)) != 0)
> +	res = tp_features.hotkey_mask ? hotkey_mask_set(hotkey_orig_mask) : 0;
> +	if (hotkey_status_set(false) || res)
>  		pr_err("failed to restore hot key mask "
>  		       "to BIOS defaults\n");
>  }

-- 
  Henrique Holschuh
