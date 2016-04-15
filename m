From: Darren Hart <dvhart@infradead.org>
Subject: Re: [patch] hp_accel: Silence an uninitialized variable warning
Date: Fri, 15 Apr 2016 08:29:59 -0700
Message-ID: <20160415152959.GC16654@f23x64.localdomain>
References: <20160415144720.GF8953@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20160415144720.GF8953@mwanda>
Sender: kernel-janitors-owner@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Piel <eric.piel@tremplin-utc.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Fri, Apr 15, 2016 at 05:47:20PM +0300, Dan Carpenter wrote:
> If acpi_evaluate_integer() fails then "lret" isn't initialized.  I've
> tweaked the error handling to avoid this issue.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks Dan, I verified and queued all 3 patches to fixes for 4.6.

> 
> diff --git a/drivers/platform/x86/hp_accel.c b/drivers/platform/x86/hp_accel.c
> index 10ce6cb..746918e 100644
> --- a/drivers/platform/x86/hp_accel.c
> +++ b/drivers/platform/x86/hp_accel.c
> @@ -127,8 +127,10 @@ static int lis3lv02d_acpi_read(struct lis3lv02d *lis3, int reg, u8 *ret)
>  	arg0.integer.value = reg;
>  
>  	status = acpi_evaluate_integer(dev->handle, "ALRD", &args, &lret);
> +	if (ACPI_FAILURE(status))
> +		return -EINVAL;
>  	*ret = lret;
> -	return (status != AE_OK) ? -EINVAL : 0;
> +	return 0;
>  }
>  
>  /**
> 

-- 
Darren Hart
Intel Open Source Technology Center
