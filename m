From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 20/36] platform/x86: intel_pmc_ipc: Make
 intel_pmc_ipc_raw_cmd() static
Date: Wed, 8 Jan 2020 18:46:49 +0200
Message-ID: <20200108164649.GJ32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-21-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-21-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:45PM +0300, Mika Westerberg wrote:
> This function is not called outside of intel_pmc_ipc.c so we can make it
> static instead.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h | 8 --------
>  drivers/platform/x86/intel_pmc_ipc.c | 5 ++---
>  2 files changed, 2 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
> index b4f804877651..966ff2171ff9 100644
> --- a/arch/x86/include/asm/intel_pmc_ipc.h
> +++ b/arch/x86/include/asm/intel_pmc_ipc.h
> @@ -31,8 +31,6 @@
>  
>  #if IS_ENABLED(CONFIG_INTEL_PMC_IPC)
>  
> -int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
> -		u32 *out, u32 outlen, u32 dptr, u32 sptr);
>  int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  		u32 *out, u32 outlen);
>  int intel_pmc_s0ix_counter_read(u64 *data);
> @@ -42,12 +40,6 @@ int intel_pmc_gcr_write(u32 offset, u32 data);
>  
>  #else
>  
> -static inline int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen,
> -		u32 *out, u32 outlen, u32 dptr, u32 sptr)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  		u32 *out, u32 outlen)
>  {
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 53551f5474a7..83f47df1c4a5 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -435,8 +435,8 @@ static int intel_pmc_ipc_simple_command(int cmd, int sub)
>   *
>   * Return:	an IPC error code or 0 on success.
>   */
> -int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out,
> -			  u32 outlen, u32 dptr, u32 sptr)
> +static int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out,
> +				 u32 outlen, u32 dptr, u32 sptr)
>  {
>  	u32 wbuf[4] = { 0 };
>  	int ret;
> @@ -468,7 +468,6 @@ int intel_pmc_ipc_raw_cmd(u32 cmd, u32 sub, u8 *in, u32 inlen, u32 *out,
>  
>  	return ret;
>  }
> -EXPORT_SYMBOL_GPL(intel_pmc_ipc_raw_cmd);
>  
>  /**
>   * intel_pmc_ipc_command() -  IPC command with input/output data
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
