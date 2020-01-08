From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2 33/36] platform/x86: intel_pmc_ipc: Use octal
 permissions in sysfs attributes
Date: Wed, 8 Jan 2020 18:58:28 +0200
Message-ID: <20200108165828.GQ32742@smile.fi.intel.com>
References: <20200108114201.27908-1-mika.westerberg@linux.intel.com>
 <20200108114201.27908-34-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200108114201.27908-34-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Jan 08, 2020 at 02:41:58PM +0300, Mika Westerberg wrote:
> This is the current preferred way so replace the S_IWUSR with the
> corresponding octal value. While there move the attributes to follow
> directly their store functions.
> 

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index acec1c6d2069..20a4bb72aeac 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -215,6 +215,7 @@ static ssize_t intel_pmc_ipc_simple_cmd_store(struct device *dev,
>  	}
>  	return (ssize_t)count;
>  }
> +static DEVICE_ATTR(simplecmd, 0200, NULL, intel_pmc_ipc_simple_cmd_store);
>  
>  static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
>  					     struct device_attribute *attr,
> @@ -240,11 +241,7 @@ static ssize_t intel_pmc_ipc_northpeak_store(struct device *dev,
>  	}
>  	return (ssize_t)count;
>  }
> -
> -static DEVICE_ATTR(simplecmd, S_IWUSR,
> -		   NULL, intel_pmc_ipc_simple_cmd_store);
> -static DEVICE_ATTR(northpeak, S_IWUSR,
> -		   NULL, intel_pmc_ipc_northpeak_store);
> +static DEVICE_ATTR(northpeak, 0200, NULL, intel_pmc_ipc_northpeak_store);
>  
>  static struct attribute *intel_ipc_attrs[] = {
>  	&dev_attr_northpeak.attr,
> -- 
> 2.24.1
> 

-- 
With Best Regards,
Andy Shevchenko
