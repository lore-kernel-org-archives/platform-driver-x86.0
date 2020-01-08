From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 21/36] platform/x86: intel_pmc_ipc: Drop
 intel_pmc_gcr_read() and intel_pmc_gcr_write()
Date: Wed, 8 Jan 2020 18:47:04 +0200
Message-ID: <20200108164704.GK32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-22-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-22-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:46PM +0300, Mika Westerberg wrote:
> These functions are not used anywhere so drop them completely.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h | 12 ------
>  drivers/platform/x86/intel_pmc_ipc.c | 59 ----------------------------
>  2 files changed, 71 deletions(-)
> 
> diff --git a/arch/x86/include/asm/intel_pmc_ipc.h b/arch/x86/include/asm/intel_pmc_ipc.h
> index 966ff2171ff9..e6da1ce26256 100644
> --- a/arch/x86/include/asm/intel_pmc_ipc.h
> +++ b/arch/x86/include/asm/intel_pmc_ipc.h
> @@ -34,9 +34,7 @@
>  int intel_pmc_ipc_command(u32 cmd, u32 sub, u8 *in, u32 inlen,
>  		u32 *out, u32 outlen);
>  int intel_pmc_s0ix_counter_read(u64 *data);
> -int intel_pmc_gcr_read(u32 offset, u32 *data);
>  int intel_pmc_gcr_read64(u32 offset, u64 *data);
> -int intel_pmc_gcr_write(u32 offset, u32 data);
>  
>  #else
>  
> @@ -51,21 +49,11 @@ static inline int intel_pmc_s0ix_counter_read(u64 *data)
>  	return -EINVAL;
>  }
>  
> -static inline int intel_pmc_gcr_read(u32 offset, u32 *data)
> -{
> -	return -EINVAL;
> -}
> -
>  static inline int intel_pmc_gcr_read64(u32 offset, u64 *data)
>  {
>  	return -EINVAL;
>  }
>  
> -static inline int intel_pmc_gcr_write(u32 offset, u32 data)
> -{
> -	return -EINVAL;
> -}
> -
>  #endif /*CONFIG_INTEL_PMC_IPC*/
>  
>  #endif
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index 83f47df1c4a5..677ed470e14e 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -210,35 +210,6 @@ static inline int is_gcr_valid(u32 offset)
>  	return 0;
>  }
>  
> -/**
> - * intel_pmc_gcr_read() - Read a 32-bit PMC GCR register
> - * @offset:	offset of GCR register from GCR address base
> - * @data:	data pointer for storing the register output
> - *
> - * Reads the 32-bit PMC GCR register at given offset.
> - *
> - * Return:	negative value on error or 0 on success.
> - */
> -int intel_pmc_gcr_read(u32 offset, u32 *data)
> -{
> -	int ret;
> -
> -	spin_lock(&ipcdev.gcr_lock);
> -
> -	ret = is_gcr_valid(offset);
> -	if (ret < 0) {
> -		spin_unlock(&ipcdev.gcr_lock);
> -		return ret;
> -	}
> -
> -	*data = readl(ipcdev.gcr_mem_base + offset);
> -
> -	spin_unlock(&ipcdev.gcr_lock);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(intel_pmc_gcr_read);
> -
>  /**
>   * intel_pmc_gcr_read64() - Read a 64-bit PMC GCR register
>   * @offset:	offset of GCR register from GCR address base
> @@ -268,36 +239,6 @@ int intel_pmc_gcr_read64(u32 offset, u64 *data)
>  }
>  EXPORT_SYMBOL_GPL(intel_pmc_gcr_read64);
>  
> -/**
> - * intel_pmc_gcr_write() - Write PMC GCR register
> - * @offset:	offset of GCR register from GCR address base
> - * @data:	register update value
> - *
> - * Writes the PMC GCR register of given offset with given
> - * value.
> - *
> - * Return:	negative value on error or 0 on success.
> - */
> -int intel_pmc_gcr_write(u32 offset, u32 data)
> -{
> -	int ret;
> -
> -	spin_lock(&ipcdev.gcr_lock);
> -
> -	ret = is_gcr_valid(offset);
> -	if (ret < 0) {
> -		spin_unlock(&ipcdev.gcr_lock);
> -		return ret;
> -	}
> -
> -	writel(data, ipcdev.gcr_mem_base + offset);
> -
> -	spin_unlock(&ipcdev.gcr_lock);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL_GPL(intel_pmc_gcr_write);
> -
>  /**
>   * intel_pmc_gcr_update() - Update PMC GCR register bits
>   * @offset:	offset of GCR register from GCR address base
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
