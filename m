From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [patch v2 2/2] drivers/platform/x86: add mlxcpld-hotplug driver
 registration to mlx-platform driver
Date: Thu, 27 Oct 2016 21:24:57 +0300
Message-ID: <1477592697.5295.48.camel@linux.intel.com>
References: <1477598154-4459-1-git-send-email-vadimp@mellanox.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:39779 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S942386AbcJ0SbF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Oct 2016 14:31:05 -0400
In-Reply-To: <1477598154-4459-1-git-send-email-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Vadim Pasternak <vadimp@mellanox.com>, dvhart@infradead.org, fengguang.wu@intel.com
Cc: davem@davemloft.net, geert@linux-m68k.org, akpm@linux-foundation.org, kvalo@codeaurora.org, gregkh@linuxfoundation.org, mchehab@kernel.org, linux@roeck-us.net, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jiri@resnulli.us

Same comment regarding series (Use --thread to git send-email)

On Thu, 2016-10-27 at 19:55 +0000, Vadim Pasternak wrote:
> Add calls for mlxcpld-hotplug platform driver
> registration/unregistration
> and add platform hotplug data configurations. This driver, when
> registered
> within system will handle system hot-plug events for the power
> suppliers,
> power cables and fans (insertion and removing). These events are
> controlled through CPLD Lattice device.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

> v1->v2:
>  Comments pointed out by Andy:
>   - Remove "from sender" from the message body;
>   - Add more information to commit message. (When CPLD spec will be
>     available at Mellanox portal - MAINTAINERS Web-page info is to
>     be updated);
>   - Do not change include order.

Same comment. Put it below '---' line.

> ---
> 

> @@ -121,7 +123,87 @@ static struct i2c_mux_reg_platform_data
> mlxplat_mux_data[] = {
>  
>  };
>  

> -static struct platform_device *mlxplat_dev;

Why did you move it? Seems like it's not needed in this patch.

> +/* Platform hotplug devices */
> +static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_psu[] = 

I_really_like_long_names_of_variables. No, I don't.

> +static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_pwr[] =
> +static struct mlxcpld_hotplug_device mlxplat_mlxcpld_hotplug_fan[] =
> +static
> +struct mlxcpld_hotplug_platform_data
> mlxplat_mlxcpld_hotplug_default_data = {


> +	.top_aggr_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x3a),

| ?! Can you elaborate why it's ORred and not just added?

Besides that redundant parens.

> +	.top_aggr_mask = 0x48,
> +	.top_aggr_psu_mask = 0x08,

And above explanation might shed a light why you are using interesting
masks like 0b101.

> +	.psu_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x58),
> +	.psu_mask = 0x03,

GENMASK()?

> +	.psu_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_psu),
> +	.psu = mlxplat_mlxcpld_hotplug_psu,
> +	.top_aggr_pwr_mask = 0x08,
> +	.pwr_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x64),
> +	.pwr_mask = 0x03,
> +	.pwr_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_pwr),
> +	.pwr = mlxplat_mlxcpld_hotplug_pwr,
> +	.top_aggr_fan_mask = 0x40,
> +	.fan_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x88),
> +	.fan_mask = 0x0f,
> +	.fan_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_fan),
> +	.fan = mlxplat_mlxcpld_hotplug_fan,

Wouldn't be cleaner like this:

struct hotplug_dev_pdata {
 reg_offset;
 mask;
 count;
 void *somethig;
};

struct hotplug_pdata {
 /* top stuff, will see later how to put it here */

 struct hotplug_dev_data psu;
 struct hotplug_dev_data pwr;
 struct hotplug_dev_data fan;
};

> +};
> +
> +/* Platform hotplug MSN21xx system family data */
> +static
> +struct mlxcpld_hotplug_platform_data
> mlxplat_mlxcpld_hotplug_msn21xx_data = {
> +	.top_aggr_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x3a),
> +	.top_aggr_mask = 0x04,
> +	.top_aggr_pwr_mask = 0x04,
> +	.pwr_reg_offset = (MLXPLAT_CPLD_LPC_REG_BASE_ADRR | 0x64),
> +	.pwr_mask = 0x03,
> +	.pwr_count = ARRAY_SIZE(mlxplat_mlxcpld_hotplug_pwr),
> +};
> +
> +static struct resource mlxplat_mlxcpld_hotplug_resources[] = {
> +	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxcpld-hotplug"),
> +};
> +
> +struct platform_device *mlxplat_dev;
> +struct mlxcpld_hotplug_platform_data *mlxplat_hotplug;
>  
>  static int __init mlxplat_dmi_default_matched(const struct
> dmi_system_id *dmi)
>  {
> @@ -132,6 +214,7 @@ static int __init
> mlxplat_dmi_default_matched(const struct dmi_system_id *dmi)
>  		mlxplat_mux_data[i].n_values =
>  				ARRAY_SIZE(mlxplat_default_channels[i
> ]);
>  	}

> +	mlxplat_hotplug = &mlxplat_mlxcpld_hotplug_default_data;

Is it only one hotplug device at a time? Otherwise it will be affected
by race conditions.

>  
>  	return 1;
>  };
> @@ -145,6 +228,7 @@ static int __init
> mlxplat_dmi_msn21xx_matched(const struct dmi_system_id *dmi)
>  		mlxplat_mux_data[i].n_values =
>  				ARRAY_SIZE(mlxplat_msn21xx_channels);
>  	}
> +	mlxplat_hotplug = &mlxplat_mlxcpld_hotplug_msn21xx_data;
>  
>  	return 1;
>  };
> @@ -230,6 +314,16 @@ static int __init mlxplat_init(void)
>  		}
>  	}
>  
> +	priv->pdev_hotplug = platform_device_register_resndata(
> +				&mlxplat_dev->dev, "mlxcpld-hotplug", 

> -1,

Isn't it something like PLATFORM_DEVID_AUTO / NONE ?

> +				mlxplat_mlxcpld_hotplug_resources,
> +				ARRAY_SIZE(mlxplat_mlxcpld_hotplug_re
> sources),
> +				mlxplat_hotplug,
> sizeof(*mlxplat_hotplug));
> +	if (IS_ERR(priv->pdev_hotplug)) {
> +		err = PTR_ERR(priv->pdev_hotplug);
> +		goto fail_platform_mux_register;
> +	}
> +
>  	return 0;
>  
>  fail_platform_mux_register:
> @@ -248,6 +342,8 @@ static void __exit mlxplat_exit(void)
>  	struct mlxplat_priv *priv =
> platform_get_drvdata(mlxplat_dev);
>  	int i;
>  
> +	platform_device_unregister(priv->pdev_hotplug);
> +
>  	for (i = ARRAY_SIZE(mlxplat_mux_data) - 1; i >= 0 ; i--)
>  		platform_device_unregister(priv->pdev_mux[i]);
>  

-- 
Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Intel Finland Oy
