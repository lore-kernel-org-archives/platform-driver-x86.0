From: Mattia Dongili <malattia@linux.it>
Subject: Re: [PATCH v2] sony-laptop: add new thermal control handle
Date: Mon, 27 Jun 2016 22:15:18 -0700
Message-ID: <20160628051515.GA17531@taihen.jp>
References: <20160623202122.Horde.TxvrWAneTMWnwZqVFW5oO0g@horde.stefanseidel.info>
 <20160623204322.Horde.KP6NgW-vjq4KeyukqDxSgtN@horde.stefanseidel.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from picard.linux.it ([213.254.12.146]:53809 "EHLO picard.linux.it"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751065AbcF1FUt (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 28 Jun 2016 01:20:49 -0400
Content-Disposition: inline
In-Reply-To: <20160623204322.Horde.KP6NgW-vjq4KeyukqDxSgtN@horde.stefanseidel.info>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Stefan Seidel <lkml@stefanseidel.info>
Cc: platform-driver-x86@vger.kernel.org

On Thu, Jun 23, 2016 at 08:43:22PM +0200, Stefan Seidel wrote:
> Hi,
> 
> sorry about the wrong first patch, I had missed an unwanted hunk.
> 
> On at least the SVD11 there is an additional thermal control setting that
> is found at a different handle address but otherwise behaves the same as
> the other one.

Hi Stefan,

this patch looks ok.
I'm tempted to say that the "cooling" option should be limited to models
that support it, though IIRC (and the comment seems to confirm), it's
already the case that not all models support the current 3 options.

I cannot test this code myself not having a Duo.
For reference, could you send me (even privately) the DSDT from your Duo
model?

Thanks.

Reviewed-by: Mattia Dongili <malattia@linux.it>

> Signed-off-by: Stefan Seidel <lkml@stefanseidel.info>
> ---
>  drivers/platform/x86/sony-laptop.c | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/platform/x86/sony-laptop.c
> b/drivers/platform/x86/sony-laptop.c
> index 1dba359..6c9deb3 100644
> --- a/drivers/platform/x86/sony-laptop.c
> +++ b/drivers/platform/x86/sony-laptop.c
> @@ -148,7 +148,8 @@ static int sony_nc_battery_care_setup(struct
> platform_device *pd,
>  		unsigned int handle);
>  static void sony_nc_battery_care_cleanup(struct platform_device *pd);
> 
> -static int sony_nc_thermal_setup(struct platform_device *pd);
> +static int sony_nc_thermal_setup(struct platform_device *pd,
> +				  unsigned int handle);
>  static void sony_nc_thermal_cleanup(struct platform_device *pd);
> 
>  static int sony_nc_lid_resume_setup(struct platform_device *pd,
> @@ -1363,7 +1364,8 @@ static void sony_nc_function_setup(struct acpi_device
> *device,
>  						result);
>  			break;
>  		case 0x0122:
> -			result = sony_nc_thermal_setup(pf_device);
> +		case 0x015F:
> +			result = sony_nc_thermal_setup(pf_device, handle);
>  			if (result)
>  				pr_err("couldn't set up thermal profile function (%d)\n",
>  						result);
> @@ -1476,6 +1478,7 @@ static void sony_nc_function_cleanup(struct
> platform_device *pd)
>  			sony_nc_lid_resume_cleanup(pd);
>  			break;
>  		case 0x0122:
> +		case 0x015F:
>  			sony_nc_thermal_cleanup(pd);
>  			break;
>  		case 0x0128:
> @@ -1547,6 +1550,7 @@ static void sony_nc_function_resume(void)
>  			sony_call_snc_handle(handle, 0x100, &result);
>  			break;
>  		case 0x0122:
> +		case 0x015F:
>  			sony_nc_thermal_resume();
>  			break;
>  		case 0x0124:
> @@ -2150,14 +2154,16 @@ struct snc_thermal_ctrl {
>  	unsigned int profiles;
>  	struct device_attribute mode_attr;
>  	struct device_attribute profiles_attr;
> +	unsigned int handle;
>  };
>  static struct snc_thermal_ctrl *th_handle;
> 
> -#define THM_PROFILE_MAX 3
> +#define THM_PROFILE_MAX 4
>  static const char * const snc_thermal_profiles[] = {
>  	"balanced",
>  	"silent",
> -	"performance"
> +	"performance",
> +	"cooling"
>  };
> 
>  static int sony_nc_thermal_mode_set(unsigned short mode)
> @@ -2173,7 +2179,8 @@ static int sony_nc_thermal_mode_set(unsigned short mode)
>  	if ((mode && !(th_handle->profiles & mode)) || mode >= THM_PROFILE_MAX)
>  		return -EINVAL;
> 
> -	if (sony_call_snc_handle(0x0122, mode << 0x10 | 0x0200, &result))
> +	if (sony_call_snc_handle(th_handle->handle, mode << 0x10 | 0x0200,
> +				 &result))
>  		return -EIO;
> 
>  	th_handle->mode = mode;
> @@ -2185,7 +2192,7 @@ static int sony_nc_thermal_mode_get(void)
>  {
>  	unsigned int result;
> 
> -	if (sony_call_snc_handle(0x0122, 0x0100, &result))
> +	if (sony_call_snc_handle(th_handle->handle, 0x0100, &result))
>  		return -EIO;
> 
>  	return result & 0xff;
> @@ -2245,14 +2252,17 @@ static ssize_t sony_nc_thermal_mode_show(struct
> device *dev,
>  	return count;
>  }
> 
> -static int sony_nc_thermal_setup(struct platform_device *pd)
> +static int sony_nc_thermal_setup(struct platform_device *pd,
> +				 unsigned int handle)
>  {
>  	int ret = 0;
>  	th_handle = kzalloc(sizeof(struct snc_thermal_ctrl), GFP_KERNEL);
>  	if (!th_handle)
>  		return -ENOMEM;
> 
> -	ret = sony_call_snc_handle(0x0122, 0x0000, &th_handle->profiles);
> +	th_handle->handle = handle;
> +
> +	ret = sony_call_snc_handle(handle, 0x0000, &th_handle->profiles);
>  	if (ret) {
>  		pr_warn("couldn't to read the thermal profiles\n");
>  		goto outkzalloc;
> -- 
> 2.8.3
> 
> 
-- 
mattia
:wq!
