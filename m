From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 30/36] platform/x86: intel_pmc_ipc: Drop
 intel_pmc_ipc_command()
Date: Wed, 8 Jan 2020 18:57:49 +0200
Message-ID: <20200108165749.GP32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-31-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-31-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:55PM +0300, Mika Westerberg wrote:
> Now that all callers have been converted over to the SCU IPC API we can
> drop intel_pmc_ipc_command().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  8 --------
>  drivers/platform/x86/intel_pmc_ipc.c | 21 ---------------------
>  2 files changed, 29 deletions(-)
> 
> diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
> index ddc964b9c78c..22848df5faaf 100644
> --- a/arch/x86/include/asm/intel_pmc_ipc.h
> +++ b/arch/x86/include/asm/intel_pmc_ipc.h
> @@ -27,19 +27,11 @@
>  
>  #if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
>  
> -int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> -		u32 *out, u32 outlen);
>  int intel_pmc_s0ix_counter_read(u64 *data);
>  int intel_pmc_gcr_read64(u32 offset, u64 *data);
>  
>  #else
>  
> -static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> -		u32 *out, u32 outlen)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline int intel_pmc_s0ix_counter_read(u64 *data)
>  {
>  	return -EINVAL;
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 10505fbd01b5..241bce603183 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -194,27 +194,6 @@ static int update_no_reboot_bit(void *priv, bool set)
>  				    PMC_CFG_NO_REBOOT_MASK, value);
>  }
>  
> -/**
> - * intel_pmc_ipc_command() -  IPC command with input/output data
> - * @cmd:	IPC command code.
> - * @sub:	IPC command sub type.
> - * @in:		input data of this IPC command.
> - * @inlen:	input data length in bytes.
> - * @out:	output data of this IPC command.
> - * @outlen:	output data length in dwords.
> - *
> - * Send an IPC command to PMC with input/output data.
> - *
> - * Return:	an IPC error code or 0 on success.
> - */
> -int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
> -			  u32 *out, u32 outlen)
> -{
> -	return intel_scu_ipc_dev_command(NULL, cmd, sub, in, inlen, out,
> -					 outlen);
> -}
> -EXPORT_SYMBOL_GPL(intel_pmc_ipc_command);
> -
>  static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  {
>  	struct intel_pmc_ipc_dev *pmc = &ipcdev;
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
