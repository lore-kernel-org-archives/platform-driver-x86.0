From: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Subject: Re: [PATCH v1 3/4] watchdog: mlx-wdt: support new watchdog type with
 longer timeout period
Date: Sat, 18 Apr 2020 04:45:55 -0700
Message-ID: <20200418114555.GA103392@roeck-us.net>
References: <20200416163514.7334-1-michaelsh@mellanox.com>
 <20200416163514.7334-4-michaelsh@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200416163514.7334-4-michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
Sender: linux-watchdog-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
Cc: wim-Q8PRGTgFL9WUCWQAtAn6Ix2eb7JE58TQ@public.gmane.org, andy-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Apr 16, 2020 at 07:35:13PM +0300, michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org wrote:
> From: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
> New programmable logic device can have watchdog type 3 implementation.
> It's same as Type 2 with extended maximum timeout period.
> Maximum timeout is up-to 65535 sec.
> Type 3 HW watchdog implementation can exist on all Mellanox systems.
> It is differentiated by WD capability bit.
> 
> Signed-off-by: Michael Shych <michaelsh-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> 
Stray empty line.

> Reviewed-by: Vadim Pasternak <vadimp-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>
> ---
>  drivers/watchdog/mlx_wdt.c | 75 +++++++++++++++++++++++++++++++++++++++-------
>  1 file changed, 64 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/mlx_wdt.c b/drivers/watchdog/mlx_wdt.c
> index 03b9ac4b99af..c6d81a3d4587 100644
> --- a/drivers/watchdog/mlx_wdt.c
> +++ b/drivers/watchdog/mlx_wdt.c
> @@ -21,6 +21,7 @@
>  #define MLXREG_WDT_CLOCK_SCALE		1000
>  #define MLXREG_WDT_MAX_TIMEOUT_TYPE1	32
>  #define MLXREG_WDT_MAX_TIMEOUT_TYPE2	255
> +#define MLXREG_WDT_MAX_TIMEOUT_TYPE3	65535
>  #define MLXREG_WDT_MIN_TIMEOUT		1
>  #define MLXREG_WDT_OPTIONS_BASE (WDIOF_KEEPALIVEPING | WDIOF_MAGICCLOSE | \
>  				 WDIOF_SETTIMEOUT)
> @@ -49,6 +50,7 @@ struct mlxreg_wdt {
>  	int tleft_idx;
>  	int ping_idx;
>  	int reset_idx;
> +	int regmap_val_sz;
>  	enum mlxreg_wdt_type wdt_type;
>  };
>  
> @@ -111,7 +113,8 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
>  	u32 regval, set_time, hw_timeout;
>  	int rc;
>  
> -	if (wdt->wdt_type == MLX_WDT_TYPE1) {
> +	switch (wdt->wdt_type) {
> +	case MLX_WDT_TYPE1:
>  		rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
>  		if (rc)
>  			return rc;
> @@ -120,14 +123,33 @@ static int mlxreg_wdt_set_timeout(struct watchdog_device *wdd,
>  		regval = (regval & reg_data->mask) | hw_timeout;
>  		/* Rowndown to actual closest number of sec. */
>  		set_time = BIT(hw_timeout) / MLXREG_WDT_CLOCK_SCALE;
> -	} else {
> +		rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> +		break;
> +	case MLX_WDT_TYPE2:
> +		set_time = timeout;
> +		rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
> +		break;
> +	case MLX_WDT_TYPE3:
> +		/* WD_TYPE3 has 2B set time register */
>  		set_time = timeout;
> -		regval = timeout;
> +		if (wdt->regmap_val_sz == 1) {
> +			timeout = cpu_to_le16(timeout);
> +			regval = timeout & GENMASK(7, 0);
> +			rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> +			if (!rc) {
> +				regval = ror32((timeout & GENMASK(15, 8)), 8);
> +				rc = regmap_write(wdt->regmap,
> +						reg_data->reg + 1, regval);
> +			}

This code seems odd. I can understand if the destination is of fixed endianness,
ie either little or big ended. If that was the case, writing timeout & 0xff into
data->reg and then writing timeout >> 8 into reg_data->reg+1 would make sense.
But that isn't what is done here. On a big endian system, data->reg will get
the upper 8 bit and data->reg+1 will get the lower 8 bit. This implies that
the target would in that case be big endian. Is this really what is intended ?
Is it guaranteed that the host byte order always matches the device byte order ?

Also, why use something as complicated as ror32 instead of a simple >> 8 ?
And using "GENMASK(7,0)" for 0xff is for sure possible but seems overly
complicated to me.

> +		} else {
> +			rc = regmap_write(wdt->regmap, reg_data->reg, timeout);
> +		}
> +		break;
> +	default:
> +		return -EINVAL;
>  	}
>  
>  	wdd->timeout = set_time;
> -	rc = regmap_write(wdt->regmap, reg_data->reg, regval);
> -
>  	if (!rc) {
>  		/*
>  		 * Restart watchdog with new timeout period
> @@ -147,10 +169,26 @@ static unsigned int mlxreg_wdt_get_timeleft(struct watchdog_device *wdd)
>  {
>  	struct mlxreg_wdt *wdt = watchdog_get_drvdata(wdd);
>  	struct mlxreg_core_data *reg_data = &wdt->pdata->data[wdt->tleft_idx];
> -	u32 regval;
> +	u32 regval, msb, lsb, reg = reg_data->reg;
>  	int rc;
>  
> -	rc = regmap_read(wdt->regmap, reg_data->reg, &regval);
> +	if (wdt->wdt_type == MLX_WDT_TYPE2) {
> +		rc = regmap_read(wdt->regmap, reg, &regval);
> +	} else {
> +		/* WD_TYPE3 has 2 byte timeleft register */
> +		if (wdt->regmap_val_sz == 1) {
> +			rc = regmap_read(wdt->regmap, reg, &lsb);
> +			if (!rc) {
> +				rc = regmap_read(wdt->regmap, ++reg, &msb);

FWIW, incrementing reg only serves a purpose if the incremented value is
actually used. That is not the case here, so this only makes the code
more complicated and risky. Besides, it is inconsistent with the code
above which directly uses reg_data->reg.

> +				regval = rol32((msb & GENMASK(7, 0)), 8) |
> +						(lsb & GENMASK(7, 0));
> +				regval = le16_to_cpu(regval);

Same question as above. Worse, this code explicitly puts "lsb" into bit 0..7
of regval, and msb into bit 8..15. Then it takes that value as little endian
value (even though, at least according to lsb/msb variable names, it is
already in host byte order) and swaps the two bytes.

I'd really like to see this code tested on a big endian system.

> +			}
> +		} else {
> +			rc = regmap_read(wdt->regmap, reg, &regval);

... or maybe someone can point me to a regmap definition with 16-bit value
size for comparison/validation.

> +		}
> +	}
> +
>  	/* Return 0 timeleft in case of failure register read. */
>  	return rc == 0 ? regval : 0;
>  }
> @@ -212,13 +250,23 @@ static void mlxreg_wdt_config(struct mlxreg_wdt *wdt,
>  		wdt->wdd.info = &mlxreg_wdt_aux_info;
>  
>  	wdt->wdt_type = pdata->version;
> -	if (wdt->wdt_type == MLX_WDT_TYPE2) {
> -		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> -		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
> -	} else {
> +	switch (wdt->wdt_type) {
> +	case MLX_WDT_TYPE1:
>  		wdt->wdd.ops = &mlxreg_wdt_ops_type1;
>  		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE1;
> +		break;
> +	case MLX_WDT_TYPE2:
> +		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> +		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE2;
> +		break;
> +	case MLX_WDT_TYPE3:
> +		wdt->wdd.ops = &mlxreg_wdt_ops_type2;
> +		wdt->wdd.max_timeout = MLXREG_WDT_MAX_TIMEOUT_TYPE3;
> +		break;
> +	default:
> +		break;
>  	}
> +
>  	wdt->wdd.min_timeout = MLXREG_WDT_MIN_TIMEOUT;
>  }
>  
> @@ -249,6 +297,11 @@ static int mlxreg_wdt_probe(struct platform_device *pdev)
>  
>  	wdt->wdd.parent = dev;
>  	wdt->regmap = pdata->regmap;
> +	rc = regmap_get_val_bytes(wdt->regmap);
> +	if (rc <= 0)
> +		return -EINVAL;

It seems to me that val_bytes == 0 does not really make any sense.
Does it really add value to check for that instead of just returning
any errors ?

> +
> +	wdt->regmap_val_sz = rc;
>  	mlxreg_wdt_config(wdt, pdata);
>  
>  	if ((pdata->features & MLXREG_CORE_WD_FEATURE_NOWAYOUT))
> -- 
> 2.11.0
> 
